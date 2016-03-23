Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVJb00CDJzDqRS
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 16:51:07 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458712263241140.4807566536732;
 Tue, 22 Mar 2016 22:51:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v4 02/13] Heartbeat Led function
Date: Wed, 23 Mar 2016 00:50:48 -0500
Message-Id: <1458712259-5454-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458712259-5454-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458712259-5454-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 23 Mar 2016 05:51:08 -0000

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
