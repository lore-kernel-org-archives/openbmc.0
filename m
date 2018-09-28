Return-Path: <3PIiuWwUKB-kVfYjTRZZRWP.NZXZaPYMXNWTded.ZkWLMd.ZcR@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com;
 envelope-from=3piiuwwukb-kvfyjtrzzrwp.nzxzapymxnwtded.zkwlmd.zcr@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nbWCR7X3"; 
 dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MMwM0RKlzF3HY
 for <openbmc@lists.ozlabs.org>; Sat, 29 Sep 2018 05:59:59 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id j15-v6so7743118pff.12
 for <openbmc@lists.ozlabs.org>; Fri, 28 Sep 2018 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bW7QQ6sb4fiATo7jTyTuAURvccUcKVFvs6VrcThzwa0=;
 b=nbWCR7X3pMP+mqCFDJraweqQ7ScFgV3Xhpn6BMQ5UezwqCki3HCAdv8Dh9f/1vqVgr
 Lahg6919xYHawE/79CtkpEdxUF06rWvM7PY1EP7VwfMKbAZH3J71/4WFO28GUcq0jy3i
 TNOqN1D+g0hQeeQEQp1oVFfJhqa5J8HUqU/bJ61BnBUzQgVA8jNUzgTvt/wv6BtXZqy5
 Cp4ieLf0Xy0YY5TADnvzEYT1Ow4FqzP1L3ZdwRy+rPhs3e7AjahFUJ4phHdy5nnosUBg
 Bj3qSXhsA1iLbVslp2wF5/PWOdbyPBMWk6lbPH6+XfnqKV8jfmZnnjzAexdo/nRT5Rnf
 dnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bW7QQ6sb4fiATo7jTyTuAURvccUcKVFvs6VrcThzwa0=;
 b=feo4sL8yuNKYZc0uuAjxq5ZrYVh8nt3QKhMwdd3HeqZitWQ9iinE93+P/J1IjXsNYN
 2PslCJI3OkLqNH+XGB5gGrnmYZqEKYuAHHwoFyKNlmuaBu3XQusnHbp/x2Ioc/tnNF4a
 ClTwdgSFVGgbg4QMDLmuXfY7Xc0sPHsDY3wQzXqTYd97nnTfspNbb8Ghh6Y5kfsSdV1N
 93V5eUpe2jdHdV1mGgIWd+GnfNA1R+H9uvH+psuBRc2yB8TJvE4D5/JoXMGFpqj14tC0
 OMt5MrACN9M+XTyOnNrb9LBnqY3VXdi8Ab6cmFHt6D76G3JoaffdAY3P66pyqC7BtoGD
 bmOQ==
X-Gm-Message-State: ABuFfojoe88Ze3HsaHsOWGZmMfZTGySApdLZZV0q+jRoL+hAa9hYLkjF
 gKcf7AJdldOZwCitLcShcv1TlXWvIw==
X-Google-Smtp-Source: ACcGV60jIBF2iVuxBbv6mMW+jEDS1DEi7z/XVs0L8Dbz2GmxaIho0nqos5RWOuYbrw2R40lau65oi3E1XQ==
X-Received: by 2002:a65:5048:: with SMTP id k8-v6mr64933pgo.17.1538164796696; 
 Fri, 28 Sep 2018 12:59:56 -0700 (PDT)
Date: Fri, 28 Sep 2018 12:58:00 -0700
Message-Id: <20180928195800.153914-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
Subject: [PATCH v2] hwmon: (adm1275): Add device tree param for shunt resistor
From: Kun Yi <kunyi@google.com>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com, 
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
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
X-List-Received-Date: Fri, 28 Sep 2018 20:00:04 -0000

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
 .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
 Documentation/hwmon/adm1275                   |  3 +++
 drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..1ecd03f3da4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,25 @@
+adm1275 properties
+
+Required properties:
+- compatible: Must be one of the supported compatible strings:
+	- "adi,adm1075" for adm1075
+	- "adi,adm1272" for adm1272
+	- "adi,adm1275" for adm1275
+	- "adi,adm1276" for adm1276
+	- "adi,adm1278" for adm1278
+	- "adi,adm1293" for adm1293
+	- "adi,adm1294" for adm1294
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
