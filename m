Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3x7fZY54ZCzDqk3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 01:17:40 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 13 Jul 2017 18:17:27 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6DFHR0g030129;
 Thu, 13 Jul 2017 18:17:27 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v6DETBli025784;
 Thu, 13 Jul 2017 17:29:11 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v6DET3Yq025599;
 Thu, 13 Jul 2017 17:29:03 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Rick Altherr <raltherr@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [PATCH linux dev-4.10] iio: aspeed-adc: wait for initial sequence.
Date: Thu, 13 Jul 2017 17:28:56 +0300
Message-Id: <20170713142856.25302-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Thu, 13 Jul 2017 15:17:42 -0000

This patch enables adc engine at initialization time and waits
for the initial sequence completion before enabling adc channels.

Without this code adc channels are not functional and shows
zeros for all connected channels.

Tested on mellanox msn platform.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 drivers/iio/adc/aspeed_adc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 2283ed2..e4ad6ef 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -22,6 +22,7 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/driver.h>
+#include <linux/iopoll.h>
 
 #define ASPEED_RESOLUTION_BITS		10
 #define ASPEED_CLOCKS_PER_SAMPLE	12
@@ -38,6 +39,11 @@
 
 #define ASPEED_ENGINE_ENABLE		BIT(0)
 
+#define ASPEED_ADC_CTRL_INIT_RDY	BIT(8)
+
+#define ASPEED_ADC_INIT_POLLING_TIME	500
+#define ASPEED_ADC_INIT_TIMEOUT		500000
+
 struct aspeed_adc_model_data {
 	const char *model_name;
 	unsigned int min_sampling_rate;	// Hz
@@ -210,6 +216,20 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		goto scaler_error;
 	}
 
+	/* Enable engine in normal mode. */
+	writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
+	       data->base + ASPEED_REG_ENGINE_CONTROL);
+
+	/* Wait for initial sequence complete. */
+	ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
+				 adc_engine_control_reg_val,
+				 adc_engine_control_reg_val &
+				 ASPEED_ADC_CTRL_INIT_RDY,
+				 ASPEED_ADC_INIT_POLLING_TIME,
+				 ASPEED_ADC_INIT_TIMEOUT);
+	if (ret)
+		goto scaler_error;
+
 	/* Start all channels in normal mode. */
 	clk_prepare_enable(data->clk_scaler->clk);
 	adc_engine_control_reg_val = GENMASK(31, 16) |
-- 
2.8.4
