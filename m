Return-Path: <wen.yang99@zte.com.cn>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=202.103.147.172; helo=mxct.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
X-Greylist: delayed 983 seconds by postgrey-1.36 at bilbo;
 Fri, 01 Mar 2019 20:13:27 AEDT
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449kHC3NwXzDqQ9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 20:13:27 +1100 (AEDT)
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Forcepoint Email with ESMTPS id EF3AE2ACC4777F4E14F6;
 Fri,  1 Mar 2019 16:57:12 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse01.zte.com.cn with ESMTP id x218v1Zh086712;
 Fri, 1 Mar 2019 16:57:01 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019030116574040-2498968 ;
 Fri, 1 Mar 2019 16:57:40 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: liviu.dudau@arm.com
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
 michal.simek@xilinx.com, afaerber@suse.de,
 manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com, openbmc@lists.ozlabs.org,
 xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org,
 catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 fabio.estevam@nxp.com, linux-imx@nxp.com, wang.yi59@zte.com.cn,
 Wen Yang <wen.yang99@zte.com.cn>, Fabio Estevam <festevam@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 05/15] ARM: imx51: fix a leaked reference by addingmissing
 of_node_put
Date: Fri, 1 Mar 2019 16:56:46 +0800
Message-Id: <1551430616-42014-5-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-03-01 16:57:40,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-03-01 16:56:46, Serialize complete at 2019-03-01 16:56:46
X-MAIL: mse01.zte.com.cn x218v1Zh086712
X-Mailman-Approved-At: Mon, 04 Mar 2019 13:02:06 +1100
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
X-List-Received-Date: Fri, 01 Mar 2019 09:13:28 -0000

The call to of_get_next_child returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./arch/arm/mach-imx/mach-imx51.c:64:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 57, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-imx/mach-imx51.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/mach-imx51.c b/arch/arm/mach-imx/mach-imx51.c
index c7169c2..08c7892 100644
--- a/arch/arm/mach-imx/mach-imx51.c
+++ b/arch/arm/mach-imx/mach-imx51.c
@@ -59,6 +59,7 @@ static void __init imx51_m4if_setup(void)
 		return;
 
 	m4if_base = of_iomap(np, 0);
+	of_node_put(np);
 	if (!m4if_base) {
 		pr_err("Unable to map M4IF registers\n");
 		return;
-- 
2.9.5
