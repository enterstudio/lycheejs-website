#!/bin/bash

LYCHEEJS_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../../../"; pwd);
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);


if [ -d $PROJECT_ROOT/build ]; then

	cd $PROJECT_ROOT/build;
	echo "lychee.js.org" > $PROJECT_ROOT/build/CNAME;
	rm -rf ./.git;
	git init;
	git remote add origin git@github.com:Artificial-Engineering/lycheeJS-website.git;
	git checkout -b gh-pages;
	git add ./;
	git commit -m ":construction: lychee.js fertilizer package :construction:";
	git push origin gh-pages -f;

	echo "SUCCESS";
	exit 0;

else

	echo "FAILURE";
	exit 1;

fi;