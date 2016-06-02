Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLFdr4X5kzDqgm
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2016 04:10:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464891052836457.5188917456006;
 Thu, 2 Jun 2016 11:10:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-settingsd v2] Adding the boot_policy attribute
Date: Thu,  2 Jun 2016 13:10:48 -0500
Message-Id: <20160602181048.19877-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160602181048.19877-1-openbmc-patches@stwcx.xyz>
References: <20160602181048.19877-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 02 Jun 2016 18:10:57 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 settings.yaml    | 7 ++++++-
 settings_file.py | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/settings.yaml b/settings.yaml
index c950e4c..ccf1db0 100644
--- a/settings.yaml
+++ b/settings.yaml
@@ -23,4 +23,9 @@ host:
     restrictedmode:
         name: restricted_mode
         type: b
-        default: false 
+        default: false
+    bootpolicy:
+        name: boot_policy
+        type: s
+        default: "ONETIME"
+
diff --git a/settings_file.py b/settings_file.py
index fe852ba..6b46a65 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -3,6 +3,9 @@ SETTINGS=\
 {'host': {'bootflags': {'default': 'default',
                         'name': 'boot_flags',
                         'type': 's'},
+          'bootpolicy': {'default': 'ONETIME',
+                         'name': 'boot_policy',
+                         'type': 's'},
           'powercap': {'default': 0,
                        'max': 1000,
                        'min': 0,
-- 
2.8.3
