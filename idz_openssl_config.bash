#
# Remote configuration
#
IDZ_IOS_SDK_VERSION=`xcrun -sdk iphoneos --show-sdk-version`
#
# This funny syntax allows the IDZ_OPENSSL_VERSION to be overidden
# by an environment variable
#
: ${IDZ_OPENSSL_VERSION:=1.0.2g}
IDZ_OPENSSL_URL=https://www.openssl.org/source/
IDZ_OPENSSL_SRC_DIR_NAME=openssl-$IDZ_OPENSSL_VERSION
IDZ_OPENSSL_TAR=$IDZ_OPENSSL_SRC_DIR_NAME.tar.gz
IDZ_OPENSSL_SHA1=$IDZ_OPENSSL_TAR.sha1
#
# Local configuration
#
: ${IDZ_OPENSSL_DIR:=$(pwd)}

IDZ_OPENSSL_BUILD_DIR=$IDZ_OPENSSL_DIR
: ${IDZ_OPENSSL_SRC_DIR:=$IDZ_OPENSSL_DIR/$IDZ_OPENSSL_SRC_DIR_NAME}


: ${IDZ_OPENSSL_BUILDLIST:="ios-armv7-clang ios-armv7s-clang ios-arm64-clang\
 ios-i386-clang ios-x86_64-clang\
 tvos-arm64-clang tvos-x86_64-clang\
 watchos-armv7k-clang watchos-i386-clang"}

function idz_error_check ()
{
  if [ $1 -ne 0 ]; then
    exit $1
  fi
}
