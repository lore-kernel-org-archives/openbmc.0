Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g1Zl3H13zF1n3
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:08:30 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4816hrQ022397;
 Mon, 7 May 2018 20:07:17 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 3/6] fsi/fsi-master-gpio: Sample input data on
 different clock phase
Date: Tue,  8 May 2018 11:06:37 +1000
Message-Id: <20180508010640.14113-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508010640.14113-1-benh@kernel.crashing.org>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 08 May 2018 01:08:34 -0000

We currently sample the input data right after we toggle the
clock low, then high. The slave establishes the data on the
rising edge, so this is not ideal. We should sample it on
the low phase instead.

This currently works because we have an extra delay, but subsequent
patches will remove it.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 4295a46780cb..d6508bbad1fb 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -86,12 +86,15 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
 	}
 }
 
-static int sda_in(struct fsi_master_gpio *master)
+static int sda_clock_in(struct fsi_master_gpio *master)
 {
 	int in;
 
 	ndelay(FSI_GPIO_STD_DLY);
+	gpiod_set_value(master->gpio_clk, 0);
 	in = gpiod_get_value(master->gpio_data);
+	ndelay(FSI_GPIO_STD_DLY);
+	gpiod_set_value(master->gpio_clk, 1);
 	return in ? 1 : 0;
 }
 
@@ -126,8 +129,7 @@ static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *msg,
 	set_sda_input(master);
 
 	for (bit = 0; bit < num_bits; bit++) {
-		clock_toggle(master, 1);
-		in_bit = sda_in(master);
+		in_bit = sda_clock_in(master);
 		msg->msg <<= 1;
 		msg->msg |= ~in_bit & 0x1;	/* Data is active low */
 	}
-- 
2.17.0
