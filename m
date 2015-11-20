Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6E7691A0019
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:40:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447994424753459.05467647744126;
 Thu, 19 Nov 2015 20:40:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/2] Switch back to using in-tree Barreleye device tree
Date: Thu, 19 Nov 2015 23:40:19 -0500
Message-Id: <1447994419-11491-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 04:40:35 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-rackspace/meta-barreleye/conf/machine/barreleye.conf           | 2 +-
 .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend           | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
index c48f811..f9d31f1 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf
@@ -1,5 +1,5 @@
 KMACHINE = "aspeed"
-KERNEL_DEVICETREE = "${MACHINE}.dtb"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
index 39c2012..b106e5a 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
-SRC_URI += "file://barreleye.dts"
-- 
2.6.3
