Return-Path: <xow@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Gp50WQzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BzuIXi5o"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id q85so57938697pfq.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sfqZMMkaSTVouefzI6i84tLzOU+WrKd7qMwXhwC8S7E=;
 b=BzuIXi5oofOB4HZMvlxBmCsG6VqxN4exW//g1wgmI6f403PY89yje72qSKe8sqUd78
 +Xi3dasyRH0ysBdtl16LKUsgIIaMyqoY5CGCXOIPA636ouj16j/x/J9C2DVjhSH7YyEI
 bd0qTJie3zytNcL4P93t5SACbi7fsg9/nUmQAy1EFgab8W00QlVGwGBXDdY3TNYl71u8
 /NzZ4x9FDFQdniDgFSCXzxyAn4i3JvM02375TNcsEUE4YvtWddzbDgPKa+pcmHbwJPSA
 9/3/Exy/uYijx4LBDgDEFlHleZUk4zYxfNkLoG1a22URlXBiw2m29avitXaMEKV2P5a8
 1r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfqZMMkaSTVouefzI6i84tLzOU+WrKd7qMwXhwC8S7E=;
 b=melwqAvlGnSm26HyUko1pDLCqy6EX+2z8mVFkLtEI6nuhjj9iNp/VbKwZxEk7GjTaq
 6hQNcLo7DpS9DRVHWsjDGNRPwenVOQiSPbRc6ADbTA7fC120gDDLNmG9t8f6fbI/ivQ3
 DmQdF7LmfvDzng/gmvBxdlX9yPdft0lgVCtlN+IMelt444b9mCmR20oqN3gQ+ZaqnOfl
 w+U5UlMDPlQrec8q55ukKL5z6cqjpcz6J3FAcjz5Ern7RMz3GR0FyOHjfimwmadTbiKR
 IWV8D6aL5gvfh9BeHnsnoDTFcBrNd2tWOVy1zGfHApmMmMc9lOgD891pEIPWAHDffdf3
 EcrQ==
X-Gm-Message-State: AIVw113JbVF9sYSDuOq+93KJzz69c9d1mO9c9T/8xoEfKIU/nsJTYgSy
 7M6MbBWp3HHD2rfJYJWJWA==
X-Received: by 10.84.247.15 with SMTP id n15mr21368588pll.296.1499733808321;
 Mon, 10 Jul 2017 17:43:28 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id k194sm21956146pgc.31.2017.07.10.17.43.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jul 2017 17:43:27 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/4] hwmon: (isl68137) add accessors to enable/disable
 AVS mode
Date: Mon, 10 Jul 2017 17:42:59 -0700
Message-Id: <20170711004301.10515-3-xow@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
In-Reply-To: <20170711004301.10515-1-xow@google.com>
References: <20170711004301.10515-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 11 Jul 2017 00:43:31 -0000

From: Robert Lippert <rlippert@google.com>

This patch adds sysfs files avs(0|1)_enabled underneath the I2C device
to control the AVS state of each rail and perform the appropriate
hacks when enabling AVS.

The ISL68137 has issues wrt AVS operation mode that require it
to be enabled/disabled at runtime.

Additionally enabling AVS mode requires a hack to set the VOUT value
before enabling to make sure that the device does not switch to
an old cached AVS provided value and is instead in a "clean" state
before booting.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 drivers/hwmon/pmbus/isl68137.c | 112 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 2a5322e4a286..cc95a3d339af 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -19,8 +19,11 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/hwmon-sysfs.h>
 #include "pmbus.h"
 
+#define ISL68137_VOUT_AVS 0x30
+
 static struct pmbus_driver_info isl68137_info = {
 	.pages = 2,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -56,10 +59,115 @@ static struct pmbus_driver_info isl68137_info = {
 	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
 };
 
+static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
+					     int page,
+					     char *buf)
+{
+	int val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+
+	return sprintf(buf, "%d\n",
+		       (val & ISL68137_VOUT_AVS) == ISL68137_VOUT_AVS ? 1 : 0);
+}
+
+static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
+					      int page,
+					      const char *buf, size_t count)
+{
+	int rc, op_val;
+
+	if (count < 1) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	switch (buf[0]) {
+		case '0': op_val = 0; break;
+		case '1': op_val = ISL68137_VOUT_AVS; break;
+		default: rc = -EINVAL; goto out; break;
+	}
+
+	/*
+	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
+	 * switched to PMBus control. Switching back to AVSBus control
+	 * restores this persisted setpoint rather than re-initializing to
+	 * PMBus VOUT_COMMAND. Writing VOUT_COMMAND first over PMBus before
+	 * enabling AVS control is the workaround.
+	 */
+	if (op_val == ISL68137_VOUT_AVS) {
+		int vout_command = pmbus_read_byte_data(client, page,
+							PMBUS_VOUT_COMMAND);
+		rc = pmbus_write_byte_data(client, page, PMBUS_VOUT_COMMAND,
+					   vout_command);
+		if (rc)
+			goto out;
+	}
+
+	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
+				    ISL68137_VOUT_AVS, op_val);
+
+out:
+	return rc < 0 ? rc : count;
+}
+
+static ssize_t isl68137_avs_enable_show(struct device *dev,
+					struct device_attribute *devattr,
+					char *buf)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	return isl68137_avs_enable_show_page(client, attr->index, buf);
+}
+
+static ssize_t isl68137_avs_enable_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	return isl68137_avs_enable_store_page(client, attr->index, buf, count);
+}
+
+static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
+			    isl68137_avs_enable_show, isl68137_avs_enable_store,
+			    0, 0);
+static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
+			    isl68137_avs_enable_show, isl68137_avs_enable_store,
+			    0, 1);
+
+static int isl68137_remove(struct i2c_client *client);
+
 static int isl68137_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
-	return pmbus_do_probe(client, id, &isl68137_info);
+	int rc;
+
+	rc = pmbus_do_probe(client, id, &isl68137_info);
+	if (rc)
+		return rc;
+
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_avs0_enabled.dev_attr);
+	if (rc)
+		goto out_fail;
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_avs1_enabled.dev_attr);
+	if (rc)
+		goto out_fail;
+
+	return rc;
+
+out_fail:
+	isl68137_remove(client);
+	return rc;
+}
+
+static int isl68137_remove(struct i2c_client *client)
+{
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_avs1_enabled.dev_attr);
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_avs0_enabled.dev_attr);
+	return pmbus_do_remove(client);
 }
 
 static const struct i2c_device_id isl68137_id[] = {
@@ -75,7 +183,7 @@ static struct i2c_driver isl68137_driver = {
 		   .name = "isl68137",
 		   },
 	.probe = isl68137_probe,
-	.remove = pmbus_do_remove,
+	.remove = isl68137_remove,
 	.id_table = isl68137_id,
 };
 
-- 
2.13.2.725.g09c95d1e9-goog
