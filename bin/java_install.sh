#!/usr/bin/env bash
# bin/compile <build-dir> <cache-dir> <env-file>

# fail fast
set -e

# parse args
BUILD_DIR=$1
CACHE_DIR=$2

# create default system.properties 
if [ ! -f ${BUILD_DIR}/system.properties ]; then
  echo "java.runtime.version=1.6" > ${BUILD_DIR}/system.properties
fi

# install JDK 
javaVersion=$(detect_java_version ${BUILD_DIR})
echo -n "-----> Installing OpenJDK ${javaVersion}..."
install_java ${BUILD_DIR} ${javaVersion}
jdk_overlay ${BUILD_DIR}
echo " done"
