Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rns8D70V4zDqwn
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:10:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468210231868868.953406469637;
 Sun, 10 Jul 2016 21:10:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] classes-utils: Whitespace fixes
Date: Sun, 10 Jul 2016 23:10:30 -0500
Message-Id: <20160711041030.4529-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711041030.4529-1-openbmc-patches@stwcx.xyz>
References: <20160711041030.4529-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:10:37 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Four spaces for python code.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/obmc-phosphor-utils.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-utils.bbclass b/meta-phosphor/classes/obmc-phosphor-utils.bbclass
index 4f55629..f558e80 100644
--- a/meta-phosphor/classes/obmc-phosphor-utils.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-utils.bbclass
@@ -3,12 +3,12 @@
 inherit utils
 
 def df_enabled(feature, value, d):
-        return base_contains("DISTRO_FEATURES", feature, value, "", d)
+    return base_contains("DISTRO_FEATURES", feature, value, "", d)
 
 def mf_enabled(feature, value, d):
-        return base_contains("MACHINE_FEATURES", feature, value, "", d)
+    return base_contains("MACHINE_FEATURES", feature, value, "", d)
 
 def cf_enabled(feature, value, d):
-        return value if df_enabled(feature, value, d) \
-                and mf_enabled(feature, value, d) \
-                        else ""
+    return value if df_enabled(feature, value, d) \
+        and mf_enabled(feature, value, d) \
+            else ""
-- 
2.9.0
