Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzcM2v1KzDvtP
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P1uUm+QQ"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id y205so19651651qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=7DZe0/5otUyJcJU9mDNp9INNwdsVJHu0+zuZlyDN+ok=;
 b=P1uUm+QQoq4qxdYAmH7qn3NFUZJLhFju8WT+4p0btpwaQUH+HeqS83xMBw6t4SVikJ
 slstux12/TEQT7K5udUs40Vi05thQ4YimU1QRtnx2CTArMRVq6KZA/8bLIc+bI08Fpqu
 M2+EKE1YZbx6lXYyUjd/zyVFnK/42DXC6hpzzS1ygmayTT3VKUdqNDBs5NI9j1X2HkzN
 gbmiwzt20rTyKnxM0x1EWa6Rh7K0qjZFToKb6jar9z+gLZz/X+g0XVbEF2cPNXlt/oMy
 O2s/NeacD8AoHK4qHUDetIdXlOh7aYEKs5zF6jKRu6PZ3OsKZmo5ixKedw8HwnfuwFak
 wHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7DZe0/5otUyJcJU9mDNp9INNwdsVJHu0+zuZlyDN+ok=;
 b=Q3TypXSkGKXKWwdi6h/0ToY45hPAUYFTFKyf+1/tichtIV0zRpJ+OmeFWczrCbMNP6
 n71wmoPvXpITvsBBuoiSxbWHbtxfeUaf0tqjQ68pYZABSfigP919yZvAjTSQkIqjno1P
 8F2ynQ9Ppfsl27h2bKa5hVWsiXMnsJl1w8F6cX+zZsasP9j2/uJFwoP4EL9QLMJh7lnO
 b2tGDUH7tODIbxk4YU8cxeCdfPlFHPu0hNz3GcfGveWnj61J8I36qlsKvCiVRrTvIifj
 UyFQY2r6tGjsb+kF0QD3nXh0ehKjxJZf011CYdwC4D+u6NghfIAWiPm90+EzGR4IstJl
 estA==
X-Gm-Message-State: AKaTC01zTVxnki20Bo7W91EDM4N0NfLiDTqYJgWX+9FYA/2XKo60Aovp/Tqly3lnvQrXOQ==
X-Received: by 10.55.92.195 with SMTP id q186mr24984821qkb.170.1480460609246; 
 Tue, 29 Nov 2016 15:03:29 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id q199sm32116291qke.31.2016.11.29.15.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:03:27 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 3/9] hwmon: occ: Add sysfs interface
Date: Tue, 29 Nov 2016 17:03:21 -0600
Message-Id: <1480460601-28658-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:03:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add a generic mechanism to expose the sensors provided by the OCC in
sysfs.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Makefile    |   2 +-
 drivers/hwmon/occ/occ_sysfs.c | 497 ++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_sysfs.h |  51 +++++
 3 files changed, 549 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h

diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 93cb52f..a6881f9 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o
+obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
diff --git a/drivers/hwmon/occ/occ_sysfs.c b/drivers/hwmon/occ/occ_sysfs.c
new file mode 100644
index 0000000..aab4fbe
--- /dev/null
+++ b/drivers/hwmon/occ/occ_sysfs.c
@@ -0,0 +1,497 @@
+/*
+ * occ_sysfs.c - OCC sysfs interface
+ *
+ * This file contains the methods and data structures for the OCC hwmon driver.
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "occ_sysfs.h"
+
+#define OCC_DATA_MAX   4096
+
+/* To generate attn to OCC */
+#define ATTN_DATA      0x0006B035
+/* For BMC to read/write SRAM */
+#define OCB_ADDRESS            0x0006B070
+#define OCB_DATA               0x0006B075
+#define OCB_STATUS_CONTROL_AND 0x0006B072
+#define OCB_STATUS_CONTROL_OR  0x0006B073
+
+#define RESP_DATA_LENGTH       3
+#define RESP_HEADER_OFFSET     5
+#define SENSOR_STR_OFFSET      37
+#define SENSOR_BLOCK_NUM_OFFSET        43
+#define SENSOR_BLOCK_OFFSET    45
+
+#define MAX_SENSOR_ATTR_LEN    32
+
+struct sensor_attr_data {
+       enum sensor_type type;
+       u32 hwmon_index;
+       u32 attr_id;
+       char name[MAX_SENSOR_ATTR_LEN];
+       struct device_attribute dev_attr;
+};
+
+static ssize_t show_input(struct device *dev,
+                         struct device_attribute *attr, char *buf)
+{
+       int val;
+       struct sensor_attr_data *sdata = container_of(attr,
+                                                     struct sensor_attr_data,
+                                                     dev_attr);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       val = occ_get_sensor_value(driver->occ, sdata->type, sdata->hwmon_index - 1);
+       if (sdata->type == TEMP)
+               val *= 1000;    /* in millidegree Celsius */
+
+       return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_label(struct device *dev,
+                         struct device_attribute *attr, char *buf)
+{
+       int val;
+       struct sensor_attr_data *sdata = container_of(attr,
+                                                     struct sensor_attr_data,
+                                                     dev_attr);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       val = occ_get_sensor_id(driver->occ, sdata->type,
+                                       sdata->hwmon_index - 1);
+
+       return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_caps(struct device *dev,
+                        struct device_attribute *attr, char *buf)
+{
+       int val;
+       struct caps_sensor *sensor;
+       struct sensor_attr_data *sdata = container_of(attr,
+                                                     struct sensor_attr_data,
+                                                     dev_attr);
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       sensor = occ_get_sensor(driver->occ, CAPS);
+       if (!sensor) {
+               val = -1;
+               return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+       }
+
+       val = occ_get_caps_value(driver->occ, sensor, sdata->hwmon_index - 1,
+                                        sdata->attr_id);
+
+       return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_update_interval(struct device *dev,
+                                   struct device_attribute *attr, char *buf)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->update_interval);
+}
+
+static ssize_t store_update_interval(struct device *dev,
+                                    struct device_attribute *attr,
+                                    const char *buf, size_t count)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+       unsigned long val;
+       int rc;
+
+       rc = kstrtoul(buf, 10, &val);
+       if (rc)
+               return rc;
+
+       driver->update_interval = val;
+       occ_set_update_interval(driver->occ, val);
+
+       return count;
+}
+
+static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_interval,
+                  store_update_interval);
+
+static ssize_t show_name(struct device *dev,
+                        struct device_attribute *attr, char *buf)
+{
+       return snprintf(buf, PAGE_SIZE - 1, "occ\n");
+}
+
+static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+
+static ssize_t show_user_powercap(struct device *dev,
+                                 struct device_attribute *attr, char *buf)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
+}
+
+static ssize_t store_user_powercap(struct device *dev,
+                                  struct device_attribute *attr,
+                                  const char *buf, size_t count)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+       u16 val;
+       int rc;
+
+       rc = kstrtou16(buf, 10, &val);
+       if (rc)
+               return rc;
+
+       dev_dbg(dev, "set user powercap to: %u\n", val);
+       rc = occ_set_user_powercap(driver->occ, val);
+       if (rc != 0) {
+               dev_err(dev,
+                       "ERROR: Set User Powercap: wrong return status: %x\n",
+                       rc);
+               if (rc == 0x13)
+                       dev_info(dev,
+                                "ERROR: set invalid powercap value: %x\n",
+                                val);
+               return -EINVAL;
+       }
+
+       driver->user_powercap = val;
+
+       return count;
+}
+
+static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
+                  store_user_powercap);
+
+static void deinit_sensor_groups(struct device *dev,
+                                struct sensor_group *sensor_groups)
+{
+       int cnt;
+
+       for (cnt = 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
+               if (sensor_groups[cnt].group.attrs)
+                       devm_kfree(dev, sensor_groups[cnt].group.attrs);
+               if (sensor_groups[cnt].sattr)
+                       devm_kfree(dev, sensor_groups[cnt].sattr);
+               sensor_groups[cnt].group.attrs = NULL;
+               sensor_groups[cnt].sattr = NULL;
+       }
+}
+
+static void sensor_attr_init(struct sensor_attr_data *sdata,
+                            char *sensor_group_name,
+                            char *attr_name,
+                            ssize_t (*show)(struct device *dev,
+                                            struct device_attribute *attr,
+                                            char *buf))
+{
+       sysfs_attr_init(&sdata->dev_attr.attr);
+
+       snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
+                sensor_group_name, sdata->hwmon_index, attr_name);
+       sdata->dev_attr.attr.name = sdata->name;
+       sdata->dev_attr.attr.mode = S_IRUGO;
+       sdata->dev_attr.show = show;
+}
+
+static int create_sensor_group(struct occ_sysfs *driver,
+                              enum sensor_type type, int sensor_num)
+{
+       struct device *dev = driver->dev;
+       struct sensor_group *sensor_groups = driver->sensor_groups;
+       struct sensor_attr_data *sdata;
+       int rc, cnt;
+
+       /* each sensor has 'label' and 'input' attributes */
+       sensor_groups[type].group.attrs =
+               devm_kzalloc(dev, sizeof(struct attribute *) *
+                            sensor_num * 2 + 1, GFP_KERNEL);
+       if (!sensor_groups[type].group.attrs) {
+               rc = -ENOMEM;
+               goto err;
+       }
+
+       sensor_groups[type].sattr =
+               devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
+                            sensor_num * 2, GFP_KERNEL);
+       if (!sensor_groups[type].sattr) {
+               rc = -ENOMEM;
+               goto err;
+       }
+
+       for (cnt = 0; cnt < sensor_num; cnt++) {
+               sdata = &sensor_groups[type].sattr[cnt];
+               /* hwmon attributes index starts from 1 */
+               sdata->hwmon_index = cnt + 1;
+               sdata->type = type;
+               sensor_attr_init(sdata, sensor_groups[type].name, "input",
+                                show_input);
+               sensor_groups[type].group.attrs[cnt] = &sdata->dev_attr.attr;
+
+               sdata = &sensor_groups[type].sattr[cnt + sensor_num];
+               sdata->hwmon_index = cnt + 1;
+               sdata->type = type;
+               sensor_attr_init(sdata, sensor_groups[type].name, "label",
+                                show_label);
+               sensor_groups[type].group.attrs[cnt + sensor_num] =
+                       &sdata->dev_attr.attr;
+       }
+
+       rc = sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
+       if (rc)
+               goto err;
+
+       return 0;
+err:
+       deinit_sensor_groups(dev, sensor_groups);
+       return rc;
+}
+
+static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
+                                 char *attr_name, uint32_t hwmon_index,
+                                 uint32_t attr_id)
+{
+       sdata->type = CAPS;
+       sdata->hwmon_index = hwmon_index;
+       sdata->attr_id = attr_id;
+
+       snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
+                "caps", sdata->hwmon_index, attr_name);
+
+       sysfs_attr_init(&sdata->dev_attr.attr);
+       sdata->dev_attr.attr.name = sdata->name;
+       sdata->dev_attr.attr.mode = S_IRUGO;
+       sdata->dev_attr.show = show_caps;
+}
+
+static int create_caps_sensor_group(struct occ_sysfs *driver,
+                                   int sensor_num)
+{
+       struct device *dev = driver->dev;
+       struct sensor_group *sensor_groups = driver->sensor_groups;
+       int field_num = driver->num_caps_fields;
+       struct sensor_attr_data *sdata;
+       int i, j, rc;
+
+       sensor_groups[CAPS].group.attrs =
+               devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num *
+                            field_num + 1, GFP_KERNEL);
+       if (!sensor_groups[CAPS].group.attrs) {
+               rc = -ENOMEM;
+               goto err;
+       }
+
+       sensor_groups[CAPS].sattr =
+               devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
+                            sensor_num * field_num, GFP_KERNEL);
+       if (!sensor_groups[CAPS].sattr) {
+               rc = -ENOMEM;
+               goto err;
+       }
+
+       for (j = 0; j < sensor_num; ++j) {
+               for (i = 0; i < field_num; ++i) {
+                       sdata = &sensor_groups[CAPS].sattr[j * field_num + i];
+                       caps_sensor_attr_init(sdata,
+                                             driver->caps_names[i],
+                                             j + 1, i);
+                       sensor_groups[CAPS].group.attrs[j * field_num + i] =
+                               &sdata->dev_attr.attr;
+               }
+       }
+
+       rc = sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
+       if (rc)
+               goto err;
+
+       return rc;
+err:
+       deinit_sensor_groups(dev, sensor_groups);
+       return rc;
+}
+
+static void occ_remove_hwmon_attrs(struct occ_sysfs *driver)
+{
+       struct device *dev = driver->dev;
+
+       device_remove_file(dev, &dev_attr_user_powercap);
+       device_remove_file(dev, &dev_attr_update_interval);
+       device_remove_file(dev, &dev_attr_name);
+}
+
+static int occ_create_hwmon_attrs(struct occ_sysfs *driver)
+{
+       int i, rc, id, sensor_num;
+       struct device *dev = driver->dev;
+       struct sensor_group *sensor_groups = driver->sensor_groups;
+       struct occ_blocks _resp, *resp = &_resp;
+               occ_get_response_blocks(driver->occ, resp);
+
+       for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
+               resp->sensor_block_id[i] = -1;
+
+       /* read sensor data from occ. */
+       rc = occ_update_device(driver->occ);
+       if (rc != 0) {
+               dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", rc);
+               return rc;
+       }
+       if (!resp->blocks)
+               return -1;
+
+       rc = device_create_file(dev, &dev_attr_name);
+       if (rc)
+               goto error;
+
+       rc = device_create_file(dev, &dev_attr_update_interval);
+       if (rc)
+               goto error;
+
+       if (resp->sensor_block_id[CAPS] >= 0) {
+               /* user powercap: only for master OCC */
+               rc = device_create_file(dev, &dev_attr_user_powercap);
+               if (rc)
+                       goto error;
+       }
+
+       sensor_groups[FREQ].name = "freq";
+       sensor_groups[TEMP].name = "temp";
+       sensor_groups[POWER].name = "power";
+       sensor_groups[CAPS].name =  "caps";
+
+       for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++) {
+               id = resp->sensor_block_id[i];
+               if (id < 0)
+                       continue;
+
+               sensor_num = resp->blocks[id].sensor_num;
+               if (i == CAPS)
+                       rc = create_caps_sensor_group(driver, sensor_num);
+               else
+                       rc = create_sensor_group(driver, i, sensor_num);
+               if (rc)
+                       goto error;
+       }
+
+       return 0;
+
+error:
+       dev_err(dev, "ERROR: cannot create hwmon attributes: %d\n", rc);
+       occ_remove_hwmon_attrs(driver);
+       return rc;
+}
+
+static ssize_t show_occ_online(struct device *dev,
+                              struct device_attribute *attr, char *buf)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+
+       return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->occ_online);
+}
+
+static ssize_t store_occ_online(struct device *dev,
+                               struct device_attribute *attr,
+                               const char *buf, size_t count)
+{
+       struct occ_sysfs *driver = dev_get_drvdata(dev);
+       unsigned long val;
+       int rc;
+
+       rc = kstrtoul(buf, 10, &val);
+       if (rc)
+               return rc;
+
+       if (val == 1) {
+               if (driver->occ_online)
+                       return count;
+
+               driver->dev = hwmon_device_register(dev);
+               if (IS_ERR(driver->dev))
+                       return PTR_ERR(driver->dev);
+
+               dev_set_drvdata(driver->dev, driver);
+
+               rc = occ_create_hwmon_attrs(driver);
+               if (rc) {
+                       hwmon_device_unregister(driver->dev);
+                       driver->dev = NULL;
+                       return rc;
+               }
+       } else if (val == 0) {
+               if (!driver->occ_online)
+                       return count;
+
+               occ_remove_hwmon_attrs(driver);
+               hwmon_device_unregister(driver->dev);
+               driver->dev = NULL;
+       } else
+               return -EINVAL;
+
+       driver->occ_online = val;
+       return count;
+}
+
+static DEVICE_ATTR(online, S_IWUSR | S_IRUGO, show_occ_online,
+                  store_occ_online);
+
+struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
+                                 struct occ_sysfs_config *config)
+{
+       struct occ_sysfs *hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+       int rc;
+
+       if (!hwmon)
+               return ERR_PTR(-ENOMEM);
+
+       hwmon->occ = occ;
+       hwmon->num_caps_fields = config->num_caps_fields;
+       hwmon->caps_names = config->caps_names;
+
+       dev_set_drvdata(dev, hwmon);
+
+       rc = device_create_file(dev, &dev_attr_online);
+       if (rc)
+               return ERR_PTR(rc);
+
+       return hwmon;
+}
+EXPORT_SYMBOL(occ_sysfs_start);
+
+int occ_sysfs_stop(struct occ_sysfs *driver)
+{
+       occ_remove_hwmon_attrs(driver);
+       hwmon_device_unregister(driver->dev);
+
+       device_remove_file(driver->dev, &dev_attr_online);
+
+       return 0;
+}
+EXPORT_SYMBOL(occ_sysfs_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("OCC sysfs driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_sysfs.h b/drivers/hwmon/occ/occ_sysfs.h
new file mode 100644
index 0000000..e0219b6
--- /dev/null
+++ b/drivers/hwmon/occ/occ_sysfs.h
@@ -0,0 +1,51 @@
+#ifndef OCC_SYSFS_H
+#define OCC_SYSFS_H
+/*
+ * occ_sysfs.c - OCC sysfs interface
+ *
+ * This file contains the methods and data structures for the OCC hwmon driver.
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "occ.h"
+
+struct sensor_group {
+       char *name;
+       struct sensor_attr_data *sattr;
+       struct attribute_group group;
+};
+
+struct occ_sysfs_config {
+       unsigned int num_caps_fields;
+       char **caps_names;
+};
+
+struct occ_sysfs {
+       struct device *dev;
+       struct occ *occ;
+
+       u16 user_powercap;
+       bool occ_online;
+       struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
+       unsigned long update_interval;
+       unsigned int num_caps_fields;
+       char **caps_names;
+};
+
+struct occ_sysfs *occ_sysfs_start(struct device *dev, struct occ *occ,
+                                 struct occ_sysfs_config *config);
+
+int occ_sysfs_stop(struct occ_sysfs *driver);
+
+#endif
-- 
1.9.1
