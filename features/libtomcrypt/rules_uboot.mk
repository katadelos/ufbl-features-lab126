#
# Copyright 2019 Amazon.com, Inc. or its Affiliates. All rights reserved.
#
subdir-ccflags-$(CONFIG_LIBTOMCRYPT) += -Os -funroll-loops \
		-fomit-frame-pointer \
		-DLTC_SOURCE \
		-DLTC_NO_FILE \
		-DLTC_NO_RAND \
		-DUSE_LTM -DLTM_DESC \
		-D_WCHAR_T -DLTC_CLEAN_STACK \

subdir-ccflags-$(CONFIG_LIBTOMCRYPT) += -ffunction-sections -fdata-sections

subdir-ccflags-$(CONFIG_LIBTOMCRYPT) += \
	-I$(UFBL_PATH)/features/libtomcrypt/uboot \
	-I$(UFBL_PATH)/features/libtomcrypt \
	-I$(UFBL_PATH)/features/libtomcrypt/src/headers \
	-I$(UFBL_PATH)/features/libtommath/src

obj-$(CONFIG_LIBTOMCRYPT) += \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/sha2/sha256.o \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/chc/chc.o \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/helper/hash_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/helper/hash_filehandle.o \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/helper/hash_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/hashes/helper/hash_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_done.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_init.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_process.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/f9/f9_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_done.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_init.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_process.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/hmac/hmac_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_done.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_init.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_process.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/omac/omac_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pelican/pelican.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pelican/pelican_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pelican/pelican_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_done.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_init.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_ntz.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_process.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_shift_xor.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/pmac/pmac_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_done.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_file.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_init.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_memory.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_memory_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_process.o \
	../../../../ufbl-features/features/libtomcrypt/src/mac/xcbc/xcbc_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/fp/ltc_ecc_fp_mulmod.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/gmp_desc.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/ltm_desc.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/rand_bn.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/rand_prime.o \
	../../../../ufbl-features/features/libtomcrypt/src/math/tfm_desc.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/adler32.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/base64/base64_decode.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/base64/base64_encode.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/burn_stack.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crc32.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_argchk.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_cipher_descriptor.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_cipher_is_valid.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_constants.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_cipher_any.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_cipher.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_cipher_id.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_hash_any.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_hash.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_hash_id.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_hash_oid.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_find_prng.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_fsa.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_hash_descriptor.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_hash_is_valid.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_inits.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_ltc_mp_descriptor.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_prng_descriptor.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_prng_is_valid.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_register_cipher.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_register_hash.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_register_prng.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_sizes.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_unregister_cipher.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_unregister_hash.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/crypt/crypt_unregister_prng.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/error_to_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/hkdf/hkdf.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/hkdf/hkdf_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/mem_neq.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/pkcs5/pkcs_5_1.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/pkcs5/pkcs_5_2.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/pkcs5/pkcs_5_test.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/pk_get_oid.o \
	../../../../ufbl-features/features/libtomcrypt/src/misc/zeromem.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/bit/der_decode_bit_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/bit/der_decode_raw_bit_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/bit/der_encode_bit_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/bit/der_encode_raw_bit_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/bit/der_length_bit_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/boolean/der_decode_boolean.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/boolean/der_encode_boolean.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/boolean/der_length_boolean.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/choice/der_decode_choice.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/ia5/der_decode_ia5_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/ia5/der_encode_ia5_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/ia5/der_length_ia5_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/integer/der_decode_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/integer/der_encode_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/integer/der_length_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/object_identifier/der_decode_object_identifier.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/object_identifier/der_encode_object_identifier.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/object_identifier/der_length_object_identifier.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/octet/der_decode_octet_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/octet/der_encode_octet_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/octet/der_length_octet_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/printable_string/der_decode_printable_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/printable_string/der_encode_printable_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/printable_string/der_length_printable_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_decode_sequence_ex.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_decode_sequence_flexi.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_decode_sequence_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_decode_subject_public_key_info.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_encode_sequence_ex.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_encode_sequence_multi.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_encode_subject_public_key_info.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_length_sequence.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/sequence/der_sequence_free.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/set/der_encode_set.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/set/der_encode_setof.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/short_integer/der_decode_short_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/short_integer/der_encode_short_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/short_integer/der_length_short_integer.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/teletex_string/der_decode_teletex_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/teletex_string/der_length_teletex_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utctime/der_decode_utctime.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utctime/der_encode_utctime.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utctime/der_length_utctime.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utf8/der_decode_utf8_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utf8/der_encode_utf8_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/asn1/der/utf8/der_length_utf8_string.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_i2osp.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_mgf1.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_oaep_decode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_oaep_encode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_os2ip.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_pss_decode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_pss_encode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_v1_5_decode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/pkcs1/pkcs_1_v1_5_encode.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_decrypt_key.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_encrypt_key.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_export.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_exptmod.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_free.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_get_size.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_import.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_make_key.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_sign_hash.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_sign_saltlen_get.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/rsa/rsa_verify_hash.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/fortuna.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/rc4.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/rng_get_bytes.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/rng_make_prng.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/sober128.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/sprng.o \
	../../../../ufbl-features/features/libtomcrypt/src/prngs/yarrow.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_is_valid_idx.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_map.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_mul2add.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_mulmod.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_mulmod_timing.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_points.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_projective_add_point.o \
	../../../../ufbl-features/features/libtomcrypt/src/pk/ecc/ltc_ecc_projective_dbl_point.o