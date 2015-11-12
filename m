Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F14691A01AA
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 16:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447305020394458.72075991313716;
 Wed, 11 Nov 2015 21:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] support multiple event logs
Date: Thu, 12 Nov 2015 00:10:18 -0500
Message-Id: <1447305018-23422-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447305018-23422-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447305018-23422-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 05:10:25 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index d4bd534..fa3e1bf 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "libsystemd"
 
 SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
 
-SRCREV = "29a8e0fd82d70af5626df5346f4c3d2568752af9"
+SRCREV = "b7df30ea8ad991c2d811e77ed4dee1beaa766883"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 2a2959a..4926393 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "8f71a6190d17d59f8de49182b0a8f3f063be3146"
+SRCREV = "1da5c8668368417802f2c0007f61dbe35c3c3052"
 
 
 S = "${WORKDIR}/git"
-- 
2.6.3
