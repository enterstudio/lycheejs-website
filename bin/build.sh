#!/bin/bash

LYCHEEJS_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../../../"; pwd);
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);
LYCHEEJS_HELPER=`which lycheejs-helper`;

if [ "$LYCHEEJS_HELPER" == "" ]; then
	LYCHEEJS_HELPER="$LYCHEEJS_ROOT/bin/helper.sh";
fi;


if [ -e "$LYCHEEJS_HELPER" ]; then

	cd $PROJECT_ROOT;

	cp "$PROJECT_ROOT/index.html" "$PROJECT_ROOT/build/index.html";
	cp "$PROJECT_ROOT/examples.html" "$PROJECT_ROOT/build/examples.html";
	cp "$PROJECT_ROOT/workflow.html" "$PROJECT_ROOT/build/workflow.html";

	cp "$PROJECT_ROOT/install.sh" "$PROJECT_ROOT/build/install.sh";
	cp "$PROJECT_ROOT/install-bot.sh" "$PROJECT_ROOT/build/install-bot.sh";
	cp "$PROJECT_ROOT/favicon.ico" "$PROJECT_ROOT/build/favicon.ico";
	cp "$PROJECT_ROOT/miracle.xml" "$PROJECT_ROOT/build/miracle.xml";
	cp "$PROJECT_ROOT/age.xml" "$PROJECT_ROOT/build/age.xml";
	cp "$PROJECT_ROOT/age-de.xml" "$PROJECT_ROOT/build/age-de.xml";

	cp -R "$PROJECT_ROOT/asset" "$PROJECT_ROOT/build/asset";
	cp -R "$PROJECT_ROOT/design" "$PROJECT_ROOT/build/design";
	cp -R "$PROJECT_ROOT/download" "$PROJECT_ROOT/build/download";

	rm -rf "$PROJECT_ROOT/build/html";

	echo "SUCCESS";
	exit 0;

else

	echo "FAILURE";
	exit 1;

fi;

