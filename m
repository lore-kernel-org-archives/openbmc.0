Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 389471A074A
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 13:30:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447900236006735.7974104824058;
 Wed, 18 Nov 2015 18:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 3/8] LED test3
Date: Wed, 18 Nov 2015 21:30:27 -0500
Message-Id: <1447900232-1928-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 02:30:52 -0000

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
