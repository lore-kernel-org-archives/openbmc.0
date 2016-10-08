Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt95FrwzDrWg
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=r57e0XJ7; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id h186so5451510oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j9ouPpu9ZxbjyfzjuSv8MTSZE8FH6osfSNGFGdz9SyM=;
 b=r57e0XJ7kGFHxzkNBaZleeYQJoumebY8H4L3euEGbDaOsUnJhBwA6vVGrvuUCmk+Ii
 W3TQuZVo2GBHPzutd29Nofb7mHSa4teOGrJXc2HM7p4HCf6j9zrt68ZgT0ymIzctJcqf
 jBQOzLxApqK4AFclmCwIZMqQgejTm79mkzD45DkHdSErHFXU1VgYnNPf4vrm6DHn4cZm
 FaefAAojpnLnVnDdI2BW4W/u/5gWLgVczkk0uLhlzJDQqBcHFwjGs+ys4vdLgZKS4GG1
 12HyHSLBoE/LSCdandOnkhs1wbamursjOJ9j4SPeTjmimzQZva7acK/ZMdFnh+K9eKli
 8B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j9ouPpu9ZxbjyfzjuSv8MTSZE8FH6osfSNGFGdz9SyM=;
 b=JF9NngyoiTOxi5yA0s2bc4CjS3dEr637aaf4hMWWxHQeI8tZKgHRdyJmfEu1GNgimD
 sUj4VqJeSXPYur5Z/8aqENMf/oY1+FiSNJfuzBGgEjcCsrRavv5s4JMMDcIuvwPUEN4S
 YVsprlZIZ2SS0G1Rdv5R/ZKGBqUFBvp1OzmyAuSK2ONX/0/xQkRh1zp1e/TpwNi17SkZ
 qFUHc7rhJtdxLzXvZayWOGGaln9efJ05H3TzIX/yyYAn0Ks9BLKQVQqpB58QmS/XNgLY
 QDIT+Ge6ZU7H8Hg9Kj8PxoBwWsqpjmRLXdk2KzQjIkAF+/ebMkQ6JlvbIjDKWuFaw28k
 1XEQ==
X-Gm-Message-State: AA6/9RmF0CQZhHK8Le++iCjVIq/Vy1k4Y3l/SMirz9ZVGlAr7WhXUTehQyGW7RPILuiaoA==
X-Received: by 10.157.5.73 with SMTP id 67mr15791762otw.47.1475948352035;
 Sat, 08 Oct 2016 10:39:12 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.11
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:11 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v2 17/17] drivers/fsi: Add GPIO master functionality
Date: Sat,  8 Oct 2016 12:38:53 -0500
Message-Id: <1475948333-55960-18-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:14 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add setup of the GPIO pins for FSI master function.
Set up I/O directions, define all pins needed and
set up their initial values.  Define serial out
operation.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 143 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3b2770d..7ad1293 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -5,15 +5,29 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 #include "fsi-cfam.h"
 #include "fsi-slave.h"
 
+#define FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
+#define FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
+#define FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
+#define FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
+#define FSI_INIT_CLOCKS		5000	/* Clear out any old data and states */
+
+#define FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
+					/* todo: adjust down as low as */
+					/* possible or eliminate */
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct gpio_desc	*gpio_clk;
 	struct gpio_desc	*gpio_data;
+	struct gpio_desc	*gpio_trans;		/* Voltage translator */
+	struct gpio_desc	*gpio_enable;		/* FSI enable */
+	struct gpio_desc	*gpio_mux;		/* Mux control */
 };
 
 #define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
@@ -23,6 +37,8 @@ struct fsi_gpio_msg {
 	uint8_t		bits;
 };
 
+static void serial_out(struct fsi_master_gpio *, struct fsi_gpio_msg *);
+
 static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, void *val, size_t size)
 {
@@ -42,6 +58,7 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
 
 	if (link != 0)
 		return -ENODEV;
@@ -49,23 +66,115 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 	/* todo: format write into a message, send, poll for response */
 	(void)master;
 
+	/* todo: fill in message */
+	cmd.msg = 0;
+	cmd.bits = 0;
+	serial_out(master, &cmd);
+
 	return 0;
 }
 
+static void sda_out(struct fsi_master_gpio *master, int value)
+{
+	gpiod_set_value(master->gpio_data, value);
+
+	/* Required -do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+}
+
+static void set_sda_output(struct fsi_master_gpio *master,
+			   int value)
+{
+	gpiod_direction_output(master->gpio_data, value);
+	gpiod_direction_output(master->gpio_trans, 1);
+}
+
+static void set_clock(struct fsi_master_gpio *master)
+{
+	/* This delay is required - do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+	gpiod_set_value(master->gpio_clk, 1);
+}
+
+static void clear_clock(struct fsi_master_gpio *master)
+{
+	/* This delay is required - do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+	gpiod_set_value(master->gpio_clk, 0);
+}
+
+static void clock_toggle(struct fsi_master_gpio *master, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		clear_clock(master);
+		set_clock(master);
+	}
+}
+
+/*
+ * Clock out some 0's after every message to ride out line reflections
+ */
+static void echo_delay(struct fsi_master_gpio *master)
+{
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_ECHO_DELAY_CLOCKS);
+}
+
+static void serial_out(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
+{
+	uint16_t bit;
+	uint64_t msg = ~cmd->msg;	/* Data is negative active */
+	uint64_t sda_mask = 1;
+	uint64_t last_bit = ~0;
+
+	set_sda_output(master, 0);
+
+	/* Send the start bit */
+	sda_out(master, 1);
+	clock_toggle(master, 1);
+
+	/* Send the message */
+	for (bit = 0; bit < cmd->bits; bit++) {
+		if (last_bit ^ (msg & sda_mask)) {
+			sda_out(master, msg & sda_mask);
+			last_bit = msg & sda_mask;
+		}
+		clock_toggle(master, 1);
+		msg >>= 1;
+	}
+}
+
 /*
  * Issue a break command on link
  */
 static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	uint32_t smode;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: send the break pattern over gpio */
-	(void)master;
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
 
-	return 0;
+	sda_out(master, 1);
+	clock_toggle(master, FSI_BREAK_CLOCKS);
+
+	echo_delay(master);
+
+	sda_out(master, 0);
+	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
+
+	udelay(200);		/* wait for logic reset to take effect */
+	rc = _master->read(_master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+	dev_info(_master->dev, "smode after break:%08x rc:%d\n", smode, rc);
+
+	return rc;
 }
 
 static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
@@ -79,6 +188,17 @@ static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
 	return rc;
 }
 
+static void fsi_master_gpio_init(struct fsi_master_gpio *master)
+{
+	gpiod_direction_output(master->gpio_mux, 1);
+	gpiod_direction_output(master->gpio_clk, 1);
+	set_sda_output(master, 1);
+	gpiod_direction_output(master->gpio_enable, 1);
+
+	/* todo: evaluate if clocks can be reduced */
+	clock_toggle(master, FSI_INIT_CLOCKS);
+}
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
@@ -98,11 +218,28 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio);
 	master->gpio_data = gpio;
 
+	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_trans = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_enable = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_mux = gpio;
+
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.set_smode = fsi_master_gpio_set_smode;
 
+	fsi_master_gpio_init(master);
+
 	return fsi_master_register(&master->master);
 }
 
-- 
1.8.2.2
