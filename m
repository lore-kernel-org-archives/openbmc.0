Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8495D1A0913
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 19:30:55 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449045036969192.00291651745135;
 Wed, 2 Dec 2015 00:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v7 04/19] Remove ;
Date: Wed,  2 Dec 2015 03:30:18 -0500
Message-Id: <1449045033-30280-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 08:30:56 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 objects/led_controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/objects/led_controller.c b/objects/led_controller.c
index 24cfc19..34945e1 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -71,7 +71,8 @@ on_set_off       (Led          *led,
 
 void init_led(Led* led, GPIO* mygpio)
 {
-	int rc = GPIO_OK;;
+	int rc = GPIO_OK;
+
 	do {
 		uint8_t val;
 		rc = gpio_open(mygpio);
-- 
2.6.3
