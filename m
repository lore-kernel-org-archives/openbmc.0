Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A4FDC1A0331
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 12:00:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447981236823720.9769998899949;
 Thu, 19 Nov 2015 17:00:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v3 04/19] Remove ;
Date: Thu, 19 Nov 2015 20:00:18 -0500
Message-Id: <1447981233-5573-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447981233-5573-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447981233-5573-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 01:00:53 -0000

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
