#--------DEPENDECE-------
#sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig git python



#-------CONFIGURATION-----

src_dir=..
config=vendor/lito-perf_defconfig
arch=arm64


#-------TOOLCHAIN-----------
if [ ! -d "./toolchains" ];
then
git clone https://github.com/Shubhamvis98/toolchains.git
fi

export PATH=$(pwd)/toolchains/clang-r428724/bin:$(pwd)/toolchains/aarch64-linux-android-4.9/bin:$(pwd)/arm-linux-androideabi-4.9/bin:$PATH

export CROSS_COMPILE=aarch64-linux-android-

export CROSS_COMPILE_ARM32=arm-linux-androideabi-

export CLANG_TRIPLE=aarch64-linux-gnu-

export ARCH=$arch
#-----------RUN-----------

cd $src_dir
if [ -d "./out" ];
then
  echo "cleaning......"
  rm -rf ./out
  make mrproper 
fi
  echo "configing----------------------------"
  make O=out ARCH=$arch $config
  echo "build start--------------------------------"
  make -j3 CC=clang O=out
  
  
  
  

#git clone https://http://mirrors.ustc.edu.cn/aosp/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b ndk-release-r21

#git clone https://github.91chi.fun/https://github.com/bigsaltyfishes/kernel_lenovo_J607Z.git


