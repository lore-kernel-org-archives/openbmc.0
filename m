Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 321AB1A01DC
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 23:10:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454415040124839.9463148432021;
 Tue, 2 Feb 2016 04:10:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Fix syntax errors
Date: Tue,  2 Feb 2016 06:10:38 -0600
Message-Id: <1454415038-22154-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454415038-22154-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454415038-22154-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 12:10:53 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 bin/Palmetto.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 9f89e3f..7a6c704 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -148,12 +148,13 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'fan.exe',
 		'args'            : [ 'fan0','fan1','fan2','fan3','fan4' ]
-	}
+	},
 	'bmc_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
 		'monitor_process' : True,
 		'process_name'    : 'control_bmc.exe',
+	}
 }
 
 CACHED_INTERFACES = {
-- 
2.6.4
