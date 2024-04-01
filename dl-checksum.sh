#!/usr/bin/env sh
DIR=~/Downloads
MIRROR='http://search.maven.org/remotecontent?filepath=org/python/jython-installer'

dl_ver()
{
    local ver=$1
    local file="jython-installer-${ver}.jar"
    local url="${MIRROR}/${ver}/${file}"
    local lfile="${DIR}/${file}"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver `sha256sum $lfile | awk '{print $1}'`
}

dl_ver ${1:-2.7.3}
