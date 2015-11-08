Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 736741A0A49
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 12:36:05 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446945634520745.9914838778129;
 Sat, 7 Nov 2015 17:20:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 3/7] LED test3
Date: Sat,  7 Nov 2015 20:20:27 -0500
Message-Id: <1446945631-28089-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446945631-28089-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446945631-28089-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 01:36:06 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 objects/led_controller.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/objects/led_controller.c b/objects/led_controller.c
index 6f773c9..24cfc19 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -68,30 +68,23 @@ on_set_off       (Led          *led,
 	return TRUE;
 }
 
-//int tmp=0;
+
 void init_led(Led* led, GPIO* mygpio)
 {
-	int rc = GPIO_OK;
-	int i=5;
-//	tmp++;
+	int rc = GPIO_OK;;
 	do {
-		sleep(2);
 		uint8_t val;
 		rc = gpio_open(mygpio);
 		if (rc != GPIO_OK) { break; }
 		rc = gpio_read(mygpio,&val);
 		if (rc != GPIO_OK) { break; }
-		led_set_state(led,"off");
 		if (val == 0) {
 			led_set_state(led,"on");
 		} else {
 			led_set_state(led,"off");
 		}
-	i--;
-	} while(i!=0);
+	} while(0);
 	
-//if(tmp==3)
-//	led_set_state(led,"off");
 
 	gpio_close(mygpio);
 	if (rc != GPIO_OK) {
-- 
2.6.3
