Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B1E01A04B2
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 04:01:09 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447779625493644.3532020080394;
 Tue, 17 Nov 2015 09:00:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Too many dbus connections
Date: Tue, 17 Nov 2015 12:00:23 -0500
Message-Id: <1447779623-3494-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447779623-3494-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447779623-3494-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 Nov 2015 17:01:09 -0000

From: Chris Austen <austenc@us.ibm.com>

This code reduces all ipmi connections to just 1
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index a4dcfab..26eea2a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,7 +18,7 @@ TARGET_CFLAGS += "-std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "675272789d4dba9a8c308f3cb1f7deb8b5b2ec41"
+SRCREV = "1c779b8570849a52dac828538c36a59798f4583a"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 4926393..7393889 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "1da5c8668368417802f2c0007f61dbe35c3c3052"
+SRCREV = "f0d4635fa2b417bd0eef3f19ae98e56ec615e703"
 
 
 S = "${WORKDIR}/git"
-- 
2.6.3
