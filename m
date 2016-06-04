Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SR1HyYzDq9n
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465017649833280.5407294737429;
 Fri, 3 Jun 2016 22:20:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 06/10] Move static kernel recipe configuration to
 include
Date: Sat,  4 Jun 2016 00:20:35 -0500
Message-Id: <20160604052039.6581-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jun 2016 05:20:55 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This facilitates multiple kernel recipes.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-kernel/linux/linux-obmc.inc         | 18 ++++++++++++++++++
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb      | 18 +-----------------
 2 files changed, 19 insertions(+), 17 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
new file mode 100644
index 0000000..c64ff9d
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Linux kernel for OpenBMC"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+
+KCONFIG_MODE="--alldefconfig"
+
+KSRC ?= "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
+SRC_URI = "${KSRC}"
+SRC_URI += "file://hwmon.cfg"
+
+LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
index b3aa704..539ea43 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
@@ -1,21 +1,5 @@
-DESCRIPTION = "Linux kernel for OpenBMC"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-
 KBRANCH ?= "dev-4.4"
-KCONFIG_MODE="--alldefconfig"
-
-SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
-SRC_URI += "file://hwmon.cfg"
-
 LINUX_VERSION ?= "4.4"
-LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
-
 SRCREV="openbmc-20160521-1"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
-
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
+require linux-obmc.inc
-- 
2.8.3
