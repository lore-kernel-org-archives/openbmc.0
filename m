Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdryz3dSkzDqfh
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b2JibCXq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="S+YjUokx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 167072107B;
 Fri, 25 Aug 2017 02:36:09 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=z4LVJA
 IVU2M56RIprl/qiX+/PbTEHvDvbXK/fTx4AqQ=; b=b2JibCXq0f9tZ7p62kPrO+
 xie5bzX5u+plx3sI+Kkua0I3tP3ZmBXCCEa91GW4d/Asr8sQwfz1PPDtgwhwoEzU
 2XXk6howiGNos1DFWSRKDgKnDBNqyIcgzEUfJbyDYvQgHh7TLY9cYDa4dU2kL4Zx
 fvVWi9KlQ/VbAqCcIuVTcMk5fS196NkLMDmO2oPgnZs8y8Sq80iirEDadSQ4jn1n
 ePF19cjoqnRRa+hKuXWSH9U56XkS+PIHg4UjWBioFhjQwKLmUc1RGnGBFCy5u3dl
 OgrfIqWKkiIYeiU6+87/K5rzgOd0E54HHvSKrX1sSaHLWMnyoTbVkodJQakDw/EQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=z4LVJAIVU2M56RIprl/qiX+/PbTEHvDvbXK/fTx4A
 qQ=; b=S+YjUokxzDTMQ75eQUPC6qWqpRR6KP+GmPgZQMVkjPMkHBK0EjW9aO6G3
 NSYkBf+raYDd/p4cG30TmVlu+ZJkTSLj/oxqVn6lVMD/yP0o5tpEV6Z9mZDhftB4
 g2efCkxe9729nIkb+0maA3hq//SNXG4MhtlDWdheL3SLTHIeynvzIQfsvxJp81E6
 qdiq1UR4wfAfasAQjs+BXCDaP/+onvZO7wmMg7j0/nZeGCWPD2TMF8Yhp5qcNcgA
 0vAo2v8zFXvEniYNXZKgf/Rxull2BeR5XW4hkl+svm9I9KgNnMe9X/Qs9hFsmsDY
 sISeRZ085zBZgLpzu3yh/yvlgj2HA==
X-ME-Sender: <xms:WcWfWdiHUWmzMYEXJOXXjpbYv7sQfrc9P3lznLnbMUHaeDoH-Z-GUw>
X-Sasl-enc: HgZ/bYw+qbv0JKHpk/b/LemW+p2pK8DPAUmQWMu4L1VO 1503642968
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E86AE7F9A8;
 Fri, 25 Aug 2017 02:36:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Fri, 25 Aug 2017 16:05:03 +0930
Message-Id: <20170825063503.31577-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170825063503.31577-1-andrew@aj.id.au>
References: <20170825063503.31577-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:36:12 -0000

In some systems, such as BMCs, we want to retain the state of LEDs
across a reboot of the BMC whilst the host remains up.

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
