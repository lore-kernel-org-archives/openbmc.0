Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnt2N4Wy3zDqxn
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468212631891157.50279435790935;
 Sun, 10 Jul 2016 21:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/2] classes-systemd: Fix FILES_${PN} path bug
Date: Sun, 10 Jul 2016 23:50:29 -0500
Message-Id: <20160711045030.6230-2-openbmc-patches@stwcx.xyz>
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

Missing space and path sep in the generated path.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/obmc-phosphor-systemd.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
index b07174f..c94a74b 100644
--- a/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-systemd.bbclass
@@ -27,9 +27,8 @@ python() {
         path = bb.utils.which(searchpaths, file)
         if os.path.isfile(path):
             d.appendVar('SRC_URI', ' file://' + file)
-            d.appendVar(
-                'FILES_' + bpn, ' ' +
-                d.getVar('systemd_system_unitdir', True) + file)
+            d.appendVar("FILES_%s" %(bpn), " %s/%s" \
+                % (d.getVar('systemd_system_unitdir', True), file))
             d.appendVar('OBMC_SYSTEMD_SERVICES', ' ' + file)
             if file not in (d.getVar('SYSTEMD_SERVICE_' + bpn, True) or "").split():
                 d.appendVar('SYSTEMD_SERVICE_' + bpn, ' ' + file)
-- 
2.9.0
