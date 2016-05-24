Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDJk60RtYzDqNQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 12:09:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=d612wuBc; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id yl2so440299pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 19:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=49IfcvzIGIPh11kaCX8lQ4ABSmVPjlKF9m1EVD2HBlQ=;
 b=d612wuBcfqcS6Y/hucRGzDWbEPYVSo0Le53QYzZDE+JJ41zlyisky8toHRxXkM7i9b
 IiH70S46cBLVNszEG9sZ9skt7Nw+8l98qK2D91QsyxedKTtgID0echc4SL2SVv6Asrsa
 XunV3GocU1cTPtPqieDkhi4sW9XEwZB+VYEGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=49IfcvzIGIPh11kaCX8lQ4ABSmVPjlKF9m1EVD2HBlQ=;
 b=g9ZPA05EF9BSnteuP3jFdZaFjHZv5XsHC6xDQynLVsR0+KoTt6l7pCFi01IIkV3PKB
 +s7nPNFQDI7tvu9NhxHEiFMvCF8vGkSzt1LJSpBndIkjbFBr6aScr834Ay5aVz25ss/K
 foJrRqhTG7R3dD1X7XFXdmQOXZ/kVgIW+i7dYWLue8syhK/KjMK6CGx5vl9yVoraI4MS
 zOmdQfkhsxwtLtL/JPxVh2NyD0I708zFVYF7coAxIbJUFoIXN+NmUBYmxgqA2mXq2JvD
 aOits9uBo8ta+Uz6UZuGggZb7cTtnKQO0E7JMwjeBVXrg4p0Kv09AhhQjp6ZCmSHoGHl
 1HjQ==
X-Gm-Message-State: ALyK8tIv6+wSfgPlaDqLuGyqYgmxuiyCKbVixcm9G64SXLN+fdm5pF7gtRjpVmYDTp2zew==
X-Received: by 10.66.112.34 with SMTP id in2mr2938498pab.52.1464055739561;
 Mon, 23 May 2016 19:08:59 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:fc53:a38c:f05e:e521])
 by smtp.gmail.com with ESMTPSA id x123sm49580088pfb.54.2016.05.23.19.08.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 May 2016 19:08:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: miltonm@us.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux] mtd/spi-nor/aspeed: Forward port to 4.7
Date: Tue, 24 May 2016 11:38:49 +0930
Message-Id: <1464055729-16174-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 02:09:02 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Milton,

Please double check this one for me.

Cheers,

Joel

 drivers/mtd/spi-nor/aspeed-smc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ed55f283b619..985455b479e3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -415,7 +415,6 @@ static int aspeed_smc_probe(struct platform_device *dev)
 	/* XXX handshake to enable access to SMC (bios) controller w/ host? */
 
 	for_each_available_child_of_node(dev->dev.of_node, child) {
-		struct mtd_part_parser_data ppdata;
 		struct platform_device *cdev;
 		struct aspeed_smc_chip *chip;
 		u32 reg;
@@ -504,7 +503,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 
 		chip->nor.dev = &cdev->dev;
 		chip->nor.priv = chip;
-		chip->nor.flash_node = child;
+		spi_nor_set_flash_node(&chip->nor, child);
 		chip->nor.mtd.name = of_get_property(child, "label", NULL);
 		chip->nor.erase = aspeed_smc_erase;
 		chip->nor.read = aspeed_smc_read_user;
@@ -528,9 +527,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 		/* XXX enable fast read here */
 		/* XXX check if resource size big enough for chip */
 
-		memset(&ppdata, 0, sizeof(ppdata));
-		ppdata.of_node = cdev->dev.of_node;
-		err = mtd_device_parse_register(&chip->nor.mtd, NULL, &ppdata, NULL, 0);
+		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
 		if (err)
 			continue;
 		controller->chips[n] = chip;
-- 
2.8.1
