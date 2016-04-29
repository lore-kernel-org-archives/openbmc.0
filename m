Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxLMW0lWMzDqBC
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:31:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461951058049594.73937941446;
 Fri, 29 Apr 2016 10:30:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add BMC Flash dbus object to Palmetto
Date: Fri, 29 Apr 2016 12:30:55 -0500
Message-Id: <1461951055-23123-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461951055-23123-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461951055-23123-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 17:31:03 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add the BMC Flash dbus object to Palmetto.py to expose interfaces
to flash the BMC. Without it, there are no interfaces to flash BMC
from REST. This change is already in Barreleye, just porting to Palmetto.
---
 bin/Palmetto.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 7172364..512a2ca 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -123,6 +123,12 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'flash_bios.exe',
 	},
+	'bmc_flash_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'bmc_update.py',
+	},
 	'download_manager' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
-- 
2.8.1
