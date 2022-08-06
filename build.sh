config=vendor/lito-perf_defconfig
arch=arm64
#export CROSS_COMPILE=$(pwd)/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
if [ ! -d "./aarch64-linux-android-4.9" ];
then
  git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b ndk-release-r22
fi
export CROSS_COMPILE=$(pwd)/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export ARCH=$arch
git clone https://github.com/Edward-Projects/android_kernel_lenovo_J607Z.git
cd ./android_kernel_lenovo_J607Z
if [ -d "./out" ];
then
  echo "cleaning......"
  rm -rf ./out
  make mrproper
  
fi
  make O=out $config
  echo "build start--------------------------------"
  make O=out -j$(nproc)

