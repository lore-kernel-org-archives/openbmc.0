Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRxDN2gr7zDqvG
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 13:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzCplwi3"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id l64so4724852pge.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 20:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=5NTF8bbmCM3H5GeyAxatEHzzkVSppE+9qTvZ1Y9kuRE=;
 b=QzCplwi3oyb1PryqkPdGQodJrvLQQoZO6pnXtyaYj9wjW+ikSSU6HsZT63pUP1WMyH
 0i14qfUXBl2gRE2GPHmVxUgNXVzQXddfhevdT/jjDblSJkmqgc9qdJPSP7JU5zeLtA1/
 0RCjaUb1bG4l8h79TTpgwTU90xyDv5cfWkpkkUBwhy5aaqZCnjiIdEDacfUAkvuyi1ch
 JD1NrP0U+STsLWr3sdv6ri8RUy+yzU54T05nn6mXVKugL1x5UFxeDVQLf8zx3wUaD61C
 jN/zuoBBlToBLUs7m0/thGxQA82cbpqfgzTH0X/LEQEw8ZypoxYD+LNSp8YLrDHNR56h
 MpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=5NTF8bbmCM3H5GeyAxatEHzzkVSppE+9qTvZ1Y9kuRE=;
 b=EB8M71lcV7s/b0/LvLVJ0ZIiQ9jbH4LsM/za6xg411ZXjz6gkjBkpD2jaFlWg+BqRo
 7yoUB5BBeTi1egloWv1gd+ojHCL9Frg5YQ8uu+ZBhnIMnUqCqB9ui8xPZbomzMs2JgXH
 k9+O0Dvi+nCsgtDMctniWNmgTRlqOE1oZNsa5Uk/wHRw0y1/TAbWwzn6ljJVsMbhS4Jc
 PQk4oZLM2Jv68a9f5yon0DJYaH5dJ+FoM0AudBOKa7gCFwFcCsv4pv4a2x+G3Vmmrb3e
 cZwB0qijyZDvC0AqXwey9Etm1c5yj1/juQ3WwGr1IDWzgWbnD/lfTQuobpuKHfSvoy+E
 ldTQ==
X-Gm-Message-State: AHYfb5jbocWxxJn+AMfS9ymRaPlQScvRlbRaOU1m77emafkZmne2xp+d
 gbpzOAqGtZUJ9wm2t8Q=
X-Received: by 10.101.72.138 with SMTP id n10mr6145089pgs.138.1502248401780;
 Tue, 08 Aug 2017 20:13:21 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id g25sm4759026pfg.91.2017.08.08.20.13.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 08 Aug 2017 20:13:21 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 09 Aug 2017 12:43:14 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>,
 Lei YU <mine260309@gmail.com>
Subject: [PATCH linux dev-4.10 v4] hwmon (occ): Add sysfs_notify on error
Date: Wed,  9 Aug 2017 12:43:13 +0930
Message-Id: <20170809031313.22306-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.0
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
X-List-Received-Date: Wed, 09 Aug 2017 03:13:25 -0000

From: "Edward A. James" <eajames@us.ibm.com>

For userspace polling, we need to notify sysfs that the state of our
error entry has changed.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Tested-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>

--
Changes since v2:
 * don't return empty sysfs file
Changes since v3:
 - remove hard-coded number of errors before reporting
 - remove use of unusual error code

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/occ/common.c | 42 ++++++++++++++++++++++++++++--------------
 drivers/hwmon/occ/common.h |  6 +++---
 drivers/hwmon/occ/p8_i2c.c | 26 ++++++++++++--------------
 drivers/hwmon/occ/p9_sbe.c | 32 ++++++++++++++------------------
 4 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 8b0a00867cfa..a79383435ac9 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -163,9 +163,21 @@ void occ_parse_poll_response(struct occ *occ)
 	}
 }
 
+void occ_set_error(struct occ *occ, int error)
+{
+	occ->error_count++;
+	occ->error = error;
+}
+
+void occ_reset_error(struct occ *occ)
+{
+	occ->error_count = 0;
+	occ->error = 0;
+}
+
 int occ_poll(struct occ *occ)
 {
-	int rc;
+	int rc, error = occ->error;
 	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
@@ -181,7 +193,7 @@ int occ_poll(struct occ *occ)
 
 	rc = occ->send_cmd(occ, cmd);
 	if (rc)
-		return rc;
+		goto done;
 
 	header = (struct occ_poll_response_header *)occ->resp.data;
 
@@ -197,19 +209,21 @@ int occ_poll(struct occ *occ)
 
 	if (header->status & OCC_STAT_MASTER) {
 		if (hweight8(header->occs_present) !=
-		    atomic_read(&occ_num_occs)) {
-			occ->error = -EXDEV;
-			occ->bad_present_count++;
-		} else
-			occ->bad_present_count = 0;
+		    atomic_read(&occ_num_occs))
+			occ->error = -ENXIO;
 	}
 
+done:
+	/* notify userspace if we change error state and have an error */
+	if (occ->error != error && occ->error && occ->error_attr_name)
+		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
+
 	return rc;
 }
 
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
-	int rc;
+	int rc, error = occ->error;
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be;
@@ -239,6 +253,10 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	rc = occ->send_cmd(occ, cmd);
 	mutex_unlock(&occ->lock);
 
+	/* notify userspace if we change error state and have an error*/
+	if (occ->error != error && occ->error && occ->error_attr_name)
+		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
+
 	return rc;
 }
 
@@ -260,14 +278,9 @@ int occ_update_response(struct occ *occ)
 static ssize_t occ_show_error(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	int error = 0;
 	struct occ *occ = dev_get_drvdata(dev);
 
-	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
-	    occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
-		error = occ->error;
-
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
 }
 
 static ssize_t occ_show_status(struct device *dev,
@@ -1194,6 +1207,7 @@ int occ_create_status_attrs(struct occ *occ)
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
 							    occ_show_error,
 							    NULL, 0);
+	occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
 
 	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
 		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index a5f86c3175f9..ca5969c9df96 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,8 +13,6 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
-#define OCC_ERROR_COUNT_THRESHOLD	2
-
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_RESP_DATA_BYTES		4089
 
@@ -103,7 +101,6 @@ struct occ {
 
 	int error;
 	unsigned int error_count;
-	unsigned int bad_present_count;
 	unsigned long last_safe;
 	unsigned long last_update;
 	struct mutex lock;
@@ -116,6 +113,7 @@ struct occ {
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 	struct sensor_device_attribute *status_attrs;
+	const char *error_attr_name;
 
 	u8 poll_cmd_data;
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
@@ -143,6 +141,8 @@ struct occ {
 extern atomic_t occ_num_occs;
 
 void occ_parse_poll_response(struct occ *occ);
+void occ_reset_error(struct occ *occ);
+void occ_set_error(struct occ *occ, int error);
 int occ_poll(struct occ *occ);
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
 int occ_update_response(struct occ *occ);
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 29233b473746..05af16b376bb 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -98,7 +98,7 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
 
 static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	int i, rc;
+	int i, rc, error;
 	unsigned long start;
 	u16 data_length;
 	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
@@ -161,22 +161,18 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
-	occ->error = resp->return_status;
-
 	if (rc < 0) {
-		occ->error_count++;
-		dev_warn(&client->dev, "occ bad response:%d\n",
-			 resp->return_status);
-		return rc;
+		error = resp->return_status;
+		dev_warn(&client->dev, "occ bad response:%d\n", error);
+		goto done;
 	}
 
 	data_length = get_unaligned_be16(&resp->data_length_be);
 	if (data_length > OCC_RESP_DATA_BYTES) {
-		occ->error_count++;
-		occ->error = -EDOM;
+		rc = -EIO;
 		dev_warn(&client->dev, "occ bad data length:%d\n",
 			 data_length);
-		return occ->error;
+		goto assign;
 	}
 
 	for (i = 8; i < data_length + 7; i += 8) {
@@ -185,13 +181,15 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 			goto err;
 	}
 
-	occ->error_count = 0;
-	return data_length + 7;
+	occ_reset_error(occ);
+	return 0;
 
 err:
-	occ->error_count++;
-	occ->error = rc;
 	dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
+assign:
+	error = rc;
+done:
+	occ_set_error(occ, error);
 	return rc;
 }
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index c85f1339ec33..2d50a94150b1 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -25,7 +25,7 @@ struct p9_sbe_occ {
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	int rc;
+	int rc, error;
 	unsigned long start;
 	struct occ_client *client;
 	struct occ_response *resp = &occ->resp;
@@ -35,9 +35,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 retry:
 	client = occ_drv_open(p9_sbe_occ->sbe, 0);
-	if (!client)
-		/* don't increment occ error counter */
-		return -ENODEV;
+	if (!client) {
+		rc = -ENODEV;
+		goto assign;
+	}
 
 	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
 	if (rc < 0)
@@ -62,7 +63,8 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		}
 		break;
 	case RESP_RETURN_SUCCESS:
-		rc = 0;
+		occ_reset_error(occ);
+		return 0;
 		break;
 	case RESP_RETURN_CMD_INVAL:
 	case RESP_RETURN_CMD_LEN:
@@ -77,23 +79,17 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
-	occ->error = resp->return_status;
-
-	if (rc < 0) {
-		occ->error_count++;
-		dev_warn(occ->bus_dev, "occ bad response:%d\n",
-			 resp->return_status);
-		return rc;
-	}
-
-	occ->error_count = 0;
-	return 0;
+	error = resp->return_status;
+	dev_warn(occ->bus_dev, "occ bad response:%d\n", error);
+	goto done;
 
 err:
-	occ->error_count++;
-	occ->error = rc;
 	occ_drv_release(client);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
+assign:
+	error = rc;
+done:
+	occ_set_error(occ, error);
 	return rc;
 }
 
-- 
2.14.0
