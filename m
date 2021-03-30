Return-Path: <SRS0=myNV=I4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2DEC433C1
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 00:32:31 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5567661985
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 00:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5567661985
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8VlJ6sDXz302r
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 11:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=RqMybm5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=RqMybm5N; 
 dkim-atps=neutral
X-Greylist: delayed 462 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 11:32:01 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Vkn0l52z2y81;
 Tue, 30 Mar 2021 11:32:00 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1D52E196;
 Mon, 29 Mar 2021 17:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617063875;
 bh=a68ojvNQDbC+AUZLivBjbDIVsO6PemBG+Kg4ci1snXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RqMybm5NJ4LYIhg26JQHwqz1DqUbeW6JqFIDkVy/f9JY4rOkesBZXpH2elHvtVPwS
 ScownTse3Njf4e6vksmTwA1+EusamiR6MUBgu/4ambtOYvjDXYKz9WD7Fk8oWItPDJ
 MTBu7fBKSLQy4SRV3pk7ohlOWnOSfN0knhcL0jOs=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/3] drivers/tty/serial/8250: simplify Aspeed VUART SIRQ
 polarity DT config
Date: Mon, 29 Mar 2021 19:23:36 -0500
Message-Id: <20210330002338.335-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210330002338.335-1-zev@bewilderbeest.net>
References: <20210330002338.335-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The initial implementation of this configuration conflated the SIRQ
polarity setting with the syscon eSPI/LPC strapping; this patch
disentangles them by reducing the DT config to a simple boolean.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 39 ++-------------------
 drivers/tty/serial/8250/Kconfig             |  1 -
 2 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index c33e02cbde93..b9b5fa58ab28 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/clk.h>
@@ -346,30 +344,8 @@ static int aspeed_vuart_handle_irq(struct uart_port *port)
 	return 1;
 }
 
-static void aspeed_vuart_auto_configure_sirq_polarity(
-	struct aspeed_vuart *vuart, struct device_node *syscon_np,
-	u32 reg_offset, u32 reg_mask)
-{
-	struct regmap *regmap;
-	u32 value;
-
-	regmap = syscon_node_to_regmap(syscon_np);
-	if (IS_ERR(regmap)) {
-		dev_warn(vuart->dev,
-			 "could not get regmap for aspeed,sirq-polarity-sense\n");
-		return;
-	}
-	if (regmap_read(regmap, reg_offset, &value)) {
-		dev_warn(vuart->dev, "could not read hw strap table\n");
-		return;
-	}
-
-	aspeed_vuart_set_sirq_polarity(vuart, (value & reg_mask) == 0);
-}
-
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
-	struct of_phandle_args sirq_polarity_sense_args;
 	struct uart_8250_port port;
 	struct aspeed_vuart *vuart;
 	struct device_node *np;
@@ -468,19 +444,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	vuart->line = rc;
 
-	rc = of_parse_phandle_with_fixed_args(
-		np, "aspeed,sirq-polarity-sense", 2, 0,
-		&sirq_polarity_sense_args);
-	if (rc < 0) {
-		dev_dbg(&pdev->dev,
-			"aspeed,sirq-polarity-sense property not found\n");
-	} else {
-		aspeed_vuart_auto_configure_sirq_polarity(
-			vuart, sirq_polarity_sense_args.np,
-			sirq_polarity_sense_args.args[0],
-			BIT(sirq_polarity_sense_args.args[1]));
-		of_node_put(sirq_polarity_sense_args.np);
-	}
+	if (of_property_read_bool(np, "aspeed,sirq-active-high"))
+		aspeed_vuart_set_sirq_polarity(vuart, 1);
 
 	aspeed_vuart_set_enabled(vuart, true);
 	aspeed_vuart_set_host_tx_discard(vuart, true);
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 603137da4736..105a325bcdd1 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -254,7 +254,6 @@ config SERIAL_8250_ASPEED_VUART
 	tristate "Aspeed Virtual UART"
 	depends on SERIAL_8250
 	depends on OF
-	depends on REGMAP && MFD_SYSCON
 	help
 	  If you want to use the virtual UART (VUART) device on Aspeed
 	  BMC platforms, enable this option. This enables the 16550A-
-- 
2.31.1

