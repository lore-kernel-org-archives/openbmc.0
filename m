Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnt2N4VR5zDqxj
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468212632719740.2713312872447;
 Sun, 10 Jul 2016 21:50:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] classes-systemd: Use PN rather than BPN
Date: Sun, 10 Jul 2016 23:50:30 -0500
Message-Id: <20160711045030.6230-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711045030.6230-1-openbmc-patches@stwcx.xyz>
References: <20160711045030.6230-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:50:37 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This is what all the classes that come with Yocto do.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/obmc-phosphor-systemd.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
index c94a74b..5d1204b 100644
--- a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
@@ -12,26 +12,26 @@ inherit systemd
 
 
 python() {
-    bpn = d.getVar('BPN', True)
+    pn = d.getVar('PN', True)
     searchpaths = d.getVar('FILESPATH', True)
 
-    services = d.getVar('SYSTEMD_SERVICE_' + bpn, True)
+    services = d.getVar('SYSTEMD_SERVICE_' + pn, True)
 
     if services:
         services = services.split()
     else:
-        services = [bpn + '.service']
+        services = [pn + '.service']
 
     for s in services:
         file = s
         path = bb.utils.which(searchpaths, file)
         if os.path.isfile(path):
             d.appendVar('SRC_URI', ' file://' + file)
-            d.appendVar("FILES_%s" %(bpn), " %s/%s" \
+            d.appendVar("FILES_%s" %(pn), " %s/%s" \
                 % (d.getVar('systemd_system_unitdir', True), file))
             d.appendVar('OBMC_SYSTEMD_SERVICES', ' ' + file)
-            if file not in (d.getVar('SYSTEMD_SERVICE_' + bpn, True) or "").split():
-                d.appendVar('SYSTEMD_SERVICE_' + bpn, ' ' + file)
+            if file not in (d.getVar('SYSTEMD_SERVICE_' + pn, True) or "").split():
+                d.appendVar('SYSTEMD_SERVICE_' + pn, ' ' + file)
         else:
             bb.error("Could not find service file: %s" % file)
 }
-- 
2.9.0
