#*****************************************************************************
# makeall.sh
#
# Change History:
#  VER.   Author         DATE              Change Description
#  1.0    Qiwei Wu       May. 04, 2019     Initial Release
#  1.1    Qiwei Wu       Apr. 06, 2020     Improvement
#  1.2    Qiwei Wu       Oct. 05, 2020     Add PetaLinux build
#*****************************************************************************
#!/bin/bash

PrjName='qwi12_petaled'
ChipType='xc7z020clg400-2'
FwBuild='1'
SwBuild='0'
PetalinuxBuild='1'
IverilogCompile='0'
MemfsBuild='0'

#*****************************************************************************
# Dir defines
#*****************************************************************************
OutpFileDir='bin'
MakeFileDir='make'
# Fw related
BuidFwFileDir='build'
# Sw related
SWTclFileDir='build'
SwSrcFileDir='software'

if [ ! -d $OutpFileDir ]; then
   mkdir $OutpFileDir
   echo "Info: $OutpFileDir created"
fi

#*****************************************************************************
# Build FW
#*****************************************************************************
if [ $FwBuild -eq 1 ]; then
	./$MakeFileDir/makefw.sh $PrjName $ChipType $BuidFwFileDir $OutpFileDir 1 $IverilogCompile
fi

#*****************************************************************************
# Build SW
#*****************************************************************************
if [ $SwBuild -eq 1 ]; then
   ./$MakeFileDir/makesw.sh $PrjName $SWTclFileDir $SwSrcFileDir $OutpFileDir $MemfsBuild
fi

#*****************************************************************************
# Build PetaLinux
#*****************************************************************************
if [ $PetalinuxBuild -eq 1 ]; then
   ./$MakeFileDir/makepetalinux.sh $PrjName $OutpFileDir
fi
