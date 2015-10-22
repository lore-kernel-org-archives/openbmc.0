Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 82F651A05AA
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 14454811059822.1043456788336243;
 Wed, 21 Oct 2015 19:31:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add devmem to busybox config.
Date: Wed, 21 Oct 2015 21:31:41 -0500
Message-Id: <1445481101-29721-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481101-29721-1-git-send-email-patches@stwcx.xyz>
References: <1445481101-29721-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:49 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg | 1 +
 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend  | 2 ++
 meta-phosphor/common/recipes.txt                              | 1 +
 3 files changed, 4 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend

diff --git a/meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg b/meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg
new file mode 100644
index 0000000..174a3f2
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg
@@ -0,0 +1 @@
+CONFIG_DEVMEM=y
diff --git a/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend b/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend
new file mode 100644
index 0000000..225f17a
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://busybox.cfg"
diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index f339a3c..ccd19b2 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1,4 +1,5 @@
 recipes-connectivity - Libraries and applications related to communication with other devices 
+recipes-core         - What's needed to build a basic working Linux image including commonly used dependencies
 recipes-devtools     - Tools primarily used by the build system (but can also be used on targets)
 recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
                        core. May be needed for full tool functionality or LSB compliance.
-- 
2.6.0
