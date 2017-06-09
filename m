Return-Path: <clg@kaod.org>
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkjqW5fjczDqM6
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:31:19 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id A55C1E2233
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:45 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 8676C60009C;
 Fri,  9 Jun 2017 15:12:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/5] leds: pca955x: add device tree support
Date: Fri,  9 Jun 2017 15:12:25 +0200
Message-Id: <1497013949-8786-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497013949-8786-1-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11442802232359095042
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
X-List-Received-Date: Fri, 09 Jun 2017 13:31:20 -0000

It will be used in a following patch to define different operation
modes for each pin.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c | 88 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 78a7ce816a47..a3e61a57d574 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -41,14 +41,17 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/string.h>
 #include <linux/ctype.h>
-#include <linux/leds.h>
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
@@ -122,6 +125,12 @@ struct pca955x_led {
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
+	const char		*default_trigger;
+};
+
+struct pca955x_platform_data {
+	struct pca955x_led	*leds;
+	int			num_leds;
 };
 
 /* 8 bits per input register */
@@ -250,6 +259,69 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_OF)
+static struct pca955x_platform_data *
+pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
+{
+	struct device_node *np = client->dev.of_node;
+	struct device_node *child;
+	struct pca955x_platform_data *pdata;
+	int count;
+
+	count = of_get_child_count(np);
+	if (!count || count > chip->bits)
+		return ERR_PTR(-ENODEV);
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->leds = devm_kzalloc(&client->dev,
+			   sizeof(struct pca955x_led) * chip->bits, GFP_KERNEL);
+	if (!pdata->leds)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_child_of_node(np, child) {
+		const char *name;
+		u32 reg;
+		int res;
+
+		res = of_property_read_u32(child, "reg", &reg);
+		if ((res != 0) || (reg >= chip->bits))
+			continue;
+
+		if (of_property_read_string(child, "label", &name))
+			name = child->name;
+
+		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
+			 "%s", name);
+
+		of_property_read_string(child, "linux,default-trigger",
+					&pdata->leds[reg].default_trigger);
+	}
+
+	pdata->num_leds = chip->bits;
+
+	return pdata;
+}
+
+static const struct of_device_id of_pca955x_match[] = {
+	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
+	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
+	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
+	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_pca955x_match);
+#else
+static struct pca955x_platform_data *
+pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef *chip)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 static int pca955x_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -257,8 +329,8 @@ static int pca955x_probe(struct i2c_client *client,
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
 	struct i2c_adapter *adapter;
-	struct led_platform_data *pdata;
 	int i, err;
+	struct pca955x_platform_data *pdata;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -272,6 +344,11 @@ static int pca955x_probe(struct i2c_client *client,
 	}
 	adapter = to_i2c_adapter(client->dev.parent);
 	pdata = dev_get_platdata(&client->dev);
+	if (!pdata) {
+		pdata =	pca955x_pdata_of_init(client, chip);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	}
 
 	/* Make sure the slave address / chip type combo given is possible */
 	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
@@ -378,6 +455,7 @@ static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
 		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
+		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
 	.remove	= pca955x_remove,
-- 
2.7.4
