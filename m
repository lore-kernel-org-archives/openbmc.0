Return-Path: <3KrfHWwUKB5sFPITDBJJBG9.7JHJK9I6H7GDNON.JUG56N.JMB@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::14a; helo=mail-it1-x14a.google.com;
 envelope-from=3krfhwwukb5sfpitdbjjbg9.7jhjk9i6h7gdnon.jug56n.jmb@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bfWeciy/"; 
 dkim-atps=neutral
Received: from mail-it1-x14a.google.com (mail-it1-x14a.google.com
 [IPv6:2607:f8b0:4864:20::14a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b6H36H6xzF3Rs
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 09:26:52 +1100 (AEDT)
Received: by mail-it1-x14a.google.com with SMTP id f79-v6so3677393ita.3
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 15:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:cc;
 bh=p8DLWVPHFdDh+XLJZJQGOyjP3fo46ff91OpQ4glEXl4=;
 b=bfWeciy/6udWJikIHpD/LgP+JWGKXe0ZOriVFNXcXy4bAFPQ3KXUm3Uv+fp6p+LDiq
 ZTqPEvrS/7/S+YJn/oKBkQhKENmairZrPOsrCvTv1yxY24upudsrd/eBy9yMpGdifLm9
 d87MC0BlpB27xSQTMBqK452DLHIFglVSSyWap0TvThozxiBhnVPeeRNlPdfLMtQET0Xh
 sGkC0jiPFqqd6nVHfdKQev2bjuC46Oi7BS4SpntJxmEM9Bn6UkxvxXg/oRY2ijBLLKO9
 8g7rLl9+zh6SOqG1Gj44E9X3PqZZSecBL8gyRg7OP+akcCVSlXFjhjmP+HrkazA4WJbs
 ydPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=p8DLWVPHFdDh+XLJZJQGOyjP3fo46ff91OpQ4glEXl4=;
 b=l6yPCM5DS4KNRyLR2PJ6udJho9SXxqEIhSitR3dg3PiVdfqxuECTdR+iAYK+SaoxVt
 lVjBjHbJhdBVRUzGpFk06eWLohZVq9lbF3icQA60QdTncEgK41GTA1MPSFG978sfdvHk
 /dJJzL0ZDHrlJKPsQAxJDbIvVQCtDCzBXZXGmG30SiWFse+P1az03W64hJcerMVJiIvX
 QqcN8okY9Q6wCJu4G1oUWh/q1Tw2FVMtO8zUYn2Dkxc2oh9et3/U9jiDMERF1uZRbh1r
 ivan+2jWsKO6viFJxOb0pxtM7+cR1k59V76LxB2n/bxuGSUM95mlZx1IH3nFds6m7eQi
 TnLQ==
X-Gm-Message-State: ABuFfoj8WToSEijRlO/PyjGwES6+Kjmd4mb9tJljZfXneUKFjxJ3Pqxe
 RkRr88TG4FsM13a39yQJ2LLjvlbfESDqqNR3gWra1JR3GZ2ZTVWpTQbU+jIxFls957Y9ojHbjV1
 pM61Tg7bOYhDYBVQsK+IFeN3is2yobRrpU8y+SXMuKO/XqkJftNfHhfveLK1Ung==
X-Google-Smtp-Source: ACcGV60Vh6hxtijV8dVp1Z0QoZIdErAIy7LyqiVmuvuBbcDXP95iUA3UyyD7dye7dxVIAExsCdztnwfH1w==
X-Received: by 2002:a05:660c:310:: with SMTP id
 u16mr3422596itj.1.1539815210606; 
 Wed, 17 Oct 2018 15:26:50 -0700 (PDT)
Date: Wed, 17 Oct 2018 15:26:39 -0700
Message-Id: <20181017222639.254434-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.331.ge82ca0e54c-goog
Subject: [PATCH v3 1/2] hwmon: (adm1275): Allow setting shunt reg value
From: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com, 
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
X-List-Received-Date: Wed, 17 Oct 2018 22:26:57 -0000

The ADM series of hotswap controllers support extending
the current measurement range by using a sensing resistor
value other than the typical 1 mOhm. For example, using a 0.5 mOhm
sensing resistor doubles the maximal current can be measured.

Current driver assumes a shunt resistor value of 1 mOhm in calculation,
meaning for other resistor values, hwmon will report scaled
current/power measurements. This patch parses device tree parameter
"shunt-resistor-micro-ohms", if there is one.

Signed-off-by: Kun Yi <kunyi@google.com>
---
Changes in v3:
- splitted hwmon and device tree binding patches

 Documentation/hwmon/adm1275   |  3 +++
 drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

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
2.19.1.331.ge82ca0e54c-goog
