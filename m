Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LmyKn5pj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gIsYd+lJ"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yf0lK29nJzDrRm
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 14:26:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 25B2020D3B;
 Fri, 17 Nov 2017 22:26:51 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 17 Nov 2017 22:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=gE4bVEmWchLUb+iY7s4CuBn7wkDOouEprP3JXzFLkbw=; b=LmyKn5pj
 YUp8KYGF0sDJeElpqRdjSdFuyTaUXiqgGH4/kKsTngGzRI6fYy09av6Y0l8nCNgL
 i5VTlQMgIJk8XH/HN0m+DlKkeAO7weO8NcSvDdia2fVJE8gSaxu7LDIlZXk9tQc5
 3wjAD7OtiP4sO9flgxtq/rHM04yr/7iR/cE0y+7aqF+7AgpJj2V8lkkwEZwyJbgX
 KTdu2O9/i+ycIgX85Sh5afS8L+myw4d4rPDkzG5eRJ0fQhn4AXylNVocnKcy+Prj
 DkE6QOA09hZbnx1LNZjAQEVtGpsMyI4S9yc+Dj0zwD5+mBLMbXiwopaO5xY0w3QK
 wsh89zAEUcsr9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=gE4bVEmWchLUb+iY7s4CuBn7wkDOo
 uEprP3JXzFLkbw=; b=gIsYd+lJ4GzLh9EUwVMgwUkfCuj5tAG28x/5eahaOcGNC
 Xq2P2GR+SXTEAUhhTJicDReytgxqSQIbSeyfrQ7R7Z1FDlDc3plxjWm1LrM9J+D5
 b3IuLSssvJmQ/Gg9607oxZU+9fRwBHArHTk2k3Xxcblf67Imxgr3PZ3+rrsSYNW+
 UwercjoF3PNojA1pLafe7e6Hkjsg/AIkc+sOtWNF7xwUfFAll9BTakGLqR0yoaAS
 QqC/egDAIRG86f4pm5rJ+ujaWkCiZLUdk/2SugL1d8N84kjrHEhReNl+HQh2SycE
 SUHIXeq9+RRt9HiC+91rJt+tU5EHEhmG7rlMmsBHg==
X-ME-Sender: <xms:e6gPWt6wit0iAV4PnW1LCF69XRCo6xAPil1boujJ2WNyxFmghbI_lQ>
Received: from dave.aj.id.au (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C878246D5;
 Fri, 17 Nov 2017 22:26:46 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 2/4] pmbus (max31785): Add fan control
Date: Sat, 18 Nov 2017 13:56:04 +1030
Message-Id: <7944e6754b4fa3ae991080e94e36e8b7882bf772.1510974230.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Sat, 18 Nov 2017 03:26:53 -0000

The implementation makes use of the new fan control virtual registers exposed
by the pmbus core. It mixes use of the default implementations with some
overrides via the read/write handlers to handle FAN_COMMAND_1 on the MAX31785,
whose definition breaks the value range into various control bands dependent on
RPM or PWM mode.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/max31785   |   7 ++-
 drivers/hwmon/pmbus/max31785.c | 138 +++++++++++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
index 45fb6093dec2..7b0a0a8cdb6b 100644
--- a/Documentation/hwmon/max31785
+++ b/Documentation/hwmon/max31785
@@ -32,6 +32,7 @@ Sysfs attributes
 fan[1-4]_alarm		Fan alarm.
 fan[1-4]_fault		Fan fault.
 fan[1-4]_input		Fan RPM.
+fan[1-4]_target		Fan input target
 
 in[1-6]_crit		Critical maximum output voltage
 in[1-6]_crit_alarm	Output voltage critical high alarm
@@ -44,6 +45,12 @@ in[1-6]_max_alarm	Output voltage high alarm
 in[1-6]_min		Minimum output voltage
 in[1-6]_min_alarm	Output voltage low alarm
 
+pwm[1-4]		Fan target duty cycle (0..255)
+pwm[1-4]_enable		0: Full-speed
+			1: Manual PWM control
+			2: Automatic PWM (tach-feedback RPM fan-control)
+			3: Automatic closed-loop (temp-feedback fan-control)
+
 temp[1-11]_crit		Critical high temperature
 temp[1-11]_crit_alarm	Chip temperature critical high alarm
 temp[1-11]_input	Measured temperature
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 9313849d5160..2699134dfbe7 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -20,8 +20,136 @@ enum max31785_regs {
 
 #define MAX31785_NR_PAGES		23
 
+static int max31785_get_pwm(struct i2c_client *client, int page)
+{
+	int rv;
+
+	rv = pmbus_get_fan_rate_device(client, page, 0, percent);
+	if (rv < 0)
+		return rv;
+	else if (rv >= 0x8000)
+		return 0;
+	else if (rv >= 0x2711)
+		return 0x2710;
+
+	return rv;
+}
+
+static int max31785_get_pwm_mode(struct i2c_client *client, int page)
+{
+	int config;
+	int command;
+
+	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	if (config < 0)
+		return config;
+
+	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
+	if (command < 0)
+		return command;
+
+	if (config & PB_FAN_1_RPM)
+		return (command >= 0x8000) ? 3 : 2;
+
+	if (command >= 0x8000)
+		return 3;
+	else if (command >= 0x2711)
+		return 0;
+
+	return 1;
+}
+
+static int max31785_read_word_data(struct i2c_client *client, int page,
+				   int reg)
+{
+	int rv;
+
+	switch (reg) {
+	case PMBUS_VIRT_PWM_1:
+		rv = max31785_get_pwm(client, page);
+		break;
+	case PMBUS_VIRT_PWM_ENABLE_1:
+		rv = max31785_get_pwm_mode(client, page);
+		break;
+	default:
+		rv = -ENODATA;
+		break;
+	}
+
+	return rv;
+}
+
+static inline u32 max31785_scale_pwm(u32 sensor_val)
+{
+	/*
+	 * The datasheet describes the accepted value range for manual PWM as
+	 * [0, 0x2710], while the hwmon pwmX sysfs interface accepts values in
+	 * [0, 255]. The MAX31785 uses DIRECT mode to scale the FAN_COMMAND
+	 * registers and in PWM mode the coefficients are m=1, b=0, R=2. The
+	 * important observation here is that 0x2710 == 10000 == 100 * 100.
+	 *
+	 * R=2 (== 10^2 == 100) accounts for scaling the value provided at the
+	 * sysfs interface into the required hardware resolution, but it does
+	 * not yet yield a value that we can write to the device (this initial
+	 * scaling is handled by pmbus_data2reg()). Multiplying by 100 below
+	 * translates the parameter value into the percentage units required by
+	 * PMBus, and then we scale back by 255 as required by the hwmon pwmX
+	 * interface to yield the percentage value at the appropriate
+	 * resolution for hardware.
+	 */
+	return (sensor_val * 100) / 255;
+}
+
+static int max31785_pwm_enable(struct i2c_client *client, int page,
+				    u16 word)
+{
+	int config = 0;
+	int rate;
+
+	switch (word) {
+	case 0:
+		rate = 0x7fff;
+		break;
+	case 1:
+		rate = pmbus_get_fan_rate_cached(client, page, 0, percent);
+		rate = max31785_scale_pwm(rate);
+		if (rate < 0)
+			return rate;
+		break;
+	case 2:
+		config = PB_FAN_1_RPM;
+		rate = pmbus_get_fan_rate_cached(client, page, 0, rpm);
+		if (rate < 0)
+			return rate;
+		break;
+	case 3:
+		rate = 0xffff;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return pmbus_update_fan(client, page, 0, config, PB_FAN_1_RPM, rate);
+}
+
+static int max31785_write_word_data(struct i2c_client *client, int page,
+				    int reg, u16 word)
+{
+	switch (reg) {
+	case PMBUS_VIRT_PWM_1:
+		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
+					max31785_scale_pwm(word));
+	case PMBUS_VIRT_PWM_ENABLE_1:
+		return max31785_pwm_enable(client, page, word);
+	default:
+		break;
+	}
+
+	return -ENODATA;
+}
+
 #define MAX31785_FAN_FUNCS \
-	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12)
+	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_PWM12)
 
 #define MAX31785_TEMP_FUNCS \
 	(PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
@@ -32,11 +160,19 @@ enum max31785_regs {
 static const struct pmbus_driver_info max31785_info = {
 	.pages = MAX31785_NR_PAGES,
 
+	.write_word_data = max31785_write_word_data,
+	.read_word_data = max31785_read_word_data,
+
 	/* RPM */
 	.format[PSC_FAN] = direct,
 	.m[PSC_FAN] = 1,
 	.b[PSC_FAN] = 0,
 	.R[PSC_FAN] = 0,
+	/* PWM */
+	.format[PSC_PWM] = direct,
+	.m[PSC_PWM] = 1,
+	.b[PSC_PWM] = 0,
+	.R[PSC_PWM] = 2,
 	.func[0] = MAX31785_FAN_FUNCS,
 	.func[1] = MAX31785_FAN_FUNCS,
 	.func[2] = MAX31785_FAN_FUNCS,
-- 
git-series 0.9.1
