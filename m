Return-Path: <jaghu@google.com>
Received: from mail-pa0-x231.google.com (mail-pa0-x231.google.com
 [IPv6:2607:f8b0:400e:c03::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svX4S0xclzDsxR
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:42:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bDlxC5jB; 
 dkim-atps=neutral
Received: by mail-pa0-x231.google.com with SMTP id vu5so33060313pab.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+syuBHOr73W8i0UGPFy9PFfe+7vCZaMOxN7LY5k4Fmk=;
 b=bDlxC5jBq3/u+1crLOizeb4c4+JHir07nrL/i9tG5SgXxpviyqk8qTCSp55osqmlX4
 i3gxTnshzIBWRJTIKZp2qoIJ4RNnY9N69Sta9m4j906E0R27ffLfQYD7DJzKW4Lst5Xu
 LGPJxfZr3PXYbetuEmosd44qItZHn15HxoeXaLNXzdJaq5BshMsnEcETLkLF322XwWrB
 Ax9Ydp6ANcczEZREniyLG04u0ejkjX993BjXIUkK3oLXFAvHrGbVclj8ilqQAlc21zUF
 Ie+A36NDK8MquEhx/l26m6UCHktIq6fH31TaixXtWmkK9tX/R4FR291ar+geT7Avu2f1
 NDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+syuBHOr73W8i0UGPFy9PFfe+7vCZaMOxN7LY5k4Fmk=;
 b=Ry7lazDUvx50uA3ifrKUAH5u+C81cT9e+DzIckDJ+k8LEXcoDOyV0xNlCsrA5+XEff
 fG8C2YGxRfI/PS3Bwo5usQMCCIq5vSNz8qis4bbV90WyX6mNhX0sL/ZdFkfcF8L6bgSo
 qEhVeX+EqHP/Xs02rn9uAgxe9M2Ap58zKI8A2EFh7/x6RXIwDgwXQEsc1pG3yAKDaSWy
 R6EPuKRHedNHo3cJyAALG/MCoRyHNUrM+HNDNaUDvbQlDlOpHHvnD+r2oUf+L5bWfaNp
 gTygGUALVKZ0qJITmChNcUCuY83Rhk5wU2fwv2oSRPS30FlpDKi5d64xoxTLYHe/gdfi
 W70g==
X-Gm-Message-State: AA6/9Rn9CIbpl96NYcaNG4eHXQsL9dObTlrSRtXYVlshcnV/IGKDx9gnrH3OG3mnMA9yk5cH
X-Received: by 10.66.222.202 with SMTP id qo10mr4938780pac.76.1476319333975;
 Wed, 12 Oct 2016 17:42:13 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v86sm14450239pfa.91.2016.10.12.17.42.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 17:42:13 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 1/3] drivers: misc: Platform driver to update display
 on the POST card
Date: Wed, 12 Oct 2016 17:41:43 -0700
Message-Id: <1476319305-29981-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476319305-29981-1-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 00:42:16 -0000

Platform driver to periodically update the display on the POST card.
POST card hardware assumed is 74HC164 wired to two 7-segment displays.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/misc/Kconfig           |   6 ++
 drivers/misc/Makefile          |   1 +
 drivers/misc/update-postcard.c | 219 +++++++++++++++++++++++++++++++++++++++++
 drivers/misc/update-postcard.h |   1 +
 4 files changed, 227 insertions(+)
 create mode 100644 drivers/misc/update-postcard.c
 create mode 100644 drivers/misc/update-postcard.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4617ddc..d65b83f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.

+config ASPEED_UPDATE_POSTCARD
+	tristate "Platform driver to update POST card"
+	help
+	 Support to periodically update display on the POST card. The POST card
+	 hardware assumed is 74HC164 wired to two 7-segment displays.
+
 config ASPEED_BT_IPMI_HOST
 	tristate "BT IPMI host driver"
 	help
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 724861b..730c6c2 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
diff --git a/drivers/misc/update-postcard.c b/drivers/misc/update-postcard.c
new file mode 100644
index 0000000..3516c24
--- /dev/null
+++ b/drivers/misc/update-postcard.c
@@ -0,0 +1,219 @@
+/* Platform driver to periodically update the display on the POST card.
+ * POST card hardware assumed is 74HC164 wired to two 7-segment displays.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/sizes.h>
+#include <linux/map_to_7segment.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/uaccess.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/gpio/consumer.h>
+
+#define POST_CODE_UPDATE_INTVL 1000
+
+#define MAX_PC_SIZE 3
+
+#define LED_DOT 0x01
+
+#define CLOCK_GPIO_NAME "clk"
+#define DATA_GPIO_NAME "data"
+#define CLEAR_GPIO_NAME "clr"
+
+static struct mutex mutex;
+
+static struct timer_list update_timer;
+
+static char curr_postcode[3];
+static u8 pc_valid;
+
+static struct gpio_desc *clk_gpio;
+static struct gpio_desc *data_gpio;
+static struct gpio_desc *clr_gpio;
+
+/*
+ * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
+ *  _       _   _       _   _   _   _   _   _       _       _   _
+ * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
+ * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
+ *
+ * data[7:1] = led[a:g]
+ * lookup table used for both bytes of lpc post code and lower byte of
+ * bmc post code
+ */
+const u8 seven_seg_bits[] = {
+	0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
+	0xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E
+	};
+
+/*
+ * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
+ *      _       _   _                              _            _
+ *     |   |_  |_| |_  _   _   _   _   _   _   _  |_    _|  _| | |
+ *     |_  |_  |   |                               _|  |_| |_| | |
+ *
+ * data[7:1] = led[a:g]
+ * lookup table used for higher byte of bmc post code
+ */
+const u8 special_seven_seg_bits[] = {
+	0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
+	0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
+	};
+
+void update_postcode(char *buf)
+{
+	mutex_lock(&mutex);
+	strncpy(curr_postcode, buf, sizeof(curr_postcode));
+	mutex_unlock(&mutex);
+	pc_valid = 1;
+}
+EXPORT_SYMBOL(update_postcode);
+
+/* convert postcode to led pattern
+ * 7-bits used for each 7-seg display and
+ * 1 bit used for the 'dot' on both digits.
+ *
+ *  @param N/A
+ *  @return N/A
+ */
+static u16 postcode_to_led_signal(void)
+{
+	u8 low_display;
+	u8 high_display;
+	u16 led_value;
+	char buf[3];
+
+	mutex_lock(&mutex);
+	strncpy(buf, curr_postcode, sizeof(buf));
+	mutex_unlock(&mutex);
+
+	low_display = seven_seg_bits[hex_to_bin(buf[2])];
+
+	high_display = (buf[0] == '1') ?
+		special_seven_seg_bits[hex_to_bin(buf[1])] :
+		seven_seg_bits[hex_to_bin(buf[1])];
+
+	led_value = low_display | (high_display << 8);
+	if (buf[0] == '1') {
+		led_value |= LED_DOT | (LED_DOT << 8);
+	}
+
+	return led_value;
+}
+
+static void update_sgpio(void)
+{
+	u16 led_signal;
+	int i;
+
+	/* Convert two bytes of post code to 16 bit led pattern */
+	led_signal = postcode_to_led_signal();
+
+	/* Set the clear signal to low */
+	gpiod_set_value(clr_gpio, 0);
+	udelay(1);
+	/* Set the clear clear to high */
+	gpiod_set_value(clr_gpio, 1);
+	udelay(1);
+
+	/* Bitbang the 16 bit led pattern
+	 * 7-bits used for each 7-seg display
+	 * 1 bit used for the 'dot' on both digits
+	 */
+	for (i = 0; i < 16; i++) {
+		if (led_signal & 0x01) {
+			/* Set the data signal to high */
+			gpiod_set_value(data_gpio, 1);
+		} else {
+			/* Set the data signal to low */
+			gpiod_set_value(data_gpio, 0);
+		}
+		udelay(1);
+
+		/* Set the clock signal to low */
+		gpiod_set_value(clk_gpio, 0);
+		udelay(1);
+		/* Set the clock signal to high */
+		gpiod_set_value(clk_gpio, 1);
+		udelay(1);
+
+		led_signal >>= 1;
+	}
+}
+
+static void update_timer_handler(unsigned long data)
+{
+	if (pc_valid == 1) {
+		update_sgpio();
+	}
+	mod_timer(&update_timer,
+		jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
+}
+
+static const struct of_device_id of_postcard_match[] = {
+		{ .compatible = "postcard-display" },
+			{},
+};
+
+MODULE_DEVICE_TABLE(of, of_postcard_match);
+
+static int postcard_probe(struct platform_device *pdev)
+{
+	int result;
+	struct device *dev = &pdev->dev;
+
+	/* Requesting the clock gpio */
+	clk_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(clk_gpio))
+		return PTR_ERR(data_gpio);
+
+	/* Requesting the data gpio */
+	data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(data_gpio))
+		return PTR_ERR(data_gpio);
+
+	/* Requesting the clear gpio */
+	clr_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(clr_gpio))
+		return PTR_ERR(clr_gpio);
+
+	/* Start timer to update post code every second */
+	setup_timer(&update_timer, update_timer_handler, 0);
+	result = mod_timer(&update_timer,
+		jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
+
+	if (result)
+		return result;
+
+	mutex_init(&mutex);
+
+	return 0;
+}
+
+static void postcard_remove(struct platform_device *pdev)
+{
+	del_timer(&update_timer);
+}
+
+static struct platform_driver postcard_display_driver = {
+	.probe		= postcard_probe,
+	.shutdown	= postcard_remove,
+	.driver		= {
+		.name	= "postcard-display",
+		.of_match_table = of_postcard_match,
+	},
+};
+
+module_platform_driver(postcard_display_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("Post card display update driver");
diff --git a/drivers/misc/update-postcard.h b/drivers/misc/update-postcard.h
new file mode 100644
index 0000000..ef82e9091d
--- /dev/null
+++ b/drivers/misc/update-postcard.h
@@ -0,0 +1 @@
+void update_postcode(char *buf);
--
2.8.0.rc3.226.g39d4020
