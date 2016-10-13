Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw42R3LzPzDsxk
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IPAgb5ul; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id f128so6539252qkb.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=RURmAaBJ5jn0uhbyd67mchpx9BX3uQl0dwIlyRnr5GI=;
 b=IPAgb5ulWRp4Od9+DyE6ElgO2wtEOaeJX5pkL1jZdjAhng1B64+eCLuEhxoofLEWdV
 Jp84RgP4fqKLRHq/KqeMLtaOmFjpzglboW/YJBp/feno/09vEerjep5vB/ufR33NNFFH
 V9C1KsgHwNIUcxtPdT47ElqlEAqgevh0FedWr9gaLCFFSpMJOvhVP442KNQNOK5wCSTh
 omwRjaafhwVyXO7IiAPFwNr225SYAscmBv3rVqR1YxEgFmS4WnM+GFK3wmCCl/DKqLl8
 yLrh6N4+F873X/zKTcdiS6pX9NieRljbYq9hLF0ICZFltfumNrqwaW0wllB3ULV4RNA/
 kGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RURmAaBJ5jn0uhbyd67mchpx9BX3uQl0dwIlyRnr5GI=;
 b=aDjvhGoLEM5z8h65PFx0Uq11Ayo6d0YC+CnFsGoETr0TMUwenzbFypKqv5zRdDcxul
 L4lEBUmrEr3uOlaKPIe9/jyUhfFnhkrJF0HgJN9OVeXH5pSchNq8ZG7LiofaFk3jqonc
 TGWEjp2KK7412qbcEKgjGlNgYoVhjme+Gw76DQ5Au5iLQf36ZS+E2FhnSojP38cU69fH
 ut2IWK65qC8AwZtBLWFsVjy7xpr49mTSXaR2NTULuBfsmFbJdPKJlJmbwCGZYb31AGUc
 n7xi8BKn+NV/2CvX6wH6eGPvXxgSse/SMZve2wPwOUX6XF+WE1OKfmTwBU1aClibca4H
 46SQ==
X-Gm-Message-State: AA6/9RnvmlHtT3FiU+gv9OYZjIlLdIA2qtkAsJJ+MkHKpcpoZE7aNwPiP8g2JF2bmRdP+A==
X-Received: by 10.55.18.40 with SMTP id c40mr8371818qkh.269.1476394940428;
 Thu, 13 Oct 2016 14:42:20 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.56])
 by smtp.gmail.com with ESMTPSA id a20sm5814250qkj.39.2016.10.13.14.42.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Oct 2016 14:42:19 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v4 3/6] hwmon: Add OCC driver basic sysfs attributes
Date: Thu, 13 Oct 2016 16:42:09 -0500
Message-Id: <1476394929-17005-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Thu, 13 Oct 2016 21:42:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add name, update interval, and powercap sysfs files, as well as the method
to send commands to the OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/power8_occ.c | 178 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
index d32c48f..a42fb30 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -31,11 +31,184 @@
 
 #include "occ.h"
 
+/* Defined in POWER8 Processor Registers Specification */
+/* To generate attn to OCC */
+#define ATTN_DATA	0x0006B035
+/* For BMC to read/write SRAM */
+#define OCB_ADDRESS		0x0006B070
+#define OCB_DATA		0x0006B075
+#define OCB_STATUS_CONTROL_AND	0x0006B072
+#define OCB_STATUS_CONTROL_OR	0x0006B073
+/* See definition in:
+ * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
+ */
+#define OCC_COMMAND_ADDR	0xFFFF6000
+#define OCC_RESPONSE_ADDR	0xFFFF7000
+
 struct power8_driver {
 	struct occ_driver *driver;
 	struct device *dev;
+	unsigned long update_interval;
+	u16 user_powercap;
 };
 
+static u8 occ_send_cmd(struct occ_driver *occ, u8 seq, u8 type,
+			    u16 length, u8 *data, u8 *resp)
+{
+	u32 cmd1, cmd2;
+	u16 checksum;
+	int i;
+
+	length = cpu_to_le16(length);
+	cmd1 = (seq << 24) | (type << 16) | length;
+	memcpy(&cmd2, data, length);
+	cmd2 <<= ((4 - length) * 8);
+
+	/* checksum: sum of every bytes of cmd1, cmd2 */
+	checksum = 0;
+	for (i = 0; i < 4; i++)
+		checksum += (cmd1 >> (i * 8)) & 0xFF;
+	for (i = 0; i < 4; i++)
+		checksum += (cmd2 >> (i * 8)) & 0xFF;
+	cmd2 |= checksum << ((2 - length) * 8);
+
+	/* Init OCB */
+	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_OR,  0x08000000,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF,
+			     0xFFFFFFFF);
+
+	/* Send command */
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_DATA, cmd1, cmd2);
+
+	/* Trigger attention */
+	occ->bus_ops.putscom(occ->bus, ATTN_DATA, 0x01010000, 0x00000000);
+
+	/* Get response data */
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_RESPONSE_ADDR,
+			     0x00000000);
+	occ->bus_ops.getscom(occ->bus, OCB_DATA, resp, 0);
+
+	/* return status */
+	return resp[2];
+}
+
+static ssize_t show_update_interval(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct power8_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
+			jiffies_to_msecs(driver->update_interval));
+}
+
+static ssize_t store_update_interval(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct power8_driver *driver = dev_get_drvdata(dev);
+	unsigned long val;
+	int rc;
+
+	rc = kstrtoul(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	driver->update_interval = msecs_to_jiffies(val);
+
+	return count;
+}
+
+static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_interval,
+		   store_update_interval);
+
+static ssize_t show_name(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE - 1, "occ-power8-i2c\n");
+}
+
+static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+
+static ssize_t show_user_powercap(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct power8_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
+}
+
+static ssize_t store_user_powercap(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct power8_driver *driver = dev_get_drvdata(dev);
+	u16 val;
+	u8 resp[8];
+	int rc;
+
+	rc = kstrtou16(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	dev_dbg(dev, "set user powercap to: %u\n", val);
+	val = cpu_to_le16(val);
+	rc = occ_send_cmd(driver->driver, 0, 0x22, 2, (u8 *)&val, resp);
+	if (rc != 0) {
+		dev_err(dev,
+			"ERROR: Set User Powercap: wrong return status: %x\n",
+			rc);
+		if (rc == 0x13)
+			dev_info(dev,
+				 "ERROR: set invalid powercap value: %x\n",
+				 val);
+		return -EINVAL;
+	}
+
+	driver->user_powercap = val;
+	return count;
+}
+
+static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
+		   store_user_powercap);
+
+static void occ_remove_hwmon_attrs(struct power8_driver *driver)
+{
+	struct device *dev = driver->dev;
+
+	device_remove_file(dev, &dev_attr_update_interval);
+	device_remove_file(dev, &dev_attr_name);
+}
+
+static int occ_create_hwmon_attrs(struct power8_driver *driver)
+{
+	int rc;
+	struct device *dev = driver->dev;
+
+	rc = device_create_file(dev, &dev_attr_name);
+	if (rc)
+		goto error;
+
+	rc = device_create_file(dev, &dev_attr_update_interval);
+	if (rc)
+		goto error;
+
+	/* skip powercap for now; we need to determine if CAPS response id
+	 * is present first, which requires polling the OCC
+	 */
+
+	return 0;
+
+error:
+	dev_err(dev, "ERROR: cannot create hwmon attributes: %d\n", rc);
+	occ_remove_hwmon_attrs(driver);
+	return rc;
+}
+
 int occ_init(struct occ_driver *driver)
 {
 	struct device *dev = driver->hwmon;
@@ -50,9 +223,12 @@ int occ_init(struct occ_driver *driver)
 
 	dev_set_drvdata(dev, powr);
 
-	return 0;
+	return occ_create_hwmon_attrs(powr);
 }
 
 void occ_exit(struct occ_driver *driver)
 {
+	struct power8_driver *powr = dev_get_drvdata(driver->hwmon);
+
+	occ_remove_hwmon_attrs(powr);
 }
-- 
1.9.1
