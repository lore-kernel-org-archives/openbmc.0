Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNVRC4CrszDqBs
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 17:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cWjIKTP8"; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 202so26201362pfx.2
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 22:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=iLlgMP/++3VizEc7ua2kVYNY5U/WrQkNP7lfzUlKYuo=;
 b=cWjIKTP8tL+FRRFhdEHXCYm7X4EpCC3dpk7dLPbMsoAl/tsJIWncURMYEEqjJSn7Vh
 iQRzwdHqC/zhfwdwrK856t9TGsRBMWWX9bzv7ib6BbEpMq2b/fxeO6axVurVO5+5/4tz
 Ai2npdTG5q7J87VTOwajwzsJexa7afeXbr5M+viqEX2YB7s+vkczZ44iSL7ZZKsiKViH
 PclKfOz2y+FzXqfG5V7ziEJAcoaaQRbdcHZRjtjEol54j869efiXkDe3RYoxVc1FlaKw
 FYQMB6DhJx2ZhwWB8W49WQPgAF2JGB1SCnXAAp8pvI4Kyn0ldVaVhg0hkR8SS5KtXi3n
 sK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=iLlgMP/++3VizEc7ua2kVYNY5U/WrQkNP7lfzUlKYuo=;
 b=NKw5d1KxFLswsfAl6sxoahgWoRjUHqLLMnYBWC1P7cpQ2yqnmjnZYjCOuYpMbeCjO/
 huCnMOevz2VRRcbDesOCtWZpAtHl+W5AosseMwP08tsN2e9CtJoBFuF57hPOR7PMXyzs
 Ruk9A9onoaXDJSPYtpP8XR27NHW0aEbX9U4cj3CLfPsf5EK5o/o2VLb0TUJ8x/A//9wz
 fKnCWQA5AhJpZf6XBjdXC42V/QqmHYbLaUmB3a6wA9aoXoR/aiz4oIzcA/EX3UMv/2J5
 ni/UNhQEAGsBy3EirlNut08K8mzjumXx5/b+J6xVPyiftLyfOL7kD0lmPjd+UCN8jybs
 CgPQ==
X-Gm-Message-State: AMke39laDodJq65Jc9IeWHHmLWKFPuhO/uDUS/9bd0/JMGKYUeov3e/pEq9n/MeQdBk2mI6U
X-Received: by 10.98.91.131 with SMTP id p125mr35832629pfb.165.1487141716649; 
 Tue, 14 Feb 2017 22:55:16 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id p26sm5000751pfj.23.2017.02.14.22.55.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Feb 2017 22:55:16 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: linus.walleij@linaro.org, andrew@aj.id.au, joel@jms.id.au, arnd@arndb.de,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [RESEND PATCH linux] aspeed: pinctrl: Allow disabling Port D and Port
 E loopback mode
Date: Tue, 14 Feb 2017 22:55:14 -0800
Message-Id: <20170215065514.16673-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2017 06:55:20 -0000

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
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 76f62bd45f02..5b49952e5fad 100644
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
2.11.0.483.g087da7b7c-goog
