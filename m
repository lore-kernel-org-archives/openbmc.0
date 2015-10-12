Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2CBFE1A07C3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:16:50 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659408392774.9298483411732;
 Mon, 12 Oct 2015 07:16:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/7] Allow login on ttyS4
Date: Mon, 12 Oct 2015 09:16:35 -0500
Message-Id: <1444659400-4196-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:16:50 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../recipes-extended/shadow/shadow-securetty/securetty.patch   | 10 ++++++++++
 .../common/recipes-extended/shadow/shadow-securetty_%.bbappend |  4 ++++
 meta-phosphor/common/recipes.txt                               |  4 +++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-extended/shadow/shadow-securetty/securetty.patch
 create mode 100644 meta-phosphor/common/recipes-extended/shadow/shadow-securetty_%.bbappend

diff --git a/meta-phosphor/common/recipes-extended/shadow/shadow-securetty/securetty.patch b/meta-phosphor/common/recipes-extended/shadow/shadow-securetty/securetty.patch
new file mode 100644
index 0000000..6533e4a
--- /dev/null
+++ b/meta-phosphor/common/recipes-extended/shadow/shadow-securetty/securetty.patch
@@ -0,0 +1,10 @@
+--- a/securetty
++++ b/securetty
+@@ -7,6 +7,7 @@ ttyS0
+ ttyS1
+ ttyS2
+ ttyS3
++ttyS4
+ 
+ # ARM AMBA SoCs
+ ttyAM0
diff --git a/meta-phosphor/common/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-phosphor/common/recipes-extended/shadow/shadow-securetty_%.bbappend
new file mode 100644
index 0000000..70ab435
--- /dev/null
+++ b/meta-phosphor/common/recipes-extended/shadow/shadow-securetty_%.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://securetty.patch"
+
diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index c2c88b7..8ebedf8 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1 +1,3 @@
-recipes-phosphor      - Phosphor OpenBMC applications and configuration
+recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
+                       core. May be needed for full tool functionality or LSB compliance.
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.6.0
