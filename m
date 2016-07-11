Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rp9Lm5CPqzDqxn
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 02:20:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468254044195586.059251006437;
 Mon, 11 Jul 2016 09:20:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2] classes-utils: Whitespace fixes
Date: Mon, 11 Jul 2016 11:20:40 -0500
Message-Id: <20160711162040.25516-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711162040.25516-1-openbmc-patches@stwcx.xyz>
References: <20160711162040.25516-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 16:20:49 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Four spaces for python code.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/obmc-phosphor-utils.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-utils.bbclass b/meta-phosphor/classes/obmc-phosphor-utils.bbclass
index 4f55629..44ca7ad 100644
--- a/meta-phosphor/classes/obmc-phosphor-utils.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-utils.bbclass
@@ -2,13 +2,16 @@
 
 inherit utils
 
+
 def df_enabled(feature, value, d):
-        return base_contains("DISTRO_FEATURES", feature, value, "", d)
+    return base_contains("DISTRO_FEATURES", feature, value, "", d)
+
 
 def mf_enabled(feature, value, d):
-        return base_contains("MACHINE_FEATURES", feature, value, "", d)
+    return base_contains("MACHINE_FEATURES", feature, value, "", d)
+
 
 def cf_enabled(feature, value, d):
-        return value if df_enabled(feature, value, d) \
-                and mf_enabled(feature, value, d) \
-                        else ""
+    return value if df_enabled(feature, value, d) \
+        and mf_enabled(feature, value, d) \
+            else ""
-- 
2.9.0
