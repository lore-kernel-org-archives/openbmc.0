Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qdqn448ZMzDq6S
 for <openbmc@lists.ozlabs.org>; Mon,  4 Apr 2016 21:40:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459770045986509.00132533429485;
 Mon, 4 Apr 2016 04:40:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-settingsd] Adding the boot_policy attribute
Date: Mon,  4 Apr 2016 06:40:42 -0500
Message-Id: <1459770042-23039-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459770042-23039-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459770042-23039-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 04 Apr 2016 11:40:57 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 settings_file.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/settings_file.py b/settings_file.py
index 698d941..a416b51 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -1,2 +1,2 @@
 #!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type': 's', 'name': 'power_policy'}, 'restrictedmode': {'default': False, 'type': 'b', 'name': 'restricted_mode'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
+SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'},'bootpolicy':{'default': 'ONETIME', 'type': 's', 'name': 'boot_policy'},'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type': 's', 'name': 'power_policy'}, 'restrictedmode': {'default': False, 'type': 'b', 'name': 'restricted_mode'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
-- 
2.7.1
