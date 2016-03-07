Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F3E721A0225
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:41:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386252019622.3195810092502;
 Mon, 7 Mar 2016 13:30:52 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 33/34] Add clear-once service
Date: Mon,  7 Mar 2016 15:30:22 -0600
Message-Id: <1457386223-5725-34-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:41:16 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Create a service unit to clear the openbmconce variable in the
the u-boot environment with fw_setenv.

Set the timeout to allow the flash to be written, even though we
currently just update the ram shadow file.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/clear-once/clear-once.bb      |  8 ++++++++
 .../clear-once/clear-once/clear-once.service              | 15 +++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/clear-once/clear-once.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/clear-once/clear-once/clear-once.service

diff --git a/meta-phosphor/common/recipes-phosphor/clear-once/clear-once.bb b/meta-phosphor/common/recipes-phosphor/clear-once/clear-once.bb
new file mode 100644
index 0000000..61e3c20
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/clear-once/clear-once.bb
@@ -0,0 +1,8 @@
+
+SUMMARY = "Clear boot-once variables"
+DESCRIPTION = "Clear u-boot variables used for one-time boot flow"
+
+RPROVIDES_${PN} += "clear-once"
+
+inherit obmc-phosphor-systemd
+inherit obmc-phosphor-license
diff --git a/meta-phosphor/common/recipes-phosphor/clear-once/clear-once/clear-once.service b/meta-phosphor/common/recipes-phosphor/clear-once/clear-once/clear-once.service
new file mode 100644
index 0000000..a7641e6
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/clear-once/clear-once/clear-once.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Clear one time boot overrides
+
+ConditionFileNotEmpty=/etc/fw_env.config
+RequiresMountsFor=/run /sbin /etc
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+
+# It took 7 seconds to erase and write flash, be conservative
+TimeoutStartSec=60
+Restart=no
+
+ExecStart=/sbin/fw_setenv openbmconce
-- 
2.7.1
