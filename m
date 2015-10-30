Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3E5AA1A0CCE
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 08:21:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446240056720874.2316578518669;
 Fri, 30 Oct 2015 14:20:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Move obmc build to use useful event
Date: Fri, 30 Oct 2015 16:20:53 -0500
Message-Id: <1446240053-5357-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446240053-5357-1-git-send-email-patches@stwcx.xyz>
References: <1446240053-5357-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 21:21:01 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 2036ad8..c27937a 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Phosphor OpenBMC Event Management"
 DESCRIPTION = "Phosphor OpenBMC event management reference implementation."
-HOMEPAGE = "https://github.com/causten/openbmc-eventd"
+HOMEPAGE = "https://github.com/openbmc/phosphor-event"
 PR = "r1"
 
 
@@ -9,9 +9,10 @@ inherit obmc-phosphor-event-mgmt
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
 
-SRC_URI += "git://github.com/causten/openbmc-eventd"
 
-SRCREV = "417f69b7839034543405f1bb70a73cc701a1b3a5"
+SRC_URI += "git://github.com/openbmc/phosphor-event"
+
+SRCREV = "0a4a39e46622a9d6d4719b14f8955866fdb51a20"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
-- 
2.6.0
