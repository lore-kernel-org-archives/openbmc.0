Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7rBb0VbrzDqkp
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 08:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GCJX3kbZ"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id t186so36230498pgb.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+g+pDii9WcEn6q1gmwcKr7pQgYUrYy1ps9JVo3MgPb0=;
 b=GCJX3kbZ962Xnod0UoQ5gUNwIcR3z3sKCxdkMO04yuLbBNZslDK5yzkpS+UimNzaz/
 lLHZh4muI8YC6/f/KsEKicUuQKAjhNff4LqSLPT/iQz/tFiYFSvXTPrZkW1rfPOPElsT
 cnoYMX6o0QR5CC1qelCQ7kYo0O16LuCKiVjyCSrnCTK3KlXxwMrzw8jmgKuXTwJ/iFbs
 nzAv9dQjGIYeqAb6IisQ6in0mzgAdbmJGcNv82EXtpNO2/k6lrotbrxEmDiqndkDrzrH
 wQrBm/nXlV44nRc82jvyn6uASUuDkp7p/JBALb+d4XT18EbIAx8skoZRnOfzwG7pgyir
 v9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+g+pDii9WcEn6q1gmwcKr7pQgYUrYy1ps9JVo3MgPb0=;
 b=Q1Ti5Vlz248Te5hwJyVlf6MffzrqkhYsMvT7Oc1RYyS3ob18fsGJXR64SpLyaPJBMi
 KGdhdsY/CuIbhdFY1u3k3n6yI5n48IsycGrNR6rQKEvjrf9UkUbFswaEbDZP2h4RNNqg
 JZv9O3HBIdThBhTqzSvgQkyCmSmpmMUp+VBadg5sJuQUmDKeshvqDTiLZPqmfEWGIpjT
 tix/IMPkEAAsx4Qbc1vYa5WP6GgZE3eloVUwpn7Icj5bwwzgXUZxqLxUb+bIU+dVGail
 HU/if64xKHPUeiVjDSm7mgSTFk4GlWpbdPQmTdLOXP1d5hKugcCDXSVDvQM1SL9sIhR5
 JRCQ==
X-Gm-Message-State: AIVw1130ga5FCebUuXqD2Bi9NVVsIpl4EwXPCBOUE2K5aF0aY8io1Wpv
 bQlrKGv6lnhnv0cR
X-Received: by 10.98.141.23 with SMTP id z23mr1930677pfd.34.1499985061233;
 Thu, 13 Jul 2017 15:31:01 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e13sm11992536pfh.96.2017.07.13.15.31.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Jul 2017 15:31:00 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	benh@kernel.crashing.org,
	joel@jms.id.au
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 1/1] i2c: aspeed: add proper support for 24xx clock params
Date: Thu, 13 Jul 2017 15:30:52 -0700
Message-Id: <20170713223052.8387-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.2.932.g7449e964c-goog
In-Reply-To: <20170713223052.8387-1-brendanhiggins@google.com>
References: <20170713223052.8387-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 13 Jul 2017 22:31:03 -0000

24xx BMCs have larger clock divider granularity which can cause problems
when trying to set them as 25xx clock dividers; this adds clock setting
code specific to 24xx.

This also fixes a potential issue where clock dividers were rounded down
instead of up.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 69 +++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index f19348328a71..247270ff2031 100644
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
 
@@ -694,11 +695,22 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
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
+	base_clk = divisor > clk_high_low_max + 1 ?
+			ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
 	tmp = divisor / (1 << base_clk);
+
+	/* Round up to next largest divisor. */
+	if (tmp * (1 << base_clk) < divisor)
+		tmp += 1;
+	if (tmp > clk_high_low_max) {
+		base_clk += 1;
+		tmp = divisor / (1 << base_clk);
+	}
+
 	clk_high = tmp / 2 + tmp % 2;
 	clk_low = tmp - clk_high;
 
@@ -712,13 +724,31 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
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
 
@@ -777,8 +807,22 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
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
@@ -808,6 +852,12 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
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
@@ -869,13 +919,6 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
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
2.13.2.932.g7449e964c-goog
