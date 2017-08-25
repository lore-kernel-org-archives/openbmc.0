Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsM65Yn2zDrLH
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GAWggC76"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RxUnIL0x"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 89F5620DE9;
 Fri, 25 Aug 2017 02:53:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zSvDc2
 JDivLhT4h+6jNj+TgZda3gTWf0YCDThpzKT0Y=; b=GAWggC761nSJOe9gvLnQWj
 Eo5B7tP7uJEOSvIjDrjbuGjV18V0rMXT98/4SIOY6NPpn6fbpXCDLzrTj02dgetH
 C2qOseP4q5xrYueLk9haHVsZKrNuKOg9z8dNni+7err2Wdw4Loh7m4/srGoCYtNz
 vmy2MD5RVnTCbgftxPXxg81LRoQmrcJwaZz41eBMELB1JjVJnkj5GGW9gmTwscwy
 RSK0pshX3egqRe5gZaTB9Po691M0nyFB0X37OiN1qIEY3aD3Ve5Ei+toAVllvUoT
 uQe0Poftp1GisunkmblV7E7VHuxJ+sJhL2Z/WzrCnZZmIR5bDLeIxuHg7+0KFYUQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zSvDc2JDivLhT4h+6jNj+TgZda3gTWf0YCDThpzKT
 0Y=; b=RxUnIL0xtNy+HKxsaZns5Qml5AlBpW75uwSFqKFffP8qa0BDNhKhN7/WZ
 YsMiWe+kAXeLe21m3GtNaw7ug45VNWTaqS0ydZDNYgzz7C7RXs7wXh9SLwV3gBe+
 xFAt10bG1XDFNR1vpAZg/9dsADU9/nVb2yP1wL3y3YPB3qtinp3xfcEVQ+QYjwOe
 ZwlGqbbcdahktLDhrS9KsnKFFTPpRianImOY7UCUhNqgkJ0bWtUWs2y/ko6WGS+u
 mfdmetyuTQMiP7LkRPwyh0gtrSOsh0wOa73H3KvRPFXFEcgU5bkqBqpO6nSXvpTK
 DredMLBw5NnDDtLSgxSwADchI5iHg==
X-ME-Sender: <xms:cMmfWQgNuPNlq4ojrIASnYGhtVqC2mEpBARB07p5mXkHj7DfdWQ_qw>
X-Sasl-enc: qtBV19+nsNhriEOYogfKocqZOaR6JjXr0kwdThvd4Hr8 1503644015
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BC6F240B1;
 Fri, 25 Aug 2017 02:53:33 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/5] leds: gpio: Allow LED to retain state at
 shutdown
Date: Fri, 25 Aug 2017 16:22:41 +0930
Message-Id: <20170825065244.488-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170825065244.488-1-andrew@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:39 -0000

In some systems, such as BMCs, we want to retain the state of LEDs
across a reboot of the BMC whilst the host remains up.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-gpio.c | 7 ++++++-
 include/linux/leds.h     | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dcaf4d29..061ab9220048 100644
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
@@ -203,6 +205,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
+		if (fwnode_property_present(child, "retain-state-shutdown"))
+			led.retain_state_shutdown = 1;
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
@@ -265,7 +269,8 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 	for (i = 0; i < priv->num_leds; i++) {
 		struct gpio_led_data *led = &priv->leds[i];
 
-		gpio_led_set(&led->cdev, LED_OFF);
+		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
+			gpio_led_set(&led->cdev, LED_OFF);
 	}
 }
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb531094c..4d39f767f34a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -46,6 +46,8 @@ struct led_classdev {
 #define LED_DEV_CAP_FLASH	(1 << 18)
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
+#define LED_BRIGHT_HW_CHANGED	(1 << 21)
+#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -378,6 +380,7 @@ struct gpio_led {
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
+	unsigned	retain_state_shutdown : 1;
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
 	struct gpio_desc *gpiod;
 };
-- 
2.11.0
