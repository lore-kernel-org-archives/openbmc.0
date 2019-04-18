Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aw4PbPE2"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lVKK1SCczDqSR;
 Fri, 19 Apr 2019 05:58:28 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p6so1657113pgh.9;
 Thu, 18 Apr 2019 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P2kSmkr0gjxDrzltwWGdPiHLXWPJpXIu1nScfCyroiQ=;
 b=aw4PbPE2LbcT7H4oTgNGIFAcjm+SZXbSWJcBJtNUrPH25VznEczbSeJ40NXsVwaMtx
 h6y3WWQzakymz1v9uoaJ+dbywvlrNiry1RccU8/skfi5CL4Vz3CaOoWOE7pyFskOJGme
 VOf9/JgETdp70sq0dVR6mv7ot3zZY+pKRTRtUFmhdr788n34/Y4G8wJOUVbmdktSV6iW
 TYcmy2Ow0VuVtGlgxYZirN62xuRxV2sICTJkCbsH+jBd8LPZCHBhL3IHbvEQpMmyqzxD
 oc3O2D6vdravLNIs9ZNnsLCcF+nTexby1/A5gq3A98N7xUJc7jnTPlE0yLXXNBBiK0l9
 HYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=P2kSmkr0gjxDrzltwWGdPiHLXWPJpXIu1nScfCyroiQ=;
 b=H0VTsTPQCnlr53q0uGRKAS5wQXnVhwGjuaYpUTbBCM1YxnSy5uiLbFjoGbLvd9ZzNJ
 2dAVzA4zrlUdohZtCemlzUxgm+MAU4vgvGR5Y6CTqDrEWfu5N0UZDboz+eXgfjfkR443
 JIhVkyKaPbs0Per0zWJ2XIwbgOdEBKDrqrJ/91ActUtdvZcr0UovaYXs9E+icnP0712+
 vT0MILum7UyWGJbdJ+tSntWnGdnDP6/HuAf+wmUQ0dv1cgCYy8Cr0A/tn18+mBHQJJFk
 QG8K/IIVmT9+aUPWMOyMJhRRqpmg6P4ZzSWHmJCDEZHS5WyKLNNkLi/48O9E/1G7ZkPC
 2BYg==
X-Gm-Message-State: APjAAAUkldgmlT7b8TRFwTGtbsY1hBSoF0KL+mFG8na6LDbw6JO1qC3p
 9UJumALZtJt6qBEYjk4MlgQ=
X-Google-Smtp-Source: APXvYqxpLyKpYoSfcl1WD6JN0XXUOmrDmvDwdlk09zltzORJYfgVRH8R3VUDuCoLqBR4k7NGttb+Fw==
X-Received: by 2002:a63:c61:: with SMTP id 33mr84153243pgm.293.1555617506752; 
 Thu, 18 Apr 2019 12:58:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h10sm4335474pfj.79.2019.04.18.12.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:58:26 -0700 (PDT)
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
 Guenter Roeck <linux@roeck-us.net>,
 Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH 2/6] hwmon: (aspeed-pwm-tacho) Use
 devm_thermal_of_cooling_device_register
Date: Thu, 18 Apr 2019 12:58:16 -0700
Message-Id: <1555617500-10862-3-git-send-email-linux@roeck-us.net>
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
X-List-Received-Date: Thu, 18 Apr 2019 19:58:30 -0000

Use devm_thermal_of_cooling_device_register() to register the cooling
device. As a side effect, this fixes a driver bug:
thermal_cooling_device_unregister() was not called on removal.

Fixes: f198907d2ff6d ("hwmon: (aspeed-pwm-tacho) cooling device support.")
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index c4dd6301e7c8..0daf0b32aa4a 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -830,10 +830,8 @@ static int aspeed_create_pwm_cooling(struct device *dev,
 	}
 	snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%pOFn%d", child, pwm_port);
 
-	cdev->tcdev = thermal_of_cooling_device_register(child,
-							 cdev->name,
-							 cdev,
-							 &aspeed_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
+					cdev->name, cdev, &aspeed_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
-- 
2.7.4
