Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fvJL4WcdzDqlF
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 04:26:26 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0GGuKRe014237;
 Wed, 16 Jan 2019 18:56:20 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id BC48362DA7; Wed, 16 Jan 2019 19:26:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 2/3] iio: adc: Modify NPCM ADC driver
Date: Wed, 16 Jan 2019 19:26:14 +0200
Message-Id: <20190116172615.203952-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190116172615.203952-1-tmaimon77@gmail.com>
References: <20190116172615.203952-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 17:26:27 -0000

Modify Nuvoton NPCM BMC ADC driver as follow:

- Return error if clock have not found in the device tree ADC node.
- Modify regulator order for avoid mixing devm and non-devm path.
- Modify probe and remove function to have relative ordering.
- Add NPCM prefix.
- Remove unnecessary parameter initialization.
- Modify read function to avoid racy condition.
- Reading the reference voltage when needed.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/iio/adc/npcm_adc.c | 133 ++++++++++++++++++++++-----------------------
 1 file changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index 4f7851472997..1cc377cdf1f7 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2016-2018 Nuvoton Technology corporation.
+// Copyright (c) 2019 Nuvoton Technology corporation.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -16,7 +16,6 @@
 #include <linux/uaccess.h>
 
 struct npcm_adc {
-	u32 vref_mv;
 	bool int_status;
 	u32 adc_sample_hz;
 	struct device *dev;
@@ -28,8 +27,8 @@ struct npcm_adc {
 };
 
 /* NPCM7xx reset module */
-#define IPSRST1_OFFSET		0x020
-#define IPSRST1_ADC_RST		BIT(27)
+#define NPCM7XX_IPSRST1_OFFSET		0x020
+#define NPCM7XX_IPSRST1_ADC_RST		BIT(27)
 
 /* ADC registers */
 #define NPCM_ADCCON	 0x00
@@ -53,15 +52,15 @@ struct npcm_adc {
 
 /* ADC General Definition */
 #define NPCM_RESOLUTION_BITS		10
-#define ADC_DEFAULT_SAMPLE_RATE		12500000
-#define INT_VREF_MV			2000
+#define NPCM_INT_VREF_MV		2000
 
 #define NPCM_ADC_CHAN(ch) {					\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
 	.channel = ch,						\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
-	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |	\
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
 }
 
 static const struct iio_chan_spec npcm_adc_iio_channels[] = {
@@ -77,7 +76,7 @@ static const struct iio_chan_spec npcm_adc_iio_channels[] = {
 
 static irqreturn_t npcm_adc_isr(int irq, void *data)
 {
-	u32 regtemp = 0;
+	u32 regtemp;
 	struct iio_dev *indio_dev = data;
 	struct npcm_adc *info = iio_priv(indio_dev);
 
@@ -94,28 +93,29 @@ static irqreturn_t npcm_adc_isr(int irq, void *data)
 static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
 {
 	int ret;
-	u32 regtemp = 0;
+	u32 regtemp;
 
-	/* Select ADC channal */
+	/* Select ADC channel */
 	regtemp = ioread32(info->regs + NPCM_ADCCON);
 	regtemp &= ~NPCM_ADCCON_CH_MASK;
+	info->int_status = false;
 	iowrite32(regtemp | NPCM_ADCCON_CH(channel) |
 		  NPCM_ADCCON_ADC_CONV, info->regs + NPCM_ADCCON);
 
-	info->int_status = false;
 	ret = wait_event_interruptible_timeout(info->wq, info->int_status,
 					       msecs_to_jiffies(10));
 	if (ret == 0) {
 		regtemp = ioread32(info->regs + NPCM_ADCCON);
 		if ((regtemp & NPCM_ADCCON_ADC_CONV) && info->rst_regmap) {
 			/* if conversion failed - reset ADC module */
-			regmap_write(info->rst_regmap, IPSRST1_OFFSET,
-				     IPSRST1_ADC_RST);
+			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
+				     NPCM7XX_IPSRST1_ADC_RST);
 			msleep(100);
-			regmap_write(info->rst_regmap, IPSRST1_OFFSET, 0x0);
+			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
+				     0x0);
 			msleep(100);
 
-			/* Enable ADC and start conversion Module */
+			/* Enable ADC and start conversion module */
 			iowrite32(NPCM_ADC_ENABLE | NPCM_ADCCON_ADC_CONV,
 				  info->regs + NPCM_ADCCON);
 			dev_err(info->dev, "RESET ADC Complete\n");
@@ -135,21 +135,26 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
 			     int *val2, long mask)
 {
 	int ret;
+	int vref_uv;
 	struct npcm_adc *info = iio_priv(indio_dev);
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&indio_dev->mlock);
 		ret = npcm_adc_read(info, val, chan->channel);
+		mutex_unlock(&indio_dev->mlock);
 		if (ret) {
 			dev_err(info->dev, "NPCM ADC read failed\n");
-			mutex_unlock(&indio_dev->mlock);
 			return ret;
 		}
-		mutex_unlock(&indio_dev->mlock);
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-		*val = info->vref_mv;
+		if (info->vref) {
+			vref_uv = regulator_get_voltage(info->vref);
+			*val = vref_uv / 1000;
+		} else {
+			*val = NPCM_INT_VREF_MV;
+		}
 		*val2 = NPCM_RESOLUTION_BITS;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
@@ -198,17 +203,16 @@ static int npcm_adc_probe(struct platform_device *pdev)
 
 	info->adc_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->adc_clk)) {
-		dev_warn(&pdev->dev, "ADC clock failed: can't read clk, Assuming ADC clock Rate 12.5MHz\n");
-		info->adc_sample_hz = ADC_DEFAULT_SAMPLE_RATE;
-	} else {
-		/* calculate ADC clock sample rate */
-		reg_con = ioread32(info->regs + NPCM_ADCCON);
-		div = reg_con & NPCM_ADCCON_DIV_MASK;
-		div = div >> NPCM_ADCCON_DIV_SHIFT;
-		info->adc_sample_hz = clk_get_rate(info->adc_clk) /
-			((div + 1) * 2);
+		dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
+		return PTR_ERR(info->adc_clk);
 	}
 
+	/* calculate ADC clock sample rate */
+	reg_con = ioread32(info->regs + NPCM_ADCCON);
+	div = reg_con & NPCM_ADCCON_DIV_MASK;
+	div = div >> NPCM_ADCCON_DIV_SHIFT;
+	info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) * 2);
+
 	if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
 		info->rst_regmap = syscon_regmap_lookup_by_compatible
 			("nuvoton,npcm750-rst");
@@ -219,6 +223,20 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		}
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0) {
+		dev_err(dev, "failed getting interrupt resource\n");
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
+			       "NPCM_ADC", indio_dev);
+	if (ret < 0) {
+		dev_err(dev, "failed requesting interrupt\n");
+		goto err_disable_clk;
+	}
+
 	reg_con = ioread32(info->regs + NPCM_ADCCON);
 	info->vref = devm_regulator_get_optional(&pdev->dev, "vref");
 	if (!IS_ERR(info->vref)) {
@@ -228,41 +246,33 @@ static int npcm_adc_probe(struct platform_device *pdev)
 			goto err_disable_clk;
 		}
 
-		ret = regulator_get_voltage(info->vref);
-		if (ret < 0)
-			goto err_disable_vref_reg;
-
-		info->vref_mv = ret / 1000;
 		iowrite32(reg_con & ~NPCM_ADCCON_REFSEL,
 			  info->regs + NPCM_ADCCON);
 	} else {
-		/* Any other error indicates that the regulator does exist */
+		/*
+		 * Any error which is not ENODEV indicates the regulator
+		 * has been specified and so is a failure case.
+		 */
 		if (PTR_ERR(info->vref) != -ENODEV) {
+			ret = PTR_ERR(info->vref);
 			goto err_disable_clk;
-			return PTR_ERR(info->vref);
 		}
 
 		/* Use internal reference */
-		info->vref_mv = INT_VREF_MV;
 		iowrite32(reg_con | NPCM_ADCCON_REFSEL,
 			  info->regs + NPCM_ADCCON);
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(dev, "failed getting interrupt resource\n");
-		ret = -EINVAL;
-		goto err_disable_vref_reg;
-	}
+	init_waitqueue_head(&info->wq);
 
-	ret = devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
-			       "NPCM_ADC", indio_dev);
-	if (ret < 0) {
-		dev_err(dev, "failed requesting interrupt\n");
-		goto err_disable_vref_reg;
-	}
+	reg_con = ioread32(info->regs + NPCM_ADCCON);
+	reg_con |= NPCM_ADC_ENABLE;
 
-	init_waitqueue_head(&info->wq);
+	/* Enable the ADC Module */
+	iowrite32(reg_con, info->regs + NPCM_ADCCON);
+
+	/* Start ADC conversion */
+	iowrite32(reg_con | NPCM_ADCCON_ADC_CONV, info->regs + NPCM_ADCCON);
 
 	platform_set_drvdata(pdev, indio_dev);
 	indio_dev->name = dev_name(&pdev->dev);
@@ -275,24 +285,15 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	ret = iio_device_register(indio_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto err_disable_vref_reg;
+		goto err_iio_register;
 	}
 
-	reg_con = ioread32(info->regs + NPCM_ADCCON);
-	reg_con |= NPCM_ADC_ENABLE;
-
-	/* Enable the ADC Module */
-	iowrite32(reg_con, info->regs + NPCM_ADCCON);
-
-	/* Start ADC conversion */
-	iowrite32(reg_con | NPCM_ADCCON_ADC_CONV, info->regs + NPCM_ADCCON);
-
-	pr_info("NPCM ADC driver probed, sample Rate %dHz\n",
-		info->adc_sample_hz);
+	pr_info("NPCM ADC driver probed\n");
 
 	return 0;
 
-err_disable_vref_reg:
+err_iio_register:
+	iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
 err_disable_clk:
@@ -305,17 +306,15 @@ static int npcm_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct npcm_adc *info = iio_priv(indio_dev);
-	u32 regtemp = 0;
+	u32 regtemp;
 
 	regtemp = ioread32(info->regs + NPCM_ADCCON);
 
-	/* Disable the ADC Module */
-	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
-
 	iio_device_unregister(indio_dev);
-	clk_disable_unprepare(info->adc_clk);
+	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
+	clk_disable_unprepare(info->adc_clk);
 
 	return 0;
 }
@@ -331,6 +330,6 @@ static struct platform_driver npcm_adc_driver = {
 
 module_platform_driver(npcm_adc_driver);
 
-MODULE_DESCRIPTION("Nuvoton NPCM ADC Sensor Driver");
+MODULE_DESCRIPTION("Nuvoton NPCM ADC Driver");
 MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.14.1
