Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F65B1A0730
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:36 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293354457455.25011321846443;
 Mon, 19 Oct 2015 15:22:34 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/3] Move palmetto configuration to openpower layer
Date: Mon, 19 Oct 2015 17:22:29 -0500
Message-Id: <1445293351-658-2-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:36 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Added openpower.inc for any openpower system.
Added ibm.cin for IBM openpower systems.
---
 .../conf/machine/include/openpower.inc              | 19 +++++++++++++++++++
 .../meta-ibm/conf/machine/include/ibm.inc           |  1 +
 .../meta-palmetto/conf/machine/palmetto.conf        | 21 +--------------------
 3 files changed, 21 insertions(+), 20 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/conf/machine/include/ibm.inc

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
new file mode 100644
index 0000000..89ad0ec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -0,0 +1,19 @@
+OBMC_MACHINE_FEATURES += "\
+        obmc-phosphor-fan-mgmt \
+        obmc-phosphor-chassis-mgmt \
+        obmc-phosphor-sensor-mgmt \
+        obmc-phosphor-flash-mgmt \
+        "
+
+VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
+       obmc-phosphor-example-sdbus \
+       "
+VIRTUAL-RUNTIME_obmc-phosphor-sensor-ctl = " \
+       obmc-phosphor-example-sdbus \
+       "
+VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
+       obmc-phosphor-example-pydbus \
+       "
+VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
+       obmc-phosphor-example-pydbus \
+       "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/conf/machine/include/ibm.inc b/meta-openbmc-machines/meta-openpower/meta-ibm/conf/machine/include/ibm.inc
new file mode 100644
index 0000000..c79ddd7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/conf/machine/include/ibm.inc
@@ -0,0 +1 @@
+require conf/machine/include/openpower.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index 0efdda0..f6256a7 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -1,28 +1,9 @@
-OBMC_MACHINE_FEATURES += "\
-        obmc-phosphor-fan-mgmt \
-        obmc-phosphor-chassis-mgmt \
-        obmc-phosphor-sensor-mgmt \
-        obmc-phosphor-flash-mgmt \
-        "
-
-VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
-       obmc-phosphor-example-sdbus \
-       "
-VIRTUAL-RUNTIME_obmc-phosphor-sensor-ctl = " \
-       obmc-phosphor-example-sdbus \
-       "
-VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl = " \
-       obmc-phosphor-example-pydbus \
-       "
-VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
-       obmc-phosphor-example-pydbus \
-       "
-
 KMACHINE = "aspeed"
 KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/ibm.inc
 
 UBOOT_MACHINE_palmetto = "palmetto_config"
 UBOOT_ENTRYPOINT = "0x40008000"
-- 
2.6.0
