Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lfhj2FqMzF2Ss
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 00:14:44 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4FDdfh4018930;
 Tue, 15 May 2018 16:39:41 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 8441)
 id AF06D5AA62; Tue, 15 May 2018 16:39:41 +0300 (IDT)
From: avifishman70@gmail.com
To: minyard@acm.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Cc: haiyue.wang@linux.intel.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v1 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
Date: Tue, 15 May 2018 16:38:34 +0300
Message-Id: <1526391514-17746-2-git-send-email-avifishman70@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1526391514-17746-1-git-send-email-avifishman70@gmail.com>
References: <1526391514-17746-1-git-send-email-avifishman70@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 14:14:46 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
---
 drivers/char/ipmi/kcs_bmc_npcm7xx.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 7bc898c5d372..5894561d061f 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -37,7 +37,14 @@
 #define KCS1CTL		0x18
 #define KCS2CTL		0x2A
 #define KCS3CTL		0x3C
-#define    KCS_CTL_IBFIE	BIT(0)
+
+#define KCS1IE		0x1C
+#define KCS2IE		0x2E
+#define KCS3IE		0x40
+
+#define KCS_CTL_IBFIE	BIT(0)
+#define KCS_IE_IRQE	BIT(0)
+#define KCS_IE_HIRQE	BIT(3)
 
 /*
  * 7.2.4 Core KCS Registers
@@ -48,12 +55,14 @@
  * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
  * dib: KCS Channel n Data In Buffer Register (KCSnDI).
  * ctl: KCS Channel n Control Register (KCSnCTL).
+ * ie : KCS Channel n  Interrupt Enable Register (KCSnIE).
  */
 struct npcm7xx_kcs_reg {
 	u32 sts;
 	u32 dob;
 	u32 dib;
 	u32 ctl;
+	u32 ie;
 };
 
 struct npcm7xx_kcs_bmc {
@@ -63,9 +72,9 @@ struct npcm7xx_kcs_bmc {
 };
 
 static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
-	{ .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
-	{ .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
-	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
+	{ .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL, .ie = KCS1IE },
+	{ .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL, .ie = KCS2IE },
+	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie = KCS3IE },
 };
 
 static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
@@ -95,6 +104,9 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 
 	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
 			   enable ? KCS_CTL_IBFIE : 0);
+
+	regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE | KCS_IE_HIRQE,
+			   enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
 }
 
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
-- 
2.14.1
