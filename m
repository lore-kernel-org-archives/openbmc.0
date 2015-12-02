Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C4A221A0C11
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 04:20:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449076827999610.469981887679;
 Wed, 2 Dec 2015 09:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Set dropbearkey service to start on boot
Date: Wed,  2 Dec 2015 12:20:26 -0500
Message-Id: <1449076826-7916-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449076826-7916-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449076826-7916-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 17:20:36 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Before this patch it isn't started until the first
client connection which is not the desired behavior.
---
 .../common/recipes-core/dropbear/dropbear/dropbearkey.service | 11 +++++++++++
 .../common/recipes-core/dropbear/dropbear_%.bbappend          |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear/dropbearkey.service
 create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear_%.bbappend

diff --git a/meta-phosphor/common/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-phosphor/common/recipes-core/dropbear/dropbear/dropbearkey.service
new file mode 100644
index 0000000..623f73e
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/dropbear/dropbear/dropbearkey.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=SSH Key Generation
+ConditionPathExists=|!/etc/dropbear/dropbear_rsa_host_key
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-core/dropbear/dropbear_%.bbappend b/meta-phosphor/common/recipes-core/dropbear/dropbear_%.bbappend
new file mode 100644
index 0000000..36c0dcd
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/dropbear/dropbear_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://dropbearkey.service"
-- 
2.6.3
