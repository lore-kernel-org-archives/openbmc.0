Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="isK713ot"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lVKN4B8DzDqRg;
 Fri, 19 Apr 2019 05:58:32 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j26so1663855pgl.5;
 Thu, 18 Apr 2019 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Dg22N7ij5CbFARw1/POY95wKTQwDv4ke41HQVemNXb0=;
 b=isK713otpnbCLzfyYP0C/L3CQGDivEgxsaQsNLJKL0LOP5j2LZQ55TosA655bgf6PU
 zPg89A27hwGa2tIdK9OwiKC05C1xC51XZEam1A4CWPhzydraLi0oy7R1yAYwVqzKYBLl
 hLaQ+KR8diIcxJt/+4OLQvspgp0aOXuAFWIbBR8cjCWOSiOIz6iDE11+D06uATslKbDE
 4WL8KelALI9n9BakzeTJDgKfyQ1NYPi8B9MpU6H4QiTjgMnOgWyQKLsXqAsbSrexWnek
 BNeGnr1KHohFWbxYeXBtt2I3g+L4ATaKgedtzqkI1bRRVrLqpGmuLyqJmUfZJDKE2XsD
 e9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Dg22N7ij5CbFARw1/POY95wKTQwDv4ke41HQVemNXb0=;
 b=i2F6R6ANPRTs2ycs8xWQ59fB/Ga4N9F7RknsMvnPRgGknyQZeXkLdCnhLC2ClMEvdX
 EMSncuVqc1uwfpS5ZVMos7dL/Pu8RSrWHzGVtt/VCIjhYc3PpH+WHlRtJn5gEgm6V0fY
 0/VM056BPGSVK9kqVZLSfvaltbLThddvluvBTvtPecSS1rOBDEqd9Qv6mD9CCE0/GO2j
 aBQE3wViuOPXnjSUvPhMt215AD+j4MGBh3/iP+zQIM8uNDsTCYI6/Dnkqajw/mt1SZe9
 3PzsBDZKZaxiehTbIa+bhssoXlB0lE+oOkynFI6gxOX3PU1PCZ/c2HflHuq1f1DvW1OF
 afuw==
X-Gm-Message-State: APjAAAWtVOUKS8Law7ANFipaFVZiA1nm/0QEHFqu8f9+W/eHl+9fqg3J
 88N+BZDV5Aq/q0aPMT+E7hM=
X-Google-Smtp-Source: APXvYqzdpywDRRWK/t1CrguxPsh3QuvMjM/1PBlC1eJQcZ9pAW6iwz4VRB6e4iZFShYWRIg6RJRx1w==
X-Received: by 2002:aa7:9a89:: with SMTP id w9mr90410001pfi.213.1555617510960; 
 Thu, 18 Apr 2019 12:58:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 128sm3058432pgb.47.2019.04.18.12.58.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:58:30 -0700 (PDT)
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
Subject: [PATCH 5/6] hwmon: (npcm750-pwm-fan) Use
 devm_thermal_of_cooling_device_register
Date: Thu, 18 Apr 2019 12:58:19 -0700
Message-Id: <1555617500-10862-6-git-send-email-linux@roeck-us.net>
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

Use devm_thermal_of_cooling_device_register() to register the cooling
device. As a side effect, this fixes a driver bug:
thermal_cooling_device_unregister() was not called on device removal.

Fixes: f1fd4a4db777 ("hwmon: Add NPCM7xx PWM and Fan driver")
Cc: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/npcm750-pwm-fan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index b3b907bdfb63..f24cc00caba9 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -864,10 +864,8 @@ static int npcm7xx_create_pwm_cooling(struct device *dev,
 	snprintf(cdev->name, THERMAL_NAME_LENGTH, "%pOFn%d", child,
 		 pwm_port);
 
-	cdev->tcdev = thermal_of_cooling_device_register(child,
-							 cdev->name,
-							 cdev,
-							 &npcm7xx_pwm_cool_ops);
+	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
+				cdev->name, cdev, &npcm7xx_pwm_cool_ops);
 	if (IS_ERR(cdev->tcdev))
 		return PTR_ERR(cdev->tcdev);
 
-- 
2.7.4
