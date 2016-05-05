Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0xsH1cYfzDqBt
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 00:20:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462458036177746.8867777832502;
 Thu, 5 May 2016 07:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Bump versions for inventory upload
Date: Thu,  5 May 2016 09:20:33 -0500
Message-Id: <1462458033-8576-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462458033-8576-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462458033-8576-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 May 2016 14:20:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Bump mapper and skeleton versions.
Bump upload version and add systemd service file.
---
 .../recipes-phosphor/inventory-upload/inventory-upload.bb      |  5 ++++-
 .../inventory-upload/inventory-upload/inventory-upload.service | 10 ++++++++++
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb      |  2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     |  2 +-
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
index 8c0bd34..c3a2361 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
@@ -6,15 +6,18 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 inherit allarch
+inherit obmc-phosphor-systemd
 inherit setuptools
 
 RDEPENDS_${PN} += " \
+        python-dbus \
+        python-pygobject \
         pyphosphor \
         dtc \
         "
 
 SRC_URI += "git://github.com/openbmc/openpower-inventory-upload"
 
-SRCREV = "5909e7859a1a56bdc902cf774093d9fae29612ea"
+SRCREV = "867e058dd246739ab9c93df64e82b7526f42d67f"
 
 S = "${WORKDIR}/git"
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service
new file mode 100644
index 0000000..18d1f4b
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=BMC Inventory Upload
+Requires=skeleton.service
+After=skeleton.service
+
+[Service]
+ExecStart=/usr/sbin/inventory_upload.py
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 5b59290..2472917 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "a2c0d00e47ec082b8bb8c96629a0a677616e49fe"
+SRCREV = "2abc4d068cec75aa3893af8197108d29ff6f1bb4"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index a258c2a..1553314 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -20,7 +20,7 @@ SRC_URI += "git://github.com/openbmc/skeleton"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "d3e6edc748f026dcd68d20306a1cfe0e26df22a9"
+SRCREV = "264009617c231447d6c8fc61264cf3c6ea7f49d5"
 
 S = "${WORKDIR}"
 
-- 
2.8.1
