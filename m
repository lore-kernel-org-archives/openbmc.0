Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPcjv4rxpzDqyG
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 01:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458052842461816.8958023562602;
 Tue, 15 Mar 2016 07:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] hwmon-adm1278: Add adm1278 to Barreleye device tree
Date: Tue, 15 Mar 2016 09:40:40 -0500
Message-Id: <1458052840-6561-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458052840-6561-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458052840-6561-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 15 Mar 2016 14:40:52 -0000

From: Yi Li <adamliyi@msn.com>

This patch enables adm1278 (and other compatible devices) to be instantiated from
device tree. So we don't need to explicitly call:

echo adm1278 0x10 > /sys/bus/i2c/devices/i2c-4/new_device

Tested on Barreleye.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 .../linux/linux-obmc/hwmon_adm1278.patch           | 92 ++++++++++++++++++----
 .../linux/linux-obmc/readme_adm1278.txt            |  7 +-
 2 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
index 074d39f..6ebc747 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
@@ -1,5 +1,34 @@
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+index 8a7347b..beace21 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+@@ -70,8 +70,23 @@
+ 						reg = <0x51>;
+ 					};
+ 				};
+-
++				i2c4: i2c-bus@140 {
++					adm1278@10 {
++						compatible = "adi,adm1278";
++						reg = <0x10>;
++					};
++				};
++				i2c5: i2c-bus@180 {
++					adm1278@10 {
++						compatible = "adi,adm1278";
++						reg = <0x10>;
++					};
++				};
+ 				i2c6: i2c-bus@1c0 {
++					adm1278@10 {
++						compatible = "adi,adm1278";
++						reg = <0x10>;
++					};
+ 					nct7904@2d {
+ 						compatible = "nuvoton,nct7904";
+ 						reg = <0x2d>;
 diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
-index 188af4c..a45075d 100644
+index 188af4c..7285eb8 100644
 --- a/drivers/hwmon/pmbus/adm1275.c
 +++ b/drivers/hwmon/pmbus/adm1275.c
 @@ -24,7 +24,7 @@
@@ -25,7 +54,7 @@ index 188af4c..a45075d 100644
 +#define ADM1278_CFG_VOUT_EN		BIT(1)
 +#define ADM1278_PEAK_TEMPERATURE	0xd7
 +
-+#define ADM1278_R_SENSE	1000	/* R_sense resistor value in microohmsi */
++#define ADM1278_R_SENSE	1000	/* R_sense resistor value in microohms */
 +
 +static int r_sense = ADM1278_R_SENSE;
 +module_param(r_sense, int, 0644);
@@ -54,17 +83,18 @@ index 188af4c..a45075d 100644
  		break;
  	case PMBUS_VIRT_RESET_PIN_HISTORY:
  		if (!data->have_pin_max)
-@@ -239,6 +261,9 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
+@@ -239,6 +261,10 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
  	case PMBUS_VIRT_RESET_VIN_HISTORY:
  		ret = pmbus_write_word_data(client, 0, ADM1275_PEAK_VIN, 0);
  		break;
 +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
-+		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMPERATURE, 0);
++		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMPERATURE,
++						0);
 +		break;
  	case PMBUS_VIRT_RESET_PIN_HISTORY:
  		ret = pmbus_write_word_data(client, 0, ADM1276_PEAK_PIN, 0);
  		if (!ret && data->have_pin_min)
-@@ -312,6 +337,7 @@ static const struct i2c_device_id adm1275_id[] = {
+@@ -312,6 +338,7 @@ static const struct i2c_device_id adm1275_id[] = {
  	{ "adm1075", adm1075 },
  	{ "adm1275", adm1275 },
  	{ "adm1276", adm1276 },
@@ -72,16 +102,19 @@ index 188af4c..a45075d 100644
  	{ "adm1293", adm1293 },
  	{ "adm1294", adm1294 },
  	{ }
-@@ -335,6 +361,8 @@ static int adm1275_probe(struct i2c_client *client,
+@@ -335,6 +362,11 @@ static int adm1275_probe(struct i2c_client *client,
  				     | I2C_FUNC_SMBUS_BLOCK_DATA))
  		return -ENODEV;
  
-+	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correctly */
++	/* i2c_aspeed driver does not handle
++	 * i2c_smbus_read_block_data() correctly.
++	 * Disable the code until been fixed.
++	 */
 +#if 0
  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
  	if (ret < 0) {
  		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
-@@ -363,6 +391,7 @@ static int adm1275_probe(struct i2c_client *client,
+@@ -363,6 +395,7 @@ static int adm1275_probe(struct i2c_client *client,
  		dev_notice(&client->dev,
  			   "Device mismatch: Configured %s, detected %s\n",
  			   id->name, mid->name);
@@ -89,23 +122,25 @@ index 188af4c..a45075d 100644
  
  	config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
  	if (config < 0)
-@@ -377,7 +406,9 @@ static int adm1275_probe(struct i2c_client *client,
+@@ -377,7 +410,12 @@ static int adm1275_probe(struct i2c_client *client,
  	if (!data)
  		return -ENOMEM;
  
 -	data->id = mid->driver_data;
-+	/* i2c_aspeed driver does not handle i2c_smbus_read_block_data correctly */
-+	//data->id = mid->driver_data;
++	/* i2c_aspeed driver does not handle
++	 * i2c_smbus_read_block_data() correctly.
++	 * Disable the code until been fixed.
++	 */
++	/* data->id = mid->driver_data; */
 +	data->id = adm1278;
  
  	info = &data->info;
  
-@@ -460,6 +491,62 @@ static int adm1275_probe(struct i2c_client *client,
+@@ -460,6 +498,63 @@ static int adm1275_probe(struct i2c_client *client,
  			info->func[0] |=
  			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
  		break;
 +	case adm1278:
-+		/* Configure monitoring */
 +		ret = i2c_smbus_write_byte_data(client,
 +			ADM1278_PMON_CONTROL, 0);
 +		if (ret < 0)
@@ -119,8 +154,8 @@ index 188af4c..a45075d 100644
 +		if (ret < 0)
 +			return ret;
 +		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
-+		dev_info(&client->dev, "adm1278 config: 0x%x\n", ret);
-+		ret = i2c_smbus_write_byte_data(client, ADM1278_PMON_CONTROL,1);
++		ret = i2c_smbus_write_byte_data(client,
++			ADM1278_PMON_CONTROL, 1);
 +		if (ret < 0)
 +			return ret;
 +
@@ -159,7 +194,34 @@ index 188af4c..a45075d 100644
 +		info->m[PSC_TEMPERATURE] = 42;
 +		info->b[PSC_TEMPERATURE] = 31880;
 +		info->R[PSC_TEMPERATURE] = -1;
++		dev_info(&client->dev, "adm1278 ready: i2c:%x-%x\n",
++				client->adapter->nr, client->addr);
 +		break;
  	case adm1293:
  	case adm1294:
  		data->have_iout_min = true;
+@@ -541,9 +636,24 @@ static int adm1275_probe(struct i2c_client *client,
+ 	return pmbus_do_probe(client, id, info);
+ }
+ 
++#ifdef CONFIG_OF
++static const struct of_device_id adm1275_of_match[] = {
++	{ .compatible = "adi,adm1075" },
++	{ .compatible = "adi,adm1275" },
++	{ .compatible = "adi,adm1276" },
++	{ .compatible = "adi,adm1278" },
++	{ .compatible = "adi,adm1293" },
++	{ .compatible = "adi,adm1294" },
++	{ }
++};
++MODULE_DEVICE_TABLE(of, adm1275_of_match);
++#endif
++
++
+ static struct i2c_driver adm1275_driver = {
+ 	.driver = {
+ 		   .name = "adm1275",
++		   .of_match_table = of_match_ptr(adm1275_of_match),
+ 		   },
+ 	.probe = adm1275_probe,
+ 	.remove = pmbus_do_remove,
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
index e86d977..157248f 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
@@ -23,10 +23,12 @@ I2C7: P12v_c for HDD and IO Board
 adm1275 and pmbus into kernel.
 
 3) When kernel booted, initialize the adm1278 devices:
-
+We have add adm1278 to device tree, so do not need to do bellow steps.
+(
 root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-4/new_device
 root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-5/new_device
 root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-6/new_device
+)
 
 There will be three new hwmon sysfs entries created:
 
@@ -76,3 +78,6 @@ root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1_input
 -270952
 
 Need further check on that.
+
+5.4) The adm1278 driver re-used sensor inteface of common pmbus driver. The adm1278 chip itself has more sensors, like 'READ_EIN'.
+If we need those sensors, we need to add additional interface.
-- 
2.7.1
