Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj6y1zvNzDqZc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:30:49 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466641843568164.75533921035026;
 Wed, 22 Jun 2016 17:30:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v6 03/18] Removed unused host-ipmid-bt application
Date: Wed, 22 Jun 2016 19:30:23 -0500
Message-Id: <20160623003038.2361-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 23 Jun 2016 00:30:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This was deprecated in favor of btbridged.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb  | 17 -----------------
 .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service        |  9 ---------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
deleted file mode 100644
index 830f754..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Phosphor OpenBMC BT to DBUS"
-DESCRIPTION = "Phosphor OpenBMC BT to DBUS."
-PR = "r1"
-
-RDEPENDS_${PN} += "python-subprocess"
-
-SYSTEMD_SERVICE_${PN} = "host-ipmi-bt.service"
-
-inherit obmc-phosphor-pydbus-service
-inherit obmc-phosphor-host-ipmi-hw
-
-S = "${WORKDIR}/git"
-SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
-SRCREV="${AUTOREV}"
-
-SCRIPT_NAME = "ipmid.py"
-INSTALL_NAME = "host-ipmi-bt"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service
deleted file mode 100644
index 3e40b46..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=Phosphor OpenBMC BT to DBUS 
-
-[Service]
-Restart=always
-ExecStart=/usr/sbin/host-ipmi-bt
-
-[Install]
-WantedBy=multi-user.target
-- 
2.9.0
