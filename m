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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ld9x4m2nzF27V
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 23:06:29 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4FD5wMF006300;
 Tue, 15 May 2018 08:05:59 -0500
Message-ID: <d7c1b4c513fb4d2d96cb1ff3735b7b27c14d336e.camel@kernel.crashing.org>
Subject: [PATCH linux dev-4.13] fsi/fsi-master-gpio: Delay sampling of FSI
 data input
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 15 May 2018 23:05:58 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 15 May 2018 13:06:30 -0000

Most SoC GPIO implementations, including the Aspeed one, have
synchronizers on the GPIO inputs. This means that the value
read from a GPIO is a couple of clocks old, from whatever clock
source feeds those synchronizers.

In practice, this means that in no-delay mode, we are using a
value that can potentially be a bit too old and too close to
the clock edge establishing the data on the other side of the link.

The voltage converters we use on some systems make this worse
and sensitive to things like voltage fluctuations etc... This is,
we believe, the cause of occasional CRC errors encountered during
heavy activity on the LPC bus.

This is fixed by introducing a dummy GPIO read before the actual
data read. It slows down SBEFIFO by about 15% (less than any delay
primitive) and the end result is so far solid.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 98700eac16fd..36a71efd802c 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -98,6 +98,11 @@ static int sda_clock_in(struct fsi_master_gpio *master)
 	if (!master->no_delays)
 		ndelay(FSI_GPIO_STD_DLY);
 	gpiod_set_value(master->gpio_clk, 0);
+
+	/* Dummy read to feed the synchronizers */
+	gpiod_get_value(master->gpio_data);
+
+	/* Actual data read */
 	in = gpiod_get_value(master->gpio_data);
 	if (!master->no_delays)
 		ndelay(FSI_GPIO_STD_DLY);
