#!/usr/bin/env bash
#Usage: ship.sh [-v versionNumber][-rd]
#-v set version number
#-d run gradle with --debug
#-r publish to maven, jcenter

dir=`dirname $0`
userId="alibabaweex"
userKey="171795c1feb7cff7766c06dafa7c7b4672653a50"
developerId="weex alibaba"
developerName="weex alibaba"
developerEmail="alibabaweex@gmail.com"
group="com.taobao.android"
version="0.0.0.1"
publish="false"
buildScript="$dir/pub.gradle"
artifactName="weex_svg"
tempDir="$HOME/temp/$artifactName"
debuggable=""

while getopts "v:rdh" arg
do
    case $arg in
        v)
        echo "publishing version number is :$OPTARG"
        version=$OPTARG
        ;;
        d)
        # build with debug
        debuggable=" --debug"
        ;;
        h)
        echo "Usage: ship [-v versionNumber][-rd]"
        echo "-v set version number"
        echo "-d run gradle with --debug"
        echo "-r publish to maven, jcenter"
        exit 1
        ;;
        r)
        # release to bintray.com
        publish="true"
        ;;
        ?)
        echo "unknown argument"
        exit 1
        ;;
    esac
done
echo "publishing version number : [$version] publish to maven, jcenter : [$publish]"

mkdir -p $tempDir
cp -a $dir $tempDir

cd $tempDir

cp "$dir/bintray-build.gradle" $buildScript

sed -i "" "s/&userId&/$userId/g" $buildScript
sed -i "" "s/&userKey&/$userKey/g" $buildScript
sed -i "" "s/&developerId&/$developerId/g" $buildScript
sed -i "" "s/&developerName&/$developerName/g" $buildScript
sed -i "" "s/&developerEmail&/$developerEmail/g" $buildScript
sed -i "" "s/&group&/$group/g" $buildScript
sed -i "" "s/&version&/$version/g" $buildScript
sed -i "" "s/def shouldPublish = false/def shouldPublish = $publish/g" $buildScript

$dir/gradlew clean assemble bintray -b $buildScript$debuggable
rm -rf $tempDir

echo -e "\033[31m **************SHIP INFO**************** \033[0m"
echo -e "\033[31m published version number : [$version] \033[0m"
echo -e "\033[31m published jcenter : [$publish] \033[0m"
echo -e "\033[31m *************************************** \033[0m"