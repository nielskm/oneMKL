#===============================================================================
# Copyright 2020-2021 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions
# and limitations under the License.
#
#
# SPDX-License-Identifier: Apache-2.0
#===============================================================================

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
include(CMakeFindDependencyMacro)

# If not hipSYCL, we need to find the SYCL implementation
if ( NOT ${ONEMKL_SYCL_IMPLEMENTATION} STREQUAL "hipsycl" )
    find_dependency(SYCL REQUIRED)
endif()

# Define the ONEMKL::cuBLAS::cuBLAS, etc. targets.
if ( ENABLE_CUBLAS_BACKEND )
    find_dependency(cuBLAS REQUIRED)
endif()
if ( ENABLE_CURAND_BACKEND )
    find_dependency(cuRAND REQUIRED)
endif()
if ( ENABLE_CUSOLVER_BACKEND )
    find_dependency(cuSOLVER REQUIRED)
endif()


include("${CMAKE_CURRENT_LIST_DIR}/oneMKLTargets.cmake")
