Return-Path: <clg@kaod.org>
X-Greylist: delayed 2305 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Jun 2017 23:51:20 AEST
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net [178.33.42.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkkGc6VQ7zDqCt
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:51:20 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id C0E54E2EE4
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:48 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id A404E60009C;
 Fri,  9 Jun 2017 15:12:45 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/5] leds: pca955x: use devm_led_classdev_register
Date: Fri,  9 Jun 2017 15:12:26 +0200
Message-Id: <1497013949-8786-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497013949-8786-1-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11443646656690359042
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jun 2017 13:51:21 -0000

This lets us remove the loop doing the cleanup in case of failure and
also the remove handler of the i2c_driver.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a3e61a57d574..13634a0f6238 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -411,10 +411,10 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led->led_cdev.name = pca955x_led->name;
 		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
 
-		err = led_classdev_register(&client->dev,
+		err = devm_led_classdev_register(&client->dev,
 					&pca955x_led->led_cdev);
-		if (err < 0)
-			goto exit;
+		if (err)
+			return err;
 	}
 
 	/* Turn off LEDs */
@@ -432,23 +432,6 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x_write_psc(client, 1, 0);
 
 	return 0;
-
-exit:
-	while (i--)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return err;
-}
-
-static int pca955x_remove(struct i2c_client *client)
-{
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	int i;
-
-	for (i = 0; i < pca955x->chipdef->bits; i++)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct i2c_driver pca955x_driver = {
@@ -458,7 +441,6 @@ static struct i2c_driver pca955x_driver = {
 		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
-	.remove	= pca955x_remove,
 	.id_table = pca955x_id,
 };
 
-- 
2.7.4
