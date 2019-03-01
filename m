Return-Path: <wen.yang99@zte.com.cn>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=202.103.147.172; helo=mxct.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449kLh1hXNzDqQ8
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 20:16:28 +1100 (AEDT)
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Forcepoint Email with ESMTPS id 0048A6929E0059AF8023;
 Fri,  1 Mar 2019 16:57:31 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse01.zte.com.cn with ESMTP id x218vKSM087213;
 Fri, 1 Mar 2019 16:57:20 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019030116575888-2499047 ;
 Fri, 1 Mar 2019 16:57:58 +0800 
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
 Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 11/15] ARM: versatile: fix a leaked reference by addingmissing
 of_node_put
Date: Fri, 1 Mar 2019 16:56:52 +0800
Message-Id: <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-03-01 16:57:58,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-03-01 16:57:04, Serialize complete at 2019-03-01 16:57:04
X-MAIL: mse01.zte.com.cn x218vKSM087213
X-Mailman-Approved-At: Mon, 04 Mar 2019 13:02:07 +1100
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
X-List-Received-Date: Fri, 01 Mar 2019 09:16:28 -0000

The call to of_get_next_child returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./arch/arm/mach-versatile/versatile_dt.c:315:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
./arch/arm/mach-versatile/versatile_dt.c:320:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-versatile/versatile_dt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
index e9d6068..028463a 100644
--- a/arch/arm/mach-versatile/versatile_dt.c
+++ b/arch/arm/mach-versatile/versatile_dt.c
@@ -312,12 +312,12 @@ static void __init versatile_dt_pci_init(void)
 		 * driver had it so we will keep it.
 		 */
 		writel(1, versatile_sys_base + VERSATILE_SYS_PCICTL_OFFSET);
-		return;
+		goto out_put_node;
 	}
 
 	newprop = kzalloc(sizeof(*newprop), GFP_KERNEL);
 	if (!newprop)
-		return;
+		goto out_put_node;
 
 	newprop->name = kstrdup("status", GFP_KERNEL);
 	newprop->value = kstrdup("disabled", GFP_KERNEL);
@@ -325,6 +325,9 @@ static void __init versatile_dt_pci_init(void)
 	of_update_property(np, newprop);
 
 	pr_info("Not plugged into PCI backplane!\n");
+
+out_put_node:
+	of_node_put(np);
 }
 
 static void __init versatile_dt_init(void)
-- 
2.9.5
