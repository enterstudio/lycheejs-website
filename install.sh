#!/usr/bin/env bash


LYCHEEJS_ROOT="/opt/lycheejs";
LYCHEEJS_BRANCH="development";



if [ "$USER" != "root" ]; then

	echo "You are not root.";
	echo "Use \"sudo $0\"";

	exit 1;

fi;



echo "";
echo "lychee.js Git/Net Installer";
echo "";
echo "This installer will download and install lychee.js to $LYCHEEJS_ROOT";
echo "";



read -p "Continue (y/n)? " -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "";
else
	exit 1;
fi;



echo "";
echo "Installing lychee.js ...";

	if [ ! -d "$LYCHEEJS_ROOT" ]; then
		mkdir -m 0777 "$LYCHEEJS_ROOT";
	else
		rm -rf "$LYCHEEJS_ROOT";
		mkdir -m 0777 "$LYCHEEJS_ROOT";
	fi;


	cd "$LYCHEEJS_ROOT";

	git clone https://github.com/Artificial-Engineering/lycheejs.git ./;
	git checkout "$LYCHEEJS_BRANCH";

echo "Done.";


echo "";
echo "Installing lycheejs runtimes ...";

	if [ ! -d "$LYCHEEJS_ROOT/bin/runtime" ]; then
		mkdir -m 0777 "$LYCHEEJS_ROOT/bin/runtime";
	else
		rm -rf "$LYCHEEJS_ROOT/bin/runtime";
		mkdir -m 0777 "$LYCHEEJS_ROOT/bin/runtime";
	fi;


	cd "$LYCHEEJS_ROOT";

	git clone --depth 1 https://github.com/Artificial-Engineering/lycheejs-runtime.git --branch master --single-branch ./bin/runtime;

echo "Done.";

echo "";
echo "Configuring lychee.js ...";

	cd $LYCHEEJS_ROOT;

	./bin/configure.sh;

echo "Done.";

echo "";
echo "";
echo "";
echo "Now bootup lychee.js by starting lycheejs-harvester.";

	echo "";
	echo "1. Modify $LYCHEEJS_ROOT/bin/harvester/development.json";
	echo "2. Start lycheejs-harvester with this command:";
	echo "";
	echo "cd $LYCHEEJS_ROOT;";
	echo "lycheejs-harvester start development; # Trailing --sandbox for sandboxed harvester";
	echo "";

