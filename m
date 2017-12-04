Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yqytR4wdzzDwNN
 for <openbmc@lists.ozlabs.org>; Mon,  4 Dec 2017 19:37:35 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2017 00:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,358,1508828400"; d="scan'208";a="10202120"
Received: from bmclab-s2600wtt.sh.intel.com ([10.239.182.71])
 by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2017 00:37:29 -0800
From: Yong Li <yong.b.li@linux.intel.com>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Cc: yong.b.li@linux.intel.com,
	Rick Altherr <raltherr@google.com>
Subject: [PATCH linux dev-4.10 1/1] pinctrl: aspeed: Allow disabling Port D
 and Port E loopback mode
Date: Mon,  4 Dec 2017 16:30:03 +0800
Message-Id: <1512376203-147224-2-git-send-email-yong.b.li@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
References: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Dec 2017 08:37:36 -0000

From: Rick Altherr <raltherr@google.com>

Port D and port E GPIO loopback modes are commonly enabled via hardware
straps for use with front-panel buttons.  When the BMC is powered
off or fails to boot, the front-panel buttons are directly connected to
the host chipset via the loopback to allow direct power-on and reset
control. Once the BMC has booted, the loopback mode must be disabled for
the BMC to take over control of host power-on and reset.

Disabling these loopback modes requires writing to the hardware strap
register which violates the current design of assuming the system
designer chose the strap settings for a specific reason and they should
be treated as read-only. Only the two bits of the strap register related
to these loopback modes are allowed to be written and comments have been
added to explain why.

Signed-off-by: Rick Altherr <raltherr@google.com>
Acked-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 3dcf825..a86a4d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -198,9 +198,19 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		 * them. This may mean that certain functions cannot be
 		 * deconfigured and is the reason we re-evaluate after writing
 		 * all descriptor bits.
+		 *
+		 * Port D and port E GPIO loopback modes are the only exception
+		 * as those are commonly used with front-panel buttons to allow
+		 * normal operation of the host when the BMC is powered off or
+		 * fails to boot. Once the BMC has booted, the loopback mode
+		 * must be disabled for the BMC to control host power-on and
+		 * reset.
 		 */
-		if ((desc->reg == HW_STRAP1 || desc->reg == HW_STRAP2) &&
-				desc->ip == ASPEED_IP_SCU)
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
+		    !(desc->mask & (BIT(21) | BIT(22))))
+			continue;
+
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
 		ret = regmap_update_bits(maps[desc->ip], desc->reg,
-- 
2.7.4
