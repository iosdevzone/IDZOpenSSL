#
# Remote configuration 
#
IDZ_IOS_SDK_VERSION=8.1
IDZ_OPENSSL_VERSION=1.0.1i
IDZ_OPENSSL_URL=https://www.openssl.org/source/
IDZ_OPENSSL_SRC_DIR_NAME=openssl-$IDZ_OPENSSL_VERSION
IDZ_OPENSSL_TAR=$IDZ_OPENSSL_SRC_DIR_NAME.tar.gz
IDZ_OPENSSL_MD5=$IDZ_OPENSSL_TAR.md5
#
# Local configuration
#
IDZ_OPENSSL_DIR=$IDZ_BUILD_ROOT/openssl/$IDZ_OPENSSL_VERSION
IDZ_OPENSSL_SRC_DIR=$IDZ_OPENSSL_DIR/$IDZ_OPENSSL_SRC_DIR_NAME
IDZ_OPENSSL_BUILD_DIR=$IDZ_BUILD_ROOT/openssl/$IDZ_OPENSSL_VERSION

IDZ_OPENSSL_BUILDLIST="ios-armv7-clang ios-armv7s-clang ios-arm64-clang ios-i386-clang ios-x86_64-clang"

function idz_error_check ()
{
  if [ $1 -ne 0 ]; then
    exit $1
  fi
}
