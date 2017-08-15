Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWkS82XP1zDrJD;
 Tue, 15 Aug 2017 17:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="l2Onq2+6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="llInxmLf"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A68A2083F;
 Tue, 15 Aug 2017 03:21:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 15 Aug 2017 03:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=OgKfMeb2Y9tE1TVykTcqQUGm11+u9B
 LmCxt1DDfx4O4=; b=l2Onq2+6+wT9UPaW9vQQf/1auTDId8hCV/xpRQQhghfjL9
 ItefnjtGvZyw6UssHQo1R0XBRTNftnY65hw8VLrwFLpJSuRu0ll4AxmbrZzb2jhw
 +FuipAha5yeqemfpEvAx+43k7ezoFrK4219BQIa3FrUlhuK8oqrfeEt3m1kCJVD2
 AOrtsUb3NWJ3LrdbvEnR1bbsbfMkFUxwQc2D7lPuBRT662gAQS509lF9oOd3bjVO
 yCm3Cv+vq922cfU0evT2qK9qr1wFON9kbDm2sQEmE1xrR3WdCXhGnihZH9C+a+XW
 qi0NdMRkS3BgzTG6GeiGgeF4AABQY397NbismPlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OgKfMe
 b2Y9tE1TVykTcqQUGm11+u9BLmCxt1DDfx4O4=; b=llInxmLfLQVVzVXhzjELdQ
 bbm72m4UqYfSvI3z4eBTjZtJ7N8V1dI0KL/OFuUMDZsH6g7Vd9MOh7UOPU9lmfgI
 bpBE8zygqaqxGLptJLAC6rWqJ+dan5JFNYfxI8jq1rMnrrx45gY/FiIgWnfADylt
 O+frk5Bo8YEIZiLupCFWktzalPKTTtq0R5xSxUxJR4dhhFax0TGsmn0vzhClZmvY
 BeYJiUOFV0X/1I570FulvGAGMv4JjM/HNWLKZb4R+qRN13DNSQuZheqrl8HZ51qk
 LpTm7/0HaMkjy2lDvDrjjXBTLkoLDnoTRejCtdLDECdzp5aE/cxAXvzd5Dbh4NhQ
 ==
X-ME-Sender: <xms:BKGSWf1D8y_PzbvU_oxfzW1oPCv3LFLu8l9PuPo6bX30fqD4P3TZHw>
X-Sasl-enc: XAJMdXutb/OF+0vpf8QojVymBc5bo71OzcGHCO3ZIQbV 1502781699
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75E56244B4;
 Tue, 15 Aug 2017 03:21:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-i2c@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wsa@the-dreams.de,
 brendanhiggins@google.com, benh@kernel.crashing.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ryan_chen@aspeedtech.com
Subject: [PATCH] i2c: aspeed: Retain delay/setup/hold values when configuring
 bus frequency
Date: Tue, 15 Aug 2017 16:51:02 +0930
Message-Id: <20170815072102.23067-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Tue, 15 Aug 2017 07:21:46 -0000

In addition to the base, low and high clock configuration, the AC timing
register #1 on the AST2400 houses fields controlling:

1. tBUF: Minimum delay between Stop and Start conditions
2. tHDSTA: Hold time for the Start condition
3. tACST: Setup time for Start and Stop conditions, and hold time for the
   Repeated Start condition

These values are defined in hardware on the AST2500 and therefore don't
need to be set.

aspeed_i2c_init_clk() was performing a direct write of the generated
clock values rather than a read/mask/modify/update sequence to retain
tBUF, tHDSTA and tACST, and therefore cleared the tBUF, tHDSTA and tACST
fields on the AST2400. This resulted in a delay/setup/hold time of 1
base clock, which in some configurations is not enough for some devices
(e.g. the MAX31785 fan controller, with an APB of 48MHz and a desired
bus speed of 100kHz).

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/i2c/busses/i2c-aspeed.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ee76e6dddc4b..284f8670dbeb 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -53,6 +53,9 @@
 #define ASPEED_I2CD_MASTER_EN				BIT(0)
 
 /* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+#define ASPEED_I2CD_TIME_TBUF_MASK			GENMASK(31, 28)
+#define ASPEED_I2CD_TIME_THDSTA_MASK			GENMASK(27, 24)
+#define ASPEED_I2CD_TIME_TACST_MASK			GENMASK(23, 20)
 #define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT			16
 #define ASPEED_I2CD_TIME_SCL_HIGH_MASK			GENMASK(19, 16)
 #define ASPEED_I2CD_TIME_SCL_LOW_SHIFT			12
@@ -744,7 +747,11 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	u32 divisor, clk_reg_val;
 
 	divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
-	clk_reg_val = bus->get_clk_reg_val(divisor);
+	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
+	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
+			ASPEED_I2CD_TIME_THDSTA_MASK |
+			ASPEED_I2CD_TIME_TACST_MASK);
+	clk_reg_val |= bus->get_clk_reg_val(divisor);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
-- 
2.11.0
