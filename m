Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3x9yP05NG1zDrD3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 19:17:23 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 17 Jul 2017 12:17:16 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6H9HGm9004993;
 Mon, 17 Jul 2017 12:17:16 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v6H917DV012543;
 Mon, 17 Jul 2017 12:01:07 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v6H90hbk012002;
 Mon, 17 Jul 2017 12:00:43 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Rick Altherr <raltherr@google.com>, openbmc@lists.ozlabs.org,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [patch v2] iio: aspeed-adc: wait for initial sequence.
Date: Mon, 17 Jul 2017 12:00:35 +0300
Message-Id: <20170717090035.11691-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Mon, 17 Jul 2017 09:17:25 -0000

This patch enables adc engine at initialization time and waits
for the initial sequence completion before enabling adc channels.

Without this code adc channels are not functional and shows
zeros for all connected channels.

Tested on mellanox msn platform.

v1 -> v2:
Pointed by Rick Altherr:
 - Wait init sequence code enabled by bool
from OF match table.

Reviewed-by: Rick Altherr <raltherr@google.com>

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 drivers/iio/adc/aspeed_adc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 2283ed2..cfa7ee1 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -22,6 +22,7 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/driver.h>
+#include <linux/iopoll.h>
 
 #define ASPEED_RESOLUTION_BITS		10
 #define ASPEED_CLOCKS_PER_SAMPLE	12
@@ -38,11 +39,17 @@
 
 #define ASPEED_ENGINE_ENABLE		BIT(0)
 
+#define ASPEED_ADC_CTRL_INIT_RDY	BIT(8)
+
+#define ASPEED_ADC_INIT_POLLING_TIME	500
+#define ASPEED_ADC_INIT_TIMEOUT		500000
+
 struct aspeed_adc_model_data {
 	const char *model_name;
 	unsigned int min_sampling_rate;	// Hz
 	unsigned int max_sampling_rate;	// Hz
 	unsigned int vref_voltage;	// mV
+	bool wait_init_sequence;
 };
 
 struct aspeed_adc_data {
@@ -210,6 +217,24 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		goto scaler_error;
 	}
 
+	model_data = of_device_get_match_data(&pdev->dev);
+
+	if (model_data->wait_init_sequence) {
+		/* Enable engine in normal mode. */
+		writel(ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE,
+		       data->base + ASPEED_REG_ENGINE_CONTROL);
+
+		/* Wait for initial sequence complete. */
+		ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
+					 adc_engine_control_reg_val,
+					 adc_engine_control_reg_val &
+					 ASPEED_ADC_CTRL_INIT_RDY,
+					 ASPEED_ADC_INIT_POLLING_TIME,
+					 ASPEED_ADC_INIT_TIMEOUT);
+		if (ret)
+			goto scaler_error;
+	}
+
 	/* Start all channels in normal mode. */
 	clk_prepare_enable(data->clk_scaler->clk);
 	adc_engine_control_reg_val = GENMASK(31, 16) |
@@ -269,6 +294,7 @@ static const struct aspeed_adc_model_data ast2500_model_data = {
 	.vref_voltage = 1800, // mV
 	.min_sampling_rate = 1,
 	.max_sampling_rate = 1000000,
+	.wait_init_sequence = true,
 };
 
 static const struct of_device_id aspeed_adc_matches[] = {
-- 
2.8.4
