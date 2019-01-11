Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oe900o0M"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lxfYi/BH"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bT8H32kyzDqws
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:37:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 75DB6157F;
 Thu, 10 Jan 2019 22:37:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=Drlj8XPpA5ps8JCr3XEawOVFps
 SbvgBMABWHCVuGgzc=; b=oe900o0MlSjzsjaNJ1sIuuBmQXHm4rBjYGakdiZKGW
 DQja1KJxPELF5WUZNzcXL66URhQ5iIhJ3prk7nUwArSjgP55eSNM9lGtRrrmBh2v
 MPkIhXLl+tRRiqDWb1AHnZuavyZhpu+rxh49cEdp2qT4AcKSq+l3xmlHFGRvCqmu
 uyc5MQ1lHSxr+xzuLp/pMbEX17F4HdeQTioI+LlUKx9cD6O3GnfUtfRrvLn4JAZj
 XOoqDEX2Lven3YHmabuUVVJvuNnW3TyZLtCKD29LKxJFZUDUlFq7cM7nWzjtm8bp
 Ll0f7OdkxGqRUFgbdBo/4WSZrez8kyX/L8ELlI874dGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Drlj8XPpA5ps8JCr3
 XEawOVFpsSbvgBMABWHCVuGgzc=; b=lxfYi/BH+PFQuPj7e5CROGOnwjP+LLAAk
 LkQJMhyZWGqaKyyfQejbXDf28F2ZeL7j7vcWZiY3rGONg49p+Eo0KgqjgXBIwaLE
 cvpv7jRNbgX0mGBDMDBCHn69vF6s4dJR+Jp7192XaaqhY3ihbXC/S5EHM9uicApH
 LYnXptwrwlrpENqWqGRI6NuQAmpmpIFTm5PG9IqYxy2la3L/pzdSrgoIFWOvArsl
 yLqmZmk15K3e3nEwkMaNXRsgPzhzbADiG19lVwKFh9AM0aPVVH8wRuiPzZqku1jj
 dGEqEgtcrcd+CI/YIsQtQeFGiJgiz6Bky/aA/H3j30z6D4Q+7dERA==
X-ME-Sender: <xms:ew84XJg38VIwIuiBC3C_GM_9N0nE5-iDMRhgz4WS1EmJe3t1thROsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnug
 hrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedv
 tddvrdekuddrudekrddvkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ew84XOupdqeMVzT8qOylWq-cn5vsPvjpfepX5ZA1LGxfh--h7FxESQ>
 <xmx:ew84XHRPiKAek4d2OGT_Fq2qRsCJaTOew1bvForcgPE2-lE-6BlRgg>
 <xmx:ew84XC1sqfp3lIvDRKl7yNAOpLzMutuR8_fuJfgCgN-8bojHa68wJg>
 <xmx:fA84XN-JNfj_8yVSB8vC6qrGjOFXeBMWvDePwLauXVcUk9wPPv6DpQ>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20670E425A;
 Thu, 10 Jan 2019 22:37:27 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC linux dev-4.19] clocksource: fttmr010: Detect back-pressure for
 Aspeed controllers
Date: Fri, 11 Jan 2019 14:06:28 +1030
Message-Id: <20190111033628.18677-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.19.1
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
X-List-Received-Date: Fri, 11 Jan 2019 03:37:40 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

See the cover letter on the corresponding qemu RFC series, to be sent after
this patch.

 arch/arm/mach-aspeed/Kconfig         | 1 +
 drivers/clocksource/timer-fttmr010.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 2d5570e6e186..6b82d5416cf0 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -7,6 +7,7 @@ menuconfig ARCH_ASPEED
 	select FTTMR010_TIMER
 	select MFD_SYSCON
 	select PINCTRL
+	select GENERIC_CLOCKEVENTS_MIN_ADJUST
 	help
 	  Say Y here if you want to run your kernel on an ASpeed BMC SoC.
 
diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index cf93f6419b51..f15386b98289 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -124,6 +124,7 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
 {
 	struct fttmr010 *fttmr010 = to_fttmr010(evt);
 	u32 cr;
+	u32 l;
 
 	/* Stop */
 	cr = readl(fttmr010->base + TIMER_CR);
@@ -136,6 +137,12 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
 		 * into TIMER1_COUNT register when the timer is re-enabled.
 		 */
 		writel(cycles, fttmr010->base + TIMER1_LOAD);
+#if CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST
+		/* QEMU model may provide back-pressure on requested period */
+		l = readl(fttmr010->base + TIMER1_LOAD);
+		if (l > cycles)
+			return -EINVAL;
+#endif
 	} else {
 		/* Setup the match register forward in time */
 		cr = readl(fttmr010->base + TIMER1_COUNT);
-- 
2.19.1
