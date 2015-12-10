Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 219551A1136
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 12:30:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449711037448487.9759575723524;
 Wed, 9 Dec 2015 17:30:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH openbmc] Add flash copy commands to busybox
Date: Wed,  9 Dec 2015 19:30:36 -0600
Message-Id: <1449711036-9716-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449711036-9716-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449711036-9716-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 10 Dec 2015 01:30:43 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The flashcp command will copy a file to a mtd device after erasing the
partition.   This is useful for updating the bmc u-boot, kernel,
environment, and/or initrd.  It can also be used for upating the whole
pnor, or partitions if we later add ffs partition parsing.
---
 meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg  | 4 ++++
 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg

diff --git a/meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg b/meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg
new file mode 100644
index 0000000..39ba10d
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg
@@ -0,0 +1,4 @@
+CONFIG_FLASHCP=y
+CONFIG_FLASH_LOCK=y
+CONFIG_FLASH_UNLOCK=y
+CONFIG_FLASH_ERASEALL=y
diff --git a/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend b/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend
index 225f17a..3c4f2b6 100644
--- a/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend
@@ -1,2 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://busybox.cfg"
+SRC_URI += "file://flash.cfg"
-- 
2.6.3
