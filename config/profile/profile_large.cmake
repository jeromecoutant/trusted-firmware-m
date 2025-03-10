#-------------------------------------------------------------------------------
# Copyright (c) 2021, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

set(TFM_PROFILE                         profile_large CACHE STRING    "Profile to use")
set(TFM_PSA_API                         ON          CACHE BOOL      "Use PSA api (IPC mode) instead of secure library mode")
set(TFM_ISOLATION_LEVEL                 3           CACHE STRING    "Isolation level")

############################ Partitions ########################################

set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")

set(TFM_PARTITION_AUDIT_LOG             OFF         CACHE BOOL      "Enable Audit Log partition")

set(TFM_PARTITION_PROTECTED_STORAGE     ON          CACHE BOOL      "Enable Protected Storage partition")
set(PS_CRYPTO_AEAD_ALG                  PSA_ALG_CCM CACHE STRING    "The AEAD algorithm to use for authenticated encryption in protected storage")

set(TFM_PARTITION_CRYPTO                ON          CACHE BOOL      "Enable Crypto partition")

set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "Enable Initial Attestation partition")

set(TFM_PARTITION_PLATFORM              ON          CACHE BOOL      "Enable Platform partition")

####################### Fault Injection Hardening ##############################
set(MCUBOOT_FIH_PROFILE                 MEDIUM      CACHE STRING    "Fault injection hardening profile [OFF, LOW, MEDIUM, HIGH]")

################################## Tests #######################################

# Specify the Crypto test cases
set(TFM_CRYPTO_TEST_ALG_CBC             ON          CACHE BOOL      "Test CBC cryptography mode")
set(TFM_CRYPTO_TEST_ALG_CFB             OFF         CACHE BOOL      "Test CFB cryptography mode")
set(TFM_CRYPTO_TEST_ALG_CTR             OFF         CACHE BOOL      "Test CTR cryptography mode")
set(TFM_CRYPTO_TEST_ALG_GCM             ON          CACHE BOOL      "Test GCM cryptography mode")
set(TFM_CRYPTO_TEST_ALG_SHA_512         ON          CACHE BOOL      "Test SHA-512 cryptography algorithm")
set(TFM_CRYPTO_TEST_HKDF                ON          CACHE BOOL      "Test the HKDF key derivation algorithm")
set(TFM_CRYPTO_TEST_ECDH                ON          CACHE BOOL      "Test the ECDH key agreement algorithm")

################################## Dependencies ################################

set(TFM_MBEDCRYPTO_CONFIG_PATH          "${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/mbedcrypto_config/tfm_mbedcrypto_config_profile_large.h" CACHE PATH "Config to use for Mbed Crypto")
