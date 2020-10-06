#*****************************************************************************
# makePetaLinux.sh
#
# Change History:
#  VER.   Author         DATE              Change Description
#  1.0    Qiwei Wu       Sep.30, 2020      Initial Release
#*****************************************************************************
#!/bin/bash

BuildDir='.build'

PrjName=$1
SrcFileDir=$2

#make dir
if [ -d $BuildDir ]; then
   echo "Warning: Building Directory $BuildDir Exist"
   rm -r $BuildDir
   echo "Info: Old Building Directory $BuildDir Removing"
fi
mkdir $BuildDir
echo "Info: Building Directory $FileSys/$BuildDir Establish"

#copy files
cp $SrcFileDir/* $BuildDir -r

# petalinux configure
cd $BuildDir
petalinux-create --type project --template zynq --name $PrjName
cd $PrjName
petalinux-config --get-hw-description ../

# petalinux custom app
petalinux-create -t apps --template c --name $PrjName --enable
cp ../../software/* components/apps/$PrjName/

#petalinux-config -c kernel
#petalinux-config -c rootfs

# petalinux build
petalinux-build

# petalinux package
petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga ../$PrjName.bit --uboot --force

#finish building
sleep 2
echo "Info: $PrjName Petalinux project finish building"

#copy the BOOT.bin file
cd ./images/linux
if [ -f BOOT.BIN ]; then
   cp image.ub ../../../../$SrcFileDir
   cp BOOT.BIN ../../../../$SrcFileDir
   echo "Info: BOOT.BIN file moved to $SrcFileDir"
   cd ../../../../
   #clean
   rm -rf $BuildDir
   echo "Info: BOOT.BIN file finish making"
   echo -e "\n   Success \n"
else
   echo "Error: $PrjName Petalinux Project built failed"
   echo "Error: $PrjName Petalinux Project make failed"
   echo -e "\n   Failure \n"
fi

