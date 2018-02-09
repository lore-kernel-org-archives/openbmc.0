Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::241; helo=mail-ot0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+SmJqqG"; 
 dkim-atps=neutral
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd38g1jK5zF1Cy
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:12:19 +1100 (AEDT)
Received: by mail-ot0-x241.google.com with SMTP id m20so6555442otf.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vsRF6ToKLajtByQLZg88LEzpzDrXDre/r6+CNU/rrSs=;
 b=J+SmJqqGkh8HBqqCrcRnlwUqorz9dLbqlFu+7SzS9kDAhz9SuVd2tj+4ZyB0WfsZu/
 HCR74LnpRUe+16r8Qarl7ZJnRrEWTCs06IEzxaOU++l5Z0Ga0E8rpKSdDWKYt8NbyhD9
 uBHWO7SFzeHwfwoCReVKxIGtt40uqc5+bb2/65fzPK8ISaSqhSZl3k/Yo+cp5GUBR4DS
 uhHSnt3rSuZMdPmcZSZximnVfMD2UeVbruVYd3cv0/g1uWmI49zywjTGD/G1lTgHXx4G
 kwA4QpiQ11TdEmWfyDDkT7a5QHye1aSiGUnxqdD42ERNReO0Es9PtG6RX+sAT/DARNdJ
 17ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=vsRF6ToKLajtByQLZg88LEzpzDrXDre/r6+CNU/rrSs=;
 b=CKfPpUdeqr7ND1D+O6uyweW7Dc3yUp2+GL2JDIov0EkNXq7ujvILqSWiZHqROV6Xin
 5WXtgzdYOuyXkislqONPhtCBz7m9ra7BOmdbUOlCTzVZbNrXrpdrob08TnRfahsaCHRG
 craQhDb0JsbOp7+ps8iTrs1YbsTmeCsKvSjfxHVzH8qGBsATD1YE8bzY5zD2ndd/rL+T
 1vwZrh6vMP0fNgCh5mHfWsTEoM2nOSNKx6FJ/2fsYhQu4flAgXQNcKcVSoYmlZIXdCjE
 G046Bvw+MPexFrFaEALgCB/DARrl+FDiA+r7yBNShqGMski7TfAoVYxUwqdU01/w+wiv
 CUog==
X-Gm-Message-State: APf1xPDArQOUI5MDUUSD1dpJn301PEXeUyBaiaZBq+o17c9L2GmGHK5H
 /etRbiszXkrdTJ02gSHFCMq82gTd
X-Google-Smtp-Source: AH8x224lt93mxEYkrSOG2eN3OBoC5IU4Em2zoM6JNip87ioYXpi1lxWUYnWAg4dXg9dQclM8lZ4tBQ==
X-Received: by 10.157.42.73 with SMTP id t67mr1197555ota.39.1518153136708;
 Thu, 08 Feb 2018 21:12:16 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id e7sm758840oic.50.2018.02.08.21.12.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 21:12:16 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 15:42:10 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 v2 2/4] misc: aspeed-lpc: Request and enable
 LPC clock
Date: Fri,  9 Feb 2018 15:41:56 +1030
Message-Id: <20180209051158.32354-3-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180209051158.32354-1-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:12:19 -0000

The LPC device needs to ensure it's clock is enabled before it can do
anything.

Tested-by: Lei YU <mine260309@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/misc/aspeed-lpc-ctrl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index b5439643f54b..4a818ad3827e 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -7,6 +7,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -26,6 +27,7 @@
 struct aspeed_lpc_ctrl {
 	struct miscdevice	miscdev;
 	struct regmap		*regmap;
+	struct clk		*clk;
 	phys_addr_t		mem_base;
 	resource_size_t		mem_size;
 	u32		pnor_size;
@@ -180,6 +182,17 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	if (!lpc_ctrl)
 		return -ENOMEM;
 
+	lpc_ctrl->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(lpc_ctrl->clk)) {
+		dev_err(dev, "couldn't get clock\n");
+		return PTR_ERR(lpc_ctrl->clk);
+	}
+	rc = clk_prepare_enable(lpc_ctrl->clk);
+	if (rc) {
+		dev_err(dev, "couldn't enable clock\n");
+		return rc;
+	}
+
 	node = of_parse_phandle(dev->of_node, "flash", 0);
 	if (!node) {
 		dev_err(dev, "Didn't find host pnor flash node\n");
@@ -239,6 +252,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
 	struct aspeed_lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
 
 	misc_deregister(&lpc_ctrl->miscdev);
+	clk_disable_unprepare(lpc_ctrl->clk);
 
 	return 0;
 }
-- 
2.15.1
