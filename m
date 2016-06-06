Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNjS61hqFzDqBP
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 04:11:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465236652571929.9538471873252;
 Mon, 6 Jun 2016 11:10:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-settingsd v2] Implement IPMI Network Settings Override
Date: Mon,  6 Jun 2016 13:10:47 -0500
Message-Id: <20160606181047.15838-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606181047.15838-1-openbmc-patches@stwcx.xyz>
References: <20160606181047.15838-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 18:11:03 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 settings.yaml    | 7 +++++--
 settings_file.py | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/settings.yaml b/settings.yaml
index ccf1db0..c52ffce 100644
--- a/settings.yaml
+++ b/settings.yaml
@@ -23,9 +23,12 @@ host:
     restrictedmode:
         name: restricted_mode
         type: b
-        default: false
+        default: false 
     bootpolicy:
         name: boot_policy
         type: s
         default: "ONETIME"
-
+    networkconfig:
+        name: network_config
+        type: s
+        default: "ipaddress=0.0.0.0,prefix=0,gateway=0.0.0.0,mac=00:00:00:00:00:00,dhcp=0" 
diff --git a/settings_file.py b/settings_file.py
index 6b46a65..eaf4d60 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -6,6 +6,9 @@ SETTINGS=\
           'bootpolicy': {'default': 'ONETIME',
                          'name': 'boot_policy',
                          'type': 's'},
+          'networkconfig': {'default': 'ipaddress=0.0.0.0,prefix=0,gateway=0.0.0.0,mac=00:00:00:00:00:00,dhcp=0',
+                            'name': 'network_config',
+                            'type': 's'},
           'powercap': {'default': 0,
                        'max': 1000,
                        'min': 0,
-- 
2.8.3
