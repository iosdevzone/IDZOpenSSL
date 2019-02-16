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

#
# Sets the globals PLATFROM, SDK and MIN_VERSION_FLAG based on an
# input triplet
# Used by `idz_openssl_build_new` and `idz_openssl_fw`
function idz_config() {
  local triplet=$1
  FORK_FLAG="-DHAVE_FORK=0"
  case $triplet in
    ios-arm*-*)
      PLATFORM=iPhoneOS
      MIN_VERSION_FLAG="-miphoneos-version-min=8.0"
      ;;
    ios-*-*)
      PLATFORM=iPhoneSimulator
      MIN_VERSION_FLAG="-mios-simulator-version-min=8.0"
      ;;
    watchos-arm*-*)
      PLATFORM=WatchOS
      MIN_VERSION_FLAG="-mwatchos-version-min=2.0"
      ;;
    watchos-*-*)
      PLATFORM=WatchSimulator
      MIN_VERSION_FLAG="-mwatchos-simulator-version-min=2.0"
      ;;
    tvos-arm*-*)
      PLATFORM=AppleTVOS
      MIN_VERSION_FLAG="-mappletvos-version-min=9.0"
      ;;
    tvos-*-*)
      PLATFORM=AppleTVSimulator
      MIN_VERSION_FLAG="-mtvos-simulator-version-min=9.0"
      ;;
  esac
  local array=(${triplet//-/ })
  OS=${array[0]}
  ARCH=${array[1]}
  COMPILER=${array[2]}
  SDK=$(echo $PLATFORM | awk '{print tolower($0)}')
}
