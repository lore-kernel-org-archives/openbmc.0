Return-Path: <adriana.kobylak@gmail.com>
Received: from mail-pa0-x22d.google.com (mail-pa0-x22d.google.com
 [IPv6:2607:f8b0:400e:c03::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C3A1B1A035C
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 08:46:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vclC6NLn; 
 dkim-atps=neutral
Received: by mail-pa0-x22d.google.com with SMTP id bj10so50303535pad.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2016 13:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4IMKD44/UPt4UdAkC7SMUReXTBbsISTa4NJoCeia4Fk=;
 b=vclC6NLn0VTu1iVYErg+fu3Z0vgltSEGyHTZnOkmJNG9vGlRAfx2H20QHBQ8w+4N9p
 hWEMWvE0M+sZNOoSR7DWkoqSDewi8hsxpJOOB9GRjswsRNqoOjIm/J2CgLYRcDAJuERv
 BB2UNSP6jfIXHh09k6YmoyN+H6GeJxd5JyWsKi1EfrZTfhMvlZEM6ajWSVilC0Zdn61c
 DZNVllq8SuF6M5JVgPNEiv1z9PBMV5/s3zlUutmsWECdiM3yCWfKv9dpXuzpgZ+bAQo5
 /NwZY+DTMkEblJx39ewzSR/JodSlYOqM1lSKE/qi9kjehIp6KzKXHU/ghpUNnax4ppVe
 ueNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4IMKD44/UPt4UdAkC7SMUReXTBbsISTa4NJoCeia4Fk=;
 b=VIV15eDz7ihgZbGs0yLB9S1CwOT2TDKoyohxH8s6YjgOK6gl8A4qvqk9X3WqqHzVul
 rYmSOod+8FVHX2M639AOhcRmm2nV0N7DpBPnv5vNvpzYOiXaJZqy0H4/Pr8js3tHcj6w
 X3K71NwQVMdmTPSnXxWvvJGEK54E/11ECR77shQd0+YWix+p61GiOBy91M2Bfj6XV+OC
 YTJhUYQywWd5jMDR1xoVSBB9gdMd0cVfTO+DjVexclamOOliNmv8KX3MN/eWqplqfh7G
 pSSTArUkj39gwoZGKLMOTnQe6ekiLwgWdBPBy75r4BZ+/gGEf4xxJ3UihCqrvVMwXxbF
 ZzsA==
X-Gm-Message-State: AD7BkJLCZuaDnWcNvzU7usNykac0q/T8mGZL5Q7axo6TVMyt2FBYJWMqHc6Fu2RvMPGP5w==
X-Received: by 10.66.55.73 with SMTP id q9mr33573942pap.50.1456868808046;
 Tue, 01 Mar 2016 13:46:48 -0800 (PST)
Received: from habcap11p1.aus.stglabs.ibm.com ([32.97.110.54])
 by smtp.googlemail.com with ESMTPSA id dg1sm47758194pad.18.2016.03.01.13.46.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Mar 2016 13:46:47 -0800 (PST)
From: Adriana Kobylak <adriana.kobylak@gmail.com>
X-Google-Original-From: Adriana Kobylak <anoo@us.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] Add temporary adm1278 hwmon pmbus driver patch
Date: Tue,  1 Mar 2016 15:45:50 -0600
Message-Id: <1456868750-46780-2-git-send-email-anoo@us.ibm.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456868750-46780-1-git-send-email-anoo@us.ibm.com>
References: <1456868750-46780-1-git-send-email-anoo@us.ibm.com>
X-Mailman-Approved-At: Fri, 04 Mar 2016 02:53:11 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 21:46:50 -0000

From: Yi Li <adamliyi@msn.com>

From: Yi Li <adamliyi@msn.com>

This patch temporarily adds adm1278 hwmon driver as a kernel patch to openbmc,
for testing on Barreleye.
If in the future this patch will still be useful, it should be put into linux kernel.

Barreleye has three adm1278 devices on three i2c buses.
This patch enables reading adm1278 sensors via hwmon sysfs interface.
The enabled sensors are: current, voltage (In and Out), power and temperature.
Detail usage can be found in 'readme_adm1278.txt'.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
 .../linux/linux-obmc/hwmon_adm1278.patch           | 165 +++++++++++++++++++++
 .../linux/linux-obmc/readme_adm1278.txt            |  78 ++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 +
 4 files changed, 249 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
new file mode 100644
index 0000000..086f191
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
@@ -0,0 +1,3 @@
+CONFIG_PMBUS=y
+CONFIG_SENSORS_PMBUS=y
+CONFIG_SENSORS_ADM1275=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
new file mode 100644
index 0000000..074d39f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
@@ -0,0 +1,165 @@
+diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
+index 188af4c..a45075d 100644
+--- a/drivers/hwmon/pmbus/adm1275.c
++++ b/drivers/hwmon/pmbus/adm1275.c
+@@ -24,7 +24,7 @@
+ #include <linux/bitops.h>
+ #include "pmbus.h"
+ 
+-enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
++enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
+ 
+ #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
+ #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
+@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
+ #define ADM1075_VAUX_OV_WARN		BIT(7)
+ #define ADM1075_VAUX_UV_WARN		BIT(6)
+ 
++#define ADM1278_PMON_CONTROL		0xd3
++#define ADM1278_PMON_CONFIG		0xd4
++#define ADM1278_CFG_TSFLT		BIT(15)
++#define ADM1278_CFG_SIMULTANEOUS	BIT(14)
++#define ADM1278_CFG_PMON_MODE		BIT(4)
++#define ADM1278_CFG_TEMP1_EN		BIT(3)
++#define ADM1278_CFG_VIN_EN		BIT(2)
++#define ADM1278_CFG_VOUT_EN		BIT(1)
++#define ADM1278_PEAK_TEMPERATURE	0xd7
++
++#define ADM1278_R_SENSE	1000	/* R_sense resistor value in microohmsi */
++
++static int r_sense = ADM1278_R_SENSE;
++module_param(r_sense, int, 0644);
++MODULE_PARM_DESC(r_sense, "Rsense resistor value in microohms");
++
+ struct adm1275_data {
+ 	int id;
+ 	bool have_oc_fault;
+@@ -186,6 +202,11 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
+ 	case PMBUS_VIRT_READ_VIN_MAX:
+ 		ret = pmbus_read_word_data(client, 0, ADM1275_PEAK_VIN);
+ 		break;
++	case PMBUS_VIRT_READ_TEMP_MAX:
++		if (data->id != adm1278)
++			return -ENODATA;
++		ret = pmbus_read_word_data(client, 0, ADM1278_PEAK_TEMPERATURE);
++		break;
+ 	case PMBUS_VIRT_READ_PIN_MIN:
+ 		if (!data->have_pin_min)
+ 			return -ENXIO;
+@@ -199,6 +220,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
+ 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
+ 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+ 	case PMBUS_VIRT_RESET_VIN_HISTORY:
++	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+ 		break;
+ 	case PMBUS_VIRT_RESET_PIN_HISTORY:
+ 		if (!data->have_pin_max)
+@@ -239,6 +261,9 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
+ 	case PMBUS_VIRT_RESET_VIN_HISTORY:
+ 		ret = pmbus_write_word_data(client, 0, ADM1275_PEAK_VIN, 0);
+ 		break;
++	case PMBUS_VIRT_RESET_TEMP_HISTORY:
++		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMPERATURE, 0);
++		break;
+ 	case PMBUS_VIRT_RESET_PIN_HISTORY:
+ 		ret = pmbus_write_word_data(client, 0, ADM1276_PEAK_PIN, 0);
+ 		if (!ret && data->have_pin_min)
+@@ -312,6 +337,7 @@ static const struct i2c_device_id adm1275_id[] = {
+ 	{ "adm1075", adm1075 },
+ 	{ "adm1275", adm1275 },
+ 	{ "adm1276", adm1276 },
++	{ "adm1278", adm1278 },
+ 	{ "adm1293", adm1293 },
+ 	{ "adm1294", adm1294 },
+ 	{ }
+@@ -335,6 +361,8 @@ static int adm1275_probe(struct i2c_client *client,
+ 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
+ 		return -ENODEV;
+ 
++	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correctly */
++#if 0
+ 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+ 	if (ret < 0) {
+ 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+@@ -363,6 +391,7 @@ static int adm1275_probe(struct i2c_client *client,
+ 		dev_notice(&client->dev,
+ 			   "Device mismatch: Configured %s, detected %s\n",
+ 			   id->name, mid->name);
++#endif
+ 
+ 	config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
+ 	if (config < 0)
+@@ -377,7 +406,9 @@ static int adm1275_probe(struct i2c_client *client,
+ 	if (!data)
+ 		return -ENOMEM;
+ 
+-	data->id = mid->driver_data;
++	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correctly */
++	//data->id = mid->driver_data;
++	data->id = adm1278;
+ 
+ 	info = &data->info;
+ 
+@@ -460,6 +491,62 @@ static int adm1275_probe(struct i2c_client *client,
+ 			info->func[0] |=
+ 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+ 		break;
++	case adm1278:
++		/* Configure monitoring */
++		ret = i2c_smbus_write_byte_data(client,
++			ADM1278_PMON_CONTROL, 0);
++		if (ret < 0)
++			return ret;
++		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
++		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
++						ADM1278_CFG_PMON_MODE |
++						ADM1278_CFG_TEMP1_EN |
++						ADM1278_CFG_VIN_EN |
++						ADM1278_CFG_VOUT_EN);
++		if (ret < 0)
++			return ret;
++		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
++		dev_info(&client->dev, "adm1278 config: 0x%x\n", ret);
++		ret = i2c_smbus_write_byte_data(client, ADM1278_PMON_CONTROL,1);
++		if (ret < 0)
++			return ret;
++
++		info->func[0] |= PMBUS_HAVE_VIN
++			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
++			| PMBUS_HAVE_PIN
++			| PMBUS_HAVE_STATUS_INPUT
++			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
++
++		data->have_oc_fault = false;
++		data->have_uc_fault = false;
++		data->have_vout = true;
++		data->have_vaux_status = false;
++		data->have_mfr_vaux_status = false;
++		data->have_iout_min = false;
++		data->have_pin_min = false;
++		data->have_pin_max = true;
++
++		info->m[PSC_VOLTAGE_IN] = 19599;
++		info->b[PSC_VOLTAGE_IN] = 0;
++		info->R[PSC_VOLTAGE_IN] = -2;
++
++		info->m[PSC_VOLTAGE_OUT] = 19599;
++		info->b[PSC_VOLTAGE_OUT] = 0;
++		info->R[PSC_VOLTAGE_OUT] = -2;
++
++		info->m[PSC_CURRENT_OUT] = 800 * r_sense / 1000;
++		info->b[PSC_CURRENT_OUT] = 20475;
++		info->R[PSC_CURRENT_OUT] = -1;
++
++		info->m[PSC_POWER] = 6123 * r_sense / 1000;
++		info->b[PSC_POWER] = 0;
++		info->R[PSC_POWER] = -2;
++
++		info->format[PSC_TEMPERATURE] = direct;
++		info->m[PSC_TEMPERATURE] = 42;
++		info->b[PSC_TEMPERATURE] = 31880;
++		info->R[PSC_TEMPERATURE] = -1;
++		break;
+ 	case adm1293:
+ 	case adm1294:
+ 		data->have_iout_min = true;
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
new file mode 100644
index 0000000..e86d977
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
@@ -0,0 +1,78 @@
+README for adm1278 hwmon driver
+==================================
+Yi Li <shliyi@cn.ibm.com>
+
+
+This is a temporary kernel patch to enable hwmon driver for adm1278 chip on Barreleye.
+When this patch is merged into linux kernel, this patch will be removed from openbmc.
+
+The adm1278 driver is created according to datasheet:
+http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1278.pdf
+
+The patch heavily re-used adm1278 enabling code from: https://github.com/facebook/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/files/patch-2.6.28.9/0000-linux-openbmc.patch.
+
+This patch has been tested on barreleye, by following these steps:
+
+1) There are 3 adm1278 devices on Barreleye
+
+I2C5: P12v_a for CPU0
+I2C6: P12v_b for CPU1
+I2C7: P12v_c for HDD and IO Board
+
+2) adm1278 driver is based on adm1275.c, which depends on pmbus. This patch builds
+adm1275 and pmbus into kernel.
+
+3) When kernel booted, initialize the adm1278 devices:
+
+root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-4/new_device
+root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-5/new_device
+root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-6/new_device
+
+There will be three new hwmon sysfs entries created:
+
+root@barreleye:~# ls /sys/class/hwmon/hwmon3/
+curr1_highest         in1_highest           in1_reset_history     in2_min_alarm         power1_label          temp1_input
+curr1_input           in1_input             in2_highest           in2_reset_history     power1_max            temp1_max
+curr1_label           in1_label             in2_input             name                  power1_reset_history  temp1_max_alarm
+curr1_max             in1_max               in2_label             power/                subsystem/            temp1_reset_history
+curr1_max_alarm       in1_max_alarm         in2_max               power1_alarm          temp1_crit            uevent
+curr1_reset_history   in1_min               in2_max_alarm         power1_input          temp1_crit_alarm
+device/               in1_min_alarm         in2_min               power1_input_highest  temp1_highest
+root@barreleye:~# ls /sys/class/hwmon/hwmon4/
+curr1_highest         in1_highest           in1_reset_history     in2_min_alarm         power1_label          temp1_input
+curr1_input           in1_input             in2_highest           in2_reset_history     power1_max            temp1_max
+curr1_label           in1_label             in2_input             name                  power1_reset_history  temp1_max_alarm
+curr1_max             in1_max               in2_label             power/                subsystem/            temp1_reset_history
+curr1_max_alarm       in1_max_alarm         in2_max               power1_alarm          temp1_crit            uevent
+curr1_reset_history   in1_min               in2_max_alarm         power1_input          temp1_crit_alarm
+device/               in1_min_alarm         in2_min               power1_input_highest  temp1_highest
+root@barreleye:~# ls /sys/class/hwmon/hwmon5/
+curr1_highest         in1_highest           in1_reset_history     in2_min_alarm         power1_label          temp1_input
+curr1_input           in1_input             in2_highest           in2_reset_history     power1_max            temp1_max
+curr1_label           in1_label             in2_input             name                  power1_reset_history  temp1_max_alarm
+curr1_max             in1_max               in2_label             power/                subsystem/            temp1_reset_history
+curr1_max_alarm       in1_max_alarm         in2_max               power1_alarm          temp1_crit            uevent
+curr1_reset_history   in1_min               in2_max_alarm         power1_input          temp1_crit_alarm
+device/               in1_min_alarm         in2_min               power1_input_highest  temp1_highest
+
+4) For details of what each hwmon sysfs attributes mean, please refer to:
+https://www.kernel.org/doc/Documentation/hwmon/pmbus
+For short, 'curr1_*' refers to 'IOUT', 'in1_*' refers to 'vin', 'in2_*' refers to 'vout', 'power1_*' refers to 'input power',
+'temp1_*' for 'temperature'.
+
+5) Remaining issue:
+
+5.1) Currently, i2c_aspeed driver does not handle "i2c_smbus_read_block_data()" correctly. So this patch has to bypass some detection code.
+We need to fix this issue when the patch is merged to kernel.
+5.2) According to adm1278 datasheet, there is a sense resistor used to measure power and current. The resistor will affect conversion between
+adm1278 register value to real-world value for current and power. I am not very sure about the resistor value. So using 1 mili-ohms (or 1000 micro-ohms) as default value. When build the adm1275 driver as kernel module, we can set this resistor value by:
+
+# insmod adm1275.ko r_sense=500
+
+This will set the 'sense resistor' to 500 micro-ohms.
+5.3) Some of the sensor value, e.g, 'temp1_input' seems not reasonable, e.g:
+
+root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1_input
+-270952
+
+Need further check on that.
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..b6e8e16
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://barreleye.cfg"
+SRC_URI += "file://hwmon_adm1278.patch"
-- 
1.8.2.2
