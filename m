Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6B2031A03ED
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 08:54:10 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444946046997345.7842521291766;
 Thu, 15 Oct 2015 14:54:06 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/4] -systemd.bbclass incorrect for nativesdk packages
Date: Thu, 15 Oct 2015 16:53:59 -0500
Message-Id: <1444946041-22756-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 21:54:10 -0000

From: Patrick Williams <patrick@stwcx.xyz>

We should use the 'bare' package name BPN instead of PN for finding the
service file.  Otherwise, a -nativesdk package cannot be created because
we get a file-not-found error on the service file.
---
 meta-phosphor/classes/obmc-phosphor-systemd.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
index 7bd2d9d..12e0bc1 100644
--- a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
@@ -2,13 +2,13 @@
 
 inherit systemd
 
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 SRC_URI += " \
-        file://${PN}.service \
+        file://${BPN}.service \
         "
 
 do_install_append() {
         # install systemd unit files
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system
 }
-- 
2.6.0
