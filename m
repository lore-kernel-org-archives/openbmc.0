Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xK18Z2yn2zDqmV
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 06:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LWSJh8Nn"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id c14so22760266pgn.0
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l6+oLlP9d6d86pgP1XR0VK4ezOBzQIUXAwTMN50U6X8=;
 b=LWSJh8Nn8nBTWYJBFOVbD08rPT43MB6g7gf6nhI4tnbEU4JpnO21CVIK4WungRPme/
 6Rz/k4lUDadaqa909TQXFQJZSE7p7eviHpfRX36Xtqld9lH9dWSrduiE4B7U67qsHTXt
 FEbAfUxBTn8LZBUwgAHfBiYoKSAcLnHd9WNd/P7kOtkCmJseB90vtzNfAJzrSslELKAd
 fDJBJr8RUmEWP0O1EugUzOgcKX6QNAv7cblAUw14VlGIH9dZKAKae5tFVAnfqY1bOyQb
 1AXT7Fe1mPhiokZ6tVITT7+iPTF2ZqUzhcsoh383GJSu5BE69gaPBxnwyCC+xbzQyHEq
 rEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l6+oLlP9d6d86pgP1XR0VK4ezOBzQIUXAwTMN50U6X8=;
 b=n4poTp6trHZdap9eBhY9Eudys9FL1HM2hqTO0h/G/T2N9kFWfLw8Akjpp+VFFItLWN
 fjoRMH9gTCBab78qIxRxD5/t1oORYz4kMhy7LWFbjEkXixJ+mLtQXAqOVRG4zIeA1ryD
 dygtEvmC56TLj4uBrHnqdi/W1QWKD/XNuSHkvujaf4BphJf39ShL/Xbcq6OjCvcR3dcW
 jZ29yVL6z16vTe2mMO99YiOteRgGPvg3olTexEY3bqaSrBYgrxYCM6xWXGJVbFz4YDWU
 TM1NPmwJSiGETz6Q0jfnVXS+W3R8yNvcN/dnBRrXOdu3ChyntkNWjlH6PsGnnYZinqCb
 kBcQ==
X-Gm-Message-State: AIVw112nSfHKblFMeJrIQn4VB26oON3xf3VGWwWx1yspprLaO/GJgoUo
 tw/Hivh82WELwRpO
X-Received: by 10.99.124.71 with SMTP id l7mr8410252pgn.429.1501274764625;
 Fri, 28 Jul 2017 13:46:04 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id y16sm4527836pfa.120.2017.07.28.13.46.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Jul 2017 13:46:03 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, benh@kernel.crashing.org, joel@jms.id.au,
 rburanyi@google.com
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 1/1] i2c: aspeed: add proper support fo 24xx clock params
Date: Fri, 28 Jul 2017 13:45:58 -0700
Message-Id: <20170728204558.6455-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc0.400.g1c36432dff-goog
In-Reply-To: <20170728204558.6455-1-brendanhiggins@google.com>
References: <20170728204558.6455-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 28 Jul 2017 20:46:06 -0000

24xx BMCs have larger clock divider granularity which can cause problems
when trying to set them as 25xx clock dividers; this adds clock setting
code specific to 24xx.

This also fixes a potential issue where clock dividers were rounded down
instead of up.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes for v2:
  - Fixed off by one error to check for divisors with base_clk == 0
  - Simplified some of the divisor math
---
 drivers/i2c/busses/i2c-aspeed.c | 74 +++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index f19348328a71..60afab866494 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -132,6 +132,7 @@ struct aspeed_i2c_bus {
 	/* Synchronizes I/O mem access to base. */
 	spinlock_t			lock;
 	struct completion		cmd_complete;
+	u32				(*get_clk_reg_val)(u32 divisor);
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
 	/* Transaction state. */
@@ -674,7 +675,7 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 #endif /* CONFIG_I2C_SLAVE */
 };
 
-static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
+static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
 {
 	u32 base_clk, clk_high, clk_low, tmp;
 
@@ -694,16 +695,22 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
 	 * Thus,
 	 *	SCL_freq = APB_freq /
 	 *		((1 << base_clk) * (clk_high + 1 + clk_low + 1))
-	 * The documentation recommends clk_high >= 8 and clk_low >= 7 when
-	 * possible; this last constraint gives us the following solution:
+	 * The documentation recommends clk_high >= clk_high_max / 2 and
+	 * clk_low >= clk_low_max / 2 - 1 when possible; this last constraint
+	 * gives us the following solution:
 	 */
-	base_clk = divisor > 33 ? ilog2((divisor - 1) / 32) + 1 : 0;
-	tmp = divisor / (1 << base_clk);
-	clk_high = tmp / 2 + tmp % 2;
-	clk_low = tmp - clk_high;
+	base_clk = divisor > clk_high_low_max ?
+			ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
+	tmp = (divisor + (1 << base_clk) - 1) >> base_clk;
+	clk_low = tmp / 2;
+	clk_high = tmp - clk_low;
+
+	if (clk_high)
+		clk_high--;
+
+	if (clk_low)
+		clk_low--;
 
-	clk_high -= 1;
-	clk_low -= 1;
 
 	return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
 		& ASPEED_I2CD_TIME_SCL_HIGH_MASK)
@@ -712,13 +719,31 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
 			| (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
 }
 
+static u32 aspeed_i2c_24xx_get_clk_reg_val(u32 divisor)
+{
+	/*
+	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
+	 * value of 8 giving a clk_high_low_max of 16.
+	 */
+	return aspeed_i2c_get_clk_reg_val(16, divisor);
+}
+
+static u32 aspeed_i2c_25xx_get_clk_reg_val(u32 divisor)
+{
+	/*
+	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
+	 * value of 16 giving a clk_high_low_max of 32.
+	 */
+	return aspeed_i2c_get_clk_reg_val(32, divisor);
+}
+
 /* precondition: bus.lock has been acquired. */
 static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 {
 	u32 divisor, clk_reg_val;
 
-	divisor = bus->parent_clk_frequency / bus->bus_frequency;
-	clk_reg_val = aspeed_i2c_get_clk_reg_val(divisor);
+	divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
+	clk_reg_val = bus->get_clk_reg_val(divisor);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
@@ -777,8 +802,22 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
 	return ret;
 }
 
+static const struct of_device_id aspeed_i2c_bus_of_table[] = {
+	{
+		.compatible = "aspeed,ast2400-i2c-bus",
+		.data = aspeed_i2c_24xx_get_clk_reg_val,
+	},
+	{
+		.compatible = "aspeed,ast2500-i2c-bus",
+		.data = aspeed_i2c_25xx_get_clk_reg_val,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
+
 static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
 	struct clk *parent_clk;
 	struct resource *res;
@@ -808,6 +847,12 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->bus_frequency = 100000;
 	}
 
+	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
+	if (!match)
+		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
+	else
+		bus->get_clk_reg_val = match->data;
+
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
 	init_completion(&bus->cmd_complete);
@@ -869,13 +914,6 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id aspeed_i2c_bus_of_table[] = {
-	{ .compatible = "aspeed,ast2400-i2c-bus", },
-	{ .compatible = "aspeed,ast2500-i2c-bus", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
-
 static struct platform_driver aspeed_i2c_bus_driver = {
 	.probe		= aspeed_i2c_probe_bus,
 	.remove		= aspeed_i2c_remove_bus,
-- 
2.14.0.rc0.400.g1c36432dff-goog
