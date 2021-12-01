/*
 * Copyright 2019 Amazon.com, Inc. or its Affiliates. All rights reserved.
 */
#include "amzn_fastboot_lockdown.h"
#include <string.h>

#if defined(UFBL_FEATURE_SECURE_BOOT)
#include "amzn_secure_boot.h"
#endif

#if defined(UFBL_FEATURE_UNLOCK)
extern int amzn_target_is_unlocked(void);
#endif


// Example to add commands into whitelist, the same for blacklist.
// Define the strong function in product own files, and add some commands into
// the input/output parameter <list> and set its <length> will do:
// void amzn_extends_fastboot_whitelist(const char* const **list, int *length) {
//	   if (list == NULL || length == NULL) return;
//	   static const char* const whitelist[] = {
//		   "command_1",
//		   "command_2",
//	   };
//	   *list = whitelist;
//	   *length = sizeof(whitelist) / sizeof(whitelist[0]);
// }
__attribute__((weak)) void amzn_extends_fastboot_whitelist(const char* const **list, int *length) {
	if (list == NULL || length == NULL) return;

	*list = NULL;
	*length = 0;
}

__attribute__((weak)) void amzn_extends_fastboot_blacklist(const char* const **list, int *length) {
	if (list == NULL || length == NULL) return;

	*list = NULL;
	*length = 0;
}

// ABC/ABC has not implement the UFBL unlock, they do unlock code
// verification on Preloader, and pass the unlock status to LK by the
// shared variable g_boot_arg->unlock
#if defined(UFBL_PROJ_ABC)

#include <boot_mode.h>
extern BOOT_ARGUMENT *g_boot_arg;

__attribute__((weak)) int is_locked_production_device() {
#if defined(UFBL_FEATURE_SECURE_BOOT)
	return (AMZN_PRODUCTION_DEVICE == amzn_target_device_type()) && (1 != g_boot_arg->unlocked);
#else
	return 0;
#endif
}

#else /* UFBL_PROJ_ABC */

__attribute__((weak)) int is_locked_production_device() {
#if defined(UFBL_FEATURE_SECURE_BOOT) && defined(UFBL_FEATURE_UNLOCK)
	return (AMZN_PRODUCTION_DEVICE == amzn_target_device_type()) && (!amzn_target_is_unlocked());
#else
	return 0;
#endif
}

#endif /* UFBL_PROJ_ABC */

int is_restricted_command_on_locked_hw(const unsigned char* const fastboot_command_buffer) {

	const unsigned char* const buffer = fastboot_command_buffer;

	// common whitelist
	// whitelist is used to filter some combined commands which
	// has a prefix in one of the commands in blacklist.
	static const char* const whitelist[] = {
		"oem relock",
		"oem flags",
		"flash:unlock", // the fastboot command parser convert "flash unlock" to "flash:unlock"
	};

	// common blacklist
	static const char* const blacklist[] = {
		"verify",
		"dump",
		"erase",
		"boot",
		"env",
		"signature",
		"oem",	 // "oem flags" is in the whitelist
		"flash", // "flash unlock" is in the whitelist
	};


	int i = 0;
	const char* const *list = NULL;
	int length = 0;

	if (! is_locked_production_device()) return 0;

	for (i = 0; i < sizeof(whitelist) / sizeof(whitelist[0]); ++i) {
		if (memcmp(buffer, whitelist[i], strlen(whitelist[i])) == 0) {
			return 0;
		}
	}

	amzn_extends_fastboot_whitelist(&list, &length);
	if (list != NULL && length > 0) {
		for (i = 0; i < length; ++i) {
			if (memcmp(buffer, list[i], strlen(list[i])) == 0) {
				return 0;
			}
		}
	}

	for (i = 0; i < sizeof(blacklist) / sizeof(blacklist[0]); ++i) {
		if (memcmp(buffer, blacklist[i], strlen(blacklist[i])) == 0) {
			return 1;
		}
	}

	amzn_extends_fastboot_blacklist(&list, &length);
	if (list != NULL && length > 0) {
		for (i = 0; i < length; ++i) {
			if (memcmp(buffer, list[i], strlen(list[i])) == 0) {
				return 1;
			}
		}
	}

	return 0;
}
