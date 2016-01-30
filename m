Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2FEC91A0061
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2016 04:20:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454174420277545.6196553686983;
 Sat, 30 Jan 2016 09:20:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add workaround to avoid disabling serial console
Date: Sat, 30 Jan 2016 11:20:18 -0600
Message-Id: <1454174418-16232-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454174418-16232-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454174418-16232-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Jan 2016 17:20:24 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

This is a workaround for issue:
https://github.com/openbmc/openbmc/issues/152
Once the issue is resolved, this workaround can be removed.
---
 meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
index 680595c..8b3b25d 100644
--- a/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-phosphor/common/recipes-core/systemd/systemd_%.bbappend
@@ -6,4 +6,8 @@ FILES_${PN} += "${libdir}/systemd/network/default.network"
 
 do_install_append() {
         install -m 644 ${WORKDIR}/default.network ${D}${libdir}/systemd/network/
+
+        #TODO Remove after this issue is resolved
+        #https://github.com/openbmc/openbmc/issues/152
+        ln -s /dev/null ${D}/etc/systemd/system/systemd-hwdb-update.service
 }
-- 
2.6.4
