Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AD96E1A0CB7
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 07:50:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446238194754555.7814677391191;
 Fri, 30 Oct 2015 13:49:54 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Moving openbmc's ipmid and oem to support Nov1
 release Fixes contained up till now include... host:
 5fc6492ff8882390e55592d776969a094567b0d5 oem:
 17160cebf1735337a35a12ba27728d90c5207ec5
Date: Fri, 30 Oct 2015 15:49:52 -0500
Message-Id: <1446238192-31340-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446238192-31340-1-git-send-email-patches@stwcx.xyz>
References: <1446238192-31340-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 20:50:01 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index 623d7d2..0c3db17 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "libsystemd"
 
 SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
 
-SRCREV = "f79a21f3c1e5209f3c911399c3b822ae93bb973d"
+SRCREV = "17160cebf1735337a35a12ba27728d90c5207ec5"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 74dad62..29ef3eb 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "84a5a0a8fdb2a5df9e33ab9132f2c083eaa4b756"
+SRCREV = "5fc6492ff8882390e55592d776969a094567b0d5"
 
 
 S = "${WORKDIR}/git"
-- 
2.6.0
