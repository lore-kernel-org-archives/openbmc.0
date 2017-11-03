Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mGJArOXB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CfeXIDVL"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySqNw0PfCzDrD9
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 15:54:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D5F5520F60;
 Fri,  3 Nov 2017 00:54:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 03 Nov 2017 00:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FRHPsGBWKaMpF3z+x
 Xp0eTgBphNNtr+LYy1PeAwakqo=; b=mGJArOXBLd/N3ixtjgT6+YhA7x5PusW1J
 WwoVBf3Vv7Am8su38yhD8rZqScM4VsgA1cfsK8yREWGZMlYDHMGouukAgAqaCewJ
 XvaTm8fEX8CqUxf6ljeEObTd+boF04vW1s5td1EjJ1V9kKg7bcop/xBSvU7N50VR
 XpUFrGSCwNQ9o3ozwgCxFsqMxr16CAwjA9KeAIfvC+c9TSzJzqBote75YsIJ1yUO
 OkhmjqRiW4pRq4DN83QGvfpBwYcv0HJb3BZfa9wk2eZGw52Uft+qT3aGbufTPaf1
 N4KCklszTIaStRCh9vydma6tzQLsF6urT+pqZKlj0EZhX53GhwZvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FRHPsGBWKaMpF3z+xXp0eTgBphNNtr+LYy1PeAwakqo=; b=CfeXIDVL
 JUKJd0bhr55PuNtmyDM4m6ei7+O5TWvL5LpH7d1hvnR/MLnLaOdCTksXXTflpNOm
 UbSx9lB+N7YZIlo/GEChL21tsX02Pn5sz42chRpy6T4pjrlAPRknPgndNeefAYMh
 pRQN0VQlHY6m0T2tPwrGHDa+PGrWsRX3QtKoa3DBE54xOMwLhyCVhOz6ktaN2hjV
 QpejcrZDrypmtjvPEWaYsqIe8M2ohSWoTVdGJhQu2o2mOTsD3PONwyxKIrZo8IDM
 B7mwUSkI0ZW+B2cMR9uTN2blOlS0DHVj5i+nAlqbRRsQFSHwDECOoNo0rc5lG2St
 TV08AvHLCT3JxQ==
X-ME-Sender: <xms:bfb7We8wtQK7G4YhVV1l1KWly5YcbQXiFq0wc2pPS8Fdn4gs3HGnlg>
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DB6C24009;
 Fri,  3 Nov 2017 00:54:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v4 4/6] pmbus: max31785: Add fan control
Date: Fri,  3 Nov 2017 15:53:04 +1100
Message-Id: <20171103045306.26448-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171103045306.26448-1-andrew@aj.id.au>
References: <20171103045306.26448-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Nov 2017 04:54:09 -0000

The implementation makes use of the new fan control virtual registers
exposed by the pmbus core. It mixes use of the default implementations
with some overrides via the read/write handlers to handle FAN_COMMAND_1
on the MAX31785, whose definition breaks the value range into various
control bands dependent on RPM or PWM mode.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/max31785   |   4 ++
 drivers/hwmon/pmbus/max31785.c | 104 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
index 45fb6093dec2..e9edbf11948f 100644
--- a/Documentation/hwmon/max31785
+++ b/Documentation/hwmon/max31785
@@ -32,6 +32,7 @@ Sysfs attributes
 fan[1-4]_alarm		Fan alarm.
 fan[1-4]_fault		Fan fault.
 fan[1-4]_input		Fan RPM.
+fan[1-4]_target		Fan input target
 
 in[1-6]_crit		Critical maximum output voltage
 in[1-6]_crit_alarm	Output voltage critical high alarm
@@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
 in[1-6]_min		Minimum output voltage
 in[1-6]_min_alarm	Output voltage low alarm
 
+pwm[1-4]		Fan target duty cycle (0..255)
+pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
+
 temp[1-11]_crit		Critical high temperature
 temp[1-11]_crit_alarm	Chip temperature critical high alarm
 temp[1-11]_input	Measured temperature
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 9313849d5160..0d97ddf67079 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -20,8 +20,102 @@ enum max31785_regs {
 
 #define MAX31785_NR_PAGES		23
 
+static int max31785_get_pwm(struct i2c_client *client, int page)
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
+	if (!(config & PB_FAN_1_RPM)) {
+		if (command >= 0x8000)
+			return 0;
+		else if (command >= 0x2711)
+			return 0x2710;
+
+		return command;
+	}
+
+	return 0;
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
+	if (!(config & PB_FAN_1_RPM)) {
+		if (command >= 0x8000)
+			return 2;
+		else if (command >= 0x2711)
+			return 0;
+
+		return 1;
+	}
+
+	return (command >= 0x8000) ? 2 : 1;
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
+		if (rv < 0)
+			return rv;
+
+		rv *= 255;
+		rv /= 100;
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
+static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
+
+static int max31785_write_word_data(struct i2c_client *client, int page,
+				    int reg, u16 word)
+{
+	switch (reg) {
+	case PMBUS_VIRT_PWM_ENABLE_1:
+		if (word >= ARRAY_SIZE(max31785_pwm_modes))
+			return -EINVAL;
+
+		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
+					max31785_pwm_modes[word]);
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
@@ -32,11 +126,19 @@ enum max31785_regs {
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
2.11.0
