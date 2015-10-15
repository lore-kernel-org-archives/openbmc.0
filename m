Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 80AC81A07F1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 08:54:12 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444946048651226.82449871276276;
 Thu, 15 Oct 2015 14:54:08 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/4] phosphor-host-ipmid: refresh SRCREV
Date: Thu, 15 Oct 2015 16:54:00 -0500
Message-Id: <1444946041-22756-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
References: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 21:54:13 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Also required updating dependencies and installed files.
---
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 9741e61..5e7ad64 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -4,17 +4,21 @@ HOMEPAGE = "http://github.com/openbmc/phosphor-host-ipmid"
 PR = "r1"
 
 inherit obmc-phosphor-license
-inherit obmc-phosphor-systemd
+inherit obmc-phosphor-sdbus-service
 
-DEPENDS += "glib-2.0"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "02d37aab090090af9a779f4039931a6721bff615"
+SRCREV = "98900a99254cd177c8308b63c341f793d2ac119d"
 
 S = "${WORKDIR}/git"
 
 do_install() {
-        install -m 0755 -d ${D}${sbindir} ${D}${libdir} ${D}${libdir}/host-ipmid/
+        install -m 0755 -d ${D}${sbindir}
         install -m 0755 ${S}/ipmid ${D}${sbindir}/
-        install -m 0755 ${S}/libapphandler.so ${D}${libdir}/host-ipmid/
+
+        install -m 0755 -d ${D}${libdir}/host-ipmid
+        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
+
+        install -m 0755 -d ${D}${includedir}/host-ipmid
+        install -m 0644 ${S}/ipmid-api.h ${D}${includedir}/host-ipmid/
 }
-- 
2.6.0
