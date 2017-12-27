Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6Dky3NLnzDqXx
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 00:50:29 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBRDWcAa027583;
 Wed, 27 Dec 2017 15:32:38 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id C3FE55A647; Wed, 27 Dec 2017 15:50:21 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 2/2] hwmon: npcm: add NPCM7xx PWM and Fan
 driver
Date: Wed, 27 Dec 2017 15:50:19 +0200
Message-Id: <1514382619-14336-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
References: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 27 Dec 2017 13:50:37 -0000

Add Nuvoton BMC NPCM7xx Pulse Width Modulation (PWM)
Fan tachometer (Fan) drivers

Nuvoton NPCM7xx support upto 16 Fan tachometer inputs and
upto 8 PWM outputs.
Each PWM output module have watchdog.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/hwmon/Kconfig       |   6 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/npcm7xx-fan.c | 722 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/npcm7xx-pwm.c | 534 ++++++++++++++++++++++++++++++++
 4 files changed, 1263 insertions(+)
 create mode 100644 drivers/hwmon/npcm7xx-fan.c
 create mode 100644 drivers/hwmon/npcm7xx-pwm.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5ef2814345ef..cedfbf36e187 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1861,6 +1861,12 @@ config SENSORS_XGENE
 	  If you say yes here you get support for the temperature
 	  and power sensors for APM X-Gene SoC.
 
+config SENSORS_NPCM7XX
+	tristate "Nuvoton NPCM7XX PWM and Fan driver"
+	help
+	  This driver provides support for Nuvoton NPCM7XX PWM and Fan
+	  controllers.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4641a9f16c1..ff4212e82740 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -169,6 +169,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
+obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm7xx-pwm.o npcm7xx-fan.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
diff --git a/drivers/hwmon/npcm7xx-fan.c b/drivers/hwmon/npcm7xx-fan.c
new file mode 100644
index 000000000000..2122df2242d0
--- /dev/null
+++ b/drivers/hwmon/npcm7xx-fan.c
@@ -0,0 +1,722 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/signal.h>
+#include <linux/spinlock.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/clk.h>
+
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+
+typedef struct {
+	u8 u8ChannelNum;
+	u8 u8FanPulsePerRev;
+	u16 u16FanSpeedReading;
+	u32 u32InputClock;
+} sFanTachData;
+
+#define NPCM750_MFT_CLKPS   255
+
+/* PLL input */
+#define PLL_INPUT_CLOCK  25000000
+
+/*
+ * Get Fan Tach Timeout (base on clock 214843.75Hz, 1 cnt = 4.654us)
+ * Timeout 94ms ~= 0x5000
+ * (The minimum FAN speed could to support ~640RPM/pulse 1,
+ * 320RPM/pulse 2, ...-- 10.6Hz)
+ */
+#define FAN_TACH_TIMEOUT   ((u16) 0x5000)
+
+/*
+ * Enable a background timer to poll fan tach value, (200ms * 4)
+ * to polling all fan)
+ */
+
+/* 1 = 1 jiffies = 10 ms */
+#define FAN_TACH_POLLING_INTERVAL 20
+
+/* MFT General Defintion */
+#define NPCM750_MFT_MAX_MODULE	8
+#define NPCM750_CMPA	0
+#define NPCM750_CMPB	1
+
+#define NPCM750_MFT_MODE_5	4 /* Dual Independent Input Capture */
+
+#define NPCM750_MFT_TCNT    ((u16) 0xFFFF)
+#define NPCM750_MFT_TCPA    ((u16) (NPCM750_MFT_TCNT - FAN_TACH_TIMEOUT))
+#define NPCM750_MFT_TCPB    ((u16) (NPCM750_MFT_TCNT - FAN_TACH_TIMEOUT))
+
+#define NPCM750_MFT_NO_CLOCK_MODE		0
+#define NPCM750_MFT_APB_CLOCK_MODE		1
+
+#define DEFAULT_PULSE_PER_REVOLUTION	2
+
+#define MFT_REGS_BASE(n)    NPCMX50_MFT_BASE_ADDR(n)
+#define MFT_MFSEL2_FLSEL(n) (1<<n)
+
+/* Fantach MFT registers */
+#define MFT_REG_TCNT1(n)    ((void *) (MFT_REGS_BASE(n) + 0x00))
+#define MFT_REG_TCRA(n)     ((void *) (MFT_REGS_BASE(n) + 0x02))
+#define MFT_REG_TCRB(n)     ((void *) (MFT_REGS_BASE(n) + 0x04))
+#define MFT_REG_TCNT2(n)    ((void *) (MFT_REGS_BASE(n) + 0x06))
+#define MFT_REG_TPRSC(n)    ((void *) (MFT_REGS_BASE(n) + 0x08))
+#define MFT_REG_TCKC(n)     ((void *) (MFT_REGS_BASE(n) + 0x0A))
+#define MFT_REG_TMCTRL(n)   ((void *) (MFT_REGS_BASE(n) + 0x0C))
+#define MFT_REG_TICTRL(n)   ((void *) (MFT_REGS_BASE(n) + 0x0E))
+#define MFT_REG_TICLR(n)    ((void *) (MFT_REGS_BASE(n) + 0x10))
+#define MFT_REG_TIEN(n)     ((void *) (MFT_REGS_BASE(n) + 0x12))
+#define MFT_REG_TCPA(n)     ((void *) (MFT_REGS_BASE(n) + 0x14))
+#define MFT_REG_TCPB(n)     ((void *) (MFT_REGS_BASE(n) + 0x16))
+#define MFT_REG_TCPCFG(n)   ((void *) (MFT_REGS_BASE(n) + 0x18))
+#define MFT_REG_TINASEL(n)  ((void *) (MFT_REGS_BASE(n) + 0x1A))
+#define MFT_REG_TINBSEL(n)  ((void *) (MFT_REGS_BASE(n) + 0x1C))
+
+#define NPCM750_TCKC_C2CSEL(mode)	    (((mode) & 0x7) << 3)
+#define NPCM750_TCKC_C1CSEL(mode)	    ((mode) & 0x7)
+
+#define NPCM750_TMCTRL_TBEN		(1<<6)
+#define NPCM750_TMCTRL_TAEN		(1<<5)
+#define NPCM750_TMCTRL_TBEDG	        (1<<4)
+#define NPCM750_TMCTRL_TAEDG	        (1<<3)
+#define NPCM750_TMCTRL_MDSEL(mode)	    ((mode) & 0x7)
+
+#define NPCM750_TICLR_CLEAR_ALL         (0x3F)
+#define NPCM750_TICLR_TFCLR             (1<<5)
+#define NPCM750_TICLR_TECLR             (1<<4)
+#define NPCM750_TICLR_TDCLR             (1<<3)
+#define NPCM750_TICLR_TCCLR             (1<<2)
+#define NPCM750_TICLR_TBCLR             (1<<1)
+#define NPCM750_TICLR_TACLR             (1<<0)
+
+#define NPCM750_TIEN_ENABLE_ALL         (0x3F)
+#define NPCM750_TIEN_TFIEN              (1<<5)
+#define NPCM750_TIEN_TEIEN              (1<<4)
+#define NPCM750_TIEN_TDIEN              (1<<3)
+#define NPCM750_TIEN_TCIEN              (1<<2)
+#define NPCM750_TIEN_TBIEN              (1<<1)
+#define NPCM750_TIEN_TAIEN              (1<<0)
+
+#define NPCM750_TICTRL_TFPND            (1<<5)
+#define NPCM750_TICTRL_TEPND            (1<<4)
+#define NPCM750_TICTRL_TDPND            (1<<3)
+#define NPCM750_TICTRL_TCPND            (1<<2)
+#define NPCM750_TICTRL_TBPND            (1<<1)
+#define NPCM750_TICTRL_TAPND            (1<<0)
+
+#define NPCM750_TCPCFG_HIBEN            (1<<7)
+#define NPCM750_TCPCFG_EQBEN            (1<<6)
+#define NPCM750_TCPCFG_LOBEN            (1<<5)
+#define NPCM750_TCPCFG_CPBSEL           (1<<4)
+#define NPCM750_TCPCFG_HIAEN            (1<<3)
+#define NPCM750_TCPCFG_EQAEN            (1<<2)
+#define NPCM750_TCPCFG_LOAEN            (1<<1)
+#define NPCM750_TCPCFG_CPASEL           (1<<0)
+
+#define NPCM750_TINASEL_FANIN_DEFAULT   (0x0)
+
+#define FAN_TACH_DISABLE                            0xFF
+#define FAN_TACH_INIT                               0x00
+#define FAN_TACH_PREPARE_TO_GET_FIRST_CAPTURE       0x01
+#define FAN_TACH_ENOUGH_SAMPLE                      0x02
+
+/* maximum fan tach input support */
+#define NPCM750_MAX_FAN_TACH	 16
+
+/* Obtain the fan number */
+#define NPCM750_FAN_TACH_INPUT(mft, cmp)	((mft << 1) + (cmp))
+
+/* Debugging Message */
+#ifdef FAN_DEBUG
+#define DEBUG_MSG(fmt, args...)  pr_info("PWM: %s() " fmt, __func__, ##args)
+#else
+#define DEBUG_MSG(fmt, args...)
+#endif
+#define PERROR(fmt, args...)  pr_err("PWM: %s() " fmt, __func__, ##args)
+
+typedef struct {
+	u8 u8FanStatusFlag;
+	u8 u8FanPulsePerRev;
+	u16 u16FanTachCnt;
+	u32 u32FanTachCntTemp;
+} sFanTachDev;
+
+static int npcm750_fan_read(sFanTachData *pFanTachData);
+static int mft_virt_addr;
+
+#undef MFT_REGS_BASE
+#define MFT_REGS_BASE(n)    (mft_virt_addr + ((n) * 0x1000L))
+
+/* for request irq use */
+static u8 u8dummy;
+int mft_irq[8];
+
+/* Input clock */
+static u32 u32InputClock;
+static sFanTachDev S_npcm750_fantach[NPCM750_MAX_FAN_TACH];
+static u8 S_npcm750_fantach_select;
+static struct timer_list npcm750_fantach_timer;
+static struct clk *mft_clk;
+
+struct npcm750_fan_data {
+	unsigned long clk_freq;
+	const struct attribute_group *groups[2];
+};
+
+static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int index = sensor_attr->index;
+	sFanTachData FanTachData;
+
+	FanTachData.u8ChannelNum = index;
+	npcm750_fan_read(&FanTachData);
+	if (FanTachData.u16FanSpeedReading < 0)
+		return FanTachData.u16FanSpeedReading;
+
+	return sprintf(buf, "%d\n", (int)FanTachData.u16FanSpeedReading);
+}
+
+static umode_t fan_dev_is_visible(struct kobject *kobj,
+				  struct attribute *a, int index)
+{
+	/*struct device *dev = container_of(kobj, struct device, kobj);*/
+	return a->mode;
+}
+
+static SENSOR_DEVICE_ATTR(fan1_input, 0444, show_rpm, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_input, 0444, show_rpm, NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_input, 0444, show_rpm, NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_input, 0444, show_rpm, NULL, 3);
+static SENSOR_DEVICE_ATTR(fan5_input, 0444, show_rpm, NULL, 4);
+static SENSOR_DEVICE_ATTR(fan6_input, 0444, show_rpm, NULL, 5);
+static SENSOR_DEVICE_ATTR(fan7_input, 0444, show_rpm, NULL, 6);
+static SENSOR_DEVICE_ATTR(fan8_input, 0444, show_rpm, NULL, 7);
+static SENSOR_DEVICE_ATTR(fan9_input, 0444, show_rpm, NULL, 8);
+static SENSOR_DEVICE_ATTR(fan10_input, 0444, show_rpm, NULL, 9);
+static SENSOR_DEVICE_ATTR(fan11_input, 0444, show_rpm, NULL, 10);
+static SENSOR_DEVICE_ATTR(fan12_input, 0444, show_rpm, NULL, 11);
+static SENSOR_DEVICE_ATTR(fan13_input, 0444, show_rpm, NULL, 12);
+static SENSOR_DEVICE_ATTR(fan14_input, 0444, show_rpm, NULL, 13);
+static SENSOR_DEVICE_ATTR(fan15_input, 0444, show_rpm, NULL, 14);
+static SENSOR_DEVICE_ATTR(fan16_input, 0444, show_rpm, NULL, 15);
+
+static struct attribute *fan_dev_attrs[] = {
+	&sensor_dev_attr_fan1_input.dev_attr.attr,
+	&sensor_dev_attr_fan2_input.dev_attr.attr,
+	&sensor_dev_attr_fan3_input.dev_attr.attr,
+	&sensor_dev_attr_fan4_input.dev_attr.attr,
+	&sensor_dev_attr_fan5_input.dev_attr.attr,
+	&sensor_dev_attr_fan6_input.dev_attr.attr,
+	&sensor_dev_attr_fan7_input.dev_attr.attr,
+	&sensor_dev_attr_fan8_input.dev_attr.attr,
+	&sensor_dev_attr_fan9_input.dev_attr.attr,
+	&sensor_dev_attr_fan10_input.dev_attr.attr,
+	&sensor_dev_attr_fan11_input.dev_attr.attr,
+	&sensor_dev_attr_fan12_input.dev_attr.attr,
+	&sensor_dev_attr_fan13_input.dev_attr.attr,
+	&sensor_dev_attr_fan14_input.dev_attr.attr,
+	&sensor_dev_attr_fan15_input.dev_attr.attr,
+	&sensor_dev_attr_fan16_input.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group fan_dev_group = {
+	.attrs = fan_dev_attrs,
+	.is_visible = fan_dev_is_visible,
+};
+
+static inline void npcm750_fantach_start_capture(u8 mft, u8 cmp)
+{
+	u8 fan_id = 0;
+	u8 reg_mode = 0;
+	u8 reg_int = 0;
+
+	fan_id = NPCM750_FAN_TACH_INPUT(mft, cmp);
+
+	/* to check whether any fan tach is enable */
+	if (S_npcm750_fantach[fan_id].u8FanStatusFlag != FAN_TACH_DISABLE) {
+		/* reset status */
+		S_npcm750_fantach[fan_id].u8FanStatusFlag = FAN_TACH_INIT;
+		reg_int = ioread8((void *)MFT_REG_TIEN(mft));
+
+		if (cmp == NPCM750_CMPA) {
+			/* enable interrupt */
+			iowrite8((u8) (reg_int | (NPCM750_TIEN_TAIEN |
+						  NPCM750_TIEN_TEIEN)),
+				 (void *)MFT_REG_TIEN(mft));
+
+			reg_mode =
+				NPCM750_TCKC_C1CSEL(NPCM750_MFT_APB_CLOCK_MODE)
+				| ioread8((void *)MFT_REG_TCKC(mft));
+
+			/* start to Capture */
+			iowrite8(reg_mode, (void *)MFT_REG_TCKC(mft));
+		} else {
+			/* enable interrupt */
+			iowrite8((u8) (reg_int | (NPCM750_TIEN_TBIEN |
+						  NPCM750_TIEN_TFIEN)),
+				 (void *)MFT_REG_TIEN(mft));
+
+			reg_mode =
+				NPCM750_TCKC_C2CSEL(NPCM750_MFT_APB_CLOCK_MODE)
+				| ioread8((void *)MFT_REG_TCKC(mft));
+
+			/* start to Capture */
+			iowrite8(reg_mode, (void *)MFT_REG_TCKC(mft));
+		}
+	}
+}
+
+static void npcm750_fantach_polling(unsigned long data)
+{
+	int i;
+
+	/* Polling two module per one round,
+	 * MFT0 & MFT4 / MFT1 & MFT5 / MFT2 & MFT6 / MFT3 & MFT7
+	 */
+	for (i = S_npcm750_fantach_select; i < NPCM750_MFT_MAX_MODULE;
+	      i = i+4) {
+		/* clear the flag and reset the counter (TCNT) */
+		iowrite8((u8) NPCM750_TICLR_CLEAR_ALL,
+			 (void *) MFT_REG_TICLR(i));
+
+		iowrite16(NPCM750_MFT_TCNT, (void *)MFT_REG_TCNT1(i));
+		iowrite16(NPCM750_MFT_TCNT, (void *)MFT_REG_TCNT2(i));
+
+		npcm750_fantach_start_capture(i, NPCM750_CMPA);
+		npcm750_fantach_start_capture(i, NPCM750_CMPB);
+	}
+
+	S_npcm750_fantach_select++;
+	S_npcm750_fantach_select &= 0x3;
+
+	/* reset the timer interval */
+	npcm750_fantach_timer.expires = jiffies + FAN_TACH_POLLING_INTERVAL;
+	add_timer(&npcm750_fantach_timer);
+}
+
+static int npcm750_fan_read(sFanTachData *pFanTachData)
+{
+	u8 fan_id = 0;
+
+	fan_id = pFanTachData->u8ChannelNum;
+
+	if (S_npcm750_fantach[fan_id].u16FanTachCnt != 0)
+		pFanTachData->u16FanSpeedReading =
+		S_npcm750_fantach[fan_id].u16FanTachCnt;
+	else
+		pFanTachData->u16FanSpeedReading = 0;
+
+	return  0;
+}
+
+static inline void npcm750_fantach_compute(u8 mft, u8 cmp, u8 fan_id,
+					   u8 flag_int, u8 flag_mode,
+					   u8 flag_clear)
+{
+	u8  reg_int  = 0;
+	u8  reg_mode = 0;
+	u16 fan_cap  = 0;
+
+	if (cmp == NPCM750_CMPA)
+		fan_cap = ioread16((void *) MFT_REG_TCRA(mft));
+	else
+		fan_cap = ioread16((void *) MFT_REG_TCRB(mft));
+
+	/* clear capature flag, H/W will auto reset the NPCM750_TCNTx */
+	iowrite8((u8) flag_clear, (void *) MFT_REG_TICLR(mft));
+
+	if (S_npcm750_fantach[fan_id].u8FanStatusFlag == FAN_TACH_INIT) {
+		/* First capture, drop it */
+		S_npcm750_fantach[fan_id].u8FanStatusFlag =
+			FAN_TACH_PREPARE_TO_GET_FIRST_CAPTURE;
+
+		/* reset counter */
+		S_npcm750_fantach[fan_id].u32FanTachCntTemp = 0;
+	} else if (S_npcm750_fantach[fan_id].u8FanStatusFlag <
+		   FAN_TACH_ENOUGH_SAMPLE) {
+		/*
+		 * collect the enough sample,
+		 * (ex: 2 pulse fan need to get 2 sample)
+		 */
+		S_npcm750_fantach[fan_id].u32FanTachCntTemp +=
+			(NPCM750_MFT_TCNT - fan_cap);
+		/*
+		 * DEBUG_MSG("step 1, fan %d cnt %d total %x\n",
+		 *	fan_id, (NPCM750_MFT_TCNT - fan_cap),
+		 *	(u32) S_npcm750_fantach[fan_id].u32FanTachCntTemp);
+		 */
+		S_npcm750_fantach[fan_id].u8FanStatusFlag++;
+	} else {
+		/* get enough sample or fan disable */
+		if (S_npcm750_fantach[fan_id].u8FanStatusFlag ==
+		    FAN_TACH_ENOUGH_SAMPLE) {
+			S_npcm750_fantach[fan_id].u32FanTachCntTemp +=
+				(NPCM750_MFT_TCNT - fan_cap);
+			/*
+			 * DEBUG_MSG("step 2, fan %d cnt %d total %x\n",
+			 *   fan_id, (NPCM750_MFT_TCNT - fan_cap),
+			 *   (u32)S_npcm750_fantach[fan_id].u32FanTachCntTemp);
+			 */
+
+			/* compute finial average cnt per pulse */
+			S_npcm750_fantach[fan_id].u16FanTachCnt
+				= S_npcm750_fantach[fan_id].u32FanTachCntTemp /
+				FAN_TACH_ENOUGH_SAMPLE;
+
+			/*
+			 * DEBUG_MSG("step 3 fan %d avg %d\n\n",
+			 *   fan_id, S_npcm750_fantach[fan_id].u16FanTachCnt);
+			 */
+			S_npcm750_fantach[fan_id].u8FanStatusFlag =
+				FAN_TACH_INIT;
+		}
+
+		reg_int =  ioread8((void *)MFT_REG_TIEN(mft));
+
+		/* disable interrupt */
+		iowrite8((u8) (reg_int & ~flag_int), (void *)MFT_REG_TIEN(mft));
+		reg_mode =  ioread8((void *)MFT_REG_TCKC(mft));
+
+		/* stop capturing */
+		iowrite8((u8) (reg_mode & ~flag_mode),
+			 (void *) MFT_REG_TCKC(mft));
+	}
+}
+
+static inline void npcm750_check_cmp(u8 mft, u8 cmp, u8 flag)
+{
+	u8 reg_int = 0;
+	u8 reg_mode = 0;
+	u8 flag_timeout;
+	u8 flag_cap;
+	u8 flag_clear;
+	u8 flag_int;
+	u8 flag_mode;
+	u8 fan_id;
+
+	fan_id = NPCM750_FAN_TACH_INPUT(mft, cmp);
+
+	if (cmp == NPCM750_CMPA) {
+		flag_cap = NPCM750_TICTRL_TAPND;
+		flag_timeout = NPCM750_TICTRL_TEPND;
+		flag_int = (NPCM750_TIEN_TAIEN | NPCM750_TIEN_TEIEN);
+		flag_mode = NPCM750_TCKC_C1CSEL(NPCM750_MFT_APB_CLOCK_MODE);
+		flag_clear = NPCM750_TICLR_TACLR | NPCM750_TICLR_TECLR;
+	} else {
+		flag_cap = NPCM750_TICTRL_TBPND;
+		flag_timeout = NPCM750_TICTRL_TFPND;
+		flag_int = (NPCM750_TIEN_TBIEN | NPCM750_TIEN_TFIEN);
+		flag_mode = NPCM750_TCKC_C2CSEL(NPCM750_MFT_APB_CLOCK_MODE);
+		flag_clear = NPCM750_TICLR_TBCLR | NPCM750_TICLR_TFCLR;
+	}
+
+	if (flag & flag_timeout) {
+		reg_int =  ioread8((void *)MFT_REG_TIEN(mft));
+
+		/** disable interrupt */
+		iowrite8((u8) (reg_int & ~flag_int), (void *)MFT_REG_TIEN(mft));
+
+		/** clear interrup flag */
+		iowrite8((u8) flag_clear, (void *) MFT_REG_TICLR(mft));
+
+		reg_mode =  ioread8((void *)MFT_REG_TCKC(mft));
+
+		/** stop capturing */
+		iowrite8((u8) (reg_mode & ~flag_mode),
+			 (void *) MFT_REG_TCKC(mft));
+
+		/*
+		 *  If timeout occurs (FAN_TACH_TIMEOUT), the fan doesn't
+		 *  connect or speed is lower than 10.6Hz (320RPM/pulse2).
+		 *  In these situation, the RPM output should be zero.
+		 */
+		S_npcm750_fantach[fan_id].u16FanTachCnt = 0;
+		DEBUG_MSG("%s : it is timeout fan_id %d\n", __func__, fan_id);
+	} else {
+	    /** input capture is occurred */
+		if (flag & flag_cap)
+			npcm750_fantach_compute(mft, cmp, fan_id, flag_int,
+						flag_mode, flag_clear);
+	}
+}
+
+static irqreturn_t npcm750_mft0_isr(int irq, void *dev_id)
+{
+	u8 flag = 0;
+	int module;
+
+	module = irq - mft_irq[0];
+	flag = ioread8((void *)(void *) MFT_REG_TICTRL(module));
+	if (flag > 0) {
+		npcm750_check_cmp(module, NPCM750_CMPA, flag);
+		npcm750_check_cmp(module, NPCM750_CMPB, flag);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int npcm750_fan_probe(struct platform_device *pdev)
+{
+	u32 reg_value, apb_clk_src;
+	int ret = 0;
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct npcm750_fan_data *priv;
+	struct resource res;
+	struct device *hwmon;
+	int i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	np = dev->of_node;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret) {
+		pr_err("\t\t\t of_address_to_resource fail ret %d\n", ret);
+		return -EINVAL;
+	}
+
+	mft_virt_addr = (int)ioremap(res.start, resource_size(&res));
+
+	if (!mft_virt_addr) {
+		pr_err("\t\t\t mft_virt_addr fail\n");
+		return -ENOMEM;
+	}
+
+	DEBUG_MSG("MFT base is 0x%08X ,res.start 0x%08X\n",
+		  (u32)mft_virt_addr, res.start);
+
+	mft_clk = devm_clk_get(&pdev->dev, NULL);
+
+	if (IS_ERR(mft_clk)) {
+		pr_err(" MFT (FAN) probe failed: can't read clk.\n");
+		return -ENODEV;
+	}
+
+	clk_prepare_enable(mft_clk);
+
+	for (i = 0; i < NPCM750_MFT_MAX_MODULE; i++) {
+		/* stop MFT0~7 clock */
+		iowrite8((u8) NPCM750_MFT_NO_CLOCK_MODE,
+			 (void *)MFT_REG_TCKC(i));
+
+		/* disable all interrupt */
+		iowrite8((u8) 0x00, (void *)MFT_REG_TIEN(i));
+
+		/* clear all interrupt */
+		iowrite8((u8) NPCM750_TICLR_CLEAR_ALL,
+			 (void *)MFT_REG_TICLR(i));
+
+		/* set MFT0~7 clock prescaler */
+		iowrite8((u8) NPCM750_MFT_CLKPS, (void *)MFT_REG_TPRSC(i));
+
+		/* set MFT0~7 mode (high-to-low transition) */
+		iowrite8(
+			(u8) (
+			      NPCM750_TMCTRL_MDSEL(NPCM750_MFT_MODE_5) |
+			      NPCM750_TMCTRL_TBEN |
+			      NPCM750_TMCTRL_TAEN
+			      ),
+			(void *) MFT_REG_TMCTRL(i)
+			);
+
+		/* set MFT0~7 Initial Count/Cap */
+		iowrite16(NPCM750_MFT_TCNT, (void *)MFT_REG_TCNT1(i));
+		iowrite16(NPCM750_MFT_TCNT, (void *)MFT_REG_TCNT2(i));
+
+		/* set MFT0~7 compare (equal to count) */
+		iowrite8((u8)(NPCM750_TCPCFG_EQAEN | NPCM750_TCPCFG_EQBEN),
+			  (void *)MFT_REG_TCPCFG(i));
+
+		/* set MFT0~7 compare value */
+		iowrite16(NPCM750_MFT_TCPA, (void *)MFT_REG_TCPA(i));
+		iowrite16(NPCM750_MFT_TCPB, (void *)MFT_REG_TCPB(i));
+
+		/* set MFT0~7 fan input FANIN 0~15 */
+		iowrite8((u8) NPCM750_TINASEL_FANIN_DEFAULT,
+			 (void *)MFT_REG_TINASEL(i));
+		iowrite8((u8) NPCM750_TINASEL_FANIN_DEFAULT,
+			 (void *)MFT_REG_TINBSEL(i));
+	}
+
+	/** fan tach structure initialization */
+	S_npcm750_fantach_select = 0;
+	for (i = 0; i < NPCM750_MAX_FAN_TACH; i++) {
+		S_npcm750_fantach[i].u8FanStatusFlag = FAN_TACH_DISABLE;
+		S_npcm750_fantach[i].u8FanPulsePerRev =
+			DEFAULT_PULSE_PER_REVOLUTION;
+		S_npcm750_fantach[i].u16FanTachCnt = 0;
+	}
+
+	for (i = 0; i < 8; i++) {
+		mft_irq[i] = platform_get_irq(pdev, i);
+		if (!mft_irq[i]) {
+			pr_err("%s - failed to map irq %d\n", __func__, i);
+			return (-EAGAIN);
+		}
+	}
+
+	if (request_irq(mft_irq[0], (irq_handler_t) npcm750_mft0_isr, 0,
+			"NPCM750-MFT0", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT0 failed\n");
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[1], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT1", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT1 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[2], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT2", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT2 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[3], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT3", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT3 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		free_irq(mft_irq[2], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[4], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT4", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT4 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		free_irq(mft_irq[2], (void *) &u8dummy);
+		free_irq(mft_irq[3], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[5], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT5", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT5 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		free_irq(mft_irq[2], (void *) &u8dummy);
+		free_irq(mft_irq[3], (void *) &u8dummy);
+		free_irq(mft_irq[4], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[6], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT6", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT6 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		free_irq(mft_irq[2], (void *) &u8dummy);
+		free_irq(mft_irq[3], (void *) &u8dummy);
+		free_irq(mft_irq[4], (void *) &u8dummy);
+		free_irq(mft_irq[5], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	if (request_irq(mft_irq[7], (irq_handler_t) npcm750_mft0_isr, 0,
+		    "NPCM750-MFT7", (void *) &u8dummy)) {
+		pr_err("NPCM750: register irq MFT7 failed\n");
+		free_irq(mft_irq[0], (void *) &u8dummy);
+		free_irq(mft_irq[1], (void *) &u8dummy);
+		free_irq(mft_irq[2], (void *) &u8dummy);
+		free_irq(mft_irq[3], (void *) &u8dummy);
+		free_irq(mft_irq[4], (void *) &u8dummy);
+		free_irq(mft_irq[5], (void *) &u8dummy);
+		free_irq(mft_irq[6], (void *) &u8dummy);
+		return (-EAGAIN);
+	}
+
+	/** initialize fan tach polling timer */
+	npcm750_fantach_timer.data = 0;
+	npcm750_fantach_timer.function = &npcm750_fantach_polling;
+
+	/** set timer interval */
+	npcm750_fantach_timer.expires = jiffies + FAN_TACH_POLLING_INTERVAL;
+
+	init_timer(&npcm750_fantach_timer);
+	add_timer(&npcm750_fantach_timer);
+
+	    apb_clk_src = clk_get_rate(mft_clk);
+	pr_info("[FAN] APB4: %d\n", (int)apb_clk_src);
+	/* Fan tach input clock = APB clock / prescalar, default is 255. */
+	u32InputClock = apb_clk_src / (NPCM750_MFT_CLKPS + 1);
+
+	pr_info("[FAN] PWM: %d\n", (int) u32InputClock);
+	pr_info("[FAN] InputClock: %d\n", (int) u32InputClock);
+
+	priv->groups[0] = &fan_dev_group;
+	priv->groups[1] = NULL;
+	hwmon = devm_hwmon_device_register_with_groups(dev, "npcm750_fan",
+						       priv, priv->groups);
+	if (IS_ERR(hwmon)) {
+		pr_err("FAN Driver failed - "
+		       "devm_hwmon_device_register_with_groups failed\n");
+		return PTR_ERR(hwmon);
+	}
+
+	pr_info("NPCM750 FAN Driver probed\n");
+
+	for (i = 0; i < NPCM750_MAX_FAN_TACH; i++)
+		S_npcm750_fantach[i].u8FanStatusFlag = FAN_TACH_INIT;
+
+	return 0;
+}
+
+/* work with hotplug and coldplug */
+MODULE_ALIAS("platform:npcm750-fan");
+
+static const struct of_device_id of_fan_match_table[] = {
+	{ .compatible = "nuvoton,npcm750-fan", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_fan_match_table);
+
+static struct platform_driver npcm750_fan_driver = {
+	.probe		= npcm750_fan_probe,
+	.driver		= {
+		.name	= "npcm750_fan",
+		.of_match_table = of_fan_match_table,
+	},
+};
+
+module_platform_driver(npcm750_fan_driver);
+
+MODULE_DESCRIPTION("Nuvoton NPCM750 FAN Driver");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hwmon/npcm7xx-pwm.c b/drivers/hwmon/npcm7xx-pwm.c
new file mode 100644
index 000000000000..560d1c5e55a9
--- /dev/null
+++ b/drivers/hwmon/npcm7xx-pwm.c
@@ -0,0 +1,534 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/sysfs.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include <linux/uaccess.h>
+#include <linux/io.h>
+
+static struct regmap *gcr_regmap;
+#define MFSEL2_OFFSET 0x10
+
+#define NPCM7XX_PWM_MAX_MODULES                 2
+
+/* PWM ABP clock */
+#define NPCM7XX_APB_CLOCK			50000 //50kHz
+
+/* PWM port base address */
+#define PWM_REG_PRESCALE_ADDR(n)			(pwm_base[n] + 0)
+#define PWM_REG_CLOCK_SELECTOR_ADDR(n)			(pwm_base[n] + 0x4)
+#define PWM_REG_CONTROL_ADDR(n)				(pwm_base[n] + 0x8)
+#define PWM_REG_COUNTER_ADDR(n, PORT)			(pwm_base[n] + 0xc + (12 * PORT))
+#define PWM_REG_COMPARATOR_ADDR(n, PORT)		(pwm_base[n] + 0x10 + (12 * PORT))
+#define PWM_REG_DATA_ADDR(n, PORT)			(pwm_base[n] + 0x14 + (12 * PORT))
+#define PWM_REG_TIMER_INT_ENABLE_ADDR(n)		(pwm_base[n] + 0x3c)
+#define PWM_REG_TIMER_INT_IDENTIFICATION_ADDR(n)	(pwm_base[n] + 0x40)
+
+#define PWM_CTRL_CH0_MODE_BIT		3
+#define PWM_CTRL_CH1_MODE_BIT		11
+#define PWM_CTRL_CH2_MODE_BIT		15
+#define PWM_CTRL_CH3_MODE_BIT		19
+
+#define PWM_CTRL_CH0_INV_BIT		2
+#define PWM_CTRL_CH1_INV_BIT		10
+#define PWM_CTRL_CH2_INV_BIT		14
+#define PWM_CTRL_CH3_INV_BIT		18
+
+#define PWM_CTRL_CH0_ENABLE_BIT		0
+#define PWM_CTRL_CH1_ENABLE_BIT		8
+#define PWM_CTRL_CH2_ENABLE_BIT		12
+#define PWM_CTRL_CH3_ENABLE_BIT		16
+
+#define PWM_CLOCK_SELECTOR_MASK		0x7
+#define PWM_CLOCK_CH0_SELECTOR_BIT	0
+#define PWM_CLOCK_CH1_SELECTOR_BIT	4
+#define PWM_CLOCK_CH2_SELECTOR_BIT	8
+#define PWM_CLOCK_CH3_SELECTOR_BIT	12
+
+#define PWM_PRESCALE_MASK		0xff
+#define PWM_PRESCALE_CH01_BIT		0
+#define PWM_PRESCALE_CH23_BIT		8
+
+#define PWM_PIN_SELECT_CH0_BIT		16
+#define PWM_PIN_SELECT_CH0_GPIO_NUM	80
+#define PWM_PIN_ENABLE_VALUE		1
+
+/* GPIO command type */
+#define GPIO_CONFIG	0
+#define GPIO_WRITE	1
+#define GPIO_READ	2
+
+#define GPIO_SELECTED_OUTPUT		0x9
+
+/* Define the maximum PWM channel number */
+#define PWM_MAX_CHN_NUM			8
+#define PWM_MAX_CHN_NUM_IN_A_MODULE	4
+
+/* Define the Counter Register, value = 100 for match 100% */
+#define PWM_COUNTER_DEFALUT0_NUM	63
+#define PWM_COUNTER_DEFALUT1_NUM	255
+#define PWM_COMPARATOR_DEFALUT_NUM	50
+#define PWM_CLOCK_SELE_DEFALUT_NUM	4
+#define PWM_PRESCALE_DEFALUT_NUM	1
+
+typedef struct {
+	u8 u8PWMChannelNum;
+	u8 u8PWMBaseCycleFrequency;
+	u8 u8PWMFrequencyDivider;
+	u16 u8PWMDutyCycle;
+} sPWMDevConfig;
+
+static int npcm7xx_pwm_config_init(sPWMDevConfig *PWMDevConfig);
+static int npcm7xx_pwm_config_set(sPWMDevConfig *PWMDevConfig);
+static int npcm7xx_pwm_get_dutycycle(sPWMDevConfig *PWMDevConfig);
+
+//#define PWM_DEBUG
+
+#define DRIVER_NAME "npcm7xx_pwm"
+#define PWM_MAX 255
+
+struct npcm7xx_pwm_data {
+	unsigned long clk_freq;
+	bool pwm_present[8];
+	const struct attribute_group *groups[2];
+};
+
+/* Debugging Message */
+#ifdef PWM_DEBUG
+#define DEBUG_MSG(fmt, args...) pr_info("PWM: %s() " fmt, __func__, ##args)
+#else
+#define DEBUG_MSG(fmt, args...)
+#endif
+#define PERROR(fmt, args...) pr_err("PWM: %s() " fmt, __func__, ##args)
+
+static const struct of_device_id pwm_dt_id[];
+static struct platform_driver npcm7xx_pwm_driver;
+
+void __iomem *pwm_base[NPCM7XX_PWM_MAX_MODULES];
+
+u8 u8InitialPWM[PWM_MAX_CHN_NUM];
+
+static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int index = sensor_attr->index;
+	int ret;
+	sPWMDevConfig PWMDevConfig;
+	long fan_ctrl;
+
+	ret = kstrtol(buf, 10, &fan_ctrl);
+	if (ret != 0)
+		return ret;
+
+	if (fan_ctrl < 0 || fan_ctrl > PWM_MAX)
+		return -EINVAL;
+
+	PWMDevConfig.u8PWMDutyCycle = fan_ctrl;
+	PWMDevConfig.u8PWMChannelNum = index;
+
+	npcm7xx_pwm_config_set(&PWMDevConfig);
+
+	return count;
+}
+
+static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	int index = sensor_attr->index;
+	sPWMDevConfig PWMDevConfig;
+
+	PWMDevConfig.u8PWMChannelNum = index;
+	npcm7xx_pwm_get_dutycycle(&PWMDevConfig);
+
+	return sprintf(buf, "%u\n", PWMDevConfig.u8PWMDutyCycle);
+}
+
+static umode_t pwm_is_visible(struct kobject *kobj,
+			      struct attribute *a, int index)
+{
+	//struct device *dev = container_of(kobj, struct device, kobj);
+
+	return a->mode;
+}
+
+static SENSOR_DEVICE_ATTR(pwm1, 0644, show_pwm, set_pwm, 0);
+static SENSOR_DEVICE_ATTR(pwm2, 0644, show_pwm, set_pwm, 1);
+static SENSOR_DEVICE_ATTR(pwm3, 0644, show_pwm, set_pwm, 2);
+static SENSOR_DEVICE_ATTR(pwm4, 0644, show_pwm, set_pwm, 3);
+static SENSOR_DEVICE_ATTR(pwm5, 0644, show_pwm, set_pwm, 4);
+static SENSOR_DEVICE_ATTR(pwm6, 0644, show_pwm, set_pwm, 5);
+static SENSOR_DEVICE_ATTR(pwm7, 0644, show_pwm, set_pwm, 6);
+static SENSOR_DEVICE_ATTR(pwm8, 0644, show_pwm, set_pwm, 7);
+
+static struct attribute *pwm_dev_attrs[] = {
+	&sensor_dev_attr_pwm1.dev_attr.attr,
+	&sensor_dev_attr_pwm2.dev_attr.attr,
+	&sensor_dev_attr_pwm3.dev_attr.attr,
+	&sensor_dev_attr_pwm4.dev_attr.attr,
+	&sensor_dev_attr_pwm5.dev_attr.attr,
+	&sensor_dev_attr_pwm6.dev_attr.attr,
+	&sensor_dev_attr_pwm7.dev_attr.attr,
+	&sensor_dev_attr_pwm8.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group pwm_dev_group = {
+	.attrs = pwm_dev_attrs,
+	.is_visible = pwm_is_visible,
+};
+
+static int npcm7xx_pwm_config_init(sPWMDevConfig *PWMDevConfig)
+{
+	u8 u8PWMChannel = (PWMDevConfig->u8PWMChannelNum %
+			   PWM_MAX_CHN_NUM_IN_A_MODULE);
+	u32 u32TmpBuf = 0, u32TmpBuf2 = 0, u32TmpBuf3 = 0;
+	u32 u32DestAddr = 0, u32CtrlAddr = 0;
+	u32 u32PrescaleAddr = 0, u32CSelectorAddr = 0;
+	u32 n_module =
+		PWMDevConfig->u8PWMChannelNum/PWM_MAX_CHN_NUM_IN_A_MODULE;
+
+	/* Set initial PWM value */
+	u8InitialPWM[PWMDevConfig->u8PWMChannelNum] =
+		(PWMDevConfig->u8PWMDutyCycle & 0xFF);
+
+	/*
+	 * Config PWMD register for setting frequency divider during initialize
+	 */
+
+	/* Get PWM register address */
+	u32PrescaleAddr = (u32)PWM_REG_PRESCALE_ADDR(n_module);
+	u32CSelectorAddr = (u32)PWM_REG_CLOCK_SELECTOR_ADDR(n_module);
+	u32CtrlAddr = (u32)PWM_REG_CONTROL_ADDR(n_module);
+
+	/* Read PWMD value */
+	u32TmpBuf = ioread32((void *) u32PrescaleAddr);
+	u32TmpBuf2 = ioread32((void *) u32CSelectorAddr);
+	u32TmpBuf3 = ioread32((void *) u32CtrlAddr);
+
+	switch (u8PWMChannel) {
+	case 0:
+		/* set prescale bit[7:0] so far, default value is 127 */
+		u32TmpBuf &= ~(PWM_PRESCALE_MASK << PWM_PRESCALE_CH01_BIT);
+		u32TmpBuf |= ((PWM_PRESCALE_DEFALUT_NUM & PWM_PRESCALE_MASK) <<
+			      PWM_PRESCALE_CH01_BIT);
+
+		/* set clock selector bit [2:0] */
+		u32TmpBuf2 &= ~(PWM_CLOCK_SELECTOR_MASK <<
+				PWM_CLOCK_CH0_SELECTOR_BIT);
+		u32TmpBuf2 |=
+			((PWMDevConfig->u8PWMBaseCycleFrequency &
+			  PWM_CLOCK_SELECTOR_MASK) <<
+			 PWM_CLOCK_CH0_SELECTOR_BIT);
+
+		/* set Toggle mode */
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH0_MODE_BIT);
+		break;
+	case 1:
+		/* set prescale bit[7:0] so far, default value is 127 */
+		u32TmpBuf &= ~(PWM_PRESCALE_MASK << PWM_PRESCALE_CH01_BIT);
+		u32TmpBuf |= ((PWM_PRESCALE_DEFALUT_NUM &
+			       PWM_PRESCALE_MASK) << PWM_PRESCALE_CH01_BIT);
+
+		/* set clock selector bit [5:4] */
+		u32TmpBuf2 &= ~(PWM_CLOCK_SELECTOR_MASK <<
+				PWM_CLOCK_CH1_SELECTOR_BIT);
+		u32TmpBuf2 |=
+			((PWMDevConfig->u8PWMBaseCycleFrequency &
+			  PWM_CLOCK_SELECTOR_MASK) <<
+			 PWM_CLOCK_CH1_SELECTOR_BIT);
+
+		/* set Toggle mode */
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH1_MODE_BIT);
+		break;
+	case 2:
+		/* set prescale bit[7:0] so far, default value is 127 */
+		u32TmpBuf &= ~(PWM_PRESCALE_MASK << PWM_PRESCALE_CH23_BIT);
+		u32TmpBuf |= ((PWM_PRESCALE_DEFALUT_NUM & PWM_PRESCALE_MASK) <<
+			      PWM_PRESCALE_CH23_BIT);
+
+		/* set clock selector bit [5:4] */
+		u32TmpBuf2 &= ~(PWM_CLOCK_SELECTOR_MASK <<
+				PWM_CLOCK_CH2_SELECTOR_BIT);
+		u32TmpBuf2 |=
+			((PWMDevConfig->u8PWMBaseCycleFrequency &
+			  PWM_CLOCK_SELECTOR_MASK) <<
+			 PWM_CLOCK_CH2_SELECTOR_BIT);
+
+		/* set Toggle mode */
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH2_MODE_BIT);
+		break;
+	case 3:
+		/* set prescale bit[7:0] so far, default value is 127 */
+		u32TmpBuf &= ~(PWM_PRESCALE_MASK << PWM_PRESCALE_CH23_BIT);
+		u32TmpBuf |= ((PWM_PRESCALE_DEFALUT_NUM & PWM_PRESCALE_MASK) <<
+			      PWM_PRESCALE_CH23_BIT);
+
+		/* set clock selector bit [5:4] */
+		u32TmpBuf2 &= ~(PWM_CLOCK_SELECTOR_MASK <<
+				PWM_CLOCK_CH3_SELECTOR_BIT);
+		u32TmpBuf2 |=
+			((PWMDevConfig->u8PWMBaseCycleFrequency &
+			  PWM_CLOCK_SELECTOR_MASK) <<
+			 PWM_CLOCK_CH3_SELECTOR_BIT);
+
+		/* set Toggle mode */
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH3_MODE_BIT);
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	DEBUG_MSG("u8PWMChannel=%d, u32CSelectorAddr=0x%x, "
+		  "u8PWMBaseCycleFrequency=%d, PWMDTmpBuf=0x%x\n",
+		  PWMDevConfig->u8PWMChannelNum, u32CSelectorAddr,
+		  PWMDevConfig->u8PWMBaseCycleFrequency, u32TmpBuf2);
+
+	/* write new PWM register value  */
+	iowrite32(u32TmpBuf, (void *) u32PrescaleAddr);
+	iowrite32(u32TmpBuf2, (void *) u32CSelectorAddr);
+	iowrite32(u32TmpBuf3, (void *) u32CtrlAddr);
+
+	/* Config PWM Counter register for setting resolution */
+	u32DestAddr = (u32)PWM_REG_COUNTER_ADDR(n_module, u8PWMChannel);
+	u32TmpBuf = (u32)(PWMDevConfig->u8PWMFrequencyDivider & 0xFF);
+
+	DEBUG_MSG("u8PWMChannel=%d, u32CSelectorAddr=0x%x, "
+		  "u8PWMFrequencyDivider=%d, PWMDTmpBuf=%x\n",
+		  PWMDevConfig->u8PWMChannelNum, u32DestAddr,
+		  PWMDevConfig->u8PWMFrequencyDivider, (unsigned int)u32TmpBuf);
+
+	/* write new PWMC value  */
+	iowrite32(u32TmpBuf, (void *) u32DestAddr);
+
+	/* Config PWM Comparator register for setting duty cycle */
+	u32DestAddr = (u32)PWM_REG_COMPARATOR_ADDR(n_module, u8PWMChannel);
+	u32TmpBuf = (u32)(PWMDevConfig->u8PWMDutyCycle & 0xFF);
+
+	DEBUG_MSG("u8PWMChannel=%d, u32CSelectorAddr=0x%x, u8PWMDutyCycle=%d,"
+		  " PWMDTmpBuf=%x\n", PWMDevConfig->u8PWMChannelNum,
+		  u32DestAddr, PWMDevConfig->u8PWMDutyCycle,
+		  (unsigned int)u32TmpBuf);
+
+	/* write new PWMC value  */
+	iowrite32(u32TmpBuf, (void *) u32DestAddr);
+
+	/* Enable PWM */
+	u32TmpBuf3 = ioread32((void *) u32CtrlAddr);
+
+	switch (u8PWMChannel) {
+	case 0:
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH0_ENABLE_BIT);
+		break;
+	case 1:
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH1_ENABLE_BIT);
+		break;
+	case 2:
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH2_ENABLE_BIT);
+		break;
+	case 3:
+		u32TmpBuf3 |= (1 << PWM_CTRL_CH3_ENABLE_BIT);
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	/* write new PWM value  */
+	iowrite32(u32TmpBuf3, (void *) u32CtrlAddr);
+
+	return 0;
+}
+
+static int npcm7xx_pwm_config_set(sPWMDevConfig *PWMDevConfig)
+{
+	u8  u8PWMChannel =
+		(PWMDevConfig->u8PWMChannelNum % PWM_MAX_CHN_NUM_IN_A_MODULE);
+	u32 u32TmpBuf = 0;
+	u32 u32DestAddr = 0;
+	u32 n_module =
+		PWMDevConfig->u8PWMChannelNum/PWM_MAX_CHN_NUM_IN_A_MODULE;
+
+	/*
+	 * Config PWM Comparator register for setting duty cycle
+	 */
+	u32DestAddr = (u32)PWM_REG_COMPARATOR_ADDR(n_module, u8PWMChannel);
+
+	u32TmpBuf = (u32)(PWMDevConfig->u8PWMDutyCycle & 0xFF);
+
+	DEBUG_MSG("u8PWMChannel=%d, u32CSelectorAddr=0x%x, u8PWMDutyCycle=%d, "
+		  "PWMDTmpBuf=%x\n", PWMDevConfig->u8PWMChannelNum,
+		  u32DestAddr, PWMDevConfig->u8PWMDutyCycle,
+		  (unsigned int)u32TmpBuf);
+
+	/* write new PWMC value  */
+	iowrite32(u32TmpBuf, (void *) u32DestAddr);
+
+	/* Added by DIJIC to diable output drive when 100% PWM set */
+	regmap_read(gcr_regmap, MFSEL2_OFFSET, &u32TmpBuf);
+
+	if (0 == (PWMDevConfig->u8PWMDutyCycle & 0xFF))
+		/* Disable PWM */
+		u32TmpBuf &= ~(1 << (PWM_PIN_SELECT_CH0_BIT +
+				     PWMDevConfig->u8PWMChannelNum));
+	else
+		/* Enable PWM */
+		u32TmpBuf |= 1 << (PWM_PIN_SELECT_CH0_BIT +
+				   PWMDevConfig->u8PWMChannelNum);
+
+
+	DEBUG_MSG("u8PWMChannel=%d, u32CSelectorAddr=0x%x, (Output Enable) "
+		  "u32TmpBuf=%x\n", PWMDevConfig->u8PWMChannelNum, u32DestAddr,
+		  (unsigned int)u32TmpBuf);
+
+	/* Enable PWM PIN */
+	regmap_write(gcr_regmap, MFSEL2_OFFSET, u32TmpBuf);
+
+	return 0;
+}
+
+static int npcm7xx_pwm_get_dutycycle(sPWMDevConfig *PWMDevConfig)
+{
+	u8  u8PWMChannel =
+		(PWMDevConfig->u8PWMChannelNum % PWM_MAX_CHN_NUM_IN_A_MODULE);
+	u32 n_module =
+		PWMDevConfig->u8PWMChannelNum/PWM_MAX_CHN_NUM_IN_A_MODULE;
+	u32 u32TmpBuf = 0;
+	u32 u32DestAddr = 0;
+
+	/* Debug using */
+	u32DestAddr = (u32)PWM_REG_COMPARATOR_ADDR(n_module, u8PWMChannel);
+	u32TmpBuf = ioread32((void *) u32DestAddr);
+	DEBUG_MSG("*** Duty Cycle - CMR[0x%x]=0x%x\n",
+		  (unsigned int)u32DestAddr, (unsigned int)u32TmpBuf);
+
+	PWMDevConfig->u8PWMDutyCycle = (u16)u32TmpBuf;
+
+	return 0;
+}
+
+static int npcm7xx_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct npcm7xx_pwm_data *priv;
+	struct resource res[NPCM7XX_PWM_MAX_MODULES];
+	struct device *hwmon;
+	struct clk *clk;
+	int ret;
+	int i, res_cnt;
+	sPWMDevConfig PWMDevConfig;
+	int err_check;
+
+	np = dev->of_node;
+
+	for (i = 0; i < PWM_MAX_CHN_NUM; i++)
+		u8InitialPWM[i] = 0;
+
+	for (res_cnt = 0; res_cnt < NPCM7XX_PWM_MAX_MODULES  ; res_cnt++) {
+		ret = of_address_to_resource(np, res_cnt, &res[res_cnt]);
+		if (ret) {
+			pr_err("PWM of_address_to_resource fail ret %d\n",
+			       ret);
+			return -EINVAL;
+		}
+
+		pwm_base[res_cnt] = devm_ioremap_resource(dev, &(res[res_cnt]));
+		DEBUG_MSG("pwm%d base is 0x%08X, res.start 0x%08X , size 0x%08X"
+			  "\n", res_cnt, (u32)pwm_base[res_cnt],
+			  res[res_cnt].start, resource_size(&(res[res_cnt])));
+
+		if (!pwm_base[res_cnt]) {
+			pr_err(" pwm probe failed: can't read pwm base address "
+			       "for resource %d.\n", res_cnt);
+			return -ENOMEM;
+		}
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return -ENODEV;
+
+	priv->clk_freq = clk_get_rate(clk);
+
+	if (gcr_regmap == NULL) {
+		gcr_regmap = syscon_regmap_lookup_by_compatible
+			("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap)) {
+			pr_err("%s: failed to find nuvoton,npcm750-gcr\n",
+			       __func__);
+			return IS_ERR(gcr_regmap);
+		}
+	}
+
+	for (i = 0; i < PWM_MAX_CHN_NUM; i++) {
+		/* setting to PWM of 25Khz */
+		PWMDevConfig.u8PWMChannelNum = i;
+		PWMDevConfig.u8PWMBaseCycleFrequency = PWM_PRESCALE_DEFALUT_NUM;
+		PWMDevConfig.u8PWMFrequencyDivider = PWM_COUNTER_DEFALUT1_NUM;
+		PWMDevConfig.u8PWMDutyCycle = PWM_COUNTER_DEFALUT1_NUM / 2;
+		err_check = npcm7xx_pwm_config_init(&PWMDevConfig);
+		if (err_check != 0) {
+			pr_err("PWM init fail channel %d\n", i);
+			return -EINVAL;
+		}
+	}
+
+	priv->groups[0] = &pwm_dev_group;
+	priv->groups[1] = NULL;
+
+	hwmon = devm_hwmon_device_register_with_groups(dev, "npcm7xx_pwm", priv,
+						       priv->groups);
+	if (IS_ERR(hwmon)) {
+		pr_err("PWM Driver failed - "
+		       "devm_hwmon_device_register_with_groups failed\n");
+		return PTR_ERR(hwmon);
+	}
+
+	pr_info("NPCM7XX PWM Driver probed\n");
+
+	return 0;
+}
+
+/* work with hotplug and coldplug */
+MODULE_ALIAS("platform:npcm750-pwm");
+
+static const struct of_device_id of_pwm_match_table[] = {
+	{ .compatible = "nuvoton,npcm750-pwm", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_match_table);
+
+static struct platform_driver npcm7xx_pwm_driver = {
+	.probe		= npcm7xx_pwm_probe,
+	.driver		= {
+		.name	= "npcm7xx_pwm",
+		.of_match_table = of_pwm_match_table,
+	},
+};
+
+module_platform_driver(npcm7xx_pwm_driver);
+
+MODULE_DESCRIPTION("Nuvoton NPCM7XX PWM Driver");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.14.1
