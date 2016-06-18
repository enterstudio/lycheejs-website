
=Q1

### How is lychee.js licensed?

lychee.js is released under the MIT / Expat License.

For further details take a look at the [LICENSE.txt](https://github.com/Artificial-Engineering/lycheejs/blob/master/LICENSE.txt) file.


=Q2

### How can I get started with lychee.js?

The features and the essential workflow of all Software Bots are explained
on the [Features](#!features) Page.

For more details on how to build Apps with lychee.js, we have written some
[Tutorials](#!tutorials) for you.

The lychee.js Engine is the full-blown automation framework that gets
installed on a developer machine and software bots learn from your code.

The lychee.js Library can be used in third-party frameworks, but has not
the advantages of software bots that learn from your code.


=Q3

### I can't boot up lychee.js!

Please follow the steps in the [README.md](https://github.com/Artificial-Engineering/lycheejs/tree/master/README.md).

If that didn't work out, please let us know in the [lychee.js](https://github.com/Artificial-Engineering/lycheejs/issues)
repository issues.

Common mistakes are:

- Forgot to execute everything inside a `bash` shell.
- Forgot to execute `sudo ./bin/configure.sh`.
- Forgot that `localhost:4848` and `localhost:8080` is already in use.
- Forgot to edit the `port` setting of `./bin/harvester/development.json`.
- Forgot to clone the [lychee.js runtime](https://github.com/Artificial-Engineering/lycheejs-runtime) repository to `./bin/runtime`.


=Q4

### I can't run lychee.js on GNU/Linux!

We have tested and can confirm that Arch Linux, Debian, Ubuntu, Fedora,
Red Hat and openSUSE are working by using the netinstaller from the
[Install](#!install) page.

If we haven't integrated your package manager yet, please let us know in the
[lychee.js](https://github.com/Artificial-Engineering/lycheejs/issues)
repository issues.


=Q5

### I can't run lychee.js on OSX!

Please use the netinstaller from the [Install](#!install) page. We require
many GNU-compatible binaries, so it is important that you have installed
either `homebrew` or `macports` on your OS beforehand.


=Q6

### I can't run lychee.js on Windows!

Sorry, we don't support Windows as a developer machine.

We currently require a fully working GNU environment with proper bash and
all required GNU utilities for proper cross-packaging and cross-compilation.

The `lycheejs://` URL wrapper is necessary to have full unlimited
no-CORS-or-Firewall-blocked access for POST and GET requests to a webserver
running on `localhost:4848` which is our local management port.

The so-called Ephermal Ports ( `49152` to `65534` ) have to be available
in order to have a working peer-to-peer WebSocket environment.

As of now (2016 Q2) this is pretty much close to impossible to achieve with
Windows. If you can prove us wrong, feel free to give us hints in the
[lychee.js](https://github.com/Artificial-Engineering/lycheejs/issues)
repository issues.

However, the `lycheejs-fertilizer` can also compile Apps to Windows as a
target platform.


=Q7

### I can't run lychee.js on FreeBSD / OpenBSD / CentOS!

We have tested and can confirm that FreeBSD, OpenBSD and CentOS are working
by using the netinstaller from the [Install](#!install) page.

If we haven't integrated your package manager yet, please let us know in the
[lychee.js](https://github.com/Artificial-Engineering/lycheejs/issues)
repository issues.

