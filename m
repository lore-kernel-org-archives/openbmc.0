Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV8pc0pvmzDqjm
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 01:00:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146600284565449.355437896072885;
 Wed, 15 Jun 2016 08:00:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Remove openpower inventory upload systemd startup
Date: Wed, 15 Jun 2016 10:00:40 -0500
Message-Id: <20160615150040.29627-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615150040.29627-1-openbmc-patches@stwcx.xyz>
References: <20160615150040.29627-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 15:00:57 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The launching of this application is temporarily being moved to the skeleton
state management framework to avoid race conditions with the host power-on
process.

Signed-off-by:  Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../recipes-phosphor/inventory-upload/inventory-upload.bb      |  1 -
 .../inventory-upload/inventory-upload/inventory-upload.service | 10 ----------
 2 files changed, 11 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
index 2dfcf58..90425f4 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
@@ -6,7 +6,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 inherit allarch
-inherit obmc-phosphor-systemd
 inherit setuptools
 
 RDEPENDS_${PN} += " \
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service
deleted file mode 100644
index 18d1f4b..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload/inventory-upload.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=BMC Inventory Upload
-Requires=skeleton.service
-After=skeleton.service
-
-[Service]
-ExecStart=/usr/sbin/inventory_upload.py
-
-[Install]
-WantedBy=multi-user.target
-- 
2.8.4
