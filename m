Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgXRT4nSszDqb4
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 10:18:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M9CqDjza"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Xg9atiDO"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E670E20994;
 Sun, 27 Aug 2017 20:18:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 20:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nrhTr4
 IvqKdTz8/vLqXokWBxuHuq3fkbpiAPW1pCFJ0=; b=M9CqDjzaVGyEMjA/7Zr0Xt
 MBUBvvLLze9IF6OmFgKBLp1lwjqxywYcAtDB6MCev/YSmTVHuzOVcaESZQhtYd7+
 bZCBxz/fd4z3KMWnLEEn1u81ng6HOtSdJYxgdoOl6cvKylw4R5StSoBdK8vV9xii
 TXWjO3r3e+DC8vFdQw2IguHKfCxaZ1WQ7rbjZW+X8B1go+Wu4iwC/WuICK79l6jo
 fNFcVVSvCRMo226jaaJsNVMIscdtwhHCMBl0/PIO+pR4e1CaanfGI0EoLdiQQeAR
 GV4Bv01by4Et6VWhr23I2ND2urmRrx2M3p3Bc/jibr9nyQYk6XJS+aONib93BWKg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=nrhTr4IvqKdTz8/vLqXokWBxuHuq3fkbpiAPW1pCF
 J0=; b=Xg9atiDO1E2evLKgSeLUUILS6RvuCa1a4A6xemQd0X1R+f8eDlYu9VMX9
 hCHderekMeGmWfV6DElSWNOU0Hok934HocMBKJ+99+v1yIKHteryMJwyNzfR9V5s
 aiVtpIy1GmK2KFJdMNtyr7hCKm8V3PVtJCYp7/85n9hbBC3tXoTqPXwfF7Pco271
 dHubYrvlNmc1pcPqdf5a1ZtIfwQx4Xn9gInNsYIrQPa7LhHbSMsqfvcouQCZh3FV
 a6XwWI5fAhdKxZDtePFsTaHt/UvEbtsI9ccxeOoyI5r6eO8FEOZ20XczG0viUg/J
 hWYF/P+hqmQ5s1l/NBSkylVUEvKBQ==
X-ME-Sender: <xms:QmGjWSi5CA5jplGi5WiMJxkm9A0PBDF_O6_04Ti4pq2dfhvIJxm48g>
X-Sasl-enc: XrH/P5JQ6Q2zo5zZj/tdvtF2GgdX5oMj96NbGVcp7Gg/ 1503879490
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0B38248E6;
 Sun, 27 Aug 2017 20:18:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Mon, 28 Aug 2017 09:47:11 +0930
Message-Id: <20170828001711.19662-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170828001711.19662-1-andrew@aj.id.au>
References: <20170828001711.19662-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 28 Aug 2017 00:18:15 -0000

In some systems, such as Baseboard Management Controllers (BMCs), we
want to retain the state of LEDs across a reboot of the BMC (whilst the
host remains up). Implement support for the retain-state-shutdown
devicetree property in leds-gpio.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-gpio.c | 7 ++++++-
 include/linux/leds.h     | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index e753ba93ba1e..764c31301f90 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -134,6 +134,8 @@ static int create_gpio_led(const struct gpio_led *template,
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
 		led_dat->cdev.flags |= LED_PANIC_INDICATOR;
+	if (template->retain_state_shutdown)
+		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
 
 	ret = gpiod_direction_output(led_dat->gpiod, state);
 	if (ret < 0)
@@ -205,6 +207,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
+		if (fwnode_property_present(child, "retain-state-shutdown"))
+			led.retain_state_shutdown = 1;
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
@@ -267,7 +271,8 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 	for (i = 0; i < priv->num_leds; i++) {
 		struct gpio_led_data *led = &priv->leds[i];
 
-		gpio_led_set(&led->cdev, LED_OFF);
+		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
+			gpio_led_set(&led->cdev, LED_OFF);
 	}
 }
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 64c56d454f7d..bf6db4fe895b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,6 +49,7 @@ struct led_classdev {
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
 #define LED_BRIGHT_HW_CHANGED	(1 << 21)
+#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -392,6 +393,7 @@ struct gpio_led {
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
+	unsigned	retain_state_shutdown : 1;
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
 	struct gpio_desc *gpiod;
 };
-- 
2.11.0
