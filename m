Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsf3hVLzDr3B
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467309039570498.53426682456916;
 Thu, 30 Jun 2016 10:50:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 3/6] Add skeleton classes
Date: Thu, 30 Jun 2016 12:50:30 -0500
Message-Id: <20160630175033.5212-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
References: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:47 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A number of classes to be used by recipes pointing to the skeleton
project.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/skeleton-gdbus.bbclass  | 7 +++++++
 meta-phosphor/classes/skeleton-python.bbclass | 5 +++++
 meta-phosphor/classes/skeleton-sdbus.bbclass  | 7 +++++++
 meta-phosphor/classes/skeleton.bbclass        | 7 +++++++
 4 files changed, 26 insertions(+)
 create mode 100644 meta-phosphor/classes/skeleton-gdbus.bbclass
 create mode 100644 meta-phosphor/classes/skeleton-python.bbclass
 create mode 100644 meta-phosphor/classes/skeleton-sdbus.bbclass
 create mode 100644 meta-phosphor/classes/skeleton.bbclass

diff --git a/meta-phosphor/classes/skeleton-gdbus.bbclass b/meta-phosphor/classes/skeleton-gdbus.bbclass
new file mode 100644
index 0000000..58df398
--- /dev/null
+++ b/meta-phosphor/classes/skeleton-gdbus.bbclass
@@ -0,0 +1,7 @@
+inherit skeleton
+
+DEPENDS += "glib-2.0 obmc-libobmc-intf"
+
+do_install_append() {
+        oe_runmake install DESTDIR=${D}
+}
diff --git a/meta-phosphor/classes/skeleton-python.bbclass b/meta-phosphor/classes/skeleton-python.bbclass
new file mode 100644
index 0000000..5464e2d
--- /dev/null
+++ b/meta-phosphor/classes/skeleton-python.bbclass
@@ -0,0 +1,5 @@
+inherit skeleton
+inherit allarch
+inherit setuptools
+
+DEPENDS += "python"
diff --git a/meta-phosphor/classes/skeleton-sdbus.bbclass b/meta-phosphor/classes/skeleton-sdbus.bbclass
new file mode 100644
index 0000000..627ce76
--- /dev/null
+++ b/meta-phosphor/classes/skeleton-sdbus.bbclass
@@ -0,0 +1,7 @@
+inherit skeleton
+
+DEPENDS += "systemd"
+
+do_install_append() {
+        oe_runmake install DESTDIR=${D}
+}
diff --git a/meta-phosphor/classes/skeleton.bbclass b/meta-phosphor/classes/skeleton.bbclass
new file mode 100644
index 0000000..72b26fb
--- /dev/null
+++ b/meta-phosphor/classes/skeleton.bbclass
@@ -0,0 +1,7 @@
+inherit obmc-phosphor-license
+
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+
+SRCREV ??= "a194b9d150b9a8d35f757bae356083cbf0d1dfd8"
+SRC_URI += "git://github.com/openbmc/skeleton"
+S = "${WORKDIR}/git/${SKELETON_DIR}"
-- 
2.9.0
