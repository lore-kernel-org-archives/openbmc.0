Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8EB2E1A0A75
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:41:27 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445539284758119.79136462496683;
 Thu, 22 Oct 2015 11:41:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4 3/4] Sensor5 hanging system IPL
Date: Thu, 22 Oct 2015 13:41:17 -0500
Message-Id: <1445539278-23641-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445539278-23641-1-git-send-email-patches@stwcx.xyz>
References: <1445539278-23641-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:41:28 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index 568f4a4..1a40411 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -85,14 +85,14 @@ char *getfw02string(uint8_t b) {
 	int i = 0;
 	event_data_t *p = g_fwprogress02h;
 
-	do {
-
-		if ((p+i)->data == b)
+	while(p->data != 0xFF) {
+		if (p->data == b) {
 			break;
-		i++;
-	} while ((p+i)->data != 0xFF);
+		} 
+		p++;
+	}
 
-	return (p+i)->text;
+	return p->text;
 }
 //  The fw progress sensor contains some additional information that needs to be processed
 //  prior to calling the dbus code.  
-- 
2.6.0
