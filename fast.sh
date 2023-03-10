#!/bin/bash
export KERNEL_DIR="/home/deepongi/Android/aurora-kernel-oss"
export KBUILD_OUTPUT="/home/deepongi/Android/aurora-kernel-oss/out"
export ZIP_DIR="/home/deepongi/Android/AnyKernel3"
export ZIP_OUT_DIR="/home/deepongi/Android/Out_Zips"
rm -rfv /home/deepongi/Android/AnyKernel3/Image
make mrproper
rm -rfv $KBUILD_OUTPUT
export PATH="/mnt/Hawai/toolchains/proton-clang-16/bin:$PATH"
export USE_CCACHE=1
export ARCH=arm64
export VARIANT="aurora-r01"
export HASH=`git rev-parse --short=4 HEAD`
export KERNEL_ZIP="$VARIANT-$HASH"
export LOCALVERSION="~aurora-r01"
make O=out CC=clang LLVM=1 LLVM_IAS=1 vendor/okona_defconfig
make O=out CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM=1 LLVM_IAS=1 -j$(nproc --all) CROSS_COMPILE=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- CROSS_COMPILE_ARM32=/mnt/Hawai/toolchains/gcc-linaro-12.2.1-2023.01_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
cp -v $KBUILD_OUTPUT/arch/arm64/boot/Image $ZIP_DIR/Image
cp -v $KBUILD_OUTPUT/arch/arm64/boot/dtbo.img $ZIP_DIR/dtbo.img
cd $ZIP_DIR
zip -r9 $VARIANT-$HASH.zip *
mv -v $VARIANT-$HASH.zip $ZIP_OUT_DIR/
echo -e "${green}"
echo "-------------------"
echo "Build Completed"
echo "-------------------"
echo -e "${restore}"
echo "                                                     "
echo "  _       __        _          _     _      _        "
echo " (_)_ _  / _|___ __| |_ ___ __| |___| |__ _| |__ ___ "
echo " | | ' \|  _/ -_) _|  _/ -_) _  |___| / _  | '_ (_-< "
echo " |_|_||_|_| \___\__|\__\___\__,_|   |_\__,_|_.__/__/ "
echo "                                                     "
echo "                                                     "
                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
