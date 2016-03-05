Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D4CE21A045D
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181049935867.6200210048734;
 Sat, 5 Mar 2016 04:30:49 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 32/32] host-ipmid: OEM command will require clear-once
 service
Date: Sat,  5 Mar 2016 06:30:23 -0600
Message-Id: <1457181023-23569-33-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:55 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Tell systemd the host-ipmid service wants the clear-once service
to be started, and that it wants to run after the clear-once
service.

The new OEM command will use the openbmc init run once variables
set in the u-boot environment.  We want the u-boot variable
cleared before the host can request it be set again.

Tell bitbake to require the clean-once package.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 1 +
 .../common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 68bd38b..9e25cd2 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,6 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 TARGET_CFLAGS   += "-fpic"
 
+RDEPENDS_${PN} += "clear-once"
 RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
index ee9ce1a..ce96dbc 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
@@ -1,5 +1,7 @@
 [Unit]
 Description=Phosphor OpenBMC IPMI daemon
+Wants=clear-once.service
+After=clear-once.service
 
 [Service]
 ExecStart=/usr/sbin/ipmid
-- 
2.7.1
