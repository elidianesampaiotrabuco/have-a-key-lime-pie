i-scream-sandwich: Ice Cream Sandwich Restoration Project
=========================================================

This repository contains reconstructed `repo` manifests of pre-release Android 4.0 ("Ice Cream Sandwich") builds.

As of now, the following builds have been reconstructed:

| Build ID & manifest branch               | Status           |
| :--------------------------------------: | :--------------: |
| [`IRJ60`]  (May 30th, 2011)              | Done             |
| [`IRJ91D`] (July 1st, 2011)              | Work in progress |
| [`IRK36B`] (August 6th, 2011)            | Done             |

[`IRJ60`]:  https://github.com/froyocomb/i-scream-sandwich/tree/IRJ60
[`IRJ91D`]: https://github.com/froyocomb/i-scream-sandwich/tree/IRJ91D
[`IRK36B`]: https://github.com/froyocomb/i-scream-sandwich/tree/IRK36B

Preparing a Build Environment
-----------------

For installing dependencies, refer to the article ["Initializing a Build Environment"](https://web.archive.org/web/20140208084633/http://source.android.com/source/initializing.html) from the AOSP documentation.

It is recommended to use an older Linux distribution. All builds have been tested on Ubuntu 12.04 ("Precise Pangolin"), which can be downloaded from [here](https://old-releases.ubuntu.com/releases/12.04/ubuntu-12.04.5-desktop-amd64.iso).

For the repositories to work, it is needed to replace any `archive.ubuntu.com` and `security.ubuntu.com` mentions in your repository list (which is under /etc/apt/sources.list) with `old-releases.ubuntu.com`. Then, it will be possible to install required dependencies.

Ubuntu 12.04 usually bundles newer GCC version, like 4.6. However, for those builds, GCC 4.4 is more recommended. To download older GCC, execute:

    sudo apt-get install gcc-4.4 g++-4.4 gcc-4.4-multilib g++-4.4-multilib  

Downloading Source
------------------

To get started with downloading the source code, experience with Git and [`repo`](https://source.android.com/docs/setup/reference/repo) is needed.

To initialize a repository tree using one of the manifests provided by this project, execute a command like this (see the table above for available `<branch>`es):

    repo init -u https://github.com/froyocomb/i-scream-sandwich.git <branch>

Then to download the respective code, execute:

    repo sync

Compiling
---------

To initialize the build environment, execute the following command:

    source build/envsetup.sh

Then pick from one of the available build targets by executing the command:

    lunch

As appropriate device trees are not available in the source, the only targets that are possible to pick are the generic ones.

To compile Android, type:

    make CC=gcc-4.4 CXX=g++-4.4

Running
-------

You can run the compiled build with the Android Emulator.

In the Ubuntu build environment, you may run the currently compiled build with the in-tree emulator by executing the command:

    emulator
