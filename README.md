# IDZOpenSSL [![Build Status](https://travis-ci.org/iosdevzone/IDZOpenSSL.svg?branch=master)](https://travis-ci.org/iosdevzone/IDZOpenSSL)

Scripts to compile OpenSSL for iOS.

Remote Variables
----------------
* IDZ_OPENSSL_VERSION The OpenSSL version begin fetched/compile (e.g. 1.0.1i)
* IDZ_OPENSSL_URL     The URL of the directory containing the OpenSSL source distribution

Local Variables
---------------
* IDZ_OPENSSL_DIR The (version-specific) root directory into which the OpenSSL will be downloaded
* IDZ_OPENSSL_BUILD_DIR The directory used for intermediate (per-architecture) build file
* IDZ_OPENSSL_BUILDLIST A list of os-arch-compiler tags being build for



