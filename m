Return-Path: <3V4u4XAcKBzwtclrspcemmejc.amkmnclZkajgqrq.mxjYZq.mpe@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e4a; helo=mail-vs1-xe4a.google.com;
 envelope-from=3v4u4xackbzwtclrspcemmejc.amkmnclzkajgqrq.mxjyzq.mpe@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W2K4MsaZ"; 
 dkim-atps=neutral
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lM9W4879zDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:36:10 +1000 (AEST)
Received: by mail-vs1-xe4a.google.com with SMTP id c20so572293vse.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=m2QiEjsSuzxH9nG9bQVgk8z2fpxJwEba6skVqD+K6+A=;
 b=W2K4MsaZcs20fIo4GexU+vvmmnZKkN2XQkEYHgDzaCA4Iow5q8mh9T68K2/w4GmDsQ
 wl6eTbfSl0EWOlYw8BuA2f6OBSjBvHLEtMIlLsArnW8MXjn0Ejvt+/xtxR+t8GNrZvgW
 XSSGu8Z7g99w80/ub0hzFO0Y2MRI8KwyD1mVmviQbf8YQ/wguSSYjF8fq4Ptmeym9m8M
 Y/rIZddeIqFbkReyuSXu6GW3OfbksD/zt4EVswBgI8ea+m6n7gVn6Ow0RbZQ6T4dzv4t
 cNL0sX4qXUr/APg+3W2VZdcMicmR8Kma9KSQdMF2sXRt4w8jG8nVb2e2TF6Um8P4wJBA
 aUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=m2QiEjsSuzxH9nG9bQVgk8z2fpxJwEba6skVqD+K6+A=;
 b=G0ZE7CqrSPXGi2DJegWK/3z1EjpdhTUrZJ9dF9w+nec6OZBiSdz2TdHI5ym8ILtze7
 1K84Le8H0hZDTOZ4kr8h47pvAM3I0qhsbluAZwvGgrj4LSvgvS838LMlL2+tcsvOfFh5
 kuKXNeOOcrsyX5ey3ekyVOOQyP9UKNM0Ud9rW10R/Y2PLPADOVKjV1bNOvpdmVH+Bjng
 hztnspSh2SqLL5dyJlLUyMaEwYone8NJ3X/XiZnFuqRVLcTKA9tNcujSvv3Woxvvf4Tl
 ihu7B08UXBTIdYb7C6RHvUyBbORyc7bK7cWjG8SClEMRHou+cWDfcCotWq1L+8FM0RJd
 B2AQ==
X-Gm-Message-State: APjAAAUX0jCXiBmEKidgEDylvvXgfmZnGBRKN3hJ8n16aCEX7wuLj2aP
 baahGs+A7INaqEtN1E0/KueiRahqfsLO
X-Google-Smtp-Source: APXvYqzA5zRGJMYenGEMVSxe9Z9D3CDlLWaBzJom7LcQVgxPQPtiZkswh+VwhOcQq9NtACo0BsISHifGY7Bm
X-Received: by 2002:a67:ad1a:: with SMTP id t26mr37015886vsl.124.1555598167343; 
 Thu, 18 Apr 2019 07:36:07 -0700 (PDT)
Date: Thu, 18 Apr 2019 07:36:04 -0700
Message-Id: <20190418143604.27628-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 1/2] pmbus: support for custom sysfs attributes
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: "krzysztof.adamski@nokia.com" <krzysztof.adamski@nokia.com>,
 openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 14:36:16 -0000

From: "krzysztof.adamski@nokia.com" <krzysztof.adamski@nokia.com>

This patch makes it possible to pass custom struct attribute_group array
via the pmbus_driver_info struct so that those can be added to the
attribute groups passed to hwmon_device_register_with_groups().

This makes it possible to register custom sysfs attributes by PMBUS
drivers similar to how you can do this with most other busses/classes.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h      |  3 +++
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ec..fb267ec11623 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -417,6 +417,9 @@ struct pmbus_driver_info {
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
+
+	/* custom attributes */
+	const struct attribute_group **groups;
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7200e80235db..6e3320bb1361 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -103,7 +103,7 @@ struct pmbus_data {
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
-	const struct attribute_group *groups[2];
+	const struct attribute_group **groups;
 	struct dentry *debugfs;		/* debugfs device directory */
 
 	struct pmbus_sensor *sensors;
@@ -2313,6 +2313,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	struct device *dev = &client->dev;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
 	struct pmbus_data *data;
+	size_t groups_num = 0;
 	int ret;
 
 	if (!info)
@@ -2327,6 +2328,15 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (!data)
 		return -ENOMEM;
 
+	if (info->groups)
+		while (info->groups[groups_num])
+			groups_num++;
+
+	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
+				    GFP_KERNEL);
+	if (!data->groups)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 	data->dev = dev;
@@ -2354,6 +2364,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	}
 
 	data->groups[0] = &data->group;
+	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
 	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
-- 
2.21.0.593.g511ec345e18-goog
