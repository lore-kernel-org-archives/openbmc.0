Return-Path: <raltherr@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpwPg2t42zDq93
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 05:41:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y72VYuHH"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id w20so25454791pgc.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2OoaTmmmAbiW0G9ARb4y1xDq8BCypmJNc6PSOp5qbsY=;
 b=Y72VYuHHPafzlPjrEFJ0n9SiXsgnlx42PgNAC0//mazZJna3T1vNJmW0hbsKck9FY8
 3YoctZNE/Tq5vzoTHHNDN2wbROmW3pl1u5RwuTQZUZ3Uy9jSy7bKkiAEday0A3EauCnj
 Buk00Fj2DHxK3oYda9vSPexQLq9CHtGrfZJBlfntPcMlp8Mg4DrxXI8nhu1nWmhzbXc8
 bASnTtjlSmhXiF/UJjQmY6UjMonSSVX6m+cb9abqY8ioFd9y++xmX8OwZo6KDLaBtAFu
 ZFGNxXTgpJNqoMTCBfFN9HMh8Bgr6VXLA9x9sLGLfx2G3lhpxW1TzViXnbDZfHqaGDV6
 pUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2OoaTmmmAbiW0G9ARb4y1xDq8BCypmJNc6PSOp5qbsY=;
 b=Fntm4YCSjGn5vfdMI1OSfRtu+PkZUNkhPjdaIUlBDDk5yTU7Blv6BE5E1zP7OA+kjD
 clc3i/SjllUv02vk/Rajmyb7oeNX5g9RVHoYhANCmSLPwWmRzg8cpa1xCFzIGDiZ9dJn
 S6xCblURMHZGpp+w70f+NjXuum7+KEvYfxcVLHEk7STsh9FNjozLnzOtf0S/raDHHCEB
 E5gGfYVw4BbEv856uyCK+ISy0kjQ2NcO1SYhwIcIeRnAMpC4dOvEu39yREwSIcX6oTTA
 TqyHxeknjk6h+czosJSCuGeSQNfEkktcIjtUF2/QRVyh8AmJWtOWm/OE90Sg9S78iToT
 WLug==
X-Gm-Message-State: AFeK/H3MRN9+P1SSIIDxkj+RCpyFUAlkn5WGbNgLdWSKpcZkcZYSDGyXaqmLBveVejm0poox
X-Received: by 10.84.238.207 with SMTP id l15mr5490741pln.90.1490294501121;
 Thu, 23 Mar 2017 11:41:41 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id b14sm11679951pfh.114.2017.03.23.11.41.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 Mar 2017 11:41:39 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-clk@vger.kernel.org,
 Andreas Klinger <ak@it-klinger.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Alison Schofield <amsfield22@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Crestez Dan Leonard <leonard.crestez@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v4 2/2] iio: Aspeed ADC
Date: Thu, 23 Mar 2017 11:41:35 -0700
Message-Id: <20170323184136.7349-2-raltherr@google.com>
X-Mailer: git-send-email 2.12.1.500.gab5fba24ee-goog
In-Reply-To: <20170323184136.7349-1-raltherr@google.com>
References: <20170323184136.7349-1-raltherr@google.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 18:41:44 -0000

Aspeed BMC SoCs include a 16 channel, 10-bit ADC. Low and high threshold
interrupts are supported by the hardware but are not currently implemented.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v4:
- Avoid copying per-model data to per-instance data

Changes in v3:
- Drop model numbers from description as same IP is used in every generation
- Remove unused macros
- Shorten macro prefix to just ASPEED_
- Remove extraneous whitespace
- Rename 2nd argument of ASPEED_CHAN() to clarify purpose
- Use existing macros in place of magic constants
- Remove unnecessary logging in failure conditions during probe
- Disable ADC hardware during remove()
- Add a NULL terminator to of_match_table
- Add per-model data to accomodate slight variations (vref, min/max sample rate)
- Added missing Kconfig depends on COMMON_CLK

Changes in v2:
- Rewritten as an IIO device
- Renamed register macros to describe the register's purpose
- Replaced awkward reading of 16-bit data registers with readw()
- Added Kconfig dependency on COMPILE_TEST

 drivers/iio/adc/Kconfig      |  11 ++
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/aspeed_adc.c | 284 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 drivers/iio/adc/aspeed_adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 2268a6fb9865..236d05f99e80 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -130,6 +130,17 @@ config AD799X
 	  To compile this driver as a module, choose M here: the module will be
 	  called ad799x.
 
+config ASPEED_ADC
+	tristate "Aspeed ADC"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  If you say yes here you get support for the ADC included in Aspeed
+	  BMC SoCs.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called aspeed_adc.
+
 config AT91_ADC
 	tristate "Atmel AT91 ADC"
 	depends on ARCH_AT91
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 73dbe399f894..306f10ffca74 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_AD7791) += ad7791.o
 obj-$(CONFIG_AD7793) += ad7793.o
 obj-$(CONFIG_AD7887) += ad7887.o
 obj-$(CONFIG_AD799X) += ad799x.o
+obj-$(CONFIG_ASPEED_ADC) += aspeed_adc.o
 obj-$(CONFIG_AT91_ADC) += at91_adc.o
 obj-$(CONFIG_AT91_SAMA5D2_ADC) += at91-sama5d2_adc.o
 obj-$(CONFIG_AXP288_ADC) += axp288_adc.o
diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
new file mode 100644
index 000000000000..e051fdf8ecbd
--- /dev/null
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -0,0 +1,284 @@
+/*
+ * Aspeed AST2400/2500 ADC
+ *
+ * Copyright (C) 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ */
+
+#include <asm/io.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <linux/iio/iio.h>
+#include <linux/iio/driver.h>
+
+#define ASPEED_RESOLUTION_BITS		10
+#define ASPEED_CLOCKS_PER_SAMPLE	12
+
+#define ASPEED_REG_ENGINE_CONTROL	0x00
+#define ASPEED_REG_INTERRUPT_CONTROL	0x04
+#define ASPEED_REG_VGA_DETECT_CONTROL	0x08
+#define ASPEED_REG_CLOCK_CONTROL	0x0C
+#define ASPEED_REG_MAX			0xC0
+
+#define ASPEED_OPERATION_MODE_POWER_DOWN	(0x0 << 1)
+#define ASPEED_OPERATION_MODE_STANDBY		(0x1 << 1)
+#define ASPEED_OPERATION_MODE_NORMAL		(0x7 << 1)
+
+#define ASPEED_ENGINE_ENABLE		BIT(0)
+
+struct aspeed_adc_model_data {
+	const char *model_name;
+	unsigned int min_sampling_rate;	// Hz
+	unsigned int max_sampling_rate;	// Hz
+	unsigned int vref_voltage;	// mV
+};
+
+struct aspeed_adc_data {
+	struct device	*dev;
+	void __iomem	*base;
+	spinlock_t	clk_lock;
+	struct clk_hw	*clk_prescaler;
+	struct clk_hw	*clk_scaler;
+};
+
+#define ASPEED_CHAN(_idx, _data_reg_addr) {			\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (_idx),					\
+	.address = (_data_reg_addr),				\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
+}
+
+static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
+	ASPEED_CHAN(0, 0x10),
+	ASPEED_CHAN(1, 0x12),
+	ASPEED_CHAN(2, 0x14),
+	ASPEED_CHAN(3, 0x16),
+	ASPEED_CHAN(4, 0x18),
+	ASPEED_CHAN(5, 0x1A),
+	ASPEED_CHAN(6, 0x1C),
+	ASPEED_CHAN(7, 0x1E),
+	ASPEED_CHAN(8, 0x20),
+	ASPEED_CHAN(9, 0x22),
+	ASPEED_CHAN(10, 0x24),
+	ASPEED_CHAN(11, 0x26),
+	ASPEED_CHAN(12, 0x28),
+	ASPEED_CHAN(13, 0x2A),
+	ASPEED_CHAN(14, 0x2C),
+	ASPEED_CHAN(15, 0x2E),
+};
+
+static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       int *val, int *val2, long mask)
+{
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+	const struct aspeed_adc_model_data *model_data =
+			of_device_get_match_data(data->dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*val = readw(data->base + chan->address);
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		*val = model_data->vref_voltage;
+		*val2 = ASPEED_RESOLUTION_BITS;
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*val = clk_get_rate(data->clk_scaler->clk) /
+				ASPEED_CLOCKS_PER_SAMPLE;
+		return IIO_VAL_INT;
+
+	default:
+		return -EPERM;
+	}
+}
+
+static int aspeed_adc_write_raw(struct iio_dev *indio_dev,
+				struct iio_chan_spec const *chan,
+				int val, int val2, long mask)
+{
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+	const struct aspeed_adc_model_data *model_data =
+			of_device_get_match_data(data->dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		if (val < model_data->min_sampling_rate ||
+			val > model_data->max_sampling_rate)
+			return -EINVAL;
+
+		clk_set_rate(data->clk_scaler->clk,
+				val * ASPEED_CLOCKS_PER_SAMPLE);
+		return 0;
+
+	default:
+		return -EPERM;
+	}
+}
+
+static int aspeed_adc_reg_access(struct iio_dev *indio_dev,
+				 unsigned int reg, unsigned int writeval,
+				 unsigned int *readval)
+{
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+
+	if (!readval || reg % 4 || reg > ASPEED_REG_MAX)
+		return -EINVAL;
+
+	*readval = readl(data->base + reg);
+	return 0;
+}
+
+static const struct iio_info aspeed_adc_iio_info = {
+	.driver_module = THIS_MODULE,
+	.read_raw = aspeed_adc_read_raw,
+	.write_raw = aspeed_adc_write_raw,
+	.debugfs_reg_access = aspeed_adc_reg_access,
+};
+
+static int aspeed_adc_probe(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev;
+	struct aspeed_adc_data *data;
+	const struct aspeed_adc_model_data *model_data;
+	struct resource *res;
+	const char *clk_parent_name;
+	int ret;
+	u32 adc_engine_control_reg_val;
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	data->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	data->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	/* Register ADC clock prescaler with source specified by device tree. */
+	spin_lock_init(&data->clk_lock);
+	clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
+
+	data->clk_prescaler = clk_hw_register_divider(
+				&pdev->dev, "prescaler", clk_parent_name, 0,
+				data->base + ASPEED_REG_CLOCK_CONTROL,
+				17, 15, 0, &data->clk_lock);
+	if (IS_ERR(data->clk_prescaler))
+		return PTR_ERR(data->clk_prescaler);
+
+	/*
+	 * Register ADC clock scaler downstream from the prescaler. Allow rate
+	 * setting to adjust the prescaler as well.
+	 */
+	data->clk_scaler = clk_hw_register_divider(
+				&pdev->dev, "scaler", "prescaler",
+				CLK_SET_RATE_PARENT,
+				data->base + ASPEED_REG_CLOCK_CONTROL,
+				0, 10, 0, &data->clk_lock);
+	if (IS_ERR(data->clk_scaler)) {
+		ret = PTR_ERR(data->clk_scaler);
+		goto scaler_error;
+	}
+
+	/* Start all channels in normal mode. */
+	clk_prepare_enable(data->clk_scaler->clk);
+	adc_engine_control_reg_val = GENMASK(31, 16) |
+		ASPEED_OPERATION_MODE_NORMAL | ASPEED_ENGINE_ENABLE;
+	writel(adc_engine_control_reg_val,
+		data->base + ASPEED_REG_ENGINE_CONTROL);
+
+	model_data = of_device_get_match_data(&pdev->dev);
+	indio_dev->name = model_data->model_name;
+	indio_dev->dev.parent = &pdev->dev;
+	indio_dev->info = &aspeed_adc_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = aspeed_adc_iio_channels;
+	indio_dev->num_channels = ARRAY_SIZE(aspeed_adc_iio_channels);
+
+	ret = iio_device_register(indio_dev);
+	if (ret)
+		goto iio_register_error;
+
+	return 0;
+
+iio_register_error:
+	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
+		data->base + ASPEED_REG_ENGINE_CONTROL);
+	clk_disable_unprepare(data->clk_scaler->clk);
+	clk_hw_unregister_divider(data->clk_scaler);
+
+scaler_error:
+	clk_hw_unregister_divider(data->clk_prescaler);
+	return ret;
+}
+
+static int aspeed_adc_remove(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	struct aspeed_adc_data *data = iio_priv(indio_dev);
+
+	iio_device_unregister(indio_dev);
+	writel(ASPEED_OPERATION_MODE_POWER_DOWN,
+		data->base + ASPEED_REG_ENGINE_CONTROL);
+	clk_disable_unprepare(data->clk_scaler->clk);
+	clk_hw_unregister_divider(data->clk_scaler);
+	clk_hw_unregister_divider(data->clk_prescaler);
+
+	return 0;
+}
+
+static const struct aspeed_adc_model_data ast2400_model_data = {
+	.model_name = "ast2400-adc",
+	.vref_voltage = 2500, // mV
+	.min_sampling_rate = 10000,
+	.max_sampling_rate = 500000,
+};
+
+static const struct aspeed_adc_model_data ast2500_model_data = {
+	.model_name = "ast2500-adc",
+	.vref_voltage = 1800, // mV
+	.min_sampling_rate = 1,
+	.max_sampling_rate = 1000000,
+};
+
+static const struct of_device_id aspeed_adc_matches[] = {
+	{ .compatible = "aspeed,ast2400-adc", .data = &ast2400_model_data },
+	{ .compatible = "aspeed,ast2500-adc", .data = &ast2500_model_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
+
+static struct platform_driver aspeed_adc_driver = {
+	.probe = aspeed_adc_probe,
+	.remove = aspeed_adc_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_adc_matches,
+	}
+};
+
+module_platform_driver(aspeed_adc_driver);
+
+MODULE_AUTHOR("Rick Altherr <raltherr@google.com>");
+MODULE_DESCRIPTION("Aspeed AST2400/2500 ADC Driver");
+MODULE_LICENSE("GPL");
-- 
2.12.1.500.gab5fba24ee-goog
