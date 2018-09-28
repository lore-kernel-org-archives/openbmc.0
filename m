Return-Path: <3pmiuWwUKBxU5F8J319916z.x979Az8w7x63DED.9K6vwD.9C1@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::14a; helo=mail-it1-x14a.google.com;
 envelope-from=3pmiuwwukbxu5f8j319916z.x979az8w7x63ded.9k6vwd.9c1@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hO8CPVWl"; 
 dkim-atps=neutral
Received: from mail-it1-x14a.google.com (mail-it1-x14a.google.com
 [IPv6:2607:f8b0:4864:20::14a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MJwr6HBTzF3J6
 for <openbmc@lists.ozlabs.org>; Sat, 29 Sep 2018 03:45:12 +1000 (AEST)
Received: by mail-it1-x14a.google.com with SMTP id t18-v6so3243879ite.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Sep 2018 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1ufm09luRqbju2ITDtXWH71bVbANa3y/xUheH7hlRZo=;
 b=hO8CPVWlxs3WRBpt+84GWEdUTAvvKHztFrPzSO7p4EoaJOUvI+WUNgAEus3Q2gJI8s
 iTV1LKF1XNxh833/4YqiRxqdyhui4n/FmbG2Bd1ub+bMdG+gUq5wNjl2O2nm1htOB8qp
 5i7n1q0kPRNfV4PCGB0zUqUmlAkEhcTi/xn5XVKd6KsekzfptoMqe/h18sQcvFPGH1ZX
 okrE5KnwkvukOpivIp+NjtVVWkaqNwKh6lR+KKd8N6j1NrE6JdohVntHaeNWz8CeF+rQ
 8SwsU5W1mkK9eF7yxffARp/uwzGizGi/Q3gK/y9r7+IXZ3CxL4zfYCkgT/GEjw8J0Hm4
 WIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1ufm09luRqbju2ITDtXWH71bVbANa3y/xUheH7hlRZo=;
 b=fyGioPy28CIGszqHEHnpASwu4yPp87l09Xapu88hwHnIubIyJwbpBmZnWiqQDkSJ/6
 MRr+hne+nUmTq43A2ctiby815XIGPbW/5VteZwmO005vlF586xbWYWw+OJwSbxiXYH8I
 BpddIoNsaflNO4mBwyWmWZYGA22EBa/39nlGXTF6LlLgE3TA/iaJIcI6g49NHWgnX3yo
 PWmQk5BXiK7DC6YQQH/AAyMn+NuAsqe7Nc9w5+DIlmYxqyiPn4pXMd+FiX/+d0lt1te5
 +MykSekIjvRX6yYBrGXbVXkxyEm+Vo5uDYk0A1vhRAtFayVCsrNacuS5VPayDBBUuF9j
 la+Q==
X-Gm-Message-State: ABuFfojzdov4oMF037zbdbBwjzRFTILY83PyAbpy8kQN5ffsp6O2aZfS
 XSwG/7qxRoOFAG82LTt8ytKR3xwBDQ==
X-Google-Smtp-Source: ACcGV62G/XJoB1eY6wrhWfcGzanVe+uG9WHa+cpo4/6ippu3Z87jYx4hlEMTYAM+YN+/4GoKYGWImFTyWw==
X-Received: by 2002:a24:2414:: with SMTP id f20-v6mr2388096ita.0.1538156710841; 
 Fri, 28 Sep 2018 10:45:10 -0700 (PDT)
Date: Fri, 28 Sep 2018 10:45:00 -0700
Message-Id: <20180928174500.18538-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
Subject: [PATCH] hwmon: (adm1275): Add device tree param for shunt resistor
From: Kun Yi <kunyi@google.com>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: rlippert@google.com, benjaminfair@google.com, openbmc@lists.ozlabs.org, 
 Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Fri, 28 Sep 2018 17:45:17 -0000

The ADM series of hotswap controllers support extending
the current measurement range by using a sensing resistor
value other than the typical 1 mOhm. For example, using a 0.5 mOhm
sensing resistor doubles the maximal current can be measured.

Current driver assumes a shunt resistor value of 1 mOhm in calculation,
meaning for other resistor values, hwmon will report scaled
current/power measurements. This patch adds a device tree parameter so
that individual boards can configure its shunt resistor value.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/adm1275.txt     | 19 +++++++++++++++++++
 Documentation/hwmon/adm1275                   |  3 +++
 drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..a182fa195ed1
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,19 @@
+adm1275 properties
+
+Required properties:
+- compatible: Must be one of the supported compatible strings in
+  Documentation/hwmon/adm1275
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor-micro-ohms
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+adm1272@10 {
+	compatible = "adi,adm1272";
+	reg = <0x10>;
+	shunt-resistor-micro-ohms = <500>;
+};
diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
index 39033538eb03..5e277b0d91ce 100644
--- a/Documentation/hwmon/adm1275
+++ b/Documentation/hwmon/adm1275
@@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
 or current scaling. Reported voltages, currents, and power are raw measurements,
 and will typically have to be scaled.
 
+The shunt value in micro-ohms can be set via device tree at compile-time. Please
+refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
+if the device tree is used.
 
 Platform data support
 ---------------------
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 13600fa79e7f..f569372c9204 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
 	const struct coefficients *coefficients;
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 	int tindex = -1;
+	u32 shunt;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA
@@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+	if (of_property_read_u32(client->dev.of_node,
+				 "shunt-resistor-micro-ohms", &shunt))
+		shunt = 1000; /* 1 mOhm if not set via DT */
+
+	if (shunt == 0)
+		return -EINVAL;
+
 	data->id = mid->driver_data;
 
 	info = &data->info;
@@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
 		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
 	}
 	if (cindex >= 0) {
-		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
+		/* Scale current with sense resistor value */
+		info->m[PSC_CURRENT_OUT] =
+			coefficients[cindex].m * shunt / 1000;
 		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
 		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
 	}
 	if (pindex >= 0) {
-		info->m[PSC_POWER] = coefficients[pindex].m;
+		info->m[PSC_POWER] =
+			coefficients[pindex].m * shunt / 1000;
 		info->b[PSC_POWER] = coefficients[pindex].b;
 		info->R[PSC_POWER] = coefficients[pindex].R;
 	}
-- 
2.19.0.605.g01d371f741-goog
