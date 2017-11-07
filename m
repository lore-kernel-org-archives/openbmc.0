Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D/UkQvvO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Kmp9lVOg"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjD6w0HzDrKp
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD24520D6C;
 Tue,  7 Nov 2017 02:31:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=iIlhVo5lAp0v0LBU5bupIjx28ElpY
 qq+GxR5fQ9zKVQ=; b=D/UkQvvOWdxcB0R+V42GxZRkSrpX1EsKZ2MU6Ya9vdu5i
 6Na31LCP0GTjrJyLWI5q3kHB+96/UytNhAxOW+ZWNBFb9QPB8FFTN1VL9NwQcBtN
 zRs+XWE3L6OjuwwpCIbZ5PC0zKBnoTM+dpg/oBfyxY4Mh/XAVIYwgcaRJZxjxlC5
 aSUvsbpWFaYX4ikSgBsED/Nf3VYJgsVhuPQEzcdfBIPMLn8Cv5o07cyCPaR1bZav
 M9cxRY+0EGl7pRA/jXB6M1lOuUI7zQJ7Ab5do8LCqcYUMEgXvfIA0snd51N+5kLA
 OERo3TMGG8qpGY6lsVzNqSZueBRcNlPH9XdQbHjwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iIlhVo
 5lAp0v0LBU5bupIjx28ElpYqq+GxR5fQ9zKVQ=; b=Kmp9lVOgoJZv+0DM3EW+It
 vU3W2pxsBDGBkV5dYWDQ1YRst0D8DuSiznjx7eqyHLh7idVGtr6/HplvNiQMTaQH
 kbAK5MUZXr5bJqjpIScMAjFB05f+PKoDdP+8n1pgR1nXxPH9/c7PHORjVaRtq0Cn
 1h5klqmxY5YFoLFOsdbVj8ZwDiiqw5wPVeD9+HBdPNeV5K8V8p2eSryU2u6e2flu
 i/0TOfn8xM8e3KWuoEqX+QeHQFrjIZoP/EP4LwWzOiEAanEiIz4vatzn4lCQnPS+
 jC6M6rb6dHvHYbD2QaxBySuB6ARgDywyWMir1Ye7SMwuuonmNKkhoLoBZas7GeLA
 ==
X-ME-Sender: <xms:bmEBWn5nyUeGYgYqzNdGi-QCL4LQeOHhYkURKWh0N3Wb9j48rIeNoA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D478724108;
 Tue,  7 Nov 2017 02:31:56 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 15/23] leds: pca955x: add device tree support
Date: Tue,  7 Nov 2017 18:00:38 +1030
Message-Id: <20171107073046.13319-16-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:01 -0000

From: Cédric Le Goater <clg@kaod.org>

It will be used in a following patch to define different operation
modes for each pin.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit ed1f4b9676a8eb9c38cf44cdc06300604bfbb43e)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 101 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 9a873118ea5f..2d34009d00e6 100644
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
@@ -250,6 +259,70 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
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
+				   sizeof(struct pca955x_led) * chip->bits,
+				   GFP_KERNEL);
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
+pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 static int pca955x_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -257,8 +330,8 @@ static int pca955x_probe(struct i2c_client *client,
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
 	struct i2c_adapter *adapter;
-	struct led_platform_data *pdata;
 	int i, err;
+	struct pca955x_platform_data *pdata;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -272,6 +345,11 @@ static int pca955x_probe(struct i2c_client *client,
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
@@ -288,13 +366,11 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
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
@@ -378,6 +454,7 @@ static struct i2c_driver pca955x_driver = {
 	.driver = {
 		.name	= "leds-pca955x",
 		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
+		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
 	.remove	= pca955x_remove,
-- 
2.11.0
