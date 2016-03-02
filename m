Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1E4761A0B4C
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 03:31:22 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14569362359491016.4535644509998;
 Wed, 2 Mar 2016 08:30:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Integrating support for event log enhancements
Date: Wed,  2 Mar 2016 10:30:32 -0600
Message-Id: <1456936232-8813-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456936232-8813-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456936232-8813-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Mar 2016 16:31:24 -0000

From: Chris Austen <austenc@us.ibm.com>

You will now get all the debug data in the event logs.  This was different
then in the past as there was a fixed few bytes of meaningless information.

The feature also reduces the memory footprint of the event manager AND
removes eselxxx logs in /tmp
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index f7c0394..0e647a8 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "libsystemd"
 
 SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
 
-SRCREV = "b7df30ea8ad991c2d811e77ed4dee1beaa766883"
+SRCREV = "caa755e97b49d332e6100c086f5921d92be31c25"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 68bd38b..74f16f4 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "5d8c424a5c125b3cc5dcf67238e174b9dcaf22e6"
+SRCREV = "4bc8baeadbcc3cda3c2106e163fe4249f4ce3ff2"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 4f59e99..5ce5818 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -13,7 +13,7 @@ TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "01ac3503dc97fb99bee9c25c23fe73a5f4ea0475"
+SRCREV = "127c8cf513ba9ed6bcc460fbea29b36eb8d23bac"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
-- 
2.7.1
