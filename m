Return-Path: <a.novikov@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.novikov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="IdSZKCbl"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xm7XG19q0zDql8
 for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2017 21:53:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3F444466EF
 for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2017 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-type:content-type:mime-version
 :user-agent:date:date:message-id:subject:subject:from:from
 :received:received:received; s=mta-01; t=1504525967; x=
 1506340368; bh=ynzNts8h+KRXbkKrpa3mXOOURX9T+/IHooQ8XxCe2aY=; b=I
 dSZKCbl3yfnm/PbekaO5BHfDsNHM6hDzDGISlHo2rKf0D1SGrQdKL+5MaBKXf0Tt
 dqCvp/KGR+HmG26y5ovfRq7KAn0w35EILgW/nEk9qN+CUjq2eFLsiqsunnmQ2dfI
 NpyGCklKXfTTY9c+kR//gh5B+B6CWSW+IImOaK5Ylc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQqN4BrdeFN4 for <openbmc@lists.ozlabs.org>;
 Mon,  4 Sep 2017 14:52:47 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 940E7404AD
 for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2017 14:52:47 +0300 (MSK)
Received: from [172.17.15.146] (172.17.15.146) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 4 Sep
 2017 14:52:47 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Anton Novikov <a.novikov@yadro.com>
Subject: meta-vesnin architecture
Message-ID: <4393fb7b-38e2-6121-d172-c8ce5c14a82b@yadro.com>
Date: Mon, 4 Sep 2017 14:54:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------6F6125F9C6F8824704A97A64"
Content-Language: en-US
X-Originating-IP: [172.17.15.146]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Mon, 04 Sep 2017 23:57:05 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 11:53:21 -0000

--------------6F6125F9C6F8824704A97A64
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I'm from YADRO company, and we develop a new architecture.

We have openbmc support code by MSI, and I'm assigned to promote it to 
openbmc mainline.

Meanwhile, there's no confirmation email from Gerrit, so I'll send 
current version of the patch here.

Please look at it and give me recommendations on organizing it into 
smaller commits.

Thanks,

Anton


--------------6F6125F9C6F8824704A97A64
Content-Type: text/x-patch;
	name="0001-01Sep2017-Vesnin-meta-files-in-openbmc-v1.99.9.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-01Sep2017-Vesnin-meta-files-in-openbmc-v1.99.9.patch"

From a410ff24e656eafcf64e6c07325af36dabc23faa Mon Sep 17 00:00:00 2001
From: Felix Lee <felixlee@msi.com>
Date: Fri, 1 Sep 2017 18:36:46 +0800
Subject: [PATCH] 01Sep2017: Vesnin meta files in openbmc v1.99.9 Add
 openpower-occ-control patch Add phosphor-hwmon patch

remove trailing spaces
---
 .../meta-openpower/meta-yadro/conf/layer.conf      |    5 +
 .../meta-yadro/conf/machine/include/yadro.inc      |    1 +
 .../meta-vesnin/conf/bblayers.conf.sample          |   37 +
 .../meta-yadro/meta-vesnin/conf/conf-notes.txt     |    2 +
 .../meta-yadro/meta-vesnin/conf/layer.conf         |    9 +
 .../meta-yadro/meta-vesnin/conf/local.conf.sample  |  245 ++
 .../meta-vesnin/conf/machine/vesnin.conf           |   16 +
 .../linux/linux-obmc/0001-Vesnin-patch.patch       |  255 ++
 .../recipes-kernel/linux/linux-obmc/vesnin.cfg     |    4 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |    3 +
 .../recipes-phosphor/fans/fan-default-speed.bb     |   24 +
 .../fans/fan-default-speed/fan-default-speed.sh    |   19 +
 .../fan-default-speed/fan-default-speed@.service   |   13 +
 .../images/obmc-phosphor-image.bbappend            |    1 +
 .../ipmi/phosphor-ipmi-fru-properties%.bbappend    |    1 +
 .../extra-properties.yaml                          | 1199 +++++++
 .../ipmi/phosphor-ipmi-sensor-inventory%.bbappend  |    1 +
 .../phosphor-ipmi-sensor-inventory%/config.yaml    | 3550 +++++++++++++++++++
 .../ipmi/vesnin-ipmi-inventory-map-native.bb       |   22 +
 .../ipmi/vesnin-ipmi-inventory-map/config.yaml     | 3712 ++++++++++++++++++++
 .../leds/vesnin-led-manager-config-native.bb       |   18 +
 .../leds/vesnin-led-manager-config/led.yaml        |    6 +
 .../occ/openpower-occ-control.bbappend             |    4 +
 .../occ/openpower-occ-control/occ-control.patch    |   49 +
 .../packagegroups/packagegroup-obmc-apps.bbappend  |    1 +
 .../sensors/phosphor-hwmon%.bbappend               |   18 +
 .../sensors/phosphor-hwmon%/hwmon.patch            |  116 +
 .../apb/i2c@1e78a000/i2c-bus@140/occ-hwmon@50.conf |   76 +
 .../apb/i2c@1e78a000/i2c-bus@180/occ-hwmon@51.conf |   76 +
 .../apb/i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56.conf |   76 +
 .../apb/i2c@1e78a000/i2c-bus@300/occ-hwmon@57.conf |   76 +
 .../ahb/apb/i2c@1e78a000/i2c-bus@400/rtc@68.conf   |    4 +
 .../apb/i2c@1e78a000/i2c-bus@440/w83795g@2f.conf   |   28 +
 .../ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@49.conf  |    3 +
 .../recipes-phosphor/workbook/vesnin-config.bb     |   36 +
 .../workbook/vesnin-config/Vesnin.py               | 1082 ++++++
 .../meta-yadro/meta-vesnin/recipes.txt             |    2 +
 37 files changed, 10790 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/conf/machine/include/yadro.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/machine/vesnin.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/0001-Vesnin-patch.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/vesnin.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed.sh
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed@.service
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/images/obmc-phosphor-image.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%/extra-properties.yaml
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map-native.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map/config.yaml
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config-native.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config/led.yaml
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control/occ-control.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/hwmon.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@140/occ-hwmon@50.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@180/occ-hwmon@51.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@300/occ-hwmon@57.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@400/rtc@68.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83795g@2f.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@49.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config/Vesnin.py
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes.txt

diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/conf/layer.conf
new file mode 100644
index 00000000..de75f7b8
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/conf/layer.conf
@@ -0,0 +1,5 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+BBFILE_COLLECTIONS += "yadro"
+BBFILE_PATTERN_yadro = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/conf/machine/include/yadro.inc b/meta-openbmc-machines/meta-openpower/meta-yadro/conf/machine/include/yadro.inc
new file mode 100644
index 00000000..c79ddd77
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/conf/machine/include/yadro.inc
@@ -0,0 +1 @@
+require conf/machine/include/openpower.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/bblayers.conf.sample
new file mode 100644
index 00000000..40305b58
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/bblayers.conf.sample
@@ -0,0 +1,37 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "6"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-poky \
+  ##OEROOT##/import-layers/meta-openembedded/meta-oe \
+  ##OEROOT##/import-layers/meta-openembedded/meta-networking \
+  ##OEROOT##/import-layers/meta-openembedded/meta-perl \
+  ##OEROOT##/import-layers/meta-openembedded/meta-python \
+  ##OEROOT##/import-layers/meta-virtualization \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-yadro \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin \
+  "
+BBLAYERS_NON_REMOVABLE ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-poky \
+  ##OEROOT##/import-layers/meta-openembedded/meta-oe \
+  ##OEROOT##/import-layers/meta-openembedded/meta-networking \
+  ##OEROOT##/import-layers/meta-openembedded/meta-perl \
+  ##OEROOT##/import-layers/meta-openembedded/meta-python \
+  ##OEROOT##/import-layers/meta-virtualization \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-yadro \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/conf-notes.txt
new file mode 100644
index 00000000..9b3c01a5
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/layer.conf
new file mode 100644
index 00000000..69bea20a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "vesnin"
+BBFILE_PATTERN_vesnin = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/local.conf.sample
new file mode 100644
index 00000000..ffee5b09
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/local.conf.sample
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
+MACHINE ??= "vesnin"
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
+#ASSUME_PROVIDED += "libsdl-native"
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
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/machine/vesnin.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/machine/vesnin.conf
new file mode 100644
index 00000000..84e6641f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/conf/machine/vesnin.conf
@@ -0,0 +1,16 @@
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+
+require conf/machine/include/ast2400.inc
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/yadro.inc
+require conf/machine/include/p8.inc
+
+UBOOT_MACHINE_vesnin = "ast_g4_ncsi_config"
+UBOOT_ENTRYPOINT = "0x40008000"
+UBOOT_LOADADDRESS = "0x40008000"
+
+FLASH_SIZE = "32768"
+
+PREFERRED_PROVIDER_virtual/phosphor-ipmi-fru-inventory = "vesnin-ipmi-inventory-map-native"
+PREFERRED_PROVIDER_virtual/phosphor-led-manager-config-native = "vesnin-led-manager-config-native"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/0001-Vesnin-patch.patch b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/0001-Vesnin-patch.patch
new file mode 100644
index 00000000..4e5c1a44
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/0001-Vesnin-patch.patch
@@ -0,0 +1,255 @@
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 6d6c9eb..74b99b7 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -988,6 +988,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
+ 	aspeed-bmc-opp-firestone.dtb \
+ 	aspeed-bmc-opp-garrison.dtb \
+ 	aspeed-bmc-opp-witherspoon.dtb \
++	aspeed-bmc-opp-vesnin.dtb \
+ 	aspeed-bmc-opp-zaius.dtb \
+ 	aspeed-bmc-opp-lanyang.dtb \
+ 	aspeed-bmc-mellanox-msn.dtb \
+diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
+index a9e91d9..c9f8226 100644
+--- a/arch/arm/mach-aspeed/aspeed.c
++++ b/arch/arm/mach-aspeed/aspeed.c
+@@ -115,6 +115,15 @@ static void __init do_garrison_setup(void)
+ 	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+ }
+ 
++static void __init do_vesnin_setup(void)
++{
++	do_common_setup();
++
++	/* Setup PNOR address mapping for 64M flash */
++	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
++	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
++}
++
+ static void __init do_ast2500evb_setup(void)
+ {
+ 	/* Set strap to RGMII for dedicated PHY networking */
+@@ -258,6 +267,8 @@ static void __init aspeed_init_early(void)
+ 		do_firestone_setup();
+ 	if (of_machine_is_compatible("ibm,garrison-bmc"))
+ 		do_garrison_setup();
++	if (of_machine_is_compatible("yadro,vesnin-bmc"))
++		do_vesnin_setup();
+ 	if (of_machine_is_compatible("aspeed,ast2500-evb"))
+ 		do_ast2500evb_setup();
+ 	if (of_machine_is_compatible("ingrasys,zaius-bmc"))
+diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
+index 49276bb..0117b32 100644
+--- a/drivers/hwmon/w83795.c
++++ b/drivers/hwmon/w83795.c
+@@ -1887,6 +1887,8 @@ static void w83795_init_client(struct i2c_client *client)
+ 
+ 	data->clkin = clkin[(config >> 3) & 0x3];
+ 	dev_dbg(&client->dev, "clkin = %u kHz\n", data->clkin);
++	/* Enable VSEN9,VSEN10,VSEN11 */
++	w83795_write(client, W83795_REG_VOLT_CTRL2, 0xff);
+ }
+ 
+ static int w83795_get_device_id(struct i2c_client *client)
+@@ -2174,6 +2176,13 @@ static int w83795_probe(struct i2c_client *client,
+ 	data->has_fan = w83795_read(client, W83795_REG_FANIN_CTRL1)
+ 		      | (w83795_read(client, W83795_REG_FANIN_CTRL2) << 8);
+ 
++	/* VSEN11-9 not for 795adg */
++	if (data->chip_type == w83795adg) {
++		data->has_in &= 0xf8ff;
++	} else {
++		data->has_in = 0xffff;
++	}
++
+ 	/* Check which analog temperatures and extra voltages are present */
+ 	tmp = w83795_read(client, W83795_REG_TEMP_CTRL1);
+ 	if (tmp & 0x20)
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+new file mode 100644
+index 0000000..0520e26
+--- /dev/null
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+@@ -0,0 +1,181 @@
++/dts-v1/;
++
++#include "aspeed-g4.dtsi"
++#include <dt-bindings/gpio/aspeed-gpio.h>
++
++/ {
++	model = "Vesnin BMC";
++	compatible = "yadro,vesnin-bmc", "aspeed,ast2400";
++
++	chosen {
++		stdout-path = &uart5;
++		bootargs = "console=ttyS4,115200 earlyprintk";
++	};
++
++	memory {
++		reg = <0x40000000 0x20000000>;
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		vga_memory: framebuffer@5f000000 {
++			no-map;
++			reg = <0x5f000000 0x01000000>; /* 16MB */
++		};
++	};
++
++		leds {
++				compatible = "gpio-leds";
++
++				heartbeat {
++						gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_LOW>;
++				};
++		};
++};
++
++&fmc {
++	status = "okay";
++	flash@0 {
++		status = "okay";
++		m25p,fast-read;
++#include "aspeed-bmc-opp-flash-layout.dtsi"
++	};
++};
++
++&spi {
++	status = "okay";
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_spi1_default>;
++
++	flash@0 {
++		status = "okay";
++		label = "pnor";
++		m25p,fast-read;
++	};
++};
++
++&mac0 {
++	status = "okay";
++
++	use-ncsi;
++	no-hw-checksum;
++
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_rmii1_default>;
++};
++
++
++&uart5 {
++	status = "okay";
++};
++
++&i2c0 {
++	status = "okay";
++
++	eeprom@50 {
++		compatible = "atmel,24c256";
++		reg = <0x50>;
++		pagesize = <64>;
++	};
++};
++
++&i2c1 {
++	status = "okay";
++
++	tmp75@49 {
++		compatible = "ti,tmp75";
++		reg = <0x49>;
++	};
++};
++
++&i2c2 {
++	status = "okay";
++};
++
++&i2c3 {
++	status = "okay";
++
++};
++
++&i2c4 {
++	status = "okay";
++
++	occ-hwmon@50 {
++		compatible = "ibm,p8-occ-hwmon";
++		reg = <0x50>;
++	};
++};
++
++&i2c5 {
++	status = "okay";
++
++	occ-hwmon@51 {
++		compatible = "ibm,p8-occ-hwmon";
++		reg = <0x51>;
++	};
++};
++
++&i2c6 {
++	status = "okay";
++
++	occ-hwmon@56 {
++		compatible = "ibm,p8-occ-hwmon";
++		reg = <0x56>;
++	};
++};
++
++&i2c7 {
++	status = "okay";
++
++	occ-hwmon@57 {
++		compatible = "ibm,p8-occ-hwmon";
++		reg = <0x57>;
++	};
++};
++
++&i2c9 {
++	status = "okay";
++};
++
++&i2c10 {
++	status = "okay";
++};
++
++&i2c11 {
++	status = "okay";
++
++	rtc@68 {
++		compatible = "dallas,ds3231";
++		reg = <0x68>;
++	};
++};
++
++&i2c12 {
++	status = "okay";
++
++	w83795g@2f {
++		compatible = "nuvoton,w83795g";
++		reg = <0x2f>;
++	};
++};
++
++&i2c13 {
++	status = "okay";
++};
++
++&gpio {
++	pin_gpio_h6 {
++		gpio-hog;
++		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
++		output-high;
++		line-name = "H6";
++	};
++
++};
++
++&vuart {
++	status = "okay";
++};
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/vesnin.cfg b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/vesnin.cfg
new file mode 100644
index 00000000..32dd79c1
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc/vesnin.cfg
@@ -0,0 +1,4 @@
+CONFIG_HWMON=y
+CONFIG_EEPROM_AT24=y
+CONFIG_SENSORS_LM75=y
+CONFIG_SENSORS_W83795=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 00000000..c26deca3
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://vesnin.cfg"
+SRC_URI += "file://0001-Vesnin-patch.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed.bb b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed.bb
new file mode 100644
index 00000000..dc883b3c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Set fans to a default speed"
+DESCRIPTION = "Set fans to a default speed"
+PR = "r1"
+
+inherit obmc-phosphor-systemd
+inherit obmc-phosphor-license
+
+RDEPENDS_${PN} += "i2c-tools"
+
+S = "${WORKDIR}"
+SRC_URI += "file://fan-default-speed.sh"
+
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0755 ${WORKDIR}/fan-default-speed.sh ${D}${bindir}/fan-default-speed.sh
+}
+
+TMPL = "fan-default-speed@.service"
+INSTFMT = "fan-default-speed@{0}.service"
+TGTFMT = "obmc-chassis-poweron@{0}.target"
+FMT = "../${TMPL}:${TGTFMT}.wants/${INSTFMT}"
+
+SYSTEMD_SERVICE_${PN} += "${TMPL}"
+SYSTEMD_LINK_${PN} += "${@compose_list(d, 'FMT', 'OBMC_CHASSIS_INSTANCES')}"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed.sh b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed.sh
new file mode 100644
index 00000000..b9f29f47
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+path="/sys/bus/i2c/drivers/w83795"
+
+
+if [ -e $path ]
+then
+    echo 12-002f > $path/unbind
+fi
+
+
+i2cset -y 12 0x2f 0x0 0x82 b
+i2cset -y 12 0x2f 0xc 0xff b
+
+
+if [ -e $path ]
+then
+    echo 12-002f > $path/bind
+fi
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed@.service b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed@.service
new file mode 100644
index 00000000..9fa72565
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/fans/fan-default-speed/fan-default-speed@.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Set fans to a default speed
+Wants=obmc-host-start-pre@%i.target
+Before=obmc-host-start-pre@%i.target
+Conflicts=obmc-chassis-poweroff@%i.target
+
+[Service]
+ExecStart={bindir}/fan-default-speed.sh
+Type=oneshot
+RemainAfterExit=yes
+
+[Install]
+WantedBy=obmc-chassis-poweron@%i.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/images/obmc-phosphor-image.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/images/obmc-phosphor-image.bbappend
new file mode 100644
index 00000000..fa330be6
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/images/obmc-phosphor-image.bbappend
@@ -0,0 +1 @@
+OBMC_IMAGE_EXTRA_INSTALL_append = " fan-default-speed"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%.bbappend
new file mode 100644
index 00000000..72d991c7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%/extra-properties.yaml b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%/extra-properties.yaml
new file mode 100644
index 00000000..2f56cbdb
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%/extra-properties.yaml
@@ -0,0 +1,1199 @@
+/system/chassis/motherboard/cpu0:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/cpu1:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/cpu2:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/cpu3:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf0:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf1:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf2:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf3:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf4:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf5:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf6:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf7:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf8:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf9:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf10:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf11:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf12:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf13:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf14:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/membuf15:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'false'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm0:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm1:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm2:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm3:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm4:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm5:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm6:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm7:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm8:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm9:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm10:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm11:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm12:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm13:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm14:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm15:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm16:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm17:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm18:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm19:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm20:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm21:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm22:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm23:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm24:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm25:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm26:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm27:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm28:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm29:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm30:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm31:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm32:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm33:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm34:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm35:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm36:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm37:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm38:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm39:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm40:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm41:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm42:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm43:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm44:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm45:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm46:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm47:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm48:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm49:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm50:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm51:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm52:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm53:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm54:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm55:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm56:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm57:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm58:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm59:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm60:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm61:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm62:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm63:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm64:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm65:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm66:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm67:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm68:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm69:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm70:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm71:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm72:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm73:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm74:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm75:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm76:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm77:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm78:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm79:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm80:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm81:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm82:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm83:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm84:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm85:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm86:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm87:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm88:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm89:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm90:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm91:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm92:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm93:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm94:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm95:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm96:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm97:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm98:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm99:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm100:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm101:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm102:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm103:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm104:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm105:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm106:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm107:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm108:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm109:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm110:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm111:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm112:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm113:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm114:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm115:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm116:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm117:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm118:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm119:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm120:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm121:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm122:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm123:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm124:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm125:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm126:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
+
+/system/chassis/motherboard/dimm127:
+    xyz.openbmc_project.Inventory.Decorator.Replaceable:
+        FieldReplaceable: 'true'
+    xyz.openbmc_project.Inventory.Decorator.Cacheable:
+        Cached: 'true'
+    xyz.openbmc_project.Inventory.Item:
+        Present: 'true'
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%.bbappend
new file mode 100644
index 00000000..72d991c7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
new file mode 100644
index 00000000..d29f68f5
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml
@@ -0,0 +1,3550 @@
+0x05:
+  interfaces:
+    xyz.openbmc_project.State.Boot.Progress:
+      BootProgress:
+        0x00:
+          set: xyz.openbmc_project.State.Boot.Progress.ProgressStages.Unspecified
+          type: string
+        0x01:
+          set: xyz.openbmc_project.State.Boot.Progress.ProgressStages.MemoryInit
+          type: string
+        0x03:
+          set: xyz.openbmc_project.State.Boot.Progress.ProgressStages.SecondaryProcInit
+          type: string
+        0x13:
+          set: xyz.openbmc_project.State.Boot.Progress.ProgressStages.OSStart
+          type: string
+        0x14:
+          set: xyz.openbmc_project.State.Boot.Progress.ProgressStages.MotherboardInit
+          type: string
+  path: /xyz/openbmc_project/state/host0
+  readingType: eventdata2
+  sensorReadingType: 0x6F
+  sensorType: 0x0F
+  serviceInterface: org.freedesktop.DBus.Properties
+0xB5:
+  interfaces:
+    xyz.openbmc_project.State.OperatingSystem.Status:
+      OperatingSystemState:
+        0x01:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.CBoot
+          type: string
+        0x02:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.PXEBoot
+          type: string
+        0x03:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.DiagBoot
+          type: string
+        0x04:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.CDROMBoot
+          type: string
+        0x05:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.ROMBoot
+          type: string
+        0x06:
+          assert: xyz.openbmc_project.State.OperatingSystem.Status.OSStatus.BootComplete
+          type: string
+  path: /xyz/openbmc_project/state/host0
+  readingType: assertion
+  sensorReadingType: 0x6F
+  sensorType: 0x1F
+  serviceInterface: org.freedesktop.DBus.Properties
+0x5F:
+  interfaces:
+    xyz.openbmc_project.Control.Boot.RebootAttempts:
+      AttemptsLeft:
+        0xFF:
+          type: uint32_t
+  path: /xyz/openbmc_project/state/host0
+  readingType: readingAssertion
+  sensorReadingType: 0x6F
+  sensorType: 0xC3
+  serviceInterface: org.freedesktop.DBus.Properties
+0x08:
+  sensorType: 0x07
+  path: /org/open_power/control/occ_4_0050
+  sensorReadingType: 0x09
+  serviceInterface: org.freedesktop.DBus.Properties
+  readingType: assertion
+  interfaces:
+    org.open_power.OCC.Status:
+      OccActive:
+          0x00:
+            assert: false
+            deassert: true
+            type: bool
+          0x01:
+            assert: true
+            deassert: false
+            type: bool
+0x09:
+  sensorType: 0x07
+  path: /org/open_power/control/occ_5_0051
+  sensorReadingType: 0x09
+  serviceInterface: org.freedesktop.DBus.Properties
+  readingType: assertion
+  interfaces:
+    org.open_power.OCC.Status:
+      OccActive:
+          0x00:
+            assert: false
+            deassert: true
+            type: bool
+          0x01:
+            assert: true
+            deassert: false
+            type: bool
+0x06:
+  sensorType: 0x07
+  path: /org/open_power/control/occ_6_0056
+  sensorReadingType: 0x09
+  serviceInterface: org.freedesktop.DBus.Properties
+  readingType: assertion
+  interfaces:
+    org.open_power.OCC.Status:
+      OccActive:
+          0x00:
+            assert: false
+            deassert: true
+            type: bool
+          0x01:
+            assert: true
+            deassert: false
+            type: bool
+0x07:
+  sensorType: 0x07
+  path: /org/open_power/control/occ_7_0057
+  sensorReadingType: 0x09
+  serviceInterface: org.freedesktop.DBus.Properties
+  readingType: assertion
+  interfaces:
+    org.open_power.OCC.Status:
+      OccActive:
+          0x00:
+            assert: false
+            deassert: true
+            type: bool
+          0x01:
+            assert: true
+            deassert: false
+            type: bool
+0x10:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x11:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x12:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x13:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x14:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm4
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x15:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm5
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x16:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm6
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x17:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm7
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x18:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm8
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x19:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm9
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm10
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm11
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm12
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm13
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm14
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x1f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm15
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x20:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm16
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x21:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm17
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x22:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm18
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x23:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm19
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x24:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm20
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x25:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm21
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x26:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm22
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x27:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm23
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x28:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm24
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x29:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm25
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm26
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm27
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm28
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm29
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm30
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x2f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm31
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x30:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm32
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x31:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm33
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x32:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm34
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x33:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm35
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x34:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm36
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x35:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm37
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x36:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm38
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x37:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm39
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x38:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm40
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x39:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm41
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm42
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm43
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm44
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm45
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm46
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x3f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm47
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x40:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm48
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x41:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm49
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x42:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm50
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x43:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm51
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x44:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm52
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x45:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm53
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x46:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm54
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x47:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm55
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x48:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm56
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x49:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm57
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm58
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm59
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm60
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm61
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm62
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x4f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm63
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x70:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm64
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x71:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm65
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x72:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm66
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x73:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm67
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x74:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm68
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x75:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm69
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x76:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm70
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x77:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm71
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x78:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm72
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x79:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm73
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm74
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm75
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm76
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm77
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm78
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x7f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm79
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x80:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm80
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x81:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm81
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x82:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm82
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x83:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm83
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x84:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm84
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x85:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm85
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x86:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm86
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x87:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm87
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x88:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm88
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x89:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm89
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm90
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm91
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm92
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm93
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm94
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x8f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm95
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x90:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm96
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x91:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm97
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x92:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm98
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x93:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm99
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x94:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm100
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x95:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm101
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x96:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm102
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x97:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm103
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x98:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm104
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x99:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm105
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9a:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm106
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9b:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm107
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9c:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm108
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9d:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm109
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9e:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm110
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x9f:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm111
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc0:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm112
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc1:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm113
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc2:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm114
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc3:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm115
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc4:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm116
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc5:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm117
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc6:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm118
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc7:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm119
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc8:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm120
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xc9:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm121
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xca:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm122
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xcb:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm123
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xcc:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm124
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xcd:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm125
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xce:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm126
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0xcf:
+  sensorType: 0x0C
+  path: /system/chassis/motherboard/dimm127
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x06:
+          type: bool
+          assert: true
+          deassert: false
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x04:
+          assert: false
+          deassert: true
+          type: bool
+0x0c:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x0e:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x03:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x0f:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x50:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x51:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x52:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x53:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x54:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core4
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x55:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core5
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x56:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core6
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x57:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core7
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x58:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core8
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x59:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core9
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x5a:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core10
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x5b:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu0/core11
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x5c:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x5d:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x65:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x66:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x67:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core4
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x68:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core5
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x69:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core6
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6a:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core7
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6b:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core8
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6c:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core9
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6d:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core10
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6e:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu1/core11
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0x6f:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xb7:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xb8:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xb9:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xba:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core4
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xbb:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core5
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xbc:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core6
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xbd:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core7
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xbe:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core8
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xbf:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core9
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd0:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core10
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd1:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu2/core11
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd2:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core0
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd3:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core1
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd4:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core2
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd5:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core3
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd6:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core4
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd7:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core5
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xd9:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core6
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xdb:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core7
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xdc:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core8
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xdd:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core9
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xde:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core10
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
+0xdf:
+  sensorType: 0x07
+  path: /system/chassis/motherboard/cpu3/core11
+  sensorReadingType: 0x6F
+  serviceInterface: xyz.openbmc_project.Inventory.Manager
+  readingType: assertion
+  interfaces:
+    xyz.openbmc_project.State.Decorator.OperationalStatus:
+      Functional:
+        0x08:
+          deassert: true
+          assert: false
+          type: bool
+    xyz.openbmc_project.Inventory.Item:
+      Present:
+        0x07:
+          deassert: false
+          assert: true
+          type: bool
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map-native.bb b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map-native.bb
new file mode 100644
index 00000000..628f7a2a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map-native.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Vesnin IPMI to DBus Inventory mapping."
+PR = "r1"
+
+inherit native
+inherit obmc-phosphor-license
+inherit phosphor-ipmi-fru
+
+SRC_URI += "file://config.yaml"
+
+PROVIDES += "virtual/phosphor-ipmi-fru-inventory"
+
+S = "${WORKDIR}"
+
+do_install() {
+        # TODO: install this to inventory_datadir
+        # after ipmi-fru-parser untangles the host
+        # firmware config from the machine inventory.
+        DEST=${D}${config_datadir}
+
+        install -d ${DEST}
+        install config.yaml ${DEST}
+}
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map/config.yaml b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map/config.yaml
new file mode 100644
index 00000000..a89e4e49
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/ipmi/vesnin-ipmi-inventory-map/config.yaml
@@ -0,0 +1,3712 @@
+1:
+  /system/chassis/motherboard/cpu0:
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Custom Field 2
+        IPMIFruSection: Board
+        IPMIFruValueDelimiter: 58
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+2:
+  /system/chassis/motherboard/cpu1:
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Custom Field 2
+        IPMIFruSection: Board
+        IPMIFruValueDelimiter: 58
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+        Value: False
+3:
+  /system/chassis/motherboard/cpu2:
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Custom Field 2
+        IPMIFruSection: Board
+        IPMIFruValueDelimiter: 58
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+        Value: False
+4:
+  /system/chassis/motherboard/cpu3:
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Custom Field 2
+        IPMIFruSection: Board
+        IPMIFruValueDelimiter: 58
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+        Value: False
+5:
+  /system/chassis/motherboard:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+  /system:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Chassis
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Chassis
+      Model:
+        IPMIFruProperty: Type
+        IPMIFruSection: Chassis
+6:
+  /system/chassis/motherboard/membuf0:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+7:
+  /system/chassis/motherboard/membuf1:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+8:
+  /system/chassis/motherboard/membuf2:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+9:
+  /system/chassis/motherboard/membuf3:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+10:
+ /system/chassis/motherboard/membuf4:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+11:
+  /system/chassis/motherboard/membuf5:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+12:
+  /system/chassis/motherboard/membuf6:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+13:
+  /system/chassis/motherboard/membuf7:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+14:
+  /system/chassis/motherboard/membuf8:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+15:
+  /system/chassis/motherboard/membuf9:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+16:
+  /system/chassis/motherboard/membuf10:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+17:
+  /system/chassis/motherboard/membuf11:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+18:
+  /system/chassis/motherboard/membuf12:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+19:
+  /system/chassis/motherboard/membuf13:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+20:
+  /system/chassis/motherboard/membuf14:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+21:
+  /system/chassis/motherboard/membuf15:
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Board
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Board
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Board
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Board
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Board
+22:
+  /system/chassis/motherboard/dimm0:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+23:
+  /system/chassis/motherboard/dimm1:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+24:
+  /system/chassis/motherboard/dimm2:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+25:
+  /system/chassis/motherboard/dimm3:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+26:
+  /system/chassis/motherboard/dimm4:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+27:
+  /system/chassis/motherboard/dimm5:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+28:
+  /system/chassis/motherboard/dimm6:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+29:
+  /system/chassis/motherboard/dimm7:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+30:
+  /system/chassis/motherboard/dimm8:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+31:
+  /system/chassis/motherboard/dimm9:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+32:
+  /system/chassis/motherboard/dimm10:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+33:
+  /system/chassis/motherboard/dimm11:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+34:
+  /system/chassis/motherboard/dimm12:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+35:
+  /system/chassis/motherboard/dimm13:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+36:
+  /system/chassis/motherboard/dimm14:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+37:
+  /system/chassis/motherboard/dimm15:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+38:
+  /system/chassis/motherboard/dimm16:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+39:
+  /system/chassis/motherboard/dimm17:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+40:
+  /system/chassis/motherboard/dimm18:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+41:
+  /system/chassis/motherboard/dimm19:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+42:
+  /system/chassis/motherboard/dimm20:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+43:
+  /system/chassis/motherboard/dimm21:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+44:
+  /system/chassis/motherboard/dimm22:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+45:
+  /system/chassis/motherboard/dimm23:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+46:
+  /system/chassis/motherboard/dimm24:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+47:
+  /system/chassis/motherboard/dimm25:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+48:
+  /system/chassis/motherboard/dimm26:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+49:
+  /system/chassis/motherboard/dimm27:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+50:
+  /system/chassis/motherboard/dimm28:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+51:
+  /system/chassis/motherboard/dimm29:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+52:
+  /system/chassis/motherboard/dimm30:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+53:
+  /system/chassis/motherboard/dimm31:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+54:
+  /system/chassis/motherboard/dimm32:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+55:
+  /system/chassis/motherboard/dimm33:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+56:
+  /system/chassis/motherboard/dimm34:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+57:
+  /system/chassis/motherboard/dimm35:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+58:
+  /system/chassis/motherboard/dimm36:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+59:
+  /system/chassis/motherboard/dimm37:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+60:
+  /system/chassis/motherboard/dimm38:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+61:
+  /system/chassis/motherboard/dimm39:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+62:
+  /system/chassis/motherboard/dimm40:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+63:
+  /system/chassis/motherboard/dimm41:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+64:
+  /system/chassis/motherboard/dimm42:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+65:
+  /system/chassis/motherboard/dimm43:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+66:
+  /system/chassis/motherboard/dimm44:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+67:
+  /system/chassis/motherboard/dimm45:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+68:
+  /system/chassis/motherboard/dimm46:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+69:
+  /system/chassis/motherboard/dimm47:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+70:
+  /system/chassis/motherboard/dimm48:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+71:
+  /system/chassis/motherboard/dimm49:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+72:
+  /system/chassis/motherboard/dimm50:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+73:
+  /system/chassis/motherboard/dimm51:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+74:
+  /system/chassis/motherboard/dimm52:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+75:
+  /system/chassis/motherboard/dimm53:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+76:
+  /system/chassis/motherboard/dimm54:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+77:
+  /system/chassis/motherboard/dimm55:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+78:
+  /system/chassis/motherboard/dimm56:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+79:
+  /system/chassis/motherboard/dimm57:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+80:
+  /system/chassis/motherboard/dimm58:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+81:
+  /system/chassis/motherboard/dimm59:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+82:
+  /system/chassis/motherboard/dimm60:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+83:
+  /system/chassis/motherboard/dimm61:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+84:
+  /system/chassis/motherboard/dimm62:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+85:
+  /system/chassis/motherboard/dimm63:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+86:
+  /system/chassis/motherboard/dimm64:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+87:
+  /system/chassis/motherboard/dimm65:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+88:
+  /system/chassis/motherboard/dimm66:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+89:
+  /system/chassis/motherboard/dimm67:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+90:
+  /system/chassis/motherboard/dimm68:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+91:
+  /system/chassis/motherboard/dimm69:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+92:
+  /system/chassis/motherboard/dimm70:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+93:
+  /system/chassis/motherboard/dimm71:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+94:
+  /system/chassis/motherboard/dimm72:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+95:
+  /system/chassis/motherboard/dimm73:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+96:
+  /system/chassis/motherboard/dimm74:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+97:
+  /system/chassis/motherboard/dimm75:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+98:
+  /system/chassis/motherboard/dimm76:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+99:
+  /system/chassis/motherboard/dimm77:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+100:
+  /system/chassis/motherboard/dimm78:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+101:
+  /system/chassis/motherboard/dimm79:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+102:
+  /system/chassis/motherboard/dimm80:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+103:
+  /system/chassis/motherboard/dimm81:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+104:
+  /system/chassis/motherboard/dimm82:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+105:
+  /system/chassis/motherboard/dimm83:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+106:
+  /system/chassis/motherboard/dimm84:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+107:
+  /system/chassis/motherboard/dimm85:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+108:
+  /system/chassis/motherboard/dimm86:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+109:
+  /system/chassis/motherboard/dimm87:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+110:
+  /system/chassis/motherboard/dimm88:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+111:
+  /system/chassis/motherboard/dimm89:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+112:
+  /system/chassis/motherboard/dimm90:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+113:
+  /system/chassis/motherboard/dimm91:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+114:
+  /system/chassis/motherboard/dimm92:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+115:
+  /system/chassis/motherboard/dimm93:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+116:
+  /system/chassis/motherboard/dimm94:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+117:
+  /system/chassis/motherboard/dimm95:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+118:
+  /system/chassis/motherboard/dimm96:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+119:
+  /system/chassis/motherboard/dimm97:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+120:
+  /system/chassis/motherboard/dimm98:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+121:
+  /system/chassis/motherboard/dimm99:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+122:
+  /system/chassis/motherboard/dimm100:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+123:
+  /system/chassis/motherboard/dimm101:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+124:
+  /system/chassis/motherboard/dimm102:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+125:
+  /system/chassis/motherboard/dimm103:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+126:
+  /system/chassis/motherboard/dimm104:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+127:
+  /system/chassis/motherboard/dimm105:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+128:
+  /system/chassis/motherboard/dimm106:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+129:
+  /system/chassis/motherboard/dimm107:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+130:
+  /system/chassis/motherboard/dimm108:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+131:
+  /system/chassis/motherboard/dimm109:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+132:
+  /system/chassis/motherboard/dimm110:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+133:
+  /system/chassis/motherboard/dimm111:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+134:
+  /system/chassis/motherboard/dimm112:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+135:
+  /system/chassis/motherboard/dimm113:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+136:
+  /system/chassis/motherboard/dimm114:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+137:
+  /system/chassis/motherboard/dimm115:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+138:
+  /system/chassis/motherboard/dimm116:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+139:
+  /system/chassis/motherboard/dimm117:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+140:
+  /system/chassis/motherboard/dimm118:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+141:
+  /system/chassis/motherboard/dimm119:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+142:
+  /system/chassis/motherboard/dimm120:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+143:
+  /system/chassis/motherboard/dimm121:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+144:
+  /system/chassis/motherboard/dimm122:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+145:
+  /system/chassis/motherboard/dimm124:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+146:
+  /system/chassis/motherboard/dimm125:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+147:
+  /system/chassis/motherboard/dimm126:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
+
+148:
+  /system/chassis/motherboard/dimm127:
+    xyz.openbmc_project.Inventory.Item:
+      PrettyName:
+        IPMIFruProperty: Name
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Asset:
+      SerialNumber:
+        IPMIFruProperty: Serial Number
+        IPMIFruSection: Product
+      Manufacturer:
+        IPMIFruProperty: Manufacturer
+        IPMIFruSection: Product
+      PartNumber:
+        IPMIFruProperty: Part Number
+        IPMIFruSection: Product
+      BuildDate:
+        IPMIFruProperty: Mfg Date
+        IPMIFruSection: Product
+      Model:
+        IPMIFruProperty: Model Number
+        IPMIFruSection: Product
+    xyz.openbmc_project.Inventory.Decorator.Revision:
+      Version:
+        IPMIFruProperty: Version
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config-native.bb b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config-native.bb
new file mode 100644
index 00000000..70fa2ffd
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config-native.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Phosphor LED Group Management for Vesnin"
+PR = "r1"
+
+inherit native
+inherit obmc-phosphor-utils
+inherit obmc-phosphor-license
+
+PROVIDES += "virtual/phosphor-led-manager-config-native"
+
+SRC_URI += "file://led.yaml"
+S = "${WORKDIR}"
+
+# Copies example led layout yaml file
+do_install() {
+    SRC=${S}
+    DEST=${D}${datadir}/phosphor-led-manager
+    install -D ${SRC}/led.yaml ${DEST}/led.yaml
+}
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config/led.yaml b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config/led.yaml
new file mode 100644
index 00000000..3bdc5dec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/leds/vesnin-led-manager-config/led.yaml
@@ -0,0 +1,6 @@
+BmcBooted:
+    heartbeat:
+        Action: 'Blink'
+        DutyOn: 50
+        Period: 1000
+PowerOn:
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control.bbappend
new file mode 100644
index 00000000..e39473ec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://occ-control.patch"
+
+EXTRA_OECONF_append = " --enable-i2c-occ"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control/occ-control.patch b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control/occ-control.patch
new file mode 100644
index 00000000..9b8b66b7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/occ/openpower-occ-control/occ-control.patch
@@ -0,0 +1,49 @@
+diff --git a/i2c_occ.cpp b/i2c_occ.cpp
+index ffbb844..c364967 100644
+--- a/i2c_occ.cpp
++++ b/i2c_occ.cpp
+@@ -1,4 +1,5 @@
+ #include <algorithm>
++#include <cassert>
+ #include <fstream>
+ 
+ #include "config.h"
+@@ -13,9 +14,12 @@ namespace fs = std::experimental::filesystem;
+ 
+ // The device name's length, e.g. "p8-occ-hwmon"
+ constexpr auto DEVICE_NAME_LENGTH = 12;
++// The occ name's length, e.g. "occ"
++constexpr auto OCC_NAME_LENGTH = 3;
+ 
+ // static assert to make sure the i2c occ device name is expected
+ static_assert(sizeof(I2C_OCC_DEVICE_NAME) -1 == DEVICE_NAME_LENGTH);
++static_assert(sizeof(OCC_NAME) -1 == OCC_NAME_LENGTH);
+ 
+ std::string getFileContent(const fs::path& f)
+ {
+@@ -63,6 +67,13 @@ void dbusToI2c(std::string& path)
+ std::string getI2cDeviceName(const std::string& dbusPath)
+ {
+     auto name = fs::path(dbusPath).filename().string();
++
++    // Need to make sure the name starts with "occ"
++    assert(name.compare(0, OCC_NAME_LENGTH, OCC_NAME) == 0);
++
++    // Change name like occ_3_0050 to 3_0050
++    name.erase(0, OCC_NAME_LENGTH + 1);
++
+     dbusToI2c(name);
+     return name;
+ }
+diff --git a/occ_manager.hpp b/occ_manager.hpp
+index 7bb1042..14b6d79 100644
+--- a/occ_manager.hpp
++++ b/occ_manager.hpp
+@@ -209,6 +209,7 @@ struct Manager
+             for (auto& name : deviceNames)
+             {
+                 i2c_occ::i2cToDbus(name);
++                name = std::string(OCC_NAME) + "_" + name;
+                 auto path = fs::path(OCC_CONTROL_ROOT) / name;
+                 statusObjects.emplace_back(
+                     std::make_unique<Status>(
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
new file mode 100644
index 00000000..e5b837ab
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend
@@ -0,0 +1 @@
+RDEPENDS_${PN}-inventory += "openpower-occ-control"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%.bbappend b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%.bbappend
new file mode 100644
index 00000000..ec84a632
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%.bbappend
@@ -0,0 +1,18 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://hwmon.patch"
+
+NAMES = " \
+        i2c@1e78a000/i2c-bus@80/tmp75@49 \
+        i2c@1e78a000/i2c-bus@140/occ-hwmon@50 \
+        i2c@1e78a000/i2c-bus@180/occ-hwmon@51 \
+        i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56 \
+        i2c@1e78a000/i2c-bus@300/occ-hwmon@57 \
+        i2c@1e78a000/i2c-bus@400/rtc@68 \
+        i2c@1e78a000/i2c-bus@440/w83795g@2f \
+        "
+ITEMSFMT = "ahb/apb/{0}.conf"
+
+ITEMS = "${@compose_list(d, 'ITEMSFMT', 'NAMES')}"
+
+ENVS = "obmc/hwmon/{0}"
+SYSTEMD_ENVIRONMENT_FILE_${PN} += "${@compose_list(d, 'ENVS', 'ITEMS')}"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/hwmon.patch b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/hwmon.patch
new file mode 100644
index 00000000..910f566f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/hwmon.patch
@@ -0,0 +1,116 @@
+diff --git a/mainloop.cpp b/mainloop.cpp
+index 486a175..2a1a519 100644
+--- a/mainloop.cpp
++++ b/mainloop.cpp
+@@ -328,7 +328,94 @@ void MainLoop::run()
+     /* If there are no sensors specified by labels, exit. */
+     if (0 == state.size())
+     {
+-        return;
++        //_hwmonRoot = _hwmonRoot + '/' + _instance;
++        //_instance = "device";
++        auto dir = _hwmonRoot + '/' + _instance + "/device";
++        sensors = std::make_unique<SensorSet>(dir);
++        for (auto& i : *sensors)
++        {
++            std::string label;
++
++            /*
++             * Check if the value of the MODE_<item><X> env variable for the sensor
++             * is "label", then read the sensor number from the <item><X>_label
++             * file. The name of the DBUS object would be the value of the env
++             * variable LABEL_<item><sensorNum>. If the MODE_<item><X> env variable
++             * does'nt exist, then the name of DBUS object is the value of the env
++             * variable LABEL_<item><X>.
++             */
++            auto mode = getEnv("MODE", i.first);
++            if (!mode.compare(hwmon::entry::label))
++            {
++                label = getIndirectLabelEnv(
++                    "LABEL", _hwmonRoot + '/' + _instance + "/device/", i.first);
++                if (label.empty())
++                {
++                    continue;
++                }
++            }
++            else
++            {
++                // Ignore inputs without a label.
++                label = getEnv("LABEL", i.first);
++                if (label.empty())
++                {
++                    continue;
++                }
++            }
++
++            Attributes attrs;
++            if (!getAttributes(i.first.first, attrs))
++            {
++                continue;
++            }
++
++            std::string objectPath{_root};
++            objectPath.append(1, '/');
++            objectPath.append(getNamespace(attrs));
++            objectPath.append(1, '/');
++            objectPath.append(label);
++
++            ObjectInfo info(&_bus, std::move(objectPath), Object());
++            auto valueInterface = addValue(i.first, _hwmonRoot, _instance, info);
++            if (!valueInterface)
++            {
++#ifdef REMOVE_ON_FAIL
++            continue; /* skip adding this sensor for now. */
++#else
++            exit(EXIT_FAILURE);
++#endif
++            }
++            auto sensorValue = valueInterface->value();
++            addThreshold<WarningObject>(i.first, sensorValue, info);
++            addThreshold<CriticalObject>(i.first, sensorValue, info);
++            //TODO openbmc/openbmc#1347
++            //     Handle application restarts to set/refresh fan speed values
++            auto target = addTarget<hwmon::FanSpeed>(
++                    i.first, _hwmonRoot, _instance, info);
++
++            if (target)
++            {
++                target->enable();
++            }
++
++            // All the interfaces have been created.  Go ahead
++            // and emit InterfacesAdded.
++            valueInterface->emit_object_added();
++
++            auto value = std::make_tuple(
++                             std::move(i.second),
++                             std::move(label),
++                             std::move(info));
++
++            state[std::move(i.first)] = std::move(value);
++        }
++    }
++
++    /* If there are no sensors specified by labels, exit. */
++    if (0 == state.size())
++    {
++         return;
+     }
+ 
+     {
+diff --git a/sysfs.cpp b/sysfs.cpp
+index efdba92..3d863ec 100644
+--- a/sysfs.cpp
++++ b/sysfs.cpp
+@@ -165,6 +165,11 @@ int readSysfsWithCallout(const std::string& root,
+     std::string fullPath = make_sysfs_path(instancePath,
+                                            type, id, sensor);
+ 
++    if (!fs::exists(fullPath))
++    {
++        fullPath = make_sysfs_path(instancePath / "device", type, id, sensor);
++    }
++
+     ifs.exceptions(std::ifstream::failbit
+                    | std::ifstream::badbit
+                    | std::ifstream::eofbit);
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@140/occ-hwmon@50.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@140/occ-hwmon@50.conf
new file mode 100644
index 00000000..b6c26ad6
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@140/occ-hwmon@50.conf
@@ -0,0 +1,76 @@
+MODE_temp1 = "label"
+MODE_temp2 = "label"
+MODE_temp3 = "label"
+MODE_temp4 = "label"
+MODE_temp5 = "label"
+MODE_temp6 = "label"
+MODE_temp7 = "label"
+MODE_temp8 = "label"
+MODE_temp9 = "label"
+MODE_temp10 = "label"
+MODE_temp11 = "label"
+MODE_temp12 = "label"
+MODE_temp13 = "label"
+MODE_temp14 = "label"
+MODE_temp15 = "label"
+MODE_temp16 = "label"
+MODE_temp17 = "label"
+MODE_temp18 = "label"
+MODE_temp19 = "label"
+MODE_temp20 = "label"
+MODE_temp21 = "label"
+MODE_temp22 = "label"
+MODE_temp23 = "label"
+MODE_temp24 = "label"
+MODE_temp25 = "label"
+MODE_temp26 = "label"
+MODE_temp27 = "label"
+MODE_temp28 = "label"
+MODE_temp29 = "label"
+MODE_temp30 = "label"
+MODE_temp31 = "label"
+MODE_temp32 = "label"
+MODE_temp33 = "label"
+MODE_temp34 = "label"
+MODE_temp35 = "label"
+MODE_temp36 = "label"
+MODE_temp37 = "label"
+MODE_temp38 = "label"
+LABEL_temp11 = "CPU0"
+LABEL_temp168 = "CPU0_CORE0"
+LABEL_temp224 = "MEMBUF0"
+LABEL_temp225 = "MEMBUF1"
+LABEL_temp226 = "MEMBUF2"
+LABEL_temp227 = "MEMBUF3"
+LABEL_temp256 = "DIMM0"
+LABEL_temp257 = "DIMM1"
+LABEL_temp258 = "DIMM2"
+LABEL_temp259 = "DIMM3"
+LABEL_temp260 = "DIMM4"
+LABEL_temp261 = "DIMM5"
+LABEL_temp262 = "DIMM6"
+LABEL_temp263 = "DIMM7"
+LABEL_temp264 = "DIMM8"
+LABEL_temp265 = "DIMM9"
+LABEL_temp266 = "DIMM10"
+LABEL_temp267 = "DIMM11"
+LABEL_temp268 = "DIMM12"
+LABEL_temp269 = "DIMM13"
+LABEL_temp270 = "DIMM14"
+LABEL_temp271 = "DIMM15"
+LABEL_temp288 = "DIMM16"
+LABEL_temp289 = "DIMM17"
+LABEL_temp290 = "DIMM18"
+LABEL_temp291 = "DIMM19"
+LABEL_temp292 = "DIMM20"
+LABEL_temp293 = "DIMM21"
+LABEL_temp294 = "DIMM22"
+LABEL_temp295 = "DIMM23"
+LABEL_temp296 = "DIMM24"
+LABEL_temp297 = "DIMM25"
+LABEL_temp298 = "DIMM26"
+LABEL_temp299 = "DIMM27"
+LABEL_temp300 = "DIMM28"
+LABEL_temp301 = "DIMM29"
+LABEL_temp302 = "DIMM30"
+LABEL_temp303 = "DIMM31"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@180/occ-hwmon@51.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@180/occ-hwmon@51.conf
new file mode 100644
index 00000000..b03291bd
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@180/occ-hwmon@51.conf
@@ -0,0 +1,76 @@
+MODE_temp1 = "label"
+MODE_temp2 = "label"
+MODE_temp3 = "label"
+MODE_temp4 = "label"
+MODE_temp5 = "label"
+MODE_temp6 = "label"
+MODE_temp7 = "label"
+MODE_temp8 = "label"
+MODE_temp9 = "label"
+MODE_temp10 = "label"
+MODE_temp11 = "label"
+MODE_temp12 = "label"
+MODE_temp13 = "label"
+MODE_temp14 = "label"
+MODE_temp15 = "label"
+MODE_temp16 = "label"
+MODE_temp17 = "label"
+MODE_temp18 = "label"
+MODE_temp19 = "label"
+MODE_temp20 = "label"
+MODE_temp21 = "label"
+MODE_temp22 = "label"
+MODE_temp23 = "label"
+MODE_temp24 = "label"
+MODE_temp25 = "label"
+MODE_temp26 = "label"
+MODE_temp27 = "label"
+MODE_temp28 = "label"
+MODE_temp29 = "label"
+MODE_temp30 = "label"
+MODE_temp31 = "label"
+MODE_temp32 = "label"
+MODE_temp33 = "label"
+MODE_temp34 = "label"
+MODE_temp35 = "label"
+MODE_temp36 = "label"
+MODE_temp37 = "label"
+MODE_temp38 = "label"
+LABEL_temp13 = "CPU1"
+LABEL_temp169 = "CPU1_CORE0"
+LABEL_temp228 = "MEMBUF4"
+LABEL_temp229 = "MEMBUF5"
+LABEL_temp230 = "MEMBUF6"
+LABEL_temp231 = "MEMBUF7"
+LABEL_temp512 = "DIMM32"
+LABEL_temp513 = "DIMM33"
+LABEL_temp514 = "DIMM34"
+LABEL_temp515 = "DIMM35"
+LABEL_temp516 = "DIMM36"
+LABEL_temp517 = "DIMM37"
+LABEL_temp518 = "DIMM38"
+LABEL_temp519 = "DIMM39"
+LABEL_temp520 = "DIMM40"
+LABEL_temp521 = "DIMM41"
+LABEL_temp522 = "DIMM42"
+LABEL_temp523 = "DIMM43"
+LABEL_temp524 = "DIMM44"
+LABEL_temp525 = "DIMM45"
+LABEL_temp526 = "DIMM46"
+LABEL_temp527 = "DIMM47"
+LABEL_temp544 = "DIMM48"
+LABEL_temp545 = "DIMM49"
+LABEL_temp546 = "DIMM50"
+LABEL_temp547 = "DIMM51"
+LABEL_temp548 = "DIMM52"
+LABEL_temp549 = "DIMM53"
+LABEL_temp550 = "DIMM54"
+LABEL_temp551 = "DIMM55"
+LABEL_temp552 = "DIMM56"
+LABEL_temp553 = "DIMM57"
+LABEL_temp554 = "DIMM58"
+LABEL_temp555 = "DIMM59"
+LABEL_temp556 = "DIMM60"
+LABEL_temp557 = "DIMM61"
+LABEL_temp558 = "DIMM62"
+LABEL_temp559 = "DIMM63"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56.conf
new file mode 100644
index 00000000..83435a74
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@1c0/occ-hwmon@56.conf
@@ -0,0 +1,76 @@
+MODE_temp1 = "label"
+MODE_temp2 = "label"
+MODE_temp3 = "label"
+MODE_temp4 = "label"
+MODE_temp5 = "label"
+MODE_temp6 = "label"
+MODE_temp7 = "label"
+MODE_temp8 = "label"
+MODE_temp9 = "label"
+MODE_temp10 = "label"
+MODE_temp11 = "label"
+MODE_temp12 = "label"
+MODE_temp13 = "label"
+MODE_temp14 = "label"
+MODE_temp15 = "label"
+MODE_temp16 = "label"
+MODE_temp17 = "label"
+MODE_temp18 = "label"
+MODE_temp19 = "label"
+MODE_temp20 = "label"
+MODE_temp21 = "label"
+MODE_temp22 = "label"
+MODE_temp23 = "label"
+MODE_temp24 = "label"
+MODE_temp25 = "label"
+MODE_temp26 = "label"
+MODE_temp27 = "label"
+MODE_temp28 = "label"
+MODE_temp29 = "label"
+MODE_temp30 = "label"
+MODE_temp31 = "label"
+MODE_temp32 = "label"
+MODE_temp33 = "label"
+MODE_temp34 = "label"
+MODE_temp35 = "label"
+MODE_temp36 = "label"
+MODE_temp37 = "label"
+MODE_temp38 = "label"
+LABEL_temp2 = "CPU2"
+LABEL_temp174 = "CPU2_CORE0"
+LABEL_temp232 = "MEMBUF8"
+LABEL_temp233 = "MEMBUF9"
+LABEL_temp234 = "MEMBUF10"
+LABEL_temp235 = "MEMBUF11"
+LABEL_temp768 = "DIMM64"
+LABEL_temp769 = "DIMM65"
+LABEL_temp770 = "DIMM66"
+LABEL_temp771 = "DIMM67"
+LABEL_temp772 = "DIMM68"
+LABEL_temp773 = "DIMM69"
+LABEL_temp774 = "DIMM70"
+LABEL_temp775 = "DIMM71"
+LABEL_temp776 = "DIMM72"
+LABEL_temp777 = "DIMM73"
+LABEL_temp778 = "DIMM74"
+LABEL_temp779 = "DIMM75"
+LABEL_temp780 = "DIMM76"
+LABEL_temp781 = "DIMM77"
+LABEL_temp782 = "DIMM78"
+LABEL_temp783 = "DIMM79"
+LABEL_temp800 = "DIMM80"
+LABEL_temp801 = "DIMM81"
+LABEL_temp802 = "DIMM82"
+LABEL_temp803 = "DIMM83"
+LABEL_temp804 = "DIMM84"
+LABEL_temp805 = "DIMM85"
+LABEL_temp806 = "DIMM86"
+LABEL_temp807 = "DIMM87"
+LABEL_temp808 = "DIMM88"
+LABEL_temp809 = "DIMM89"
+LABEL_temp810 = "DIMM90"
+LABEL_temp811 = "DIMM91"
+LABEL_temp812 = "DIMM92"
+LABEL_temp813 = "DIMM93"
+LABEL_temp814 = "DIMM94"
+LABEL_temp815 = "DIMM95"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@300/occ-hwmon@57.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@300/occ-hwmon@57.conf
new file mode 100644
index 00000000..b0a8644a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@300/occ-hwmon@57.conf
@@ -0,0 +1,76 @@
+MODE_temp1 = "label"
+MODE_temp2 = "label"
+MODE_temp3 = "label"
+MODE_temp4 = "label"
+MODE_temp5 = "label"
+MODE_temp6 = "label"
+MODE_temp7 = "label"
+MODE_temp8 = "label"
+MODE_temp9 = "label"
+MODE_temp10 = "label"
+MODE_temp11 = "label"
+MODE_temp12 = "label"
+MODE_temp13 = "label"
+MODE_temp14 = "label"
+MODE_temp15 = "label"
+MODE_temp16 = "label"
+MODE_temp17 = "label"
+MODE_temp18 = "label"
+MODE_temp19 = "label"
+MODE_temp20 = "label"
+MODE_temp21 = "label"
+MODE_temp22 = "label"
+MODE_temp23 = "label"
+MODE_temp24 = "label"
+MODE_temp25 = "label"
+MODE_temp26 = "label"
+MODE_temp27 = "label"
+MODE_temp28 = "label"
+MODE_temp29 = "label"
+MODE_temp30 = "label"
+MODE_temp31 = "label"
+MODE_temp32 = "label"
+MODE_temp33 = "label"
+MODE_temp34 = "label"
+MODE_temp35 = "label"
+MODE_temp36 = "label"
+MODE_temp37 = "label"
+MODE_temp38 = "label"
+LABEL_temp10 = "CPU3"
+LABEL_temp175 = "CPU3_CORE0"
+LABEL_temp236 = "MEMBUF12"
+LABEL_temp237 = "MEMBUF13"
+LABEL_temp238 = "MEMBUF14"
+LABEL_temp239 = "MEMBUF15"
+LABEL_temp1024 = "DIMM96"
+LABEL_temp1025 = "DIMM97"
+LABEL_temp1026 = "DIMM98"
+LABEL_temp1027 = "DIMM99"
+LABEL_temp1028 = "DIMM100"
+LABEL_temp1029 = "DIMM101"
+LABEL_temp1030 = "DIMM102"
+LABEL_temp1031 = "DIMM103"
+LABEL_temp1032 = "DIMM104"
+LABEL_temp1033 = "DIMM105"
+LABEL_temp1034 = "DIMM106"
+LABEL_temp1035 = "DIMM107"
+LABEL_temp1036 = "DIMM108"
+LABEL_temp1037 = "DIMM109"
+LABEL_temp1038 = "DIMM110"
+LABEL_temp1039 = "DIMM111"
+LABEL_temp1056 = "DIMM112"
+LABEL_temp1057 = "DIMM113"
+LABEL_temp1058 = "DIMM114"
+LABEL_temp1059 = "DIMM115"
+LABEL_temp1060 = "DIMM116"
+LABEL_temp1061 = "DIMM117"
+LABEL_temp1062 = "DIMM118"
+LABEL_temp1063 = "DIMM119"
+LABEL_temp1064 = "DIMM120"
+LABEL_temp1065 = "DIMM121"
+LABEL_temp1066 = "DIMM122"
+LABEL_temp1067 = "DIMM123"
+LABEL_temp1068 = "DIMM124"
+LABEL_temp1069 = "DIMM125"
+LABEL_temp1070 = "DIMM126"
+LABEL_temp1071 = "DIMM127"
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@400/rtc@68.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@400/rtc@68.conf
new file mode 100644
index 00000000..87cde7e4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@400/rtc@68.conf
@@ -0,0 +1,4 @@
+LABEL_temp1=RTC_temp1
+WARNLO_temp1=10000
+WARNHI_temp1=35000
+ADJUST_temp1=300
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83795g@2f.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83795g@2f.conf
new file mode 100644
index 00000000..479890d9
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83795g@2f.conf
@@ -0,0 +1,28 @@
+LABEL_temp1 = INlet_Temp1
+LABEL_temp2 = INlet_Temp2
+LABEL_temp3 = OUTlet_Temp1
+LABEL_temp4 = OUTlet_Temp2
+LABEL_pwm3 = FAN_PWM0
+LABEL_pwm4 = FAN_PWM1
+LABEL_pwm5 = FAN_PWM2
+LABEL_pwm6 = FAN_PWM3
+LABEL_pwm7 = FAN_PWM4
+LABEL_fan3 = FAN_TACH0
+LABEL_fan4 = FAN_TACH1
+LABEL_fan5 = FAN_TACH2
+LABEL_fan6 = FAN_TACH3
+LABEL_fan7 = FAN_TACH4
+LABEL_in0 = P0V89_CPU0
+LABEL_in1 = P1V1_CPU0
+LABEL_in2 = P0V97_CPU0
+LABEL_in3 = P0V89_CPU1
+LABEL_in4 = P1V1_CPU1
+LABEL_in5 = P0V97_CPU1
+LABEL_in6 = P0V89_CPU2
+LABEL_in7 = P1V1_CPU2
+LABEL_in8 = P0V97_CPU2
+LABEL_in9 = P0V89_CPU3
+LABEL_in10 = P1V1_CPU3
+LABEL_in11 = P0V97_CPU3
+LABEL_in12 = P12V_1
+LABEL_in13 = P5V
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@49.conf b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@49.conf
new file mode 100644
index 00000000..2c794d13
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@80/tmp75@49.conf
@@ -0,0 +1,3 @@
+LABEL_temp1=ambient
+WARNLO_temp1=10000
+WARNHI_temp1=40000
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config.bb b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config.bb
new file mode 100644
index 00000000..0c1dee56
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Vesnin board wiring"
+DESCRIPTION = "Board wiring information for the Vesnin system."
+PR = "r1"
+
+inherit allarch
+inherit setuptools
+inherit pythonnative
+inherit obmc-phosphor-license
+
+PROVIDES += "virtual/obmc-inventory-data"
+RPROVIDES_${PN} += "virtual-obmc-inventory-data"
+
+DEPENDS += "python"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://Vesnin.py;subdir=${S}"
+
+python() {
+	machine = d.getVar('MACHINE', True).capitalize() + '.py'
+	d.setVar('_config_in_skeleton', machine)
+}
+
+do_make_setup() {
+        cp ${S}/${_config_in_skeleton} \
+                ${S}/obmc_system_config.py
+        cat <<EOF > ${S}/setup.py
+from distutils.core import setup
+
+setup(name='${BPN}',
+    version='${PR}',
+    py_modules=['obmc_system_config'],
+    )
+EOF
+}
+
+addtask make_setup after do_patch before do_configure
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config/Vesnin.py b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config/Vesnin.py
new file mode 100644
index 00000000..e8c233a3
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes-phosphor/workbook/vesnin-config/Vesnin.py
@@ -0,0 +1,1082 @@
+## System states
+##   state can change to next state in 2 ways:
+##   - a process emits a GotoSystemState signal with state name to goto
+##   - objects specified in EXIT_STATE_DEPEND have started
+SYSTEM_STATES = [
+    'BASE_APPS',
+    'BMC_STARTING',
+    'BMC_READY',
+    'HOST_POWERING_ON',
+    'HOST_POWERED_ON',
+    'HOST_BOOTING',
+    'HOST_BOOTED',
+    'HOST_POWERED_OFF',
+]
+
+EXIT_STATE_DEPEND = {
+    'BASE_APPS' : {
+        '/org/openbmc/sensors': 0,
+    },
+    'BMC_STARTING' : {
+        '/org/openbmc/control/chassis0': 0,
+        '/org/openbmc/control/power0' : 0,
+        '/org/openbmc/control/host0' : 0,
+        '/org/openbmc/control/flash/bios' : 0,
+    },
+}
+
+FRU_INSTANCES = {
+    '<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/bios' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/misc' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
+
+    '<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+
+    '<inventory_root>/system/chassis/motherboard' : { 'fru_type' : 'MAIN_PLANAR','is_fru' : True, },
+
+    '<inventory_root>/system/systemevent'                  : { 'fru_type' : 'SYSTEM_EVENT', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/refclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/pcieclock': { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/todclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/apss'     : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 'manufacturer' : 'ASPEED' },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+    '<inventory_root>/system/chassis/motherboard/cpu1' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+    '<inventory_root>/system/chassis/motherboard/cpu2' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+    '<inventory_root>/system/chassis/motherboard/cpu3' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core10': { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core11': { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu1/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu2/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu2/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu3/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu3/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf8' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf9' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf10' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf11' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf12' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf13' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf14' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf15' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm2' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm3' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm4' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm5' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm6' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm7' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm8' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm9' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm10' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm11' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm12' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm13' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm14' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm15' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm16' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm17' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm18' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm19' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm20' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm21' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm22' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm23' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm24' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm25' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm26' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm27' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm28' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm29' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm30' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm31' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm32' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm33' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm34' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm35' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm36' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm37' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm38' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm39' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm40' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm41' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm42' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm43' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm44' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm45' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm46' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm47' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm48' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm49' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm50' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm51' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm52' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm53' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm54' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm55' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm56' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm57' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm58' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm59' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm60' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm61' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm62' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm63' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm64' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm65' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm66' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm67' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm68' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm69' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm70' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm71' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm72' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm73' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm74' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm75' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm76' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm77' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm78' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm79' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm80' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm81' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm82' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm83' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm84' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm85' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm86' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm87' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm88' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm89' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm90' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm91' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm92' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm93' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm94' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm95' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm96' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm97' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm98' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm99' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm100' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm101' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm102' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm103' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm104' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm105' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm106' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm107' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm108' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm109' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm110' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm111' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm112' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm113' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm114' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm115' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm116' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm117' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm118' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm119' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm120' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm121' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm122' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm123' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm124' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm125' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm126' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm127' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+}
+
+ID_LOOKUP = {
+    'FRU' : {
+        0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x02 : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x03 : '<inventory_root>/system/chassis/motherboard/cpu2',
+        0x04 : '<inventory_root>/system/chassis/motherboard/cpu3',
+        0x05 : '<inventory_root>/system/chassis/motherboard',
+        0x06 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0x07 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0x08 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0x09 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0x0a : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0x0b : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0x0c : '<inventory_root>/system/chassis/motherboard/membuf6',
+        0x0d : '<inventory_root>/system/chassis/motherboard/membuf7',
+        0x0e : '<inventory_root>/system/chassis/motherboard/membuf8',
+        0x0f : '<inventory_root>/system/chassis/motherboard/membuf9',
+        0x10 : '<inventory_root>/system/chassis/motherboard/membuf10',
+        0x11 : '<inventory_root>/system/chassis/motherboard/membuf11',
+        0x12 : '<inventory_root>/system/chassis/motherboard/membuf12',
+        0x13 : '<inventory_root>/system/chassis/motherboard/membuf13',
+        0x14 : '<inventory_root>/system/chassis/motherboard/membuf14',
+        0x15 : '<inventory_root>/system/chassis/motherboard/membuf15',
+        0x16 : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x17 : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x18 : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x19 : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x1a : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x1b : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x1c : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x1d : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x2c : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x2d : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x2e : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x2f : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x30 : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x31 : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x32 : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x33 : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x34 : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x35 : '<inventory_root>/system/chassis/motherboard/dimm31',
+        0x36 : '<inventory_root>/system/chassis/motherboard/dimm32',
+        0x37 : '<inventory_root>/system/chassis/motherboard/dimm33',
+        0x38 : '<inventory_root>/system/chassis/motherboard/dimm34',
+        0x39 : '<inventory_root>/system/chassis/motherboard/dimm35',
+        0x3a : '<inventory_root>/system/chassis/motherboard/dimm36',
+        0x3b : '<inventory_root>/system/chassis/motherboard/dimm37',
+        0x3c : '<inventory_root>/system/chassis/motherboard/dimm38',
+        0x3d : '<inventory_root>/system/chassis/motherboard/dimm39',
+        0x3e : '<inventory_root>/system/chassis/motherboard/dimm40',
+        0x3f : '<inventory_root>/system/chassis/motherboard/dimm41',
+        0x40 : '<inventory_root>/system/chassis/motherboard/dimm42',
+        0x41 : '<inventory_root>/system/chassis/motherboard/dimm43',
+        0x42 : '<inventory_root>/system/chassis/motherboard/dimm44',
+        0x43 : '<inventory_root>/system/chassis/motherboard/dimm45',
+        0x44 : '<inventory_root>/system/chassis/motherboard/dimm46',
+        0x45 : '<inventory_root>/system/chassis/motherboard/dimm47',
+        0x46 : '<inventory_root>/system/chassis/motherboard/dimm48',
+        0x47 : '<inventory_root>/system/chassis/motherboard/dimm49',
+        0x48 : '<inventory_root>/system/chassis/motherboard/dimm50',
+        0x49 : '<inventory_root>/system/chassis/motherboard/dimm51',
+        0x4a : '<inventory_root>/system/chassis/motherboard/dimm52',
+        0x4b : '<inventory_root>/system/chassis/motherboard/dimm53',
+        0x4c : '<inventory_root>/system/chassis/motherboard/dimm54',
+        0x4d : '<inventory_root>/system/chassis/motherboard/dimm55',
+        0x4e : '<inventory_root>/system/chassis/motherboard/dimm56',
+        0x4f : '<inventory_root>/system/chassis/motherboard/dimm57',
+        0x50 : '<inventory_root>/system/chassis/motherboard/dimm58',
+        0x51 : '<inventory_root>/system/chassis/motherboard/dimm59',
+        0x52 : '<inventory_root>/system/chassis/motherboard/dimm60',
+        0x53 : '<inventory_root>/system/chassis/motherboard/dimm61',
+        0x54 : '<inventory_root>/system/chassis/motherboard/dimm62',
+        0x55 : '<inventory_root>/system/chassis/motherboard/dimm63',
+        0x56 : '<inventory_root>/system/chassis/motherboard/dimm64',
+        0x57 : '<inventory_root>/system/chassis/motherboard/dimm65',
+        0x58 : '<inventory_root>/system/chassis/motherboard/dimm66',
+        0x59 : '<inventory_root>/system/chassis/motherboard/dimm67',
+        0x5a : '<inventory_root>/system/chassis/motherboard/dimm68',
+        0x5b : '<inventory_root>/system/chassis/motherboard/dimm69',
+        0x5c : '<inventory_root>/system/chassis/motherboard/dimm70',
+        0x5d : '<inventory_root>/system/chassis/motherboard/dimm71',
+        0x5e : '<inventory_root>/system/chassis/motherboard/dimm72',
+        0x5f : '<inventory_root>/system/chassis/motherboard/dimm73',
+        0x60 : '<inventory_root>/system/chassis/motherboard/dimm74',
+        0x61 : '<inventory_root>/system/chassis/motherboard/dimm75',
+        0x62 : '<inventory_root>/system/chassis/motherboard/dimm76',
+        0x63 : '<inventory_root>/system/chassis/motherboard/dimm77',
+        0x64 : '<inventory_root>/system/chassis/motherboard/dimm78',
+        0x65 : '<inventory_root>/system/chassis/motherboard/dimm79',
+        0x66 : '<inventory_root>/system/chassis/motherboard/dimm80',
+        0x67 : '<inventory_root>/system/chassis/motherboard/dimm81',
+        0x68 : '<inventory_root>/system/chassis/motherboard/dimm82',
+        0x69 : '<inventory_root>/system/chassis/motherboard/dimm83',
+        0x6a : '<inventory_root>/system/chassis/motherboard/dimm84',
+        0x6b : '<inventory_root>/system/chassis/motherboard/dimm85',
+        0x6c : '<inventory_root>/system/chassis/motherboard/dimm86',
+        0x6d : '<inventory_root>/system/chassis/motherboard/dimm87',
+        0x6e : '<inventory_root>/system/chassis/motherboard/dimm88',
+        0x6f : '<inventory_root>/system/chassis/motherboard/dimm89',
+        0x70 : '<inventory_root>/system/chassis/motherboard/dimm90',
+        0x71 : '<inventory_root>/system/chassis/motherboard/dimm91',
+        0x72 : '<inventory_root>/system/chassis/motherboard/dimm92',
+        0x73 : '<inventory_root>/system/chassis/motherboard/dimm93',
+        0x74 : '<inventory_root>/system/chassis/motherboard/dimm94',
+        0x75 : '<inventory_root>/system/chassis/motherboard/dimm95',
+        0x76 : '<inventory_root>/system/chassis/motherboard/dimm96',
+        0x77 : '<inventory_root>/system/chassis/motherboard/dimm97',
+        0x78 : '<inventory_root>/system/chassis/motherboard/dimm98',
+        0x79 : '<inventory_root>/system/chassis/motherboard/dimm99',
+        0x7a : '<inventory_root>/system/chassis/motherboard/dimm100',
+        0x7b : '<inventory_root>/system/chassis/motherboard/dimm101',
+        0x7c : '<inventory_root>/system/chassis/motherboard/dimm102',
+        0x7d : '<inventory_root>/system/chassis/motherboard/dimm103',
+        0x7e : '<inventory_root>/system/chassis/motherboard/dimm104',
+        0x7f : '<inventory_root>/system/chassis/motherboard/dimm105',
+        0x80 : '<inventory_root>/system/chassis/motherboard/dimm106',
+        0x81 : '<inventory_root>/system/chassis/motherboard/dimm107',
+        0x82 : '<inventory_root>/system/chassis/motherboard/dimm108',
+        0x83 : '<inventory_root>/system/chassis/motherboard/dimm109',
+        0x84 : '<inventory_root>/system/chassis/motherboard/dimm110',
+        0x85 : '<inventory_root>/system/chassis/motherboard/dimm111',
+        0x86 : '<inventory_root>/system/chassis/motherboard/dimm112',
+        0x87 : '<inventory_root>/system/chassis/motherboard/dimm113',
+        0x88 : '<inventory_root>/system/chassis/motherboard/dimm114',
+        0x89 : '<inventory_root>/system/chassis/motherboard/dimm115',
+        0x8a : '<inventory_root>/system/chassis/motherboard/dimm116',
+        0x8b : '<inventory_root>/system/chassis/motherboard/dimm117',
+        0x8c : '<inventory_root>/system/chassis/motherboard/dimm118',
+        0x8d : '<inventory_root>/system/chassis/motherboard/dimm119',
+        0x8e : '<inventory_root>/system/chassis/motherboard/dimm120',
+        0x8f : '<inventory_root>/system/chassis/motherboard/dimm121',
+        0x90 : '<inventory_root>/system/chassis/motherboard/dimm122',
+        0x91 : '<inventory_root>/system/chassis/motherboard/dimm123',
+        0x92 : '<inventory_root>/system/chassis/motherboard/dimm124',
+        0x93 : '<inventory_root>/system/chassis/motherboard/dimm125',
+        0x94 : '<inventory_root>/system/chassis/motherboard/dimm126',
+        0x95 : '<inventory_root>/system/chassis/motherboard/dimm127',
+    },
+    'FRU_STR' : {
+        'PRODUCT_0'  : '<inventory_root>/system/bios',
+        'BOARD_1'    : '<inventory_root>/system/chassis/motherboard/cpu0',
+        'BOARD_2'    : '<inventory_root>/system/chassis/motherboard/cpu1',
+        'BOARD_3'    : '<inventory_root>/system/chassis/motherboard/cpu2',
+        'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/cpu3',
+        'CHASSIS_3'  : '<inventory_root>/system/chassis/motherboard',
+        'BOARD_5'    : '<inventory_root>/system/misc',
+        'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/membuf0',
+        'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/membuf1',
+        'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/membuf2',
+        'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/membuf3',
+        'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/membuf4',
+        'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/membuf5',
+        'BOARD_12'   : '<inventory_root>/system/chassis/motherboard/membuf6',
+        'BOARD_13'   : '<inventory_root>/system/chassis/motherboard/membuf7',
+        'BOARD_14'   : '<inventory_root>/system/chassis/motherboard/membuf8',
+        'BOARD_15'   : '<inventory_root>/system/chassis/motherboard/membuf9',
+        'BOARD_16'   : '<inventory_root>/system/chassis/motherboard/membuf10',
+        'BOARD_17'   : '<inventory_root>/system/chassis/motherboard/membuf11',
+        'BOARD_18'   : '<inventory_root>/system/chassis/motherboard/membuf12',
+        'BOARD_19'   : '<inventory_root>/system/chassis/motherboard/membuf13',
+        'BOARD_20'   : '<inventory_root>/system/chassis/motherboard/membuf14',
+        'BOARD_21'   : '<inventory_root>/system/chassis/motherboard/membuf15',
+        'PRODUCT_12'   : '<inventory_root>/system/chassis/motherboard/dimm0',
+        'PRODUCT_13'   : '<inventory_root>/system/chassis/motherboard/dimm1',
+        'PRODUCT_14'   : '<inventory_root>/system/chassis/motherboard/dimm2',
+        'PRODUCT_15'   : '<inventory_root>/system/chassis/motherboard/dimm3',
+        'PRODUCT_16'   : '<inventory_root>/system/chassis/motherboard/dimm4',
+        'PRODUCT_17'   : '<inventory_root>/system/chassis/motherboard/dimm5',
+        'PRODUCT_18'   : '<inventory_root>/system/chassis/motherboard/dimm6',
+        'PRODUCT_19'   : '<inventory_root>/system/chassis/motherboard/dimm7',
+        'PRODUCT_20'   : '<inventory_root>/system/chassis/motherboard/dimm8',
+        'PRODUCT_21'   : '<inventory_root>/system/chassis/motherboard/dimm9',
+        'PRODUCT_22'   : '<inventory_root>/system/chassis/motherboard/dimm10',
+        'PRODUCT_23'   : '<inventory_root>/system/chassis/motherboard/dimm11',
+        'PRODUCT_24'   : '<inventory_root>/system/chassis/motherboard/dimm12',
+        'PRODUCT_25'   : '<inventory_root>/system/chassis/motherboard/dimm13',
+        'PRODUCT_26'   : '<inventory_root>/system/chassis/motherboard/dimm14',
+        'PRODUCT_27'   : '<inventory_root>/system/chassis/motherboard/dimm15',
+        'PRODUCT_28'   : '<inventory_root>/system/chassis/motherboard/dimm16',
+        'PRODUCT_29'   : '<inventory_root>/system/chassis/motherboard/dimm17',
+        'PRODUCT_30'   : '<inventory_root>/system/chassis/motherboard/dimm18',
+        'PRODUCT_31'   : '<inventory_root>/system/chassis/motherboard/dimm19',
+        'PRODUCT_32'   : '<inventory_root>/system/chassis/motherboard/dimm20',
+        'PRODUCT_33'   : '<inventory_root>/system/chassis/motherboard/dimm21',
+        'PRODUCT_34'   : '<inventory_root>/system/chassis/motherboard/dimm22',
+        'PRODUCT_35'   : '<inventory_root>/system/chassis/motherboard/dimm23',
+        'PRODUCT_36'   : '<inventory_root>/system/chassis/motherboard/dimm24',
+        'PRODUCT_37'   : '<inventory_root>/system/chassis/motherboard/dimm25',
+        'PRODUCT_38'   : '<inventory_root>/system/chassis/motherboard/dimm26',
+        'PRODUCT_39'   : '<inventory_root>/system/chassis/motherboard/dimm27',
+        'PRODUCT_40'   : '<inventory_root>/system/chassis/motherboard/dimm28',
+        'PRODUCT_41'   : '<inventory_root>/system/chassis/motherboard/dimm29',
+        'PRODUCT_42'   : '<inventory_root>/system/chassis/motherboard/dimm30',
+        'PRODUCT_43'   : '<inventory_root>/system/chassis/motherboard/dimm31',
+        'PRODUCT_44'   : '<inventory_root>/system/chassis/motherboard/dimm32',
+        'PRODUCT_45'   : '<inventory_root>/system/chassis/motherboard/dimm33',
+        'PRODUCT_46'   : '<inventory_root>/system/chassis/motherboard/dimm34',
+        'PRODUCT_47'   : '<inventory_root>/system/chassis/motherboard/dimm35',
+        'PRODUCT_48'   : '<inventory_root>/system/chassis/motherboard/dimm36',
+        'PRODUCT_49'   : '<inventory_root>/system/chassis/motherboard/dimm37',
+        'PRODUCT_50'   : '<inventory_root>/system/chassis/motherboard/dimm38',
+        'PRODUCT_51'   : '<inventory_root>/system/chassis/motherboard/dimm39',
+        'PRODUCT_52'   : '<inventory_root>/system/chassis/motherboard/dimm40',
+        'PRODUCT_53'   : '<inventory_root>/system/chassis/motherboard/dimm41',
+        'PRODUCT_54'   : '<inventory_root>/system/chassis/motherboard/dimm42',
+        'PRODUCT_55'   : '<inventory_root>/system/chassis/motherboard/dimm43',
+        'PRODUCT_56'   : '<inventory_root>/system/chassis/motherboard/dimm44',
+        'PRODUCT_57'   : '<inventory_root>/system/chassis/motherboard/dimm45',
+        'PRODUCT_58'   : '<inventory_root>/system/chassis/motherboard/dimm46',
+        'PRODUCT_59'   : '<inventory_root>/system/chassis/motherboard/dimm47',
+        'PRODUCT_60'   : '<inventory_root>/system/chassis/motherboard/dimm48',
+        'PRODUCT_61'   : '<inventory_root>/system/chassis/motherboard/dimm49',
+        'PRODUCT_62'   : '<inventory_root>/system/chassis/motherboard/dimm50',
+        'PRODUCT_63'   : '<inventory_root>/system/chassis/motherboard/dimm51',
+        'PRODUCT_64'   : '<inventory_root>/system/chassis/motherboard/dimm52',
+        'PRODUCT_65'   : '<inventory_root>/system/chassis/motherboard/dimm53',
+        'PRODUCT_66'   : '<inventory_root>/system/chassis/motherboard/dimm54',
+        'PRODUCT_67'   : '<inventory_root>/system/chassis/motherboard/dimm55',
+        'PRODUCT_68'   : '<inventory_root>/system/chassis/motherboard/dimm56',
+        'PRODUCT_69'   : '<inventory_root>/system/chassis/motherboard/dimm57',
+        'PRODUCT_70'   : '<inventory_root>/system/chassis/motherboard/dimm58',
+        'PRODUCT_71'   : '<inventory_root>/system/chassis/motherboard/dimm59',
+        'PRODUCT_72'   : '<inventory_root>/system/chassis/motherboard/dimm50',
+        'PRODUCT_73'   : '<inventory_root>/system/chassis/motherboard/dimm61',
+        'PRODUCT_74'   : '<inventory_root>/system/chassis/motherboard/dimm62',
+        'PRODUCT_75'   : '<inventory_root>/system/chassis/motherboard/dimm63',
+        'PRODUCT_76'   : '<inventory_root>/system/chassis/motherboard/dimm64',
+        'PRODUCT_77'   : '<inventory_root>/system/chassis/motherboard/dimm65',
+        'PRODUCT_78'   : '<inventory_root>/system/chassis/motherboard/dimm66',
+        'PRODUCT_79'   : '<inventory_root>/system/chassis/motherboard/dimm67',
+        'PRODUCT_80'   : '<inventory_root>/system/chassis/motherboard/dimm68',
+        'PRODUCT_81'   : '<inventory_root>/system/chassis/motherboard/dimm69',
+        'PRODUCT_82'   : '<inventory_root>/system/chassis/motherboard/dimm70',
+        'PRODUCT_83'   : '<inventory_root>/system/chassis/motherboard/dimm71',
+        'PRODUCT_84'   : '<inventory_root>/system/chassis/motherboard/dimm72',
+        'PRODUCT_85'   : '<inventory_root>/system/chassis/motherboard/dimm73',
+        'PRODUCT_86'   : '<inventory_root>/system/chassis/motherboard/dimm74',
+        'PRODUCT_87'   : '<inventory_root>/system/chassis/motherboard/dimm75',
+        'PRODUCT_88'   : '<inventory_root>/system/chassis/motherboard/dimm76',
+        'PRODUCT_89'   : '<inventory_root>/system/chassis/motherboard/dimm77',
+        'PRODUCT_90'   : '<inventory_root>/system/chassis/motherboard/dimm78',
+        'PRODUCT_91'   : '<inventory_root>/system/chassis/motherboard/dimm79',
+        'PRODUCT_92'   : '<inventory_root>/system/chassis/motherboard/dimm80',
+        'PRODUCT_93'   : '<inventory_root>/system/chassis/motherboard/dimm81',
+        'PRODUCT_94'   : '<inventory_root>/system/chassis/motherboard/dimm82',
+        'PRODUCT_95'   : '<inventory_root>/system/chassis/motherboard/dimm83',
+        'PRODUCT_96'   : '<inventory_root>/system/chassis/motherboard/dimm84',
+        'PRODUCT_97'   : '<inventory_root>/system/chassis/motherboard/dimm85',
+        'PRODUCT_98'   : '<inventory_root>/system/chassis/motherboard/dimm86',
+        'PRODUCT_99'   : '<inventory_root>/system/chassis/motherboard/dimm87',
+        'PRODUCT_100'   : '<inventory_root>/system/chassis/motherboard/dimm88',
+        'PRODUCT_101'   : '<inventory_root>/system/chassis/motherboard/dimm89',
+        'PRODUCT_102'   : '<inventory_root>/system/chassis/motherboard/dimm90',
+        'PRODUCT_103'   : '<inventory_root>/system/chassis/motherboard/dimm91',
+        'PRODUCT_104'   : '<inventory_root>/system/chassis/motherboard/dimm92',
+        'PRODUCT_105'   : '<inventory_root>/system/chassis/motherboard/dimm93',
+        'PRODUCT_106'   : '<inventory_root>/system/chassis/motherboard/dimm94',
+        'PRODUCT_107'   : '<inventory_root>/system/chassis/motherboard/dimm95',
+        'PRODUCT_108'   : '<inventory_root>/system/chassis/motherboard/dimm96',
+        'PRODUCT_109'   : '<inventory_root>/system/chassis/motherboard/dimm97',
+        'PRODUCT_110'   : '<inventory_root>/system/chassis/motherboard/dimm98',
+        'PRODUCT_111'   : '<inventory_root>/system/chassis/motherboard/dimm99',
+        'PRODUCT_112'   : '<inventory_root>/system/chassis/motherboard/dimm100',
+        'PRODUCT_113'   : '<inventory_root>/system/chassis/motherboard/dimm101',
+        'PRODUCT_114'   : '<inventory_root>/system/chassis/motherboard/dimm102',
+        'PRODUCT_115'   : '<inventory_root>/system/chassis/motherboard/dimm103',
+        'PRODUCT_116'   : '<inventory_root>/system/chassis/motherboard/dimm104',
+        'PRODUCT_117'   : '<inventory_root>/system/chassis/motherboard/dimm105',
+        'PRODUCT_118'   : '<inventory_root>/system/chassis/motherboard/dimm106',
+        'PRODUCT_119'   : '<inventory_root>/system/chassis/motherboard/dimm107',
+        'PRODUCT_120'   : '<inventory_root>/system/chassis/motherboard/dimm108',
+        'PRODUCT_121'   : '<inventory_root>/system/chassis/motherboard/dimm109',
+        'PRODUCT_122'   : '<inventory_root>/system/chassis/motherboard/dimm110',
+        'PRODUCT_123'   : '<inventory_root>/system/chassis/motherboard/dimm111',
+        'PRODUCT_124'   : '<inventory_root>/system/chassis/motherboard/dimm112',
+        'PRODUCT_125'   : '<inventory_root>/system/chassis/motherboard/dimm113',
+        'PRODUCT_126'   : '<inventory_root>/system/chassis/motherboard/dimm114',
+        'PRODUCT_127'   : '<inventory_root>/system/chassis/motherboard/dimm115',
+        'PRODUCT_128'   : '<inventory_root>/system/chassis/motherboard/dimm116',
+        'PRODUCT_129'   : '<inventory_root>/system/chassis/motherboard/dimm117',
+        'PRODUCT_130'   : '<inventory_root>/system/chassis/motherboard/dimm118',
+        'PRODUCT_131'   : '<inventory_root>/system/chassis/motherboard/dimm119',
+        'PRODUCT_132'   : '<inventory_root>/system/chassis/motherboard/dimm120',
+        'PRODUCT_133'   : '<inventory_root>/system/chassis/motherboard/dimm121',
+        'PRODUCT_134'   : '<inventory_root>/system/chassis/motherboard/dimm122',
+        'PRODUCT_135'   : '<inventory_root>/system/chassis/motherboard/dimm123',
+        'PRODUCT_136'   : '<inventory_root>/system/chassis/motherboard/dimm124',
+        'PRODUCT_137'   : '<inventory_root>/system/chassis/motherboard/dimm125',
+        'PRODUCT_138'   : '<inventory_root>/system/chassis/motherboard/dimm126',
+        'PRODUCT_139'   : '<inventory_root>/system/chassis/motherboard/dimm127',
+        'PRODUCT_140'   : '<inventory_root>/system/misc',
+    },
+    'SENSOR' : {
+        0x04 : '/org/openbmc/sensors/host/HostStatus',
+        0x05 : '/org/openbmc/sensors/host/BootProgress',
+        0x08 : '/org/openbmc/sensors/host/cpu0/OccStatus',
+        0x09 : '/org/openbmc/sensors/host/cpu1/OccStatus',
+        0x06 : '/org/openbmc/sensors/host/cpu2/OccStatus',
+        0x07 : '/org/openbmc/sensors/host/cpu3/OccStatus',
+        0x0c : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x0e : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x03 : '<inventory_root>/system/chassis/motherboard/cpu2',
+        0x0f : '<inventory_root>/system/chassis/motherboard/cpu3',
+        0x10 : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x11 : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x12 : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x13 : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x14 : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x15 : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x16 : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x17 : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x18 : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x19 : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x1a : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x1b : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x1c : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x1d : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x2c : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x2d : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x2e : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x2f : '<inventory_root>/system/chassis/motherboard/dimm31',
+        0x30 : '<inventory_root>/system/chassis/motherboard/dimm32',
+        0x31 : '<inventory_root>/system/chassis/motherboard/dimm33',
+        0x32 : '<inventory_root>/system/chassis/motherboard/dimm34',
+        0x33 : '<inventory_root>/system/chassis/motherboard/dimm35',
+        0x34 : '<inventory_root>/system/chassis/motherboard/dimm36',
+        0x35 : '<inventory_root>/system/chassis/motherboard/dimm37',
+        0x36 : '<inventory_root>/system/chassis/motherboard/dimm38',
+        0x37 : '<inventory_root>/system/chassis/motherboard/dimm39',
+        0x38 : '<inventory_root>/system/chassis/motherboard/dimm40',
+        0x39 : '<inventory_root>/system/chassis/motherboard/dimm41',
+        0x3a : '<inventory_root>/system/chassis/motherboard/dimm42',
+        0x3b : '<inventory_root>/system/chassis/motherboard/dimm43',
+        0x3c : '<inventory_root>/system/chassis/motherboard/dimm44',
+        0x3d : '<inventory_root>/system/chassis/motherboard/dimm45',
+        0x3e : '<inventory_root>/system/chassis/motherboard/dimm46',
+        0x3f : '<inventory_root>/system/chassis/motherboard/dimm47',
+        0x40 : '<inventory_root>/system/chassis/motherboard/dimm48',
+        0x41 : '<inventory_root>/system/chassis/motherboard/dimm49',
+        0x42 : '<inventory_root>/system/chassis/motherboard/dimm50',
+        0x43 : '<inventory_root>/system/chassis/motherboard/dimm51',
+        0x44 : '<inventory_root>/system/chassis/motherboard/dimm52',
+        0x45 : '<inventory_root>/system/chassis/motherboard/dimm53',
+        0x46 : '<inventory_root>/system/chassis/motherboard/dimm54',
+        0x47 : '<inventory_root>/system/chassis/motherboard/dimm55',
+        0x48 : '<inventory_root>/system/chassis/motherboard/dimm56',
+        0x49 : '<inventory_root>/system/chassis/motherboard/dimm57',
+        0x4a : '<inventory_root>/system/chassis/motherboard/dimm58',
+        0x4b : '<inventory_root>/system/chassis/motherboard/dimm59',
+        0x4c : '<inventory_root>/system/chassis/motherboard/dimm60',
+        0x4d : '<inventory_root>/system/chassis/motherboard/dimm61',
+        0x4e : '<inventory_root>/system/chassis/motherboard/dimm62',
+        0x4f : '<inventory_root>/system/chassis/motherboard/dimm63',
+        0x70 : '<inventory_root>/system/chassis/motherboard/dimm64',
+        0x71 : '<inventory_root>/system/chassis/motherboard/dimm65',
+        0x72 : '<inventory_root>/system/chassis/motherboard/dimm66',
+        0x73 : '<inventory_root>/system/chassis/motherboard/dimm67',
+        0x74 : '<inventory_root>/system/chassis/motherboard/dimm68',
+        0x75 : '<inventory_root>/system/chassis/motherboard/dimm69',
+        0x76 : '<inventory_root>/system/chassis/motherboard/dimm70',
+        0x77 : '<inventory_root>/system/chassis/motherboard/dimm71',
+        0x78 : '<inventory_root>/system/chassis/motherboard/dimm72',
+        0x79 : '<inventory_root>/system/chassis/motherboard/dimm73',
+        0x7a : '<inventory_root>/system/chassis/motherboard/dimm74',
+        0x7b : '<inventory_root>/system/chassis/motherboard/dimm75',
+        0x7c : '<inventory_root>/system/chassis/motherboard/dimm76',
+        0x7d : '<inventory_root>/system/chassis/motherboard/dimm77',
+        0x7e : '<inventory_root>/system/chassis/motherboard/dimm78',
+        0x7f : '<inventory_root>/system/chassis/motherboard/dimm79',
+        0x80 : '<inventory_root>/system/chassis/motherboard/dimm80',
+        0x81 : '<inventory_root>/system/chassis/motherboard/dimm81',
+        0x82 : '<inventory_root>/system/chassis/motherboard/dimm82',
+        0x83 : '<inventory_root>/system/chassis/motherboard/dimm83',
+        0x84 : '<inventory_root>/system/chassis/motherboard/dimm84',
+        0x85 : '<inventory_root>/system/chassis/motherboard/dimm85',
+        0x86 : '<inventory_root>/system/chassis/motherboard/dimm86',
+        0x87 : '<inventory_root>/system/chassis/motherboard/dimm87',
+        0x88 : '<inventory_root>/system/chassis/motherboard/dimm88',
+        0x89 : '<inventory_root>/system/chassis/motherboard/dimm89',
+        0x8a : '<inventory_root>/system/chassis/motherboard/dimm90',
+        0x8b : '<inventory_root>/system/chassis/motherboard/dimm91',
+        0x8c : '<inventory_root>/system/chassis/motherboard/dimm92',
+        0x8d : '<inventory_root>/system/chassis/motherboard/dimm93',
+        0x8e : '<inventory_root>/system/chassis/motherboard/dimm94',
+        0x8f : '<inventory_root>/system/chassis/motherboard/dimm95',
+        0x90 : '<inventory_root>/system/chassis/motherboard/dimm96',
+        0x91 : '<inventory_root>/system/chassis/motherboard/dimm97',
+        0x92 : '<inventory_root>/system/chassis/motherboard/dimm98',
+        0x93 : '<inventory_root>/system/chassis/motherboard/dimm99',
+        0x94 : '<inventory_root>/system/chassis/motherboard/dimm100',
+        0x95 : '<inventory_root>/system/chassis/motherboard/dimm101',
+        0x96 : '<inventory_root>/system/chassis/motherboard/dimm102',
+        0x97 : '<inventory_root>/system/chassis/motherboard/dimm103',
+        0x98 : '<inventory_root>/system/chassis/motherboard/dimm104',
+        0x99 : '<inventory_root>/system/chassis/motherboard/dimm105',
+        0x9a : '<inventory_root>/system/chassis/motherboard/dimm106',
+        0x9b : '<inventory_root>/system/chassis/motherboard/dimm107',
+        0x9c : '<inventory_root>/system/chassis/motherboard/dimm108',
+        0x9d : '<inventory_root>/system/chassis/motherboard/dimm109',
+        0x9e : '<inventory_root>/system/chassis/motherboard/dimm110',
+        0x9f : '<inventory_root>/system/chassis/motherboard/dimm111',
+        0xc0 : '<inventory_root>/system/chassis/motherboard/dimm112',
+        0xc1 : '<inventory_root>/system/chassis/motherboard/dimm113',
+        0xc2 : '<inventory_root>/system/chassis/motherboard/dimm114',
+        0xc3 : '<inventory_root>/system/chassis/motherboard/dimm115',
+        0xc4 : '<inventory_root>/system/chassis/motherboard/dimm116',
+        0xc5 : '<inventory_root>/system/chassis/motherboard/dimm117',
+        0xc6 : '<inventory_root>/system/chassis/motherboard/dimm118',
+        0xc7 : '<inventory_root>/system/chassis/motherboard/dimm119',
+        0xc8 : '<inventory_root>/system/chassis/motherboard/dimm120',
+        0xc9 : '<inventory_root>/system/chassis/motherboard/dimm121',
+        0xca : '<inventory_root>/system/chassis/motherboard/dimm122',
+        0xcb : '<inventory_root>/system/chassis/motherboard/dimm123',
+        0xcc : '<inventory_root>/system/chassis/motherboard/dimm124',
+        0xcd : '<inventory_root>/system/chassis/motherboard/dimm125',
+        0xce : '<inventory_root>/system/chassis/motherboard/dimm126',
+        0xcf : '<inventory_root>/system/chassis/motherboard/dimm127',
+        0x50 : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+        0x51 : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+        0x52 : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+        0x53 : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+        0x54 : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+        0x55 : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+        0x56 : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+        0x57 : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+        0x58 : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+        0x59 : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+        0x5a : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+        0x5b : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+        0x5c : '<inventory_root>/system/chassis/motherboard/cpu1/core0',
+        0x5d : '<inventory_root>/system/chassis/motherboard/cpu1/core1',
+        0x65 : '<inventory_root>/system/chassis/motherboard/cpu1/core2',
+        0x66 : '<inventory_root>/system/chassis/motherboard/cpu1/core3',
+        0x67 : '<inventory_root>/system/chassis/motherboard/cpu1/core4',
+        0x68 : '<inventory_root>/system/chassis/motherboard/cpu1/core5',
+        0x69 : '<inventory_root>/system/chassis/motherboard/cpu1/core6',
+        0x6a : '<inventory_root>/system/chassis/motherboard/cpu1/core7',
+        0x6b : '<inventory_root>/system/chassis/motherboard/cpu1/core8',
+        0x6c : '<inventory_root>/system/chassis/motherboard/cpu1/core9',
+        0x6d : '<inventory_root>/system/chassis/motherboard/cpu1/core10',
+        0x6e : '<inventory_root>/system/chassis/motherboard/cpu1/core11',
+        0x6f : '<inventory_root>/system/chassis/motherboard/cpu2/core0',
+        0xb7 : '<inventory_root>/system/chassis/motherboard/cpu2/core1',
+        0xb8 : '<inventory_root>/system/chassis/motherboard/cpu2/core2',
+        0xb9 : '<inventory_root>/system/chassis/motherboard/cpu2/core3',
+        0xba : '<inventory_root>/system/chassis/motherboard/cpu2/core4',
+        0xbb : '<inventory_root>/system/chassis/motherboard/cpu2/core5',
+        0xbc : '<inventory_root>/system/chassis/motherboard/cpu2/core6',
+        0xbd : '<inventory_root>/system/chassis/motherboard/cpu2/core7',
+        0xbe : '<inventory_root>/system/chassis/motherboard/cpu2/core8',
+        0xbf : '<inventory_root>/system/chassis/motherboard/cpu2/core9',
+        0xd0 : '<inventory_root>/system/chassis/motherboard/cpu2/core10',
+        0xd1 : '<inventory_root>/system/chassis/motherboard/cpu2/core11',
+        0xd2 : '<inventory_root>/system/chassis/motherboard/cpu3/core0',
+        0xd3 : '<inventory_root>/system/chassis/motherboard/cpu3/core1',
+        0xd4 : '<inventory_root>/system/chassis/motherboard/cpu3/core2',
+        0xd5 : '<inventory_root>/system/chassis/motherboard/cpu3/core3',
+        0xd6 : '<inventory_root>/system/chassis/motherboard/cpu3/core4',
+        0xd7 : '<inventory_root>/system/chassis/motherboard/cpu3/core5',
+        0xd9 : '<inventory_root>/system/chassis/motherboard/cpu3/core6',
+        0xdb : '<inventory_root>/system/chassis/motherboard/cpu3/core7',
+        0xdc : '<inventory_root>/system/chassis/motherboard/cpu3/core8',
+        0xdd : '<inventory_root>/system/chassis/motherboard/cpu3/core9',
+        0xde : '<inventory_root>/system/chassis/motherboard/cpu3/core10',
+        0xdf : '<inventory_root>/system/chassis/motherboard/cpu3/core11',
+        0xf0 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0xf1 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0xf2 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0xf3 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0xf4 : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0xf5 : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0xf6 : '<inventory_root>/system/chassis/motherboard/membuf6',
+        0xf7 : '<inventory_root>/system/chassis/motherboard/membuf7',
+        0xf8 : '<inventory_root>/system/chassis/motherboard/membuf8',
+        0xf9 : '<inventory_root>/system/chassis/motherboard/membuf9',
+        0xfa : '<inventory_root>/system/chassis/motherboard/membuf10',
+        0xfb : '<inventory_root>/system/chassis/motherboard/membuf11',
+        0xfc : '<inventory_root>/system/chassis/motherboard/membuf12',
+        0xfd : '<inventory_root>/system/chassis/motherboard/membuf13',
+        0xfe : '<inventory_root>/system/chassis/motherboard/membuf14',
+        0xa0 : '<inventory_root>/system/chassis/motherboard/membuf15',
+        0x5f : '/org/openbmc/sensors/host/BootCount',
+        0x60 : '<inventory_root>/system/chassis/motherboard',
+        0x61 : '<inventory_root>/system/systemevent',
+        0x62 : '<inventory_root>/system/powerlimit',
+        0x63 : '<inventory_root>/system/chassis/motherboard/refclock',
+        0x64 : '<inventory_root>/system/chassis/motherboard/pcieclock',
+        0xb1 : '<inventory_root>/system/chassis/motherboard/todclock',
+        0xb2 : '<inventory_root>/system/chassis/motherboard/apss',
+        0xb3 : '/org/openbmc/sensors/host/powercap',
+        0xb5 : '/org/openbmc/sensors/host/OperatingSystemStatus',
+        0xb6 : '<inventory_root>/system/chassis/motherboard/pcielink',
+    },
+    'GPIO_PRESENT' : {}
+}
+
+GPIO_CONFIG = {}
+GPIO_CONFIG['BMC_POWER_UP'] = \
+        {'gpio_pin': 'E1', 'direction': 'out'}
+GPIO_CONFIG['SYS_PWROK_BUFF'] = \
+        {'gpio_pin': 'D2', 'direction': 'in'}
+GPIO_CONFIG['BMC_WD_CLEAR_PULSE_N'] = \
+        {'gpio_pin': 'N4', 'direction': 'out'}
+GPIO_CONFIG['CM1_OE_R_N'] = \
+        {'gpio_pin': 'Q6', 'direction': 'out'}
+GPIO_CONFIG['BMC_CP0_RESET_N'] = \
+        {'gpio_pin': 'O2', 'direction': 'out'}
+GPIO_CONFIG['PSU_PG'] = \
+        {'gpio_pin': 'J2', 'direction': 'in'}
+GPIO_CONFIG['PEX8718_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'B6', 'direction': 'out'}
+GPIO_CONFIG['CP0_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N3', 'direction': 'in'}
+GPIO_CONFIG['CP1_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N5', 'direction': 'in'}
+GPIO_CONFIG['CP2_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'P0', 'direction': 'in'}
+GPIO_CONFIG['CP3_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'P1', 'direction': 'in'}
+GPIO_CONFIG['IDBTN']       = \
+        { 'gpio_pin': 'Q7', 'direction': 'out' }
+GPIO_CONFIG['FSI_DATA'] = \
+        {'gpio_pin': 'A5', 'direction': 'out'}
+GPIO_CONFIG['FSI_CLK'] = \
+        {'gpio_pin': 'A4', 'direction': 'out'}
+GPIO_CONFIG['FSI_ENABLE'] = \
+        {'gpio_pin': 'D0', 'direction': 'out'}
+GPIO_CONFIG['CRONUS_SEL'] = \
+        {'gpio_pin': 'A6', 'direction': 'out'}
+
+
+GPIO_CONFIG['POWER_BUTTON'] = \
+        {'gpio_pin': 'E0', 'direction': 'both'}
+GPIO_CONFIG['RESET_BUTTON'] = \
+        {'gpio_pin': 'E2', 'direction': 'both'}
+GPIO_CONFIG['CHECKSTOP'] = \
+        {'gpio_pin': 'P5', 'direction': 'falling'}
+
+GPIO_CONFIG['PS0_PRES_N'] = \
+        {'gpio_pin': 'P7', 'direction': 'in'}
+GPIO_CONFIG['PS1_PRES_N'] = \
+        {'gpio_pin': 'N0', 'direction': 'in'}
+
+HWMON_CONFIG = {
+    '1-0049' :  {
+        'names' : {
+            'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        }
+    },
+    '11-0068' : {
+        'names' : {
+            'temp1_input' : { 'object_path' : 'temperature/RTC_temp1','poll_interval' : 10000,'scale' : -3,'units' : 'C' },
+        }
+    },
+    '12-002f' : {
+        'names' : {
+            'device/temp1_input' : { 'object_path' : 'temperature/INlet_Temp1','poll_interval' : 10000,'scale' : -3,'units' : 'C' },
+            'device/temp2_input' : { 'object_path' : 'temperature/INlet_Temp2','poll_interval' : 10000,'scale' : -3,'units' : 'C' },
+            'device/temp3_input' : { 'object_path' : 'temperature/OUTlet_Temp1','poll_interval' : 10000,'scale' : -3,'units' : 'C' },
+            'device/temp4_input' : { 'object_path' : 'temperature/OUTlet_Temp2','poll_interval' : 10000,'scale' : -3,'units' : 'C' },
+            'device/pwm3' : { 'object_path' : 'speed/FAN_PWM0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/pwm4' : { 'object_path' : 'speed/FAN_PWM1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/pwm5' : { 'object_path' : 'speed/FAN_PWM2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/pwm6' : { 'object_path' : 'speed/FAN_PWM3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/pwm7' : { 'object_path' : 'speed/FAN_PWM4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/fan3_input' : { 'object_path' : 'tach/FAN_TACH0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/fan4_input' : { 'object_path' : 'tach/FAN_TACH1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/fan5_input' : { 'object_path' : 'tach/FAN_TACH2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/fan6_input' : { 'object_path' : 'tach/FAN_TACH3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/fan7_input' : { 'object_path' : 'tach/FAN_TACH4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+            'device/in0_input' : { 'object_path' : 'voltage/P0V89_CPU0','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in1_input' : { 'object_path' : 'voltage/P1V1_CPU0','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in2_input' : { 'object_path' : 'voltage/P0V97_CPU0','poll_interval' : 10000,'scale' : -3,'offset': -10,'units' : 'V' },
+            'device/in3_input' : { 'object_path' : 'voltage/P0V89_CPU1','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in4_input' : { 'object_path' : 'voltage/P1V1_CPU1','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in5_input' : { 'object_path' : 'voltage/P0V97_CPU1','poll_interval' : 10000,'scale' : -3,'offset': -10,'units' : 'V' },
+            'device/in6_input' : { 'object_path' : 'voltage/P0V89_CPU2','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in7_input' : { 'object_path' : 'voltage/P1V1_CPU2','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in8_input' : { 'object_path' : 'voltage/P0V97_CPU2','poll_interval' : 10000,'scale' : -3,'offset': -10,'units' : 'V' },
+            'device/in9_input' : { 'object_path' : 'voltage/P0V89_CPU3','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in10_input' : { 'object_path' : 'voltage/P1V1_CPU3','poll_interval' : 10000,'scale' : -3,'units' : 'V' },
+            'device/in11_input' : { 'object_path' : 'voltage/P0V97_CPU3','poll_interval' : 10000,'scale' : -3,'offset': -10,'units' : 'V' },
+            'device/in12_input' : { 'object_path' : 'voltage/P12V_1','poll_interval' : 10000,'scale' : -3,'adjust' : 0.26,'units' : 'V' },
+            'device/in13_input' : { 'object_path' : 'voltage/P5V','poll_interval' : 10000,'scale' : -3,'adjust' : 0.6,'units' : 'V' },
+        }
+    },
+   '4-0050' : {
+        'names' : {
+            'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+        },
+        'labels' : {
+        '11' :  { 'object_path' : 'temperature/cpu0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '168' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '224' :  { 'object_path' : 'temperature/membuf0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '225' :  { 'object_path' : 'temperature/membuf1','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '226' :  { 'object_path' : 'temperature/membuf2','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '227' :  { 'object_path' : 'temperature/membuf3','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '256' :  { 'object_path' : 'temperature/DIMM0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '257' :  { 'object_path' : 'temperature/DIMM1','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '258' :  { 'object_path' : 'temperature/DIMM2','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '259' :  { 'object_path' : 'temperature/DIMM3','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '260' :  { 'object_path' : 'temperature/DIMM4','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '261' :  { 'object_path' : 'temperature/DIMM5','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '262' :  { 'object_path' : 'temperature/DIMM6','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '263' :  { 'object_path' : 'temperature/DIMM7','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '264' :  { 'object_path' : 'temperature/DIMM8','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '265' :  { 'object_path' : 'temperature/DIMM9','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '266' :  { 'object_path' : 'temperature/DIMM10','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '267' :  { 'object_path' : 'temperature/DIMM11','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '268' :  { 'object_path' : 'temperature/DIMM12','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '269' :  { 'object_path' : 'temperature/DIMM13','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '270' :  { 'object_path' : 'temperature/DIMM14','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '271' :  { 'object_path' : 'temperature/DIMM15','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '288' :  { 'object_path' : 'temperature/DIMM16','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '289' :  { 'object_path' : 'temperature/DIMM17','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '290' :  { 'object_path' : 'temperature/DIMM18','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '291' :  { 'object_path' : 'temperature/DIMM19','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '292' :  { 'object_path' : 'temperature/DIMM20','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '293' :  { 'object_path' : 'temperature/DIMM21','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '294' :  { 'object_path' : 'temperature/DIMM22','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '295' :  { 'object_path' : 'temperature/DIMM23','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '296' :  { 'object_path' : 'temperature/DIMM24','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '297' :  { 'object_path' : 'temperature/DIMM25','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '298' :  { 'object_path' : 'temperature/DIMM26','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '299' :  { 'object_path' : 'temperature/DIMM27','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '300' :  { 'object_path' : 'temperature/DIMM28','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '301' :  { 'object_path' : 'temperature/DIMM29','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '302' :  { 'object_path' : 'temperature/DIMM30','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '303' :  { 'object_path' : 'temperature/DIMM31','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        }
+    },
+    '5-0051' : {
+        'labels' :  {
+        '13' :  { 'object_path' : 'temperature/cpu1','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '169' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '228' :  { 'object_path' : 'temperature/membuf4','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '229' :  { 'object_path' : 'temperature/membuf5','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '230' :  { 'object_path' : 'temperature/membuf6','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '231' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '512' :  { 'object_path' : 'temperature/DIMM32','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '513' :  { 'object_path' : 'temperature/DIMM33','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '514' :  { 'object_path' : 'temperature/DIMM34','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '515' :  { 'object_path' : 'temperature/DIMM35','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '516' :  { 'object_path' : 'temperature/DIMM36','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '517' :  { 'object_path' : 'temperature/DIMM37','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '518' :  { 'object_path' : 'temperature/DIMM38','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '519' :  { 'object_path' : 'temperature/DIMM39','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '520' :  { 'object_path' : 'temperature/DIMM40','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '521' :  { 'object_path' : 'temperature/DIMM41','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '522' :  { 'object_path' : 'temperature/DIMM42','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '523' :  { 'object_path' : 'temperature/DIMM43','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '524' :  { 'object_path' : 'temperature/DIMM44','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '525' :  { 'object_path' : 'temperature/DIMM45','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '526' :  { 'object_path' : 'temperature/DIMM46','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '527' :  { 'object_path' : 'temperature/DIMM47','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '544' :  { 'object_path' : 'temperature/DIMM48','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '545' :  { 'object_path' : 'temperature/DIMM49','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '546' :  { 'object_path' : 'temperature/DIMM50','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '547' :  { 'object_path' : 'temperature/DIMM51','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '548' :  { 'object_path' : 'temperature/DIMM52','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '549' :  { 'object_path' : 'temperature/DIMM53','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '550' :  { 'object_path' : 'temperature/DIMM54','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '551' :  { 'object_path' : 'temperature/DIMM55','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '552' :  { 'object_path' : 'temperature/DIMM56','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '553' :  { 'object_path' : 'temperature/DIMM57','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '554' :  { 'object_path' : 'temperature/DIMM58','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '555' :  { 'object_path' : 'temperature/DIMM59','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '556' :  { 'object_path' : 'temperature/DIMM60','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '557' :  { 'object_path' : 'temperature/DIMM61','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '558' :  { 'object_path' : 'temperature/DIMM62','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '559' :  { 'object_path' : 'temperature/DIMM63','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        }
+    },
+    '6-0056' : {
+        'labels' :  {
+        '2' :  { 'object_path' : 'temperature/cpu2','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '174' :  { 'object_path' : 'temperature/cpu2/core0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '232' :  { 'object_path' : 'temperature/membuf8','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '233' :  { 'object_path' : 'temperature/membuf9','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '234' :  { 'object_path' : 'temperature/membuf10','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '235' :  { 'object_path' : 'temperature/membuf11','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '768' :  { 'object_path' : 'temperature/DIMM64','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '769' :  { 'object_path' : 'temperature/DIMM65','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '770' :  { 'object_path' : 'temperature/DIMM66','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '771' :  { 'object_path' : 'temperature/DIMM67','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '772' :  { 'object_path' : 'temperature/DIMM68','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '773' :  { 'object_path' : 'temperature/DIMM69','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '774' :  { 'object_path' : 'temperature/DIMM70','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '775' :  { 'object_path' : 'temperature/DIMM71','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '776' :  { 'object_path' : 'temperature/DIMM72','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '777' :  { 'object_path' : 'temperature/DIMM73','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '778' :  { 'object_path' : 'temperature/DIMM74','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '779' :  { 'object_path' : 'temperature/DIMM75','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '780' :  { 'object_path' : 'temperature/DIMM76','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '781' :  { 'object_path' : 'temperature/DIMM77','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '782' :  { 'object_path' : 'temperature/DIMM78','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '783' :  { 'object_path' : 'temperature/DIMM79','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '800' :  { 'object_path' : 'temperature/DIMM80','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '801' :  { 'object_path' : 'temperature/DIMM81','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '802' :  { 'object_path' : 'temperature/DIMM82','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '803' :  { 'object_path' : 'temperature/DIMM83','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '804' :  { 'object_path' : 'temperature/DIMM84','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '805' :  { 'object_path' : 'temperature/DIMM85','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '806' :  { 'object_path' : 'temperature/DIMM86','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '807' :  { 'object_path' : 'temperature/DIMM87','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '808' :  { 'object_path' : 'temperature/DIMM88','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '809' :  { 'object_path' : 'temperature/DIMM89','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '810' :  { 'object_path' : 'temperature/DIMM90','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '811' :  { 'object_path' : 'temperature/DIMM91','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '812' :  { 'object_path' : 'temperature/DIMM92','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '813' :  { 'object_path' : 'temperature/DIMM93','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '814' :  { 'object_path' : 'temperature/DIMM94','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '815' :  { 'object_path' : 'temperature/DIMM95','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        }
+    },
+    '7-0057' : {
+        'labels' :  {
+        '10' :  { 'object_path' : 'temperature/cpu3','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '175' :  { 'object_path' : 'temperature/cpu3/core0','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '236' :  { 'object_path' : 'temperature/membuf12','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '237' :  { 'object_path' : 'temperature/membuf13','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '238' :  { 'object_path' : 'temperature/membuf14','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '239' :  { 'object_path' : 'temperature/membuf15','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1024' :  { 'object_path' : 'temperature/DIMM96','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1025' :  { 'object_path' : 'temperature/DIMM97','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1026' :  { 'object_path' : 'temperature/DIMM98','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1027' :  { 'object_path' : 'temperature/DIMM99','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1028' :  { 'object_path' : 'temperature/DIMM100','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1029' :  { 'object_path' : 'temperature/DIMM101','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1030' :  { 'object_path' : 'temperature/DIMM102','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1031' :  { 'object_path' : 'temperature/DIMM103','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1032' :  { 'object_path' : 'temperature/DIMM104','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1033' :  { 'object_path' : 'temperature/DIMM105','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1034' :  { 'object_path' : 'temperature/DIMM106','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1035' :  { 'object_path' : 'temperature/DIMM107','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1036' :  { 'object_path' : 'temperature/DIMM108','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1037' :  { 'object_path' : 'temperature/DIMM109','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1038' :  { 'object_path' : 'temperature/DIMM110','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1039' :  { 'object_path' : 'temperature/DIMM111','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1056' :  { 'object_path' : 'temperature/DIMM112','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1057' :  { 'object_path' : 'temperature/DIMM113','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1058' :  { 'object_path' : 'temperature/DIMM114','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1059' :  { 'object_path' : 'temperature/DIMM115','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1060' :  { 'object_path' : 'temperature/DIMM116','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1061' :  { 'object_path' : 'temperature/DIMM117','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1062' :  { 'object_path' : 'temperature/DIMM118','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1063' :  { 'object_path' : 'temperature/DIMM119','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1064' :  { 'object_path' : 'temperature/DIMM120','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1065' :  { 'object_path' : 'temperature/DIMM121','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1066' :  { 'object_path' : 'temperature/DIMM122','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1067' :  { 'object_path' : 'temperature/DIMM123','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1068' :  { 'object_path' : 'temperature/DIMM124','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1069' :  { 'object_path' : 'temperature/DIMM125','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1070' :  { 'object_path' : 'temperature/DIMM126','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        '1071' :  { 'object_path' : 'temperature/DIMM127','poll_interval' : 5000,'scale' : -3,'units' : 'C' },
+        }
+    },
+}
+
+
+GPIO_CONFIGS = {
+    'power_config' : {
+        'power_good_in' : 'SYS_PWROK_BUFF',
+        'power_up_outs' : [
+            ('BMC_POWER_UP', False),
+        ],
+        'reset_outs' : [
+            ('CM1_OE_R_N', True),
+            ('BMC_CP0_RESET_N', False),
+        ],
+        'pci_reset_outs': [
+            # net name, polarity, reset hold
+            # if 'reset hold' set to 'True', BMC will hold pci reset until host CPU ready to drive PCI
+            ('PEX8718_DEVICES_RESET_N', False, True),
+            #('CP0_DEVICES_RESET_N', False, True),
+            #('CP1_DEVICES_RESET_N', False, True),
+            #('CP2_DEVICES_RESET_N', False, True),
+            #('CP3_DEVICES_RESET_N', False, True),
+        ],
+    },
+    'hostctl_config' : {
+        'fsi_data' : 'FSI_DATA',
+        'fsi_clk' : 'FSI_CLK',
+        'fsi_enable' : 'FSI_ENABLE',
+        'cronus_sel' : 'CRONUS_SEL',
+        'optionals' : [
+            ('IDBTN', False),
+        ],
+    },
+}
+
+
+# Miscellaneous non-poll sensor with system specific properties.
+# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
+MISC_SENSORS = {
+	0x5f : { 'class' : 'BootCountSensor' },
+	0x05 : { 'class' : 'BootProgressSensor' },
+	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
+}
+
+# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
diff --git a/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes.txt
new file mode 100644
index 00000000..3ec3f4a4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-yadro/meta-vesnin/recipes.txt
@@ -0,0 +1,2 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.14.1


--------------6F6125F9C6F8824704A97A64--
