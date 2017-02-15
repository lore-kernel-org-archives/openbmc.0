Return-Path: <raltherr@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNTQ71g3dzDqCc
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 17:09:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QBCOuzac"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id 189so28928398pfu.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 22:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iLlgMP/++3VizEc7ua2kVYNY5U/WrQkNP7lfzUlKYuo=;
 b=QBCOuzacNtjoQ/qZZngJAKAZYsUhOlZ1sNVgorh2xsg2et1NoEYu8FxQVpBmrUei/v
 D5kbWX3WRfzXNfJZ1tfYM28inzjzVYDvkpHtwJKvZ/WB93lNhrEWaHpRn+LAWaeXmVZv
 ga8WJy/aF8540ayCHWLdrOytttBImp6LCecSCX1x8Sg3YRMBf6939S1u85T4NU2qzS8O
 qfWd2CqUrY5l72K1AB9QqrPm8LeG/dpAW972dnR+fzlYbd7SLDhjQ4O2ocPwsdlegfIg
 DuqedX4LYqzU4KGbQg3O8OZqtQEVjqMYWsUOkiAOfqch5xJcskFidbZmXDGg4TxRjmxU
 cAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iLlgMP/++3VizEc7ua2kVYNY5U/WrQkNP7lfzUlKYuo=;
 b=W+stgdRInpizQmjX95izkh48gucWClrmECkwsPIwmIdPSpuP24CqPubrW3nowX7czt
 2PYnG+GEDlbV1p95W80iglVIRwJCbLZp4nHM7WLKxkhJNCSrghHL6ynDU2m53SBwbj8H
 BWLnVISDUDWFe8T6H3zVGUgZ+OeVVKU0hR90eXzirmyNl7l8wNCVoWtRA2uXcm4rFAWU
 rOI1WLK++NI4hr6ADTx37V1mQDES+V/qLSa1CEEXCtMd/NrrsWYyJahxQCsrhC8RqoEt
 esD2SG8EVrAaXs7Sy++wRp2m2ZeZRmxunS9sTkWX6taDnynyitVGw3whVh4SK6Mx2W6+
 bKbg==
X-Gm-Message-State: AMke39lTE3Nbkn0ih8IwoCSymGoVAeXsszfiXVhLByyLdnXTr3k34v5U9RxZfsRVzsvu2AKi
X-Received: by 10.84.176.100 with SMTP id u91mr41365713plb.112.1487138956448; 
 Tue, 14 Feb 2017 22:09:16 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id z70sm4657837pff.26.2017.02.14.22.09.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Feb 2017 22:09:15 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux] aspeed: pinctrl: Allow disabling Port D and Port E
 loopback mode
Date: Tue, 14 Feb 2017 22:09:14 -0800
Message-Id: <20170215060914.5952-1-raltherr@google.com>
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
X-List-Received-Date: Wed, 15 Feb 2017 06:09:19 -0000

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
