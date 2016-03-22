Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTZql5st9zDqFj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 12:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=MqwnzlMd; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n5so32888461pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 18:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=O6PW4GJK1G9taiNgOOvEZX+CVEzRmQBXG95YHk6VOzs=;
 b=MqwnzlMdXe9ijoOE/5fWQHbic/dxVdvTDuYFg0WjkrA0F/LqAz9rY7mjuLEBsSHx7B
 9FFoP+h1zq+5NCS2qh8bCXeqTGsOfE/igAR1jFE0pLNiLqp6l9y/lUrDDLIv4AmxkHbc
 b1KXTArGMzJ3Ohs1iJA5RnOfrZnuLWDOtC4sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O6PW4GJK1G9taiNgOOvEZX+CVEzRmQBXG95YHk6VOzs=;
 b=ENMBhNNp2MNF9Nd9waOoDQIGeKgDpWxIWYzKdckQhOve+3QXIaYFwTTf3b8JvQX2rv
 9vsQS8keRCeSO7bTNbUjMPKVLz0l5LEXMIValt2NDudeHsBM30WU2l64bEcXoR1RaUDc
 xqnPIxrJyS/Jd01MsgoAA7pmzzaeS5hZg83lrwF/k9nHnQ8Dudks3rJkz2ApOgWGiizi
 /VPFgMwyIy2iQH3FBj9vo1y23k4Elsz4/fb2zCsOdYNJb+IEHRWYQmYpGDfQ8W9SVFVI
 jv8eldUWeQiVWCm2i/g/F96yKEXagq57IFIxmdkr0ueWPl1Gg4SCHI+JOuIJ4X8UgJTd
 1Rbw==
X-Gm-Message-State: AD7BkJJvXuOKt3TA6wymv6+IW4/Yb1GjEZFToLzQ1gtUkYfECYLSvzKmRp5531fBN1A7LQ==
X-Received: by 10.98.75.214 with SMTP id d83mr49639328pfj.22.1458610178035;
 Mon, 21 Mar 2016 18:29:38 -0700 (PDT)
Received: from icarus.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r68sm43550814pfb.51.2016.03.21.18.29.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Mar 2016 18:29:37 -0700 (PDT)
Received: by icarus.jms.id.au (Postfix, from userid 1000)
 id 35F72100317; Tue, 22 Mar 2016 11:59:32 +1030 (ACDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] hwmon/adm1275: Support sense resistor parameter from dt
Date: Tue, 22 Mar 2016 11:59:31 +1030
Message-Id: <1458610171-11894-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.7.3
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
X-List-Received-Date: Tue, 22 Mar 2016 01:29:40 -0000

Allow a system to specify the value of an external sense resistor in the
device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/hwmon/adm1275.txt | 19 +++++++++++++++++++
 drivers/hwmon/pmbus/adm1275.c                       | 11 +++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..abfba34e91ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,19 @@
+adm1275 temperature sensor
+--------------------------
+
+Required property:
+
+ - compatible: "adi,adm1278"
+ - reg: i2c device address 
+
+Optional property:
+
+- sense-resistor: external sense resistor value in milliOhms
+
+Example:
+
+sensor { 
+	reg = <0x11>;
+	compatible = "adi,adm1278";
+	sense-resistor = < 100 >
+}
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 1476a127dbdb..a5534e40f4b1 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -364,6 +364,7 @@ static int adm1275_probe(struct i2c_client *client,
 	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
 	int config, device_config;
 	int ret;
+	u32 r_sense = 1;
 	struct pmbus_driver_info *info;
 	struct adm1275_data *data;
 	const struct i2c_device_id *mid;
@@ -418,6 +419,12 @@ static int adm1275_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+	ret = of_property_read_u32(client->dev.of_node, "sense-resistor",
+			&r_sense);
+	if (!ret)
+		dev_notice(&client->dev, "using r_sense from dt %d\n",
+				r_sense);
+
 	data->id = mid->driver_data;
 
 	info = &data->info;
@@ -591,12 +598,12 @@ static int adm1275_probe(struct i2c_client *client,
 		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
 	}
 	if (cindex >= 0) {
-		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
+		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m * r_sense;
 		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
 		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
 	}
 	if (pindex >= 0) {
-		info->m[PSC_POWER] = coefficients[pindex].m;
+		info->m[PSC_POWER] = coefficients[pindex].m * r_sense;
 		info->b[PSC_POWER] = coefficients[pindex].b;
 		info->R[PSC_POWER] = coefficients[pindex].R;
 	}
-- 
2.7.3
