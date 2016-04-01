Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qcFgx4G9BzDq6y
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 09:01:01 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459548058411288.00457888601;
 Fri, 1 Apr 2016 15:00:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd 2/2] settings_file.py: update with pprint'd
 output.
Date: Fri,  1 Apr 2016 17:00:54 -0500
Message-Id: <1459548054-10473-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 01 Apr 2016 22:01:02 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 settings_file.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/settings_file.py b/settings_file.py
index 698d941..fe852ba 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -1,2 +1,18 @@
 #!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type': 's', 'name': 'power_policy'}, 'restrictedmode': {'default': False, 'type': 'b', 'name': 'restricted_mode'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
+SETTINGS=\
+{'host': {'bootflags': {'default': 'default',
+                        'name': 'boot_flags',
+                        'type': 's'},
+          'powercap': {'default': 0,
+                       'max': 1000,
+                       'min': 0,
+                       'name': 'power_cap',
+                       'type': 'i',
+                       'unit': 'watts'},
+          'powerpolicy': {'default': 'RESTORE_LAST_STATE',
+                          'name': 'power_policy',
+                          'type': 's'},
+          'restrictedmode': {'default': False,
+                             'name': 'restricted_mode',
+                             'type': 'b'},
+          'sysstate': {'default': '', 'name': 'system_state', 'type': 's'}}}
-- 
2.7.1
