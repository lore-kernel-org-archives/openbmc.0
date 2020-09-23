Return-Path: <SRS0=27f3=DA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2818C2D0A8
	for <openbmc@archiver.kernel.org>; Wed, 23 Sep 2020 21:25:21 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED1B21D43
	for <openbmc@archiver.kernel.org>; Wed, 23 Sep 2020 21:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED1B21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxWRd6tVZzDqGh
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 07:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxWQC4YvJzDqVC
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 07:23:56 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08NLN8mr026845;
 Thu, 24 Sep 2020 00:23:08 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id EBDB3639D6; Thu, 24 Sep 2020 00:23:07 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v1] hw_random: npcm: modify readl to readb
Date: Thu, 24 Sep 2020 00:23:05 +0300
Message-Id: <20200923212305.198485-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: openbmc@lists.ozlabs.org, tmaimon77@gmail.com, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Modify the read size to the correct HW random
registers size, 8bit.
The incorrect read size caused and faulty
HW random value.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/npcm-rng.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 5d0d13f891b7..1ec5f267a656 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -58,24 +58,24 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 
 	pm_runtime_get_sync((struct device *)priv->rng.priv);
 
-	while (max >= sizeof(u32)) {
+	while (max) {
 		if (wait) {
-			if (readl_poll_timeout(priv->base + NPCM_RNGCS_REG,
+			if (readb_poll_timeout(priv->base + NPCM_RNGCS_REG,
 					       ready,
 					       ready & NPCM_RNG_DATA_VALID,
 					       NPCM_RNG_POLL_USEC,
 					       NPCM_RNG_TIMEOUT_USEC))
 				break;
 		} else {
-			if ((readl(priv->base + NPCM_RNGCS_REG) &
+			if ((readb(priv->base + NPCM_RNGCS_REG) &
 			    NPCM_RNG_DATA_VALID) == 0)
 				break;
 		}
 
-		*(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
-		retval += sizeof(u32);
-		buf += sizeof(u32);
-		max -= sizeof(u32);
+		*(u8 *)buf = readb(priv->base + NPCM_RNGD_REG);
+		retval++;
+		buf++;
+		max--;
 	}
 
 	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-- 
2.22.0

