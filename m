Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ptnitUg6"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lVKM6MHFzDqRg;
 Fri, 19 Apr 2019 05:58:31 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id z9so1654301pgu.10;
 Thu, 18 Apr 2019 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iWQMJ2qTXasITQgDK7vc9YMGIL8w6QMaEOeMp9MVgzI=;
 b=ptnitUg6IR26fWprpiE9SfWzcu4vKN3PFmzfsz+4CDYEGeIqed3/8Lo9tQysZUG4Lv
 SGLNuz5reGyNFVfirM8CCbcaXLvTAcwDEgUNrIdldCkCvUMcqtz+SUzeeYsxEbAhrhe8
 OZV4IdpJ/JrDKgyaiDznPuk+NqeEQ+jdLfRbHLUzkg+Mi1UVxsBjWuVyNwUATQGgOyAi
 Ur8Ltu5Z/kfZiNlkj5lQHDvgInKi5nOQho3eNt1oc8wHMjoaJVJpgrlgv/bsrCPNbZ2p
 uBvINGwHLyrn0+sEuBYiyqP1Yz3q4x1JO738O87cTk3RZL6XE3D7tVRwHfsrL5pwO/Mq
 XG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=iWQMJ2qTXasITQgDK7vc9YMGIL8w6QMaEOeMp9MVgzI=;
 b=ogIypUzK97MfNRPNHNM/+58IjgTt+DLHPes7n28pMcfcF3wtmqQ6DD63O84dV132vC
 NTlSWdTjVeuOrfgY4XZxtPgtAyO1ZMXeaxI6+uaycgX8jEfl5R+6eIvFfY/Ojttq2TEI
 /qPcmwo8qhRZBVdhZACUJOoovx0ZGBNZEwh4BfbBBGzxQEIu2h5KidUZC1LKuj8GceTx
 67yAS3gLyUsT8J9xTlrMgK8/p0jzBCifLvPpP0/+M/1zFoeHRmAbru0GcS8n9WL8SGSY
 /jjAcQrPkxEo0zBEbDKmqOyQ6+qEr97aqVrJFf8bdTXdyCN9l1CSFq3KAsC6N3IKsWl/
 /66w==
X-Gm-Message-State: APjAAAWOUOcnFSOIg1Q4C5ZUGtTR1CO5/zhWAkF3Ir34Dk5G/hKMrdTW
 BsbN58+yRBEjZmyhWIt6M7w=
X-Google-Smtp-Source: APXvYqwapDl66OdPq4SqQZL/qnGUXMG1TzJPI+cBC4ddbm9BEsja+OuErjgE2UHtPRBNttg6+aDKSg==
X-Received: by 2002:a63:fa46:: with SMTP id g6mr89147313pgk.382.1555617509572; 
 Thu, 18 Apr 2019 12:58:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n21sm10519669pfb.42.2019.04.18.12.58.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:58:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-pm@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Kamil Debski <kamil@wypas.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (mlxreg-fan) Use
 devm_thermal_of_cooling_device_register
Date: Thu, 18 Apr 2019 12:58:18 -0700
Message-Id: <1555617500-10862-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
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
X-List-Received-Date: Thu, 18 Apr 2019 19:58:32 -0000

Call devm_thermal_of_cooling_device_register() to register the cooling
device. Also introduce struct device *dev = &pdev->dev; to make the code
easier to read.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/mlxreg-fan.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index db8c6de0b6a0..a14347ea0d77 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -420,42 +420,42 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
 static int mlxreg_fan_probe(struct platform_device *pdev)
 {
 	struct mlxreg_core_platform_data *pdata;
+	struct device *dev = &pdev->dev;
 	struct mlxreg_fan *fan;
 	struct device *hwm;
 	int err;
 
-	pdata = dev_get_platdata(&pdev->dev);
+	pdata = dev_get_platdata(dev);
 	if (!pdata) {
-		dev_err(&pdev->dev, "Failed to get platform data.\n");
+		dev_err(dev, "Failed to get platform data.\n");
 		return -EINVAL;
 	}
 
-	fan = devm_kzalloc(&pdev->dev, sizeof(*fan), GFP_KERNEL);
+	fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
 	if (!fan)
 		return -ENOMEM;
 
-	fan->dev = &pdev->dev;
+	fan->dev = dev;
 	fan->regmap = pdata->regmap;
-	platform_set_drvdata(pdev, fan);
 
 	err = mlxreg_fan_config(fan, pdata);
 	if (err)
 		return err;
 
-	hwm = devm_hwmon_device_register_with_info(&pdev->dev, "mlxreg_fan",
+	hwm = devm_hwmon_device_register_with_info(dev, "mlxreg_fan",
 						   fan,
 						   &mlxreg_fan_hwmon_chip_info,
 						   NULL);
 	if (IS_ERR(hwm)) {
-		dev_err(&pdev->dev, "Failed to register hwmon device\n");
+		dev_err(dev, "Failed to register hwmon device\n");
 		return PTR_ERR(hwm);
 	}
 
 	if (IS_REACHABLE(CONFIG_THERMAL)) {
-		fan->cdev = thermal_cooling_device_register("mlxreg_fan", fan,
-						&mlxreg_fan_cooling_ops);
+		fan->cdev = devm_thermal_of_cooling_device_register(dev,
+			NULL, "mlxreg_fan", fan, &mlxreg_fan_cooling_ops);
 		if (IS_ERR(fan->cdev)) {
-			dev_err(&pdev->dev, "Failed to register cooling device\n");
+			dev_err(dev, "Failed to register cooling device\n");
 			return PTR_ERR(fan->cdev);
 		}
 	}
@@ -463,22 +463,11 @@ static int mlxreg_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mlxreg_fan_remove(struct platform_device *pdev)
-{
-	struct mlxreg_fan *fan = platform_get_drvdata(pdev);
-
-	if (IS_REACHABLE(CONFIG_THERMAL))
-		thermal_cooling_device_unregister(fan->cdev);
-
-	return 0;
-}
-
 static struct platform_driver mlxreg_fan_driver = {
 	.driver = {
 	    .name = "mlxreg-fan",
 	},
 	.probe = mlxreg_fan_probe,
-	.remove = mlxreg_fan_remove,
 };
 
 module_platform_driver(mlxreg_fan_driver);
-- 
2.7.4
