#!/bin/bash

LYCHEEJS_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../../../"; pwd);
PROJECT_ROOT=$(cd "$(dirname "$(readlink -f "$0")")/../"; pwd);
LYCHEEJS_FERTILIZER=`which lycheejs-fertilizer`;

if [ "$LYCHEEJS_FERTILIZER" == "" ]; then
	LYCHEEJS_FERTILIZER="$LYCHEEJS_ROOT/bin/fertilizer.sh";
fi;


if [ -e "$LYCHEEJS_FERTILIZER" ]; then

	cd $PROJECT_ROOT;

	rm -rf "$PROJECT_ROOT/release";
	mkdir -p "$PROJECT_ROOT/release";


	$LYCHEEJS_FERTILIZER auto /projects/boilerplate;
	mv "$LYCHEEJS_ROOT/projects/boilerplate/build/boilerplate_browser_all.zip"    "$PROJECT_ROOT/release/boilerplate_browser_all.zip";
	mv "$LYCHEEJS_ROOT/projects/boilerplate/build/boilerplate_linux_x86_64.zip"   "$PROJECT_ROOT/release/boilerplate_linux_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/boilerplate/build/boilerplate_osx_x86_64.zip"     "$PROJECT_ROOT/release/boilerplate_osx_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/boilerplate/build/boilerplate_windows_x86_64.zip" "$PROJECT_ROOT/release/boilerplate_windows_x86_64.zip";

	$LYCHEEJS_FERTILIZER auto /projects/lethalmaze;
	mv "$LYCHEEJS_ROOT/projects/lethalmaze/build/lethalmaze_browser_all.zip"    "$PROJECT_ROOT/release/lethalmaze_browser_all.zip";
	mv "$LYCHEEJS_ROOT/projects/lethalmaze/build/lethalmaze_linux_x86_64.zip"   "$PROJECT_ROOT/release/lethalmaze_linux_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/lethalmaze/build/lethalmaze_osx_x86_64.zip"     "$PROJECT_ROOT/release/lethalmaze_osx_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/lethalmaze/build/lethalmaze_windows_x86_64.zip" "$PROJECT_ROOT/release/lethalmaze_windows_x86_64.zip";

	$LYCHEEJS_FERTILIZER auto /projects/mode7;
	mv "$LYCHEEJS_ROOT/projects/mode7/build/mode7_browser_all.zip"    "$PROJECT_ROOT/release/mode7_browser_all.zip";
	mv "$LYCHEEJS_ROOT/projects/mode7/build/mode7_linux_x86_64.zip"   "$PROJECT_ROOT/release/mode7_linux_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/mode7/build/mode7_osx_x86_64.zip"     "$PROJECT_ROOT/release/mode7_osx_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/mode7/build/mode7_windows_x86_64.zip" "$PROJECT_ROOT/release/mode7_windows_x86_64.zip";

	$LYCHEEJS_FERTILIZER auto /projects/over-there;
	mv "$LYCHEEJS_ROOT/projects/over-there/build/over-there_browser_all.zip"    "$PROJECT_ROOT/release/over-there_browser_all.zip";
	mv "$LYCHEEJS_ROOT/projects/over-there/build/over-there_linux_x86_64.zip"   "$PROJECT_ROOT/release/over-there_linux_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/over-there/build/over-there_osx_x86_64.zip"     "$PROJECT_ROOT/release/over-there_osx_x86_64.zip";
	mv "$LYCHEEJS_ROOT/projects/over-there/build/over-there_windows_x86_64.zip" "$PROJECT_ROOT/release/over-there_windows_x86_64.zip";


	cd $PROJECT_ROOT;

	rm -rf "$PROJECT_ROOT/build";
	mkdir -p "$PROJECT_ROOT/build";


	mkdir -p "$PROJECT_ROOT/build/examples/boilerplate";
	cp -R $LYCHEEJS_ROOT/projects/boilerplate/build/html/main/* $PROJECT_ROOT/build/examples/boilerplate/;

	mkdir -p "$PROJECT_ROOT/build/examples/lethalmaze";
	cp -R $LYCHEEJS_ROOT/projects/lethalmaze/build/html/main/* $PROJECT_ROOT/build/examples/lethalmaze/;

	mkdir -p "$PROJECT_ROOT/build/examples/mode7";
	cp -R $LYCHEEJS_ROOT/projects/mode7/build/html/main/* $PROJECT_ROOT/build/examples/mode7/;

	mkdir -p "$PROJECT_ROOT/build/examples/over-there";
	cp -R $LYCHEEJS_ROOT/projects/over-there/build/html/main/* $PROJECT_ROOT/build/examples/over-there/;


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

	echo "SUCCESS";
	exit 0;

else

	echo "FAILURE";
	exit 1;

fi;

