Return-Path: <clg@kaod.org>
Received: from 13.mo6.mail-out.ovh.net (13.mo6.mail-out.ovh.net
 [188.165.56.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgLmP4B7kzDqMh
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 03:02:12 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id A4A36103D1F
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 18:46:07 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 7D490600072;
 Sun, 27 Aug 2017 18:46:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 1/2] leds: pca955x: sync with mainline driver
Date: Sun, 27 Aug 2017 18:45:45 +0200
Message-Id: <20170827164546.22903-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170827164546.22903-1-clg@kaod.org>
References: <20170827164546.22903-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17820462253373557506
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledruddtgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Sun, 27 Aug 2017 17:02:13 -0000

The result should be in sync with kernel 4.14 once the gpio extension
is merged in the pca955x driver.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c | 49 ++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 0217bac2f47b..f062d1e7640f 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -342,7 +342,8 @@ pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->leds = devm_kzalloc(&client->dev,
-			   sizeof(struct pca955x_led) * chip->bits, GFP_KERNEL);
+				   sizeof(struct pca955x_led) * chip->bits,
+				   GFP_KERNEL);
 	if (!pdata->leds)
 		return ERR_PTR(-ENOMEM);
 
@@ -430,16 +431,14 @@ static int pca955x_probe(struct i2c_client *client,
 			"slave address 0x%02x\n",
 			client->name, chip->bits, client->addr);
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	if (pdata) {
-		if (pdata->num_leds != chip->bits) {
-			dev_err(&client->dev, "board info claims %d LEDs"
-					" on a %d-bit chip\n",
-					pdata->num_leds, chip->bits);
-			return -ENODEV;
-		}
+	if (pdata->num_leds != chip->bits) {
+		dev_err(&client->dev,
+			"board info claims %d LEDs on a %d-bit chip\n",
+			pdata->num_leds, chip->bits);
+		return -ENODEV;
 	}
 
 	pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
@@ -458,12 +457,10 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x->chipdef = chip;
 
 	for (i = 0; i < chip->bits; i++) {
-		struct pca955x_led *pdata_led = &pdata->leds[i];
-
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
-		pca955x_led->type = pdata_led->type;
+		pca955x_led->type = pdata->leds[i].type;
 
 		switch (pca955x_led->type) {
 		case PCA955X_TYPE_NONE:
@@ -476,27 +473,20 @@ static int pca955x_probe(struct i2c_client *client,
 			 * Platform data can specify LED names and
 			 * default triggers
 			 */
-			if (pdata) {
-				if (pdata->leds[i].name)
-					snprintf(pca955x_led->name,
-						 sizeof(pca955x_led->name),
-						 "pca955x:%s",
-						 pdata->leds[i].name);
-				if (pdata->leds[i].default_trigger)
-					pca955x_led->led_cdev.default_trigger =
-						pdata->leds[i].default_trigger;
-			} else {
+			if (pdata->leds[i].name)
 				snprintf(pca955x_led->name,
-					 sizeof(pca955x_led->name),
-					 "pca955x:%d", i);
-			}
+					sizeof(pca955x_led->name), "pca955x:%s",
+					pdata->leds[i].name);
+			if (pdata->leds[i].default_trigger)
+				pca955x_led->led_cdev.default_trigger =
+					pdata->leds[i].default_trigger;
 
 			pca955x_led->led_cdev.name = pca955x_led->name;
 			pca955x_led->led_cdev.brightness_set_blocking =
 				pca955x_led_set;
 
 			err = devm_led_classdev_register(&client->dev,
-						 &pca955x_led->led_cdev);
+							&pca955x_led->led_cdev);
 			if (err)
 				return err;
 
@@ -536,11 +526,10 @@ static int pca955x_probe(struct i2c_client *client,
 			pca955x->gpio.parent = NULL;
 			dev_warn(&client->dev, "could not add gpiochip\n");
 			return err;
-		} else {
-			dev_info(&client->dev, "gpios %i...%i\n",
-				 pca955x->gpio.base, pca955x->gpio.base +
-				 pca955x->gpio.ngpio - 1);
 		}
+		dev_info(&client->dev, "gpios %i...%i\n",
+			 pca955x->gpio.base, pca955x->gpio.base +
+			 pca955x->gpio.ngpio - 1);
 	}
 #endif
 
-- 
2.13.5
