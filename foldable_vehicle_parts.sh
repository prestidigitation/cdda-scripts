#!/bin/bash
echo "Executing script..."

#svn export https://github.com/CleverRaven/Cataclysm-DDA/trunk/data/json/vehicleparts

git clone https://github.com/CleverRaven/Cataclysm-DDA.git

cat Cataclysm-DDA/data/json/vehicleparts/*.json | jq '.[]
| select(.flags | index("FOLDABLE")), select(.extend.flags | index("FOLDABLE"))
| select(.id)
| .id'

rm -rf Cataclysm-DDA
