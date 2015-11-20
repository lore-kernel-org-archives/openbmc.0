Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F3C2E1A0018
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:40:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447994422114823.8420373020595;
 Thu, 19 Nov 2015 20:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/2] Switch back to using in-tree Palmetto device tree
Date: Thu, 19 Nov 2015 23:40:18 -0500
Message-Id: <1447994419-11491-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447994419-11491-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447994419-11491-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 04:40:30 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf    | 2 +-
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index d57bdcb..f6256a7 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -1,5 +1,5 @@
 KMACHINE = "aspeed"
-KERNEL_DEVICETREE = "${MACHINE}.dtb"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
index e4a4d85..a49c239 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,2 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
-SRC_URI += "file://palmetto.dts file://palmetto.cfg"
+SRC_URI += "file://palmetto.cfg"
-- 
2.6.3
