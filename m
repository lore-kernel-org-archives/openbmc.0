Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgCgL3sfdzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 18:41:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467276056790228.22685616875083;
 Thu, 30 Jun 2016 01:40:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add the missing binary into Palmetto config file
Date: Thu, 30 Jun 2016 03:40:54 -0500
Message-Id: <20160630084054.17216-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630084054.17216-1-openbmc-patches@stwcx.xyz>
References: <20160630084054.17216-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 08:41:03 -0000

From: Vishwa <vishwanath@in.ibm.com>

Palmetto.py did not have discover_system_state.py and this patch is
to update that. discover_system_state.py is responsible for looking
at power restoration policy set by the user and then taking appropriate
actions when BMC comes back from any reboot / power cycle and reaches
BMC_READY state.  Actions could be :
1) Leave the system in power off state.
2) Power on the box.
3) Restore the last state which can be either #1 or #2 above.
---
 configs/Palmetto.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/Palmetto.py b/configs/Palmetto.py
index bbe4afc..1eed30d 100644
--- a/configs/Palmetto.py
+++ b/configs/Palmetto.py
@@ -154,6 +154,12 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'chassis_control.py',
 	},
+	'restore' : {
+		'system_state'    : 'BMC_READY',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'discover_system_state.py',
+	},
 	'bmc_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
-- 
2.9.0
