Return-Path: <xow@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxSD604yqzDr2g
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 10:56:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g94eoeoW"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id t186so7751183pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 17:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16dvwAzYw7tBcIlDp8W2dg4pufUeyFnOmQ5LGbQyF6w=;
 b=g94eoeoWMWPy+8JGHuC0Ybns2d0E5mFCq78reyLSR/RknfIU5TRF43xo76cG+PeURm
 JUIQnRknqpnPb+o+qg5qCsP+QC6nIkWyPeFxNYb+SCrEPUIrHN0m4RimR9UV836MmOVw
 EFcs2FWFbmDtcz54CySJxfq0ss1+m5OE7+Es4r2PEiIRpEl7cHsi+yLUSpQTM93gnRKN
 /D1nm9rqha3luDYZx0CATe81vrVQ9e/0Wdi/t9b68ivB1bEoT15SYmsYwJzHqZYoqhHU
 5IZC3E/eLTGydL3SP8/4AHlemK6mcB3p6bz5Fp6yw9+XDrOB9XE9Pw+mZj2rqga4H5sJ
 hGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16dvwAzYw7tBcIlDp8W2dg4pufUeyFnOmQ5LGbQyF6w=;
 b=ChFofneEp924+cxUnVZPhFxPqxbi0pabmflrrbkIQalDG0C9xCcZFShquOfOJ5W0g4
 POMJkcscZ37Zl67ddCmwp39xw/X+KA3gVBPtn3LMU0yBhCvxg5ZE3XeggjFEK9yaHk8O
 +aFGK61+myqRIJxYA8DIJk7D+HKCbkDsYfLj4gg+cMjPyXc0EZLcVlX6oKUYuK03jt60
 W5fVItuy+pRJqNjH7dcD/qbQeaqz3E6cyKgN7D0vvG+YkDhzTZdBdxkJ7K1zhcRhpBr8
 YZUMJYbRFI/bvPsOxy3EaSb7JxHWm/0K9jdIkdtu747w57bjYL9Uo2ypnO/dtL7WVvNI
 n7Xg==
X-Gm-Message-State: AKS2vOzFJ+W4htdrfmxKC726SJ57lkQmqc2WKubwGTjVVzvBfzY+XUg3
 MKeDfBSed9WRlvZOKAa+Ow==
X-Received: by 10.84.232.135 with SMTP id i7mr2951481plk.300.1498524977867;
 Mon, 26 Jun 2017 17:56:17 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id 189sm2019220pfd.50.2017.06.26.17.56.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 26 Jun 2017 17:56:16 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 4.10] ARM: aspeed: zaius: Fix FSI GPIO mapping matching
Date: Mon, 26 Jun 2017 17:55:50 -0700
Message-Id: <20170627005550.59771-1-xow@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 27 Jun 2017 00:56:22 -0000

Zaius changes FSI GPIO mappings dynamically based on board revision
fuses. The GPIO lookup tables used matches the FSI device tree node name
that is used prior to a3f0f300d74d05977a21a6941979414a78360d89. Now they
no longer work as intended to configure the FSI driver.

Update the lookup table device name match string.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 32eb36183e92..420a8d0344da 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -138,7 +138,7 @@ static void __init do_zaius_setup(void)
 	/* EVT boards have different FSI pin mappings */
 	if (board_rev < 0x08) {
 		static struct gpiod_lookup_table fsi_evt_gpio_lookup = {
-			.dev_id = "fsi-master",
+			.dev_id = "gpio-fsi",
 			.table = {
 				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 3),
 					    "clock", GPIO_ACTIVE_HIGH),
@@ -150,7 +150,7 @@ static void __init do_zaius_setup(void)
 		gpiod_add_lookup_table(&fsi_evt_gpio_lookup);
 	} else {
 		static struct gpiod_lookup_table fsi_gpio_lookup = {
-			.dev_id = "fsi-master",
+			.dev_id = "gpio-fsi",
 			.table = {
 				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 0),
 					    "clock", GPIO_ACTIVE_HIGH),
-- 
2.13.1.611.g7e3b11ae1-goog
