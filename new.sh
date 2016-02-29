#!/bin/bash

set -eu

if [ $# -lt 1 ]; then
  echo "Usage $0 <project name>"
  exit 1
fi

PRJ=$1
echo "Generate project: $PRJ"
if [ -d  "${PRJ}_prj" ]; then
  echo "Directory already exist: ${PRJ}_prj"
  exit 1
fi

mkdir -p ${PRJ}_prj
cp -r template/* ${PRJ}_prj

cd ${PRJ}_prj
find . -type f | xargs -I{} sed -i "" "s/<project>/${PRJ}/g" {}
mv src/prj.vhdl src/${PRJ}.vhdl
mv test/prj_tb.vhdl test/${PRJ}_tb.vhdl
cd -

echo "Done."
