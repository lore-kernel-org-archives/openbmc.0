Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF1341A0B57
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 07:40:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456864846889238.7373742640841;
 Tue, 1 Mar 2016 12:40:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Replace HOST_POWERED_DOWN with HOST_POWERED_OFF
 state in Palmetto
Date: Tue,  1 Mar 2016 14:40:43 -0600
Message-Id: <1456864843-29388-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456864843-29388-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456864843-29388-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 20:40:52 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The HOST_POWERED_DOWN has been deprecated and replaced with HOST_POWERED_OFF.
Update the Palmetto config file with the updated state define.
---
 bin/Palmetto.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index ee95999..7172364 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -19,7 +19,7 @@ SYSTEM_STATES = [
 	'HOST_POWERED_ON',
 	'HOST_BOOTING',
 	'HOST_BOOTED',
-	'HOST_POWERED_DOWN',
+	'HOST_POWERED_OFF',
 ]
 
 EXIT_STATE_DEPEND = {
-- 
2.7.1
