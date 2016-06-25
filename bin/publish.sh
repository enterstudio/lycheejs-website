#!/bin/bash

LYCHEEJS_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../../../"; pwd);
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);


cd $PROJECT_ROOT;

branch=`git branch --list gh-pages`;

if [ "$branch" != "" ]; then

	git checkout gh-pages;
	git push origin gh-pages -f;

	echo "SUCCESS";
	exit 0;

else

	echo "FAILURE";
	exit 1;

fi;

