Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwHp6RwgzDqCp
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:50:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466531435952792.5939460876419;
 Tue, 21 Jun 2016 10:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Removed unused host-ipmid-bt application
Date: Tue, 21 Jun 2016 12:50:33 -0500
Message-Id: <20160621175033.25045-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621175033.25045-1-openbmc-patches@stwcx.xyz>
References: <20160621175033.25045-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:50:48 -0000

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
