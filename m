Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="icRHGIxP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="orhMAZcj"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLj36jbzzDrL1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C9F1B20D6C;
 Tue,  7 Nov 2017 02:31:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zhE3LIZmDzB8khwbV
 3wJcE5JvgfvJBtgZg5y5Vf1KNk=; b=icRHGIxP1Wn8jg9jBZgaHRZTn5gJNm4ja
 WZS2S0JCZK7HN/5WFN7imwf8ByGptH4YRxwu9+Ep/a2XZ+PwTJ53oef1+OSRCnY0
 nz1V/iQR3WNm9ASN/AvBXl6e2+vjYgtkz7h7+ga0EpaiA3IEHWUveBtkks6UfBG2
 jMiuRPl75yArZqWCD53OHmhb9/2wRyTUClrGsnNyUfi6CDmffkZc4i5darYx+VER
 MFasQAxXphdu3Y75n0dab/oHQeuzScRIFOCVljb9WTfdthyVa6tjhBOTLTlODG3I
 OLB8WoWUfYTKH796g2HBZhEnf3++n+ycF3uIm83Wdoat95+Z9HccA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zhE3LIZmDzB8khwbV3wJcE5JvgfvJBtgZg5y5Vf1KNk=; b=orhMAZcj
 gXWFzbq43gblD1bG0asSRgMyq9TIj9POi0h3NMvVhOzqMbym5cp823iuBSiEX9dl
 rp/0B6tq4npJCI5W2cavkfhw1JDjsm5FVb+GA3kE3YnDGsD2fV0sMDs0pV9/aVH3
 DgXqmBBm3jTieXIQkK+BesR6qoQMFwikmwIjqHUyVlvN660oYGNUSi81bRcqNa6v
 Hxk3qi2TxDtWawFE5xdEmU/4p5TgKyz8ioo0Ks6mGx0Bu93FlLrrbFp+RWBr1j++
 gaDbXJyWOtUzGGoO77cqMLXW//2vPUV8cffxd5GHmeCJD4jEFG+9EMlJ0BG7ERtM
 sDE11SvUR6/MKA==
X-ME-Sender: <xms:ZWEBWjH5h0cD4VLX1vMQpX57ZrsSRHa_Xs1j7zCuDzb9P0eQQ2J45g>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1767F2494B;
 Tue,  7 Nov 2017 02:31:47 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 11/23] drivers/watchdog: ASPEED reference dev
 tree properties for config
Date: Tue,  7 Nov 2017 18:00:34 +1030
Message-Id: <20171107073046.13319-12-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:52 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Reference the system device tree when configuring the watchdog
engines. If property 'aspeed,reset_type' is present then set
reset behavior based on the specified value.  This can be one of
three different mutually exclusive values
  * cpu - Reset CPU only on watchdog timeout
  * soc - Reset System on Chip
  * system - Full system reset

No reset can also be specified by indicating:
  * none - No reset, assumes another watchdog is responsible for
           this.

Add optional property 'aspeed,external-signal'. If present then
configure to generate external signal on watchdog timeout.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@iguana.be>
(cherry picked from commit b7f0b8ad25f3f19f7830b3ce5b8fa6f7fe7ae5d5)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 1c652582de40..c707ab647922 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -36,6 +36,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_CTRL		0x0C
 #define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
+#define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
 #define   WDT_CTRL_1MHZ_CLK		BIT(4)
 #define   WDT_CTRL_WDT_EXT		BIT(3)
 #define   WDT_CTRL_WDT_INTR		BIT(2)
@@ -140,6 +141,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct aspeed_wdt *wdt;
 	struct resource *res;
+	struct device_node *np;
+	const char *reset_type;
 	int ret;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -164,14 +167,30 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
 
+	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+
 	/*
 	 * Control reset on a per-device basis to ensure the
-	 * host is not affected by a BMC reboot, so only reset
-	 * the SOC and not the full chip
+	 * host is not affected by a BMC reboot
 	 */
-	wdt->ctrl = WDT_CTRL_RESET_MODE_SOC |
-		WDT_CTRL_1MHZ_CLK |
-		WDT_CTRL_RESET_SYSTEM;
+	np = pdev->dev.of_node;
+	ret = of_property_read_string(np, "aspeed,reset-type", &reset_type);
+	if (ret) {
+		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
+	} else {
+		if (!strcmp(reset_type, "cpu"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_ARM_CPU;
+		else if (!strcmp(reset_type, "soc"))
+			wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC;
+		else if (!strcmp(reset_type, "system"))
+			wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+		else if (strcmp(reset_type, "none"))
+			return -EINVAL;
+	}
+	if (of_property_read_bool(np, "aspeed,external-signal"))
+		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+
+	writel(wdt->ctrl, wdt->base + WDT_CTRL);
 
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
 		aspeed_wdt_start(&wdt->wdd);
-- 
2.11.0
