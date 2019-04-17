Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="A64toXG9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tWWb7ARQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kWSQ1hqdzDqDV
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:46:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E2C4722007;
 Wed, 17 Apr 2019 01:46:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Apr 2019 01:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=S0HQY7dtkeQzQrGK4DRPVc6EFv
 4ywTAbHbgO9cP/mnY=; b=A64toXG9w1YJGgBTcGwFr/KUQ8QQXojVud+qKbyk/O
 sRM9WX5Z1vGBtDO+aj7cJXv8HOoZZ4eLNCrTDOvZDhHyzFNxRLVdfQk5yLeTUfdw
 83cXYGuFciwSeKAmkYWKfI4lzQPFuZ9GhfhGppMPYuyfOCMKU/OPoqMOGVzTOn41
 F7nntVr3Et56XsCWKaTp3weMBC//r7TPtNVI3noXYh5fSw+vrfqQFnnXPu3RN0GN
 g6QUu7JyHP23yB4oSAyfAJNfHNfKgnu5+Ak5K/F5PPX2YzjvifubNwkurdoynG7o
 UE67X4wMctbi8csPamb4loeMm56JFXYHWpp135h+vGgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S0HQY7
 dtkeQzQrGK4DRPVc6EFv4ywTAbHbgO9cP/mnY=; b=tWWb7ARQvVeHpGmhl6w6/N
 kfQYEo+X9iEYTUSnQtKoLBMmhBlGoZJ4aLBQEbt0tx/B3zy58HYDWP5lP2ZEJF/2
 jH05TERq+gqCmSuFyeFg2W9zVGM1IxTRiu0Uz2QYuubEwzSlIItWdmTvhDmuUnuu
 jB1NWTtYz5yxcdI+6Y+CHzHzOgHOGpYZYbiaO6SJUBqdT+xcP4ci8okY5rkKwRD5
 aoV4GBvzQb3fCVwMtARKxkxCbMPnyMVmovULOkZgDrSytEc/Q6+rLtOg0gOPVJnS
 0KGZYxSVVGhq9dPluNKYmI9qDgIZaCubD7S/XA1+sVyUxNGnxoEObU5V/3Gy6xFQ
 ==
X-ME-Sender: <xms:ob22XL3XzPAPGr8-GmoZnc3QVnEUCNYXWPnVbd0rDGMsBkBoZdbYuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedvgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhgurhgvficu
 lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtvddrke
 durddukedrvdeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ob22XDADRF3JSTFNiPJ1pyAG5K43V6tfiX3yT0SsyfbGBfWo_wymZQ>
 <xmx:ob22XHfDS7dp82x5RXPePApf34bxefrvKlvNwGM2okkPbrnqpKA5ag>
 <xmx:ob22XA5lBHiBO7CibCO_-8J7HNmokQ_g7Oz2d2qSE2e0nBQwckDBDw>
 <xmx:or22XP09g0Z7lRkel0unY65WqNYteUznUHt0X_djYDf8fmY36KqMEg>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id ABF55103C8;
 Wed, 17 Apr 2019 01:46:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Andrew Jeffery <andrew@aj.id.au>, eajames@linux.ibm.com,
 clg@kaod.org, gkeishin@in.ibm.com, Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] Revert "mtd: spi-nor: Add a post BFPT fixup for MX25L25635E"
Date: Wed, 17 Apr 2019 15:15:11 +0930
Message-Id: <20190417054511.29291-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.19.1
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
X-List-Received-Date: Wed, 17 Apr 2019 05:46:18 -0000

This reverts commit 2bffa65da43e399079dad5947c6aa9ab3cfa4ad4.

5.0.x fails to boot on Witherspoon machines after an AC-cycle, with the
following error:

> [    4.337766] ubi0: default fastmap pool size: 25
> [    4.342321] ubi0: default fastmap WL pool size: 12
> [    4.347232] ubi0: attaching mtd3
> [    4.361487] ubi0: scanning is finished
> [    4.365525] ubi0 error: ubi_read_volume_table: the layout volume was not found
> [    4.372989] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22
> [    4.380193] UBI error: cannot attach mtd3

Which leads to:

> [    4.553478] VFS: Cannot open root device "ubiblock0_1" or unknown-block(0,0): error -6
> [    4.561550] Please append a correct "root=" boot option; here are the available partitions:
> [    4.570029] 1f00           32768 mtdblock0
> [    4.570038]  (driver?)
> [    4.576671] 1f01             384 mtdblock1
> [    4.576680]  (driver?)
> [    4.583234] 1f02             128 mtdblock2
> [    4.583240]  (driver?)
> [    4.589883] 1f03           32256 mtdblock3
> [    4.589892]  (driver?)
> [    4.596520] 1f04           32768 mtdblock4
> [    4.596529]  (driver?)
> [    4.603080] 1f05             384 mtdblock5
> [    4.603085]  (driver?)
> [    4.609711] 1f06             128 mtdblock6
> [    4.609719]  (driver?)
> [    4.616338] 1f07           32256 mtdblock7
> [    4.616347]  (driver?)
> [    4.622901] 1f08          131072 mtdblock8
> [    4.622907]  (driver?)
> [    4.629539] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

A hint is provided earlier in the boot process:

> [    0.920597] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> [    0.926753] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
> [    0.932704] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
> [    0.940230] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB
> [    0.947812] aspeed-smc 1e620000.spi: read control register: 203c0641
> [    1.435022] 3 fixed-partitions partitions found on MTD device bmc
> [    1.441249] Creating 3 MTD partitions on "bmc":
> [    1.445911] 0x000000000000-0x000000060000 : "u-boot"
> [    1.455264] 0x000000060000-0x000000080000 : "u-boot-env"
> [    1.465042] 0x000000080000-0x000002000000 : "obmc-ubi"
> [    1.474914] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> [    1.481102] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
> [    1.487175] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 - 0x24000000 ] 32MB
> [    1.494592] aspeed-smc 1e620000.spi: CE2 window [ 0x24000000 - 0x2c000000 ] 128MB
> [    1.502173] aspeed-smc 1e620000.spi: read control register: 203c0041
> [    1.705799] aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> [    1.717393] 3 fixed-partitions partitions found on MTD device alt-bmc
> [    1.723851] Creating 3 MTD partitions on "alt-bmc":
> [    1.728890] 0x000000000000-0x000000060000 : "alt-u-boot"
> [    1.738950] 0x000000060000-0x000000080000 : "alt-u-boot-env"
> [    1.748975] 0x000000080000-0x000002000000 : "alt-obmc-ubi"

Specifically, the control register state is exposed as:

> [    0.947812] aspeed-smc 1e620000.spi: read control register: 203c0641

The 0x3c opcode translates to DREAD4B for the mx25l25635f part, which is
what is detected. The post BFPT fixup implemented in commit 2bffa65da43e
("mtd: spi-nor: Add a post BFPT fixup for MX25L25635E") detects the 'e'
vs 'f' part based on the reported support for
BFPT_DWORD5_FAST_READ_4_4_4, which implies 4B opcodes are supported
(e.g. DREAD4B), however the aspeed-smc driver fails to put the
controller into the right addressing mode to support sending DREAD4B, and
so we reach a bad state.

In the interim, revert the upstream patch adding 'e' vs 'f' detection to
avoid sending 4B opcodes.

The revert has been tested on a freshly flashed and power-cycled
Witherspoon, both with and without the patch applied, confirming the
broken behaviour in the former case and a successful boot in the latter.

Cc: Andrew Geissler <geissonator@gmail.com>
Reported-by: George Keishing <gkeishin@in.ibm.com>
Investigated-by: Cédric Le Goater <clg@kaod.org>
Investigated-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5a5a47651bf9..9f85ab5fc569 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1681,31 +1681,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 		.addr_width = 3,					\
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
-static int
-mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
-			    const struct sfdp_parameter_header *bfpt_header,
-			    const struct sfdp_bfpt *bfpt,
-			    struct spi_nor_flash_parameter *params)
-{
-	/*
-	 * MX25L25635F supports 4B opcodes but MX25L25635E does not.
-	 * Unfortunately, Macronix has re-used the same JEDEC ID for both
-	 * variants which prevents us from defining a new entry in the parts
-	 * table.
-	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
-	 * seems that the F version advertises support for Fast Read 4-4-4 in
-	 * its BFPT table.
-	 */
-	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	return 0;
-}
-
-static struct spi_nor_fixups mx25l25635_fixups = {
-	.post_bfpt = mx25l25635_post_bfpt_fixups,
-};
-
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -1843,9 +1818,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-			 .fixups = &mx25l25635_fixups },
+	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.19.1
