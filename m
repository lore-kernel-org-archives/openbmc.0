Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.233; helo=8.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 603 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Oct 2017 19:54:31 AEDT
Received: from 8.mo69.mail-out.ovh.net (8.mo69.mail-out.ovh.net
 [46.105.56.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMP8R2JTbzDqkp
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 19:54:29 +1100 (AEDT)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id CE57848954
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 10:37:07 +0200 (CEST)
Received: from zorba.home (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 40384240092;
 Wed, 25 Oct 2017 10:37:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrea Scian <andrea.scian@dave.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10] leds: pca955x: map gpio offset to led index
 correctly
Date: Wed, 25 Oct 2017 10:36:53 +0200
Message-Id: <20171025083653.3967-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5562508492796234498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrfedtgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 08:54:31 -0000

From: Andrea Scian <andrea.scian@dave.eu>

We need to map gpio offset to led index of this device otherwise we
cannot mix led and gpios into device tree definition

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
[clg: ported on linux openbmc 4.10 kernel ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 This should help in defining mixed GPIO/LED pca9952 devices. I don't
 think we need to change our bindings but could we include this patch
 to chek is it not breaking anything. I only tested the basics under
 QEMU.

 drivers/leds/leds-pca955x.c |   38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

Index: linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
===================================================================
--- linux-openbmc-4.10.git.orig/drivers/leds/leds-pca955x.c
+++ linux-openbmc-4.10.git/drivers/leds/leds-pca955x.c
@@ -126,6 +126,7 @@ struct pca955x {
 	struct i2c_client	*client;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
+	int *gpio_to_index;
 #endif
 };
 
@@ -315,22 +316,34 @@ static int pca955x_read_input(struct i2c
 
 }
 
+/*
+ * Map from gpio offset to led index.
+ * Return NULL in case of unmapped GPIO (even if it should never happens)
+ */
+static struct pca955x_led *
+pca955x_gpio_get_led_index(struct pca955x *pca955x, unsigned int offset)
+{
+	int index = pca955x->gpio_to_index[offset];
+
+	return index < 0 ? NULL : &pca955x->leds[index];
+}
+
 static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
-
-	if (led->type == PCA955X_TYPE_GPIO)
-		return 0;
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
 
-	return -EBUSY;
+	return led == NULL ? -EBUSY : 0;
 }
 
 static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
 			     int val)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
+
+	if (led == NULL)
+		return -EINVAL;
 
 	if (val)
 		return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH);
@@ -347,10 +360,13 @@ static void pca955x_gpio_set_value(struc
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
 	u8 reg = 0;
 
 	/* There is nothing we can do about errors */
+	if (led == NULL)
+		return 0;
+
 	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
 
 	return !!(reg & (1 << (led->led_num % 8)));
@@ -499,6 +515,11 @@ static int pca955x_probe(struct i2c_clie
 	if (!pca955x->leds)
 		return -ENOMEM;
 
+	pca955x->gpio_to_index = devm_kzalloc(&client->dev,
+			sizeof(int) * chip->bits, GFP_KERNEL);
+	if (!pca955x->gpio_to_index)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, pca955x);
 
 	mutex_init(&pca955x->lock);
@@ -510,12 +531,13 @@ static int pca955x_probe(struct i2c_clie
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
 		pca955x_led->type = pdata->leds[i].type;
+		pca955x->gpio_to_index[i] = -ENOENT;
 
 		switch (pca955x_led->type) {
 		case PCA955X_TYPE_NONE:
 			break;
 		case PCA955X_TYPE_GPIO:
-			ngpios++;
+			pca955x->gpio_to_index[ngpios++] = i;
 			break;
 		case PCA955X_TYPE_LED:
 			/*
