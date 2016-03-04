Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D9D881A032F
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 20:10:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457082625742698.7906741996576;
 Fri, 4 Mar 2016 01:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] inarp: Add inverse ARP daemon
Date: Fri,  4 Mar 2016 03:10:24 -0600
Message-Id: <1457082624-30487-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457082624-30487-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457082624-30487-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 04 Mar 2016 09:10:37 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds 'inarp': A small daemon to listen for, and reply to
inverse ARP requests.

This should be started at system init time, so we add a .service file.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb    | 17 +++++++++++++++++
 .../common/recipes-phosphor/inarp/inarp/inarp.service   |  8 ++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/inarp/inarp/inarp.service

diff --git a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
new file mode 100644
index 0000000..a36bba1
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Inverse ARP daemon"
+DESCRIPTION = "Daemon to respond to Inverse-ARP requests"
+HOMEPAGE = "http://github.com/openbmc/inarp"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-c-daemon
+
+TARGET_CFLAGS   += "-fpic -O2"
+
+RDEPENDS_${PN} += "network"
+SRC_URI += "git://github.com/openbmc/inarp"
+
+SRCREV = "19ed5170356495f5fc67189513c5739780ee6a81"
+
+S = "${WORKDIR}/git"
+INSTALL_NAME = "inarp"
diff --git a/meta-phosphor/common/recipes-phosphor/inarp/inarp/inarp.service b/meta-phosphor/common/recipes-phosphor/inarp/inarp/inarp.service
new file mode 100644
index 0000000..55517ab
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/inarp/inarp/inarp.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor Inverse ARP daemon
+
+[Service]
+ExecStart=/usr/sbin/inarp
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.1
