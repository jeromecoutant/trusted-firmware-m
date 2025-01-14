#-------------------------------------------------------------------------------
# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

set(TFM_EXTRA_GENERATED_FILE_LIST_PATH  ${CMAKE_CURRENT_SOURCE_DIR}/platform/ext/target/arm/mps2/an521/generated_file_list.yaml  CACHE PATH "Path to extra generated file list. Appended to stardard TFM generated file list." FORCE)

if(TFM_PSA_API)
    if (NOT TFM_ENABLE_SLIH_TEST)
        # FLIH and SLIH testing can not be enabled at the same time
        set(TFM_ENABLE_FLIH_TEST      ON           CACHE BOOL      "Enable FLIH testing")
    endif()
endif()
