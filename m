Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVBpv3VfdzDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 12:31:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458696660691542.4814866616995;
 Tue, 22 Mar 2016 18:31:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton 2/8] Heartbeat Led function
Date: Tue, 22 Mar 2016 20:30:50 -0500
Message-Id: <1458696656-28363-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458696656-28363-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458696656-28363-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 23 Mar 2016 01:31:04 -0000

From: Ken <ken1029@gmail.com>

---
 bin/Barreleye.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 08a91a9..ff6690b 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -68,9 +68,9 @@ ENTER_STATE_CALLBACK = {
 
 	},
 	'BMC_READY' : {
-		'setOn' : {
+		'setBlinkSlow' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/beep',
+			'obj_name'   : '/org/openbmc/control/led/heartbeat',
 			'interface_name' : 'org.openbmc.Led',
 		},
 		'init' : {
-- 
2.7.1
