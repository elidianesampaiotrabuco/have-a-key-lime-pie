i-scream-sandwich: Ice Cream Sandwich Restoration Project
=========================================================

This repository contains reconstructed `repo` manifests of pre-release Android 4.0 ("Ice Cream Sandwich") builds.

As of now, the following builds have been reconstructed:

| Build ID & manifest branch               | Status           |
| :--------------------------------------: | :--------------: |
| [`IRJ60`]  (May 30th, 2011)              | Done             |
| [`IRK36B`] (August 6th, 2011)            | Done             |

[`IRJ60`]:  https://github.com/froyocomb/i-scream-sandwich/tree/IRJ60
[`IRK36B`]: https://github.com/froyocomb/i-scream-sandwich/tree/IRK36B

Downloading Source
------------------

To get started with downloading the source code, you'll need to get familiar with Git and [`repo`](https://source.android.com/docs/setup/reference/repo).

To initialize a repository tree using one of the manifests provided by this project, execute a command like this (see the table above for available `<branch>`es):

    repo init -u https://github.com/froyocomb/i-scream-sandwich.git <branch>

Then to download the respective code, execute:

    repo sync

Compiling
---------

For installing dependencies, refer to the article ["Initializing a Build Environment"](https://web.archive.org/web/20140208084633/http://source.android.com/source/initializing.html) from the AOSP documentation.

To initialize the build environment, execute the following command:

    source build/envsetup.sh

Then pick from one of the available build targets by executing the command:

    lunch
