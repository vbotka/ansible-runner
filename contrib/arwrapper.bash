#!/bin/bash

runner=$HOME/bin/ansible-runner
project=$HOME/.ansible/runner/$2
playbook=${3:-all.yml}

case "$1" in
    test)
	echo $(date '+%Y-%m-%d %H:%M:%S') $runner run $project -p $playbook
	;;
    run)
	echo $(date '+%Y-%m-%d %H:%M:%S') $0
	source $HOME/.ssh/environment
	$runner run $project -p $playbook
	;;
    clean)
	rm -rf $project/artifacts
	;;
    *)
	printf "$0: run|clean|test project [playbook]\n"
	exit 1
	;;
esac
exit
