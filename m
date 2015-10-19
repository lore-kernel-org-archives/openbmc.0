Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 00BD91A0A6A
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:39 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293357852829.812227685035;
 Mon, 19 Oct 2015 15:22:37 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/3] Add stubbed barreleye/foxconn layers
Date: Mon, 19 Oct 2015 17:22:31 -0500
Message-Id: <1445293351-658-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445293351-658-1-git-send-email-patches@stwcx.xyz>
References: <1445293351-658-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:40 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-openpower/meta-foxconn/conf/layer.conf    |   5 +
 .../meta-foxconn/conf/machine/include/foxconn.inc  |   1 +
 .../meta-barreleye/conf/bblayers.conf.sample       |  27 +++
 .../meta-barreleye/conf/conf-notes.txt             |   2 +
 .../meta-foxconn/meta-barreleye/conf/layer.conf    |   5 +
 .../meta-barreleye/conf/local.conf.sample          | 245 +++++++++++++++++++++
 .../meta-barreleye/conf/machine/barreleye.conf     |  12 +
 7 files changed, 297 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf

diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf
new file mode 100644
index 0000000..a0f16b4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf
@@ -0,0 +1,5 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+BBFILE_COLLECTIONS += "foxconn"
+BBFILE_PATTERN_foxconn = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc b/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc
new file mode 100644
index 0000000..c79ddd7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc
@@ -0,0 +1 @@
+require conf/machine/include/openpower.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample
new file mode 100644
index 0000000..f30ab15
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample
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
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-foxconn \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye \
+  "
+BBLAYERS_NON_REMOVABLE ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-aspeed \
+  ##OEROOT##/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openpower \
+  ##OEROOT##/meta-openpower/meta-foxconn \
+  ##OEROOT##/meta-openpower/meta-foxconn/meta-barreleye \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt
new file mode 100644
index 0000000..9b3c01a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf
new file mode 100644
index 0000000..313b8fc
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf
@@ -0,0 +1,5 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+BBFILE_COLLECTIONS += "barreleye"
+BBFILE_PATTERN_barreleye = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample
new file mode 100644
index 0000000..8799d8d
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample
@@ -0,0 +1,245 @@
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
+MACHINE ??= "barreleye"
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
+#
+# Qemu configuration
+#
+# By default qemu will build with a builtin VNC server where graphical output can be
+# seen. The two lines below enable the SDL backend too. This assumes there is a
+# libsdl library available on your build system.
+PACKAGECONFIG_append_pn-qemu-native = " sdl"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
+ASSUME_PROVIDED += "libsdl-native"
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
diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
new file mode 100644
index 0000000..f3da811
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
@@ -0,0 +1,12 @@
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+
+require conf/machine/include/ast2400.inc
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/foxconn.inc
+
+UBOOT_MACHINE_barreleye = "barreleye_config"
+UBOOT_ENTRYPOINT = "0x40008000"
+UBOOT_LOADADDRESS = "0x40008000"
+
+FLASH_SIZE = "32768"
-- 
2.6.0
