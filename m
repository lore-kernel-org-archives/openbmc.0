Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTQr6f7lzDsxl
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:43:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OReQOIbe; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id n189so4590285qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=UFC3AeLwbUfmpqz7ww2iQqSGesm3rWuUBlHnQoBDl1I=;
 b=OReQOIbe/Ckuj63qfxnWDRE2xU7MUxU8S4ocQx1wegsB6AaLFtAL16FGI6bWb9vLNa
 1+QJVAOcPwDzT6KumJBNNCsdJGVKLDt+utrOig/ummnxLDlLkjb9vz+wObf6BwaCLhzg
 mIs9bv072NbBlbzhmJYWfgZ9BsRsomNalSlKbNb3jfrpw8b2RfcOiYMVJ0hBfQnENGPI
 Q1E3WMv/L1IphaVhcyNVpkqt8Rb8Jm7Y+snAVkl5lZtFYFwTqfgNGyNnF5G4VKmu6PVO
 pCi8ctp6/GtAPVaZd15ktlXUoMnmsgtMQyCX0zWh00cSaREzJwnYh5x/hPlQH4K35Y3h
 bskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UFC3AeLwbUfmpqz7ww2iQqSGesm3rWuUBlHnQoBDl1I=;
 b=PWr3iTVQGnEdlBQIbFH1nCt8CYYEeiHbi04/DJgB+qihV2AN87DVzorbqF4ZCtbes7
 m57HValmvB7+PRRKzOHZ/ZhsHv5CFJ5IvQra8CSz42mEp3pYxDulk0n3wm2Dyi1eWPp1
 vVhvCnxy9cVxJA/AnWE46VhrQZlpooKps/GV/tY4IvwPx66bHNzZxc9nelnySEgqshoH
 HKE0yX9XZPRMXSr7lMjsfovNA5wCJGhOGxXhYfRsGnSj2vIR5cgBPWYGm+SbFKkCLnaC
 X3REXihyC83zJ12H605X0JbYLyhf20UvXP9yF24awmhabgT5p03ZmnoZvhUzd4cYPqqC
 wzdA==
X-Gm-Message-State: AA6/9Rm6IvjUPfDm5Yf0L9OduGgxa7hBA5I7TdyX5aPGiXlyJgJT6pCgoj+3HicnLz4djQ==
X-Received: by 10.55.42.144 with SMTP id q16mr4175023qkq.257.1476312178766;
 Wed, 12 Oct 2016 15:42:58 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id g11sm3576278qtb.19.2016.10.12.15.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:42:58 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v3 3/4] hwmon: Add OCC driver basic sysfs attributes
Date: Wed, 12 Oct 2016 17:42:48 -0500
Message-Id: <1476312168-20207-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:43:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add name, update interval, and powercap sysfs files, as well as the method
to send commands to the OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/power8_occ.c | 178 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
index 15d4bde..fbfaf08 100644
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
