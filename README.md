Ice Cream Sandwich Restoration Project (i-scream-sandwich)
===========

This repository contains reconstructed manifests of ICS builds. As of now, following builds were reconstructed:


| Build number                    | Status           |
| :---:                           |   :---:          |
| `IRK36B` (August 6th, 2011)     |    Done          |


Getting Started
---------------

To get started with Android, you'll need to get
familiar with [Git and Repo](http://source.android.com/source/using-repo.html).

To initialize your local repository using the Android trees, use a command like this:

    repo init -u https://github.com/Typicals-Android-Stuff/i-scream-sandwich IRK36B

Then to sync up:

    repo sync

Compiling
---------

For installing dependencies, refer over to this [site](https://web.archive.org/web/20130128005045/http://source.android.com/source/initializing.html). To initialize build environment, use a command:

    . build/envsetup.sh
	
Then, pick up from available compilation options by using command:

    lunch
	
	
