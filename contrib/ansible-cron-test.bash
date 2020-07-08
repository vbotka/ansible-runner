#!/bin/bash

marker=$(printf "%80s" | sed "s/ /./g")
rc=0
cmd=$HOME/bin/arwrapper.bash
projects="test_01 test_02 test_03"
playbook=pb-01.yml

for project in ${projects[@]}; do
     out=$($cmd run $project $playbook 2>&1)
     if [ $? -eq 0 ]; then
        printf "[OK]  $project $playbook PASSED\n"
	$cmd clean $project
    else
        printf "[ERR] $out\n$marker\n"
        rc=1
    fi
done

exit $rc
