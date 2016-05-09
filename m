Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HF26yP2zDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:31:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462786258009732.617426407385;
 Mon, 9 May 2016 02:30:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v7 02/21] Heartbeat Led function
Date: Mon,  9 May 2016 04:30:35 -0500
Message-Id: <1462786254-18000-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:03 -0000

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
2.8.1
