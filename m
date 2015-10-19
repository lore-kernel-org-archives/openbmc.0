Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF6A91A0725
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:56:51 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259408076119.01881969782085;
 Mon, 19 Oct 2015 05:56:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/9] Rename host-ipmid/files to host-ipmid/host-ipmid
Date: Mon, 19 Oct 2015 07:56:37 -0500
Message-Id: <1445259405-10312-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:56:52 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

In preparation for additional recipes in this directory.
---
 .../common/recipes-phosphor/host-ipmid/files/host-ipmid.service   | 8 --------
 .../recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service     | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
deleted file mode 100644
index 0636f12..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description="Phosphor OpenBMC IPMI daemon"
-
-[Service]
-ExecStart=/usr/sbin/ipmid
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
new file mode 100644
index 0000000..0636f12
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
@@ -0,0 +1,8 @@
+[Unit]
+Description="Phosphor OpenBMC IPMI daemon"
+
+[Service]
+ExecStart=/usr/sbin/ipmid
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.0
