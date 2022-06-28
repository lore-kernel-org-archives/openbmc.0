Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39E9C433EF
	for <openbmc@archiver.kernel.org>; Tue, 28 Jun 2022 16:21:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXVGc2b40z3dY6
	for <openbmc@archiver.kernel.org>; Wed, 29 Jun 2022 02:21:44 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXVFg6r4vz3btt
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 02:20:55 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXVFf5Gdgz4xDH;
	Wed, 29 Jun 2022 02:20:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXVFc6nH8z4xYL;
	Wed, 29 Jun 2022 02:20:52 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/5] spi: aspeed: Fix window offset of CE1
Date: Tue, 28 Jun 2022 18:20:40 +0200
Message-Id: <20220628162044.1121337-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628162044.1121337-1-clg@kaod.org>
References: <20220628162044.1121337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The offset value of the mapping window in the kernel structure is
calculated using the value of the previous window offset. This doesn't
reflect how the HW is configured and can lead to erroneous setting of
the second flash device (CE1).

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 3e891bf22470..5a995b5653f1 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -398,7 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 		windows[cs].cs = cs;
 		windows[cs].size = data->segment_end(aspi, reg_val) -
 			data->segment_start(aspi, reg_val);
-		windows[cs].offset = cs ? windows[cs - 1].offset + windows[cs - 1].size : 0;
+		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
 		dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
 			 windows[cs].offset, windows[cs].size);
 	}
-- 
2.35.3

