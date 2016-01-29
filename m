Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 25E071A0129
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 10:50:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454111432303114.3879339010964;
 Fri, 29 Jan 2016 15:50:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Change default for boot parms to be human
 readable
Date: Fri, 29 Jan 2016 17:50:30 -0600
Message-Id: <1454111430-20883-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454111430-20883-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454111430-20883-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Jan 2016 23:50:37 -0000

From: Chris Austen <austenc@us.ibm.com>

The REST interface is not a reflection of IPMI.  It is its own
design.  The 0's as the default was because that is what the
you could think of as the IPMI bytes indicating default. The
OpenBMC REST interface should not have a direct relationship
with IPMI.  That is a general tenent
---
 settings.yaml    | 2 +-
 settings_file.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/settings.yaml b/settings.yaml
index a8cecb6..01e7828 100644
--- a/settings.yaml
+++ b/settings.yaml
@@ -11,7 +11,7 @@ host:
     bootflags:
         name: boot_flags
         type: s
-        default: "0000000000"
+        default: "default"
     sysstate:
         name: system_state
         type: s
diff --git a/settings_file.py b/settings_file.py
index e05bc31..0c4e6cb 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -1,2 +1,2 @@
 #!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
+SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
-- 
2.6.4
