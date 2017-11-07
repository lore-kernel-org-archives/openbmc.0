Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ClEjgUTF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LnERoHqP"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhx1rqrzDrKp
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2327B206E9;
 Tue,  7 Nov 2017 02:31:43 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bVvgMx+aRgG1rCWdd
 uymHIBht4KAd2DrkHCnU50XvXs=; b=ClEjgUTF/N/1aXM0lgDWv2xS9IlZwiAaI
 ELr/9L66JX9mVpAQ/CrVnkl6L99RrD6Ukbc3IF2XCqpgB/rgXeUylFSeNEOIIrMN
 2cU8i9/YsVIv/pJQzjBPzZxQxigwe0dn7aWNFy9OviLLNryzzVUPWcChJnHXQrCS
 PwKZMVS0C/WEICI3QoL6yw97KnHXNDAFsXWX7QMlkZMEviOKwh/vvfajOIcTxdCr
 rUgpl8AhTDTic/URxpgPFPlWdhEeyr41psenBIQhmxAWZerKBjK+yfheCEqaJBuT
 aBWm5M2FS8ct/jwPctegzfkV7p4MwOc812K5vaWQ/jNw7XOG1FaGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bVvgMx+aRgG1rCWdduymHIBht4KAd2DrkHCnU50XvXs=; b=LnERoHqP
 yitCKNxWHSf1exGdEolcuOm+vOrR4GnzVwyAoX06KFR9L6ZWOFhidLhl7i+3m0Zn
 rshW1J8ELWLGPo3PDw0+1B0R/iobxFshabkBE1CJ5386Yha6X+9aYPZ5DkgZIorV
 wA2vaxBcbU8Sop3WlG4hCWZCT+az614BUpEIyckf8I6iCjcX3cRXndU7SAAUSQEt
 LHyRZ3ZlKdyd3TY0nVWDQnfp+zGNJNMW42v7+Drfix23ygYFRXMiUtrU96Ji61Vi
 /ZGTyFoo1/I5Ck/env0+tff/Zx8EGWVGiWHQEv48vt0tVQERotq+PTHCPoLYy2FK
 DQUzZs4HzRbqTA==
X-ME-Sender: <xms:X2EBWszUupAUl9CnlB5JU49G5VxvQ2aKVpg4Xmtu0Jalm9PbfUguvg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0C8D24BCA;
 Tue,  7 Nov 2017 02:31:41 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 08/23] leds: gpio: Allow LED to retain state at
 shutdown
Date: Tue,  7 Nov 2017 18:00:31 +1030
Message-Id: <20171107073046.13319-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:31:45 -0000

In some systems, such as Baseboard Management Controllers (BMCs), we
want to retain the state of LEDs across a reboot of the BMC (whilst the
host remains up). Implement support for the retain-state-shutdown
devicetree property in leds-gpio.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit ab9fa30883635b7a579ed318ac7ec7d85fe1e4d5)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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
