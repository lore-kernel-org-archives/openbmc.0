Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 75ECC1A0C85
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2016 11:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453594221560400.16122174123063;
 Sat, 23 Jan 2016 16:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Resolve relocation warnings with build
Date: Sat, 23 Jan 2016 18:10:20 -0600
Message-Id: <1453594220-11674-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453594220-11674-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453594220-11674-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 24 Jan 2016 00:10:27 -0000

From: Chris Austen <austenc@us.ibm.com>

Yocto's QA service identified issues with the build
The -fpic option was not included in .so files.
Resovles issue https://github.com/openbmc/openbmc/issues/105
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 72d847d..5eed1f4 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -14,7 +14,7 @@ DEPENDS += "systemd    \
 
 RDEPENDS_${PN} += "libsystemd"
 
-TARGET_CFLAGS += "-std=gnu++14"
+TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index fa3e1bf..f7c0394 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -10,6 +10,7 @@ inherit obmc-phosphor-license
 DEPENDS += "systemd    \
 		 	host-ipmid \
 		 	"
+TARGET_CFLAGS += "-fpic"
 
 
 RDEPENDS_${PN} += "libsystemd"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 2a8aa07..24c4045 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -12,6 +12,9 @@ inherit obmc-phosphor-license
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
 
+TARGET_CFLAGS   += "-fpic"
+
+
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
 SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
-- 
2.6.4
