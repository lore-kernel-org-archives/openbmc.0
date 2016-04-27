Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qw4Df0rnzzDqBy
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 01:50:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461772233437465.9961426544205;
 Wed, 27 Apr 2016 08:50:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Basic support for Firestone and Garrison systems
Date: Wed, 27 Apr 2016 10:50:30 -0500
Message-Id: <1461772230-19428-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461772230-19428-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461772230-19428-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 15:50:43 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Firestone and Garrison are IBM branded OpenPOWER systems.
---
 .../meta-firestone/conf/bblayers.conf.sample       |  27 +++
 .../meta-ibm/meta-firestone/conf/conf-notes.txt    |   2 +
 .../meta-ibm/meta-firestone/conf/layer.conf        |   9 +
 .../meta-ibm/meta-firestone/conf/local.conf.sample | 234 +++++++++++++++++++++
 .../meta-firestone/conf/machine/firestone.conf     |  12 ++
 .../recipes-kernel/linux/linux-obmc/firestone.cfg  |   4 +
 .../recipes-kernel/linux/linux-obmc/firestone.dts  |   1 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   4 +
 .../skeleton/skeleton/firestone.patch              |  11 +
 .../skeleton/skeleton/occ-path.patch               |   1 +
 .../skeleton/skeleton/poweron.patch                |   1 +
 .../meta-ibm/meta-firestone/recipes.txt            |   2 +
 .../meta-garrison/conf/bblayers.conf.sample        |  27 +++
 .../meta-ibm/meta-garrison/conf/conf-notes.txt     |   2 +
 .../meta-ibm/meta-garrison/conf/layer.conf         |   9 +
 .../meta-ibm/meta-garrison/conf/local.conf.sample  | 234 +++++++++++++++++++++
 .../meta-garrison/conf/machine/garrison.conf       |  12 ++
 .../recipes-kernel/linux/linux-obmc/garrison.cfg   |   4 +
 .../recipes-kernel/linux/linux-obmc/garrison.dts   |   1 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   4 +
 .../skeleton/skeleton/garrison.patch               |  11 +
 .../skeleton/skeleton/occ-path.patch               |  20 ++
 .../skeleton/skeleton/poweron.patch                | 113 ++++++++++
 .../meta-ibm/meta-garrison/recipes.txt             |   2 +
 26 files changed, 751 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes.txt

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
new file mode 100644
index 0000000..c675a18
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
@@ -0,0 +1,27 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "6"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone \
+  "
+BBLAYERS_NON_REMOVABLE ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-aspeed \
+  ##OEROOT##/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openpower \
+  ##OEROOT##/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openpower/meta-ibm/meta-firestone \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/conf-notes.txt
new file mode 100644
index 0000000..9b3c01a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/layer.conf
new file mode 100644
index 0000000..43a06a9
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "firestone"
+BBFILE_PATTERN_firestone = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/local.conf.sample
new file mode 100644
index 0000000..f490a0c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/local.conf.sample
@@ -0,0 +1,234 @@
+#
+# This file is your local configuration file and is where all local user settings
+# are placed. The comments in this file give some guide to the options a new user
+# to the system might want to change but pretty much any configuration option can
+# be set in this file. More adventurous users can look at local.conf.extended 
+# which contains other examples of configuration which can be placed in this file
+# but new users likely won't need any of them initially.
+#
+# Lines starting with the '#' character are commented out and in some cases the 
+# default values are provided as comments to show people example syntax. Enabling
+# the option is a question of removing the # character and making any change to the
+# variable as required.
+
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# of emulated machines available which can boot and run in the QEMU emulator:
+#
+#MACHINE ?= "qemuarm"
+#MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemumips"
+#MACHINE ?= "qemuppc"
+#MACHINE ?= "qemux86"
+#MACHINE ?= "qemux86-64"
+#
+# There are also the following hardware board target machines included for 
+# demonstration purposes:
+#
+#MACHINE ?= "beaglebone"
+#MACHINE ?= "genericx86"
+#MACHINE ?= "genericx86-64"
+#MACHINE ?= "mpc8315e-rdb"
+#MACHINE ?= "edgerouter"
+#
+# This sets the default machine to be qemux86 if no other machine is selected:
+MACHINE ??= "firestone"
+
+#
+# Where to place downloads
+#
+# During a first build the system will download many different source code tarballs
+# from various upstream projects. This can take a while, particularly if your network
+# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
+# can preserve this directory to speed up this part of subsequent builds. This directory
+# is safe to share between multiple builds on the same machine too.
+#
+# The default is a downloads directory under TOPDIR which is the build directory.
+#
+#DL_DIR ?= "${TOPDIR}/downloads"
+
+#
+# Where to place shared-state files
+#
+# BitBake has the capability to accelerate builds based on previously built output.
+# This is done using "shared state" files which can be thought of as cache objects
+# and this option determines where those files are placed.
+#
+# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
+# from these files if no changes were made to the configuration. If changes were made
+# to the configuration, only shared state files where the state was still valid would
+# be used (done using checksums).
+#
+# The default is a sstate-cache directory under TOPDIR.
+#
+#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
+
+#
+# Where to place the build output
+#
+# This option specifies where the bulk of the building work should be done and
+# where BitBake should place its temporary files and output. Keep in mind that
+# this includes the extraction and compilation of many applications and the toolchain
+# which can use Gigabytes of hard disk space.
+#
+# The default is a tmp directory under TOPDIR.
+#
+#TMPDIR = "${TOPDIR}/tmp"
+
+#
+# Default policy config
+#
+# The distribution setting controls which policy settings are used as defaults.
+# The default value is fine for general Yocto project use, at least initially.
+# Ultimately when creating custom policy, people will likely end up subclassing 
+# these defaults.
+#
+DISTRO ?= "openbmc-phosphor"
+# As an example of a subclass there is a "bleeding" edge policy configuration
+# where many versions are set to the absolute latest code from the upstream 
+# source control systems. This is just mentioned here as an example, its not
+# useful to most new users.
+# DISTRO ?= "poky-bleeding"
+
+#
+# Package Management configuration
+#
+# This variable lists which packaging formats to enable. Multiple package backends 
+# can be enabled at once and the first item listed in the variable will be used 
+# to generate the root filesystems.
+# Options are:
+#  - 'package_deb' for debian style deb files
+#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
+#  - 'package_rpm' for rpm style packages
+# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
+# We default to rpm:
+PACKAGE_CLASSES ?= "package_rpm"
+
+#
+# SDK/ADT target architecture
+#
+# This variable specifies the architecture to build SDK/ADT items for and means
+# you can build the SDK packages for architectures other than the machine you are 
+# running the build on (i.e. building i686 packages on an x86_64 host).
+# Supported values are i686 and x86_64
+#SDKMACHINE ?= "i686"
+
+SANITY_TESTED_DISTROS_append ?= " RedHatEnterpriseWorkstation-6.*"
+
+#
+# Extra image configuration defaults
+#
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
+# images. Some of these options are added to certain image types automatically. The
+# variable can contain the following options:
+#  "dbg-pkgs"       - add -dbg packages for all installed packages
+#                     (adds symbol information for debugging/profiling)
+#  "dev-pkgs"       - add -dev packages for all installed packages
+#                     (useful if you want to develop against libs in the image)
+#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
+#                     (useful if you want to run the package test suites)
+#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"    - add debugging tools (gdb, strace)
+#  "eclipse-debug"  - add Eclipse remote debugging support
+#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
+#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"   - make an image suitable for development
+#                     e.g. ssh root access has a blank password
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# We default to enabling the debugging tweaks.
+EXTRA_IMAGE_FEATURES = "debug-tweaks"
+
+#
+# Additional image features
+#
+# The following is a list of additional classes to use when building images which
+# enable extra features. Some available options which can be included in this variable 
+# are:
+#   - 'buildstats' collect build statistics
+#   - 'image-mklibs' to reduce shared library files size for an image
+#   - 'image-prelink' in order to prelink the filesystem image
+#   - 'image-swab' to perform host system intrusion detection
+# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+
+#
+# Runtime testing of images
+#
+# The build system can test booting virtual machine images under qemu (an emulator)
+# after any root filesystems are created and run tests against those images. To
+# enable this uncomment this line. See classes/testimage(-auto).bbclass for
+# further details.
+#TEST_IMAGE = "1"
+#
+# Interactive shell configuration
+#
+# Under certain circumstances the system may need input from you and to do this it 
+# can launch an interactive shell. It needs to do this since the build is 
+# multithreaded and needs to be able to handle the case where more than one parallel
+# process may require the user's attention. The default is iterate over the available
+# terminal types to find one that works.
+#
+# Examples of the occasions this may happen are when resolving patches which cannot
+# be applied, to use the devshell or the kernel menuconfig
+#
+# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
+# Note: currently, Konsole support only works for KDE 3.x due to the way
+# newer Konsole versions behave
+#OE_TERMINAL = "auto"
+# By default disable interactive patch resolution (tasks will just fail instead):
+PATCHRESOLVE = "noop"
+
+#
+# Disk Space Monitoring during the build
+#
+# Monitor the disk space during the build. If there is less that 1GB of space or less
+# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
+# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# of the build. The reason for this is that running completely out of space can corrupt
+# files and damages the build in ways which may not be easily recoverable.
+# It's necesary to monitor /tmp, if there is no space left the build will fail
+# with very exotic errors.
+BB_DISKMON_DIRS = "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K \
+    ABORT,/tmp,10M,1K"
+
+#
+# Shared-state files from other locations
+#
+# As mentioned above, shared state files are prebuilt cache data objects which can 
+# used to accelerate build time. This variable can be used to configure the system
+# to search other mirror locations for these objects before it builds the data itself.
+#
+# This can be a filesystem directory, or a remote url such as http or ftp. These
+# would contain the sstate-cache results from previous builds (possibly from other 
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
+# cache locations to check for the shared objects.
+# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
+# at the end as shown in the examples below. This will be substituted with the
+# correct path within the directory structure.
+#SSTATE_MIRRORS ?= "\
+#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+#file://.* file:///some/local/dir/sstate/PATH"
+
+
+# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
+# track the version of this file when it was generated. This can safely be ignored if
+# this doesn't mean anything to you.
+CONF_VERSION = "1"
+
+# Set the root password to '0penBmc'
+INHERIT += "extrausers"
+
+EXTRA_USERS_PARAMS = " \
+  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
new file mode 100644
index 0000000..42f2d29
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
@@ -0,0 +1,12 @@
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+
+require conf/machine/include/ast2400.inc
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/ibm.inc
+
+UBOOT_MACHINE_firestone = "palmetto_config"
+UBOOT_ENTRYPOINT = "0x40008000"
+UBOOT_LOADADDRESS = "0x40008000"
+
+FLASH_SIZE = "32768"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
new file mode 100644
index 0000000..2594dec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
@@ -0,0 +1,4 @@
+CONFIG_HWMON=y
+CONFIG_SENSORS_NCT7904=y
+CONFIG_EEPROM_AT24=y
+CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
new file mode 100644
index 0000000..3b5e0f1
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
@@ -0,0 +1 @@
+# use in-tree devtree
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..b67f87c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://firestone.cfg"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
new file mode 100644
index 0000000..1edbf31
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+SRC_URI += "file://firestone.patch"
+SRC_URI += "file://poweron.patch"
+SRC_URI += "file://occ-path.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
new file mode 100644
index 0000000..2cb6ab4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
@@ -0,0 +1,11 @@
+--- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
++++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
+@@ -2,7 +2,7 @@
+ Description=Temp placeholder for skeleton function
+ 
+ [Service]
+-ExecStart=/usr/sbin/system_manager.py Palmetto
++ExecStart=/usr/sbin/system_manager.py Firestone
+ 
+ [Install]
+ WantedBy=multi-user.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
new file mode 120000
index 0000000..2fc0f2c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
@@ -0,0 +1 @@
+../../../../meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
new file mode 120000
index 0000000..27acaeb
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
@@ -0,0 +1 @@
+../../../../meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes.txt
new file mode 100644
index 0000000..3ec3f4a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes.txt
@@ -0,0 +1,2 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
new file mode 100644
index 0000000..76777e4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
@@ -0,0 +1,27 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "6"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison \
+  "
+BBLAYERS_NON_REMOVABLE ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-aspeed \
+  ##OEROOT##/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openpower \
+  ##OEROOT##/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openpower/meta-ibm/meta-garrison \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/conf-notes.txt
new file mode 100644
index 0000000..9b3c01a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/layer.conf
new file mode 100644
index 0000000..ef803c0
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "garrison"
+BBFILE_PATTERN_garrison = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/local.conf.sample
new file mode 100644
index 0000000..bf2f7fd
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/local.conf.sample
@@ -0,0 +1,234 @@
+#
+# This file is your local configuration file and is where all local user settings
+# are placed. The comments in this file give some guide to the options a new user
+# to the system might want to change but pretty much any configuration option can
+# be set in this file. More adventurous users can look at local.conf.extended 
+# which contains other examples of configuration which can be placed in this file
+# but new users likely won't need any of them initially.
+#
+# Lines starting with the '#' character are commented out and in some cases the 
+# default values are provided as comments to show people example syntax. Enabling
+# the option is a question of removing the # character and making any change to the
+# variable as required.
+
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# of emulated machines available which can boot and run in the QEMU emulator:
+#
+#MACHINE ?= "qemuarm"
+#MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemumips"
+#MACHINE ?= "qemuppc"
+#MACHINE ?= "qemux86"
+#MACHINE ?= "qemux86-64"
+#
+# There are also the following hardware board target machines included for 
+# demonstration purposes:
+#
+#MACHINE ?= "beaglebone"
+#MACHINE ?= "genericx86"
+#MACHINE ?= "genericx86-64"
+#MACHINE ?= "mpc8315e-rdb"
+#MACHINE ?= "edgerouter"
+#
+# This sets the default machine to be qemux86 if no other machine is selected:
+MACHINE ??= "garrison"
+
+#
+# Where to place downloads
+#
+# During a first build the system will download many different source code tarballs
+# from various upstream projects. This can take a while, particularly if your network
+# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
+# can preserve this directory to speed up this part of subsequent builds. This directory
+# is safe to share between multiple builds on the same machine too.
+#
+# The default is a downloads directory under TOPDIR which is the build directory.
+#
+#DL_DIR ?= "${TOPDIR}/downloads"
+
+#
+# Where to place shared-state files
+#
+# BitBake has the capability to accelerate builds based on previously built output.
+# This is done using "shared state" files which can be thought of as cache objects
+# and this option determines where those files are placed.
+#
+# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
+# from these files if no changes were made to the configuration. If changes were made
+# to the configuration, only shared state files where the state was still valid would
+# be used (done using checksums).
+#
+# The default is a sstate-cache directory under TOPDIR.
+#
+#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
+
+#
+# Where to place the build output
+#
+# This option specifies where the bulk of the building work should be done and
+# where BitBake should place its temporary files and output. Keep in mind that
+# this includes the extraction and compilation of many applications and the toolchain
+# which can use Gigabytes of hard disk space.
+#
+# The default is a tmp directory under TOPDIR.
+#
+#TMPDIR = "${TOPDIR}/tmp"
+
+#
+# Default policy config
+#
+# The distribution setting controls which policy settings are used as defaults.
+# The default value is fine for general Yocto project use, at least initially.
+# Ultimately when creating custom policy, people will likely end up subclassing 
+# these defaults.
+#
+DISTRO ?= "openbmc-phosphor"
+# As an example of a subclass there is a "bleeding" edge policy configuration
+# where many versions are set to the absolute latest code from the upstream 
+# source control systems. This is just mentioned here as an example, its not
+# useful to most new users.
+# DISTRO ?= "poky-bleeding"
+
+#
+# Package Management configuration
+#
+# This variable lists which packaging formats to enable. Multiple package backends 
+# can be enabled at once and the first item listed in the variable will be used 
+# to generate the root filesystems.
+# Options are:
+#  - 'package_deb' for debian style deb files
+#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
+#  - 'package_rpm' for rpm style packages
+# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
+# We default to rpm:
+PACKAGE_CLASSES ?= "package_rpm"
+
+#
+# SDK/ADT target architecture
+#
+# This variable specifies the architecture to build SDK/ADT items for and means
+# you can build the SDK packages for architectures other than the machine you are 
+# running the build on (i.e. building i686 packages on an x86_64 host).
+# Supported values are i686 and x86_64
+#SDKMACHINE ?= "i686"
+
+SANITY_TESTED_DISTROS_append ?= " RedHatEnterpriseWorkstation-6.*"
+
+#
+# Extra image configuration defaults
+#
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
+# images. Some of these options are added to certain image types automatically. The
+# variable can contain the following options:
+#  "dbg-pkgs"       - add -dbg packages for all installed packages
+#                     (adds symbol information for debugging/profiling)
+#  "dev-pkgs"       - add -dev packages for all installed packages
+#                     (useful if you want to develop against libs in the image)
+#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
+#                     (useful if you want to run the package test suites)
+#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"    - add debugging tools (gdb, strace)
+#  "eclipse-debug"  - add Eclipse remote debugging support
+#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
+#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"   - make an image suitable for development
+#                     e.g. ssh root access has a blank password
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# We default to enabling the debugging tweaks.
+EXTRA_IMAGE_FEATURES = "debug-tweaks"
+
+#
+# Additional image features
+#
+# The following is a list of additional classes to use when building images which
+# enable extra features. Some available options which can be included in this variable 
+# are:
+#   - 'buildstats' collect build statistics
+#   - 'image-mklibs' to reduce shared library files size for an image
+#   - 'image-prelink' in order to prelink the filesystem image
+#   - 'image-swab' to perform host system intrusion detection
+# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+
+#
+# Runtime testing of images
+#
+# The build system can test booting virtual machine images under qemu (an emulator)
+# after any root filesystems are created and run tests against those images. To
+# enable this uncomment this line. See classes/testimage(-auto).bbclass for
+# further details.
+#TEST_IMAGE = "1"
+#
+# Interactive shell configuration
+#
+# Under certain circumstances the system may need input from you and to do this it 
+# can launch an interactive shell. It needs to do this since the build is 
+# multithreaded and needs to be able to handle the case where more than one parallel
+# process may require the user's attention. The default is iterate over the available
+# terminal types to find one that works.
+#
+# Examples of the occasions this may happen are when resolving patches which cannot
+# be applied, to use the devshell or the kernel menuconfig
+#
+# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
+# Note: currently, Konsole support only works for KDE 3.x due to the way
+# newer Konsole versions behave
+#OE_TERMINAL = "auto"
+# By default disable interactive patch resolution (tasks will just fail instead):
+PATCHRESOLVE = "noop"
+
+#
+# Disk Space Monitoring during the build
+#
+# Monitor the disk space during the build. If there is less that 1GB of space or less
+# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
+# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# of the build. The reason for this is that running completely out of space can corrupt
+# files and damages the build in ways which may not be easily recoverable.
+# It's necesary to monitor /tmp, if there is no space left the build will fail
+# with very exotic errors.
+BB_DISKMON_DIRS = "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K \
+    ABORT,/tmp,10M,1K"
+
+#
+# Shared-state files from other locations
+#
+# As mentioned above, shared state files are prebuilt cache data objects which can 
+# used to accelerate build time. This variable can be used to configure the system
+# to search other mirror locations for these objects before it builds the data itself.
+#
+# This can be a filesystem directory, or a remote url such as http or ftp. These
+# would contain the sstate-cache results from previous builds (possibly from other 
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
+# cache locations to check for the shared objects.
+# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
+# at the end as shown in the examples below. This will be substituted with the
+# correct path within the directory structure.
+#SSTATE_MIRRORS ?= "\
+#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+#file://.* file:///some/local/dir/sstate/PATH"
+
+
+# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
+# track the version of this file when it was generated. This can safely be ignored if
+# this doesn't mean anything to you.
+CONF_VERSION = "1"
+
+# Set the root password to '0penBmc'
+INHERIT += "extrausers"
+
+EXTRA_USERS_PARAMS = " \
+  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
new file mode 100644
index 0000000..4fd03fd
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
@@ -0,0 +1,12 @@
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+
+require conf/machine/include/ast2400.inc
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/ibm.inc
+
+UBOOT_MACHINE_garrison = "palmetto_config"
+UBOOT_ENTRYPOINT = "0x40008000"
+UBOOT_LOADADDRESS = "0x40008000"
+
+FLASH_SIZE = "32768"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
new file mode 100644
index 0000000..2594dec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
@@ -0,0 +1,4 @@
+CONFIG_HWMON=y
+CONFIG_SENSORS_NCT7904=y
+CONFIG_EEPROM_AT24=y
+CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
new file mode 100644
index 0000000..3b5e0f1
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
@@ -0,0 +1 @@
+# use in-tree devtree
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..676ec9f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://garrison.cfg"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
new file mode 100644
index 0000000..f7f16da
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+SRC_URI += "file://garrison.patch"
+SRC_URI += "file://poweron.patch"
+SRC_URI += "file://occ-path.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
new file mode 100644
index 0000000..23aabc5
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
@@ -0,0 +1,11 @@
+--- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
++++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
+@@ -2,7 +2,7 @@
+ Description=Temp placeholder for skeleton function
+ 
+ [Service]
+-ExecStart=/usr/sbin/system_manager.py Palmetto
++ExecStart=/usr/sbin/system_manager.py Garrison
+ 
+ [Install]
+ WantedBy=multi-user.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
new file mode 100644
index 0000000..04304e4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
@@ -0,0 +1,20 @@
+--- a/git/bin/sensor_manager2.py
++++ b/git/bin/sensor_manager2.py
+@@ -63,13 +63,13 @@ if __name__ == '__main__':
+ 	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
+ 
+ 	obj_path = OBJ_PATH+"/host/cpu0/OccStatus"
+-	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
+-	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
++	sensor_obj = Sensors.OccStatusSensor(bus,obj_path,
++			"/sys/class/i2c-adapter/i2c-4/4-0050/online")
+ 	root_sensor.add(obj_path,sensor_obj)
+ 
+ 	obj_path = OBJ_PATH+"/host/cpu1/OccStatus"
+-	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
+-	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0051/online"
++	sensor_obj = Sensors.OccStatusSensor(bus,obj_path,
++			"/sys/class/i2c-adapter/i2c-5/5-0050/online")
+ 	root_sensor.add(obj_path,sensor_obj)
+ 
+ 	obj_path = OBJ_PATH+"/host/BootCount"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
new file mode 100644
index 0000000..c50ce3d
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
@@ -0,0 +1,113 @@
+--- a/git/objects/power_control_obj.c
++++ b/git/objects/power_control_obj.c
+@@ -17,11 +17,15 @@ static const gchar* instance_name = "power0";
+ static const gchar* dbus_name = "org.openbmc.control.Power";
+ 
+ //This object will use these GPIOs
+-GPIO power_pin    = (GPIO){ "POWER_PIN" };
+-GPIO pgood        = (GPIO){ "PGOOD" };
+-GPIO usb_reset    = (GPIO){ "USB_RESET" };
+-GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
+-
++GPIO power_pin = (GPIO){ "BMC_POWER_UP" };
++GPIO pgood = (GPIO){ "SYS_PWROK_BUFF" };
++GPIO bmc_wd_clear_pulse_n = (GPIO){ "BMC_WD_CLEAR_PULSE_N" };
++GPIO cm1_oe_r_n = (GPIO){ "CM1_OE_R_N" };
++GPIO bmc_cp0_reset_n = (GPIO){ "BMC_CP0_RESET_N" };
++GPIO bmc_cfam_reset_n_r = (GPIO){ "BMC_CFAM_RESET_N_R" };
++GPIO pcie_reset = (GPIO){ "PEX8718_DEVICES_RESET_N" };
++GPIO cp0_devices_reset_n = (GPIO){ "CP0_DEVICES_RESET_N" };
++GPIO cp1_devices_reset_n = (GPIO){ "CP1_DEVICES_RESET_N" };
+ 
+ static GDBusObjectManagerServer *manager = NULL;
+ 
+@@ -67,27 +71,36 @@ poll_pgood(gpointer user_data)
+ 			{
+ 				control_power_emit_power_lost(control_power);
+ 				control_emit_goto_system_state(control,"HOST_POWERED_OFF");
+-				rc = gpio_open(&pcie_reset);
+-				rc = gpio_write(&pcie_reset,0);
+-				gpio_close(&pcie_reset);
+-
+-				rc = gpio_open(&usb_reset);
+-				rc = gpio_write(&usb_reset,0);
+-				gpio_close(&usb_reset);
+-
+ 			}
+ 			else
+ 			{
+ 				control_power_emit_power_good(control_power);
+ 				control_emit_goto_system_state(control,"HOST_POWERED_ON");
+-				rc = gpio_open(&pcie_reset);
+-				rc = gpio_write(&pcie_reset,1);
+-				gpio_close(&pcie_reset);
+-
+-				rc = gpio_open(&usb_reset);
+-				rc = gpio_write(&usb_reset,1);
+-				gpio_close(&usb_reset);
+ 			}
++
++			gpio_open(&cm1_oe_r_n);
++			gpio_write(&cm1_oe_r_n, !gpio);
++			gpio_close(&cm1_oe_r_n);
++
++			gpio_open(&bmc_cp0_reset_n);
++			gpio_write(&bmc_cp0_reset_n, gpio);
++			gpio_close(&bmc_cp0_reset_n);
++
++			gpio_open(&bmc_cfam_reset_n_r);
++			gpio_write(&bmc_cfam_reset_n_r, gpio);
++			gpio_close(&bmc_cfam_reset_n_r);
++
++			gpio_open(&pcie_reset);
++			gpio_write(&pcie_reset, gpio);
++			gpio_close(&pcie_reset);
++
++			gpio_open(&cp0_devices_reset_n);
++			gpio_write(&cp0_devices_reset_n, gpio);
++			gpio_close(&cp0_devices_reset_n);
++
++			gpio_open(&cp1_devices_reset_n);
++			gpio_write(&cp1_devices_reset_n, gpio);
++			gpio_close(&cp1_devices_reset_n);
+ 		}
+ 	} else {
+ 		printf("ERROR PowerControl: GPIO read error (gpio=%s,rc=%d)\n",pgood.name,rc);
+@@ -138,11 +151,13 @@ on_set_power_state(ControlPower *pwr,
+ 			} else {
+ 				control_emit_goto_system_state(control,"HOST_POWERING_OFF");
+ 			}
++
+ 			error = gpio_open(&power_pin);
+ 			if(error != GPIO_OK) { break;	}
+-			error = gpio_write(&power_pin,!state);
++			error = gpio_write(&power_pin, state);
+ 			if(error != GPIO_OK) { break;	}
+ 			gpio_close(&power_pin);
++
+ 			control_power_set_state(pwr,state);
+ 		} while(0);
+ 		if(error != GPIO_OK)
+@@ -230,10 +245,21 @@ on_bus_acquired(GDBusConnection *connection,
+ 		if(rc != GPIO_OK) { break; }
+ 		rc = gpio_init(connection,&pgood);
+ 		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_wd_clear_pulse_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&cm1_oe_r_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_cp0_reset_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_cfam_reset_n_r);
++		if(rc != GPIO_OK) { break; }
+ 		rc = gpio_init(connection,&pcie_reset);
+ 		if(rc != GPIO_OK) { break; }
+-		rc = gpio_init(connection,&usb_reset);
++		rc = gpio_init(connection,&cp0_devices_reset_n);
+ 		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&cp1_devices_reset_n );
++		if(rc != GPIO_OK) { break; }
++
+ 
+ 		uint8_t gpio;
+ 		rc = gpio_open(&pgood);
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes.txt
new file mode 100644
index 0000000..3ec3f4a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes.txt
@@ -0,0 +1,2 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.8.1
