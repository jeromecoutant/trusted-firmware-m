/*
 * Copyright (c) 2018-2021, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include "array.h"
#include "psa/initial_attestation.h"
#include "tfm_memory_utils.h"
#include "tfm_secure_api.h"
#ifdef TFM_PSA_API
#include "psa/client.h"
#include "psa_manifest/sid.h"
#else
#include "tfm_veneers.h"
#endif
#include <string.h>

psa_status_t
psa_initial_attest_get_token(const uint8_t *auth_challenge,
                             size_t         challenge_size,
                             uint8_t       *token_buf,
                             size_t         token_buf_size,
                             size_t        *token_size)
{
    psa_status_t status;
    psa_invec in_vec[] = {
        {auth_challenge, challenge_size}
    };
    psa_outvec out_vec[] = {
        {token_buf, token_buf_size}
    };

#ifdef TFM_PSA_API
    psa_handle_t handle = PSA_NULL_HANDLE;
    handle = psa_connect(TFM_ATTEST_GET_TOKEN_SID,
                         TFM_ATTEST_GET_TOKEN_VERSION);
    if (!PSA_HANDLE_IS_VALID(handle)) {
        return PSA_HANDLE_TO_ERROR(handle);
    }

    status = psa_call(handle, PSA_IPC_CALL,
                      in_vec, IOVEC_LEN(in_vec),
                      out_vec, IOVEC_LEN(out_vec));
    psa_close(handle);
#else
    status = tfm_initial_attest_get_token_veneer(in_vec, IOVEC_LEN(in_vec),
                                                 out_vec, IOVEC_LEN(out_vec));
#endif
    if (status == PSA_SUCCESS) {
        *token_size = out_vec[0].len;
    }

    return status;
}

psa_status_t
psa_initial_attest_get_token_size(size_t challenge_size,
                                  size_t *token_size)
{
    psa_status_t status;
    psa_invec in_vec[] = {
        {&challenge_size, sizeof(challenge_size) }
    };
    psa_outvec out_vec[] = {
        {token_size, sizeof(size_t)}
    };

#ifdef TFM_PSA_API
    psa_handle_t handle = PSA_NULL_HANDLE;
    handle = psa_connect(TFM_ATTEST_GET_TOKEN_SIZE_SID,
                         TFM_ATTEST_GET_TOKEN_SIZE_VERSION);
    if (!PSA_HANDLE_IS_VALID(handle)) {
        return PSA_HANDLE_TO_ERROR(handle);
    }

    status = psa_call(handle, PSA_IPC_CALL,
                      in_vec, IOVEC_LEN(in_vec),
                      out_vec, IOVEC_LEN(out_vec));
    psa_close(handle);
#else

    status = tfm_initial_attest_get_token_size_veneer(in_vec, IOVEC_LEN(in_vec),
                                                   out_vec, IOVEC_LEN(out_vec));
#endif

    return status;
}
