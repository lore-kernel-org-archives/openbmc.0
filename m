Return-Path: <xow@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Gq5nnTzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ChC3fPoM"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id e7so58013583pfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwwCQzBsP/+qP4ZYQxxldmjciDJmxSLHGmcNlq52V8Q=;
 b=ChC3fPoMot7h5Q09Tq3swPTOebkCWfQyvjf2e1IlUfqqRNUMn8g2gyUcdwKqsfsMxF
 oZu51CbmxPkWH56dxa+qJ1ppXlZshDlCySfUs4KYBNw7+wEWNf+mJR/X9eJb16zDlAHd
 8bnjvHGURbKTA0JwFhX0c1OvEsHn1/7moePrSu8u7gVqnh2GO069e58YCo479ltCqbxx
 cK/ktTdORmvEgcdwuUC7ceWRnwUUPyfM1/f3tEq0oxfWk1FKoc4OPCCl3u1A6ng9a8qP
 7Po2QiYWq7724TgD+xkfyvdZDNc+l7q0pkgv10XkNbW/Vdmqz6lzhrDSPomgmtMAUde/
 qmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwwCQzBsP/+qP4ZYQxxldmjciDJmxSLHGmcNlq52V8Q=;
 b=ZTwqJV6+nv35qcbpY7TYmt7854veQUg9RDddcs3vGUurbX3vAEkbsEY0R6oCHv40Fe
 EKm7zqL6RC2M1qcYYCx5advx5A9c6W3GzQXlxGEOprXiUiIXCWc6GQwmclOQRp5ar3mv
 B3XA3vScivmRMKbToYwcRPiinY+Gigx0jkYfmim5PsYKGSGoiy8ozalVUpdiI9GN4mxn
 d+D9ucNZ2ze/cyLL3sgFsZ36WIYxBhXrru80Wu/J3EvC+biBS0zkfSdMK7IFE8QRaBGw
 36gCj7zW8K1acn0QQ7oS/YS5qXMVlzR5jalv95+gQGfE3LJeiIf3HMzf9MnFm5YelDIs
 s1ew==
X-Gm-Message-State: AIVw110BArLq5Zt5u9E+fmRxDV7S1ihr5Dh+6GmtbgeST7FE77eF8SvV
 Oxj9EXafQSF1oco0ZrslJQ==
X-Received: by 10.84.132.104 with SMTP id 95mr20683550ple.228.1499733809760;
 Mon, 10 Jul 2017 17:43:29 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id k194sm21956146pgc.31.2017.07.10.17.43.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jul 2017 17:43:28 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/4] hwmon: (isl68137) add accessors for changing
 VOUT_MAX
Date: Mon, 10 Jul 2017 17:43:00 -0700
Message-Id: <20170711004301.10515-4-xow@google.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 00:43:32 -0000

From: Robert Lippert <rlippert@google.com>

To workaround a controller errata, VOUT_MAX must be changed dynamically
on some early Zaius boards.  PMBus core framework does not have
any support for making this value settable so add some device-specific
sysfs files to expose the value.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 drivers/hwmon/pmbus/isl68137.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index cc95a3d339af..2341f376bc2b 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -134,6 +134,38 @@ static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
 			    isl68137_avs_enable_show, isl68137_avs_enable_store,
 			    0, 1);
 
+static ssize_t isl68137_word_show(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	int val = pmbus_read_word_data(client, attr->index, attr->nr);
+	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+}
+
+static ssize_t isl68137_word_store(struct device *dev,
+				   struct device_attribute *devattr,
+				   const char *buf, size_t count)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	char *end;
+	int rc;
+	long new = simple_strtol(buf, &end, 0);
+	if (end == buf || new > INT_MAX || new < INT_MIN)
+		return -EINVAL;
+
+	rc = pmbus_write_word_data(client, attr->index, attr->nr, new);
+	return rc < 0 ? rc : count;
+}
+
+static SENSOR_DEVICE_ATTR_2(vout0_max, 0644,
+			    isl68137_word_show, isl68137_word_store,
+			    PMBUS_VOUT_MAX, 0);
+static SENSOR_DEVICE_ATTR_2(vout1_max, 0644,
+			    isl68137_word_show, isl68137_word_store,
+			    PMBUS_VOUT_MAX, 1);
+
 static int isl68137_remove(struct i2c_client *client);
 
 static int isl68137_probe(struct i2c_client *client,
@@ -153,6 +185,14 @@ static int isl68137_probe(struct i2c_client *client,
 				&sensor_dev_attr_avs1_enabled.dev_attr);
 	if (rc)
 		goto out_fail;
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_vout0_max.dev_attr);
+	if (rc)
+		goto out_fail;
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_vout1_max.dev_attr);
+	if (rc)
+		goto out_fail;
 
 	return rc;
 
@@ -163,6 +203,10 @@ static int isl68137_probe(struct i2c_client *client,
 
 static int isl68137_remove(struct i2c_client *client)
 {
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_vout1_max.dev_attr);
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_vout0_max.dev_attr);
 	device_remove_file(&client->dev,
 			   &sensor_dev_attr_avs1_enabled.dev_attr);
 	device_remove_file(&client->dev,
-- 
2.13.2.725.g09c95d1e9-goog
