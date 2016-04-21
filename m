Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrLX0396TzDqdX
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 00:21:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461248455661105.97611826803882;
 Thu, 21 Apr 2016 07:20:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton v2 1/5] Remove fan control support from Palmetto
Date: Thu, 21 Apr 2016 09:20:49 -0500
Message-Id: <1461248453-8652-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 21 Apr 2016 14:21:05 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

It never had any hardware to support this in the first place.
---
 bin/Palmetto.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 7172364..09fbe06 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -142,13 +142,6 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'chassis_control.py',
 	},
-	'fans' : {
-		'system_state'    : 'BMC_STARTING',
-		'start_process'   : True,
-		'monitor_process' : True,
-		'process_name'    : 'fan.exe',
-		'args'            : [ 'fan0','fan1','fan2','fan3','fan4' ]
-	},
 	'bmc_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
-- 
2.8.1
