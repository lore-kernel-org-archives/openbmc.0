Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uz1Kdp0Z"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcRmx2XQ1zF17Y
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 16:38:09 +1100 (AEDT)
Received: by mail-pl0-x242.google.com with SMTP id f8-v6so1530934plk.11
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 21:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wbzyafGsH0Zt2dadXuSoP1bis2zIdmUwqKrzF296bG4=;
 b=uz1Kdp0ZiA4ZAOAtNFLQfPlXejLPHLekOj7pbE9O7jCiIgQRIOKwXnzDQMPMXRiEBW
 iEPWPygMgHjf6Z2NwiNvy6Mwb/uA6YMZ9CINu7m+crPKbjxGv5x20kx/Jpd5/S5rR1Dm
 4uu09+n8gebORIdFZGlIID7JQv8VPD6qZVMg/mx5RUy8goQveX1eTS/gpbC7ew0BKYgI
 ZKExBH81pCg4AALPEv3mw0fmuvZE9U4Jl6wyU+nEQx7KGbbfzPW3aifYZybfcVQswE5J
 asJ0hD90PEDsLP7gVSDKCARBsH+eZfRzeGrWoumHYLZSqGl1vW1wYMzl43NsH6FbjDaj
 ZK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=wbzyafGsH0Zt2dadXuSoP1bis2zIdmUwqKrzF296bG4=;
 b=eHjFsZcaUq9+zMRlbHDAD/C2SaIg6ix9ihTTHwAoRcsI7qWx7/+z8QmXahOlyGnSji
 eucz8qK8R/3YnKsVIQt9rs1vUSSzGntwM8Ct4B48cpei+IcJfCpijNKsKe0ETIerdBxn
 vihmrZeuAZG0WboOZoZE3kIhiQSdpUGgmqo+gmjeLrBoqpWWX/QmyCy2s4DB7rWXCW29
 4HJZNxkkkDWvwPDIzvChqun8K6NCNpKZ59qzFbbw+1A2x7EUQ/GYbkTCgENVaJpp04XB
 B7iYsOiplPEEYw/8O9H+tf1JM+HuHiRnnViPONiDJPkoK55imkbrctemJ68qdRYW6SyH
 TKVA==
X-Gm-Message-State: APf1xPBe+bQLAMYlE7ldMkQ0ZhyKPj67qGMKW3e2HHnTZcPs567JaNNP
 32nnI1jPVeCfoSSAZyMrepxRRc0u
X-Google-Smtp-Source: AH8x227ZceSx62eiO72n1f8VjvsJkqsOZ7Geh5/w7FxcjWL6DbZV/0NIOXqSh35QTQhEVbM+VmYq1g==
X-Received: by 2002:a17:902:64d6:: with SMTP id
 y22-v6mr8483804pli.444.1518068286883; 
 Wed, 07 Feb 2018 21:38:06 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id c8sm7125764pfm.130.2018.02.07.21.38.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 21:38:06 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 08 Feb 2018 16:08:00 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 2/3] misc: aspeed-lpc: Enable clock
Date: Thu,  8 Feb 2018 16:07:44 +1030
Message-Id: <20180208053745.31254-3-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208053745.31254-1-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 08 Feb 2018 05:38:09 -0000

The LPC device needs to ensure it's clock is enabled before it can do
anything.

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
