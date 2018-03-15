Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402PcN031CzF0h9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 10:16:48 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w2FMprS3027467;
 Fri, 16 Mar 2018 00:51:53 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id B4D595AA86; Fri, 16 Mar 2018 01:10:16 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: arnd@arndb.de, venture@google.com, yuenn@google.co,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
Date: Fri, 16 Mar 2018 01:10:12 +0200
Message-Id: <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 15 Mar 2018 23:16:53 -0000

Enable L2 Cache in Nuvoton NPCM7xx BMC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/mach-npcm/npcm7xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
index 5f7cd88103ef..c5f77d854c4f 100644
--- a/arch/arm/mach-npcm/npcm7xx.c
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] = {
 DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
 	.atag_offset	= 0x100,
 	.dt_compat	= npcm7xx_dt_match,
+	.l2c_aux_val	= 0x0,
+	.l2c_aux_mask	= ~0x0,
 MACHINE_END
-- 
2.14.1
