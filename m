Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjshS6rdvzDqW4
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 11:20:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460337652868591.3667881851597;
 Sun, 10 Apr 2016 18:20:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: [PATCH skeleton v5 02/19] Heartbeat Led function
Date: Sun, 10 Apr 2016 20:20:31 -0500
Message-Id: <1460337648-30919-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460337648-30919-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460337648-30919-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 01:20:57 -0000

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
