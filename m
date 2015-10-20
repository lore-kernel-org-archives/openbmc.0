Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D7ACF1A075C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:13 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368810350728.9637121150382;
 Tue, 20 Oct 2015 12:20:10 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 04/20] Start host-ipmid on boot
Date: Tue, 20 Oct 2015 14:19:42 -0500
Message-Id: <1445368798-31274-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:14 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Recipe was not picking up c-daemon which hooks into systemd.
Removed quotes from description.
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 5 ++---
 .../common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 5e7ad64..5f38eb3 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -5,17 +5,16 @@ PR = "r1"
 
 inherit obmc-phosphor-license
 inherit obmc-phosphor-sdbus-service
+inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
 SRCREV = "98900a99254cd177c8308b63c341f793d2ac119d"
 
 S = "${WORKDIR}/git"
+INSTALL_NAME = "ipmid"
 
 do_install() {
-        install -m 0755 -d ${D}${sbindir}
-        install -m 0755 ${S}/ipmid ${D}${sbindir}/
-
         install -m 0755 -d ${D}${libdir}/host-ipmid
         install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
 
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
index 0636f12..ee9ce1a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service
@@ -1,5 +1,5 @@
 [Unit]
-Description="Phosphor OpenBMC IPMI daemon"
+Description=Phosphor OpenBMC IPMI daemon
 
 [Service]
 ExecStart=/usr/sbin/ipmid
-- 
2.6.0
