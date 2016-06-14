Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTYJ23l1ZzDqf3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 01:20:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465917638794521.6698828107113;
 Tue, 14 Jun 2016 08:20:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/2] Whitespace fixes for host-ipmid-fru recipe
Date: Tue, 14 Jun 2016 10:20:33 -0500
Message-Id: <20160614152034.7936-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614152034.7936-1-openbmc-patches@stwcx.xyz>
References: <20160614152034.7936-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2016 15:20:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

No functional changes.
Replace tab with spaces.
Removed dead code.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb   | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 47a8a34..00a652f 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -7,10 +7,10 @@ RRECOMMENDS_${PN} = "virtual/obmc-phosphor-host-ipmi-hw"
 
 inherit obmc-phosphor-license
 
-DEPENDS += "systemd    \
-		 	host-ipmid \
-		 	"
-
+DEPENDS += " \
+        systemd \
+        host-ipmid \
+        "
 
 RDEPENDS_${PN} += "libsystemd"
 
@@ -26,9 +26,5 @@ FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
 S = "${WORKDIR}/git"
 
 do_install() {
-	oe_runmake install DESTDIR=${D} LIBDIR=${libdir} BINDIR=${sbindir}
+        oe_runmake install DESTDIR=${D} LIBDIR=${libdir} BINDIR=${sbindir}
 }
-
-
-#        install -m 0755 -d ${D}${libdir}/host-ipmid
-#        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
-- 
2.8.4
