Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DI/fzboH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Peyitvx6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y0nDr2q5QzDqNm
 for <openbmc@lists.ozlabs.org>; Mon, 25 Sep 2017 11:53:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 42AE720A41;
 Sun, 24 Sep 2017 21:53:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 24 Sep 2017 21:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=rSQO59ZWDZYqi5392NZcIdn2h9swio
 fIRa8X/aGv0pM=; b=DI/fzboHpEMC8o9XM39lEt01oaenwIUZzi5f7ysn3xNTuK
 jN9IKTknE3UMlUNNZlpMn4PchssGM6tzUhcugG3RxScw3Vmtf1r30ymnHffaTYoW
 OKlSlNksDsv3mJTzK/KH1Cuy7CIX1+d8QHtmCqhkM/oppNn5gbwpXr/YSNV++roK
 zxSAktqWJWFUbqbS9H1SDgB80oDQpTZFMLl4+XlyIaDoXfTPFGrA71YoTWKW2du7
 4cuHgXgVonsTRQK6OcXZsRJmrdaUIa9PBLgTUpK34ZTcNMDq92yvfEFdrUiRjbXK
 uyLB1ztXM03lEfSOJjwwTs28YYvatC6VFgXBj8Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rSQO59
 ZWDZYqi5392NZcIdn2h9swiofIRa8X/aGv0pM=; b=Peyitvx6r41z5Z2AsVBF2n
 vP5D4rpPqeds7MJFa53oAz/E368UzXlw0KjqCiOD4bdhMvhP/wByEjAYVe5YZUEz
 R9nT8rJiXThU1upKfknhj2z/xb3h5TNtOzfnlh9+IHEzrU4mSQ0QD/BLut1nslfz
 lsJ3CDsP0LZ0wnyqhmtFCcrltQItL6Nb4HHQOkjqAkC+vMcpqExqvrxlD/4S25MS
 6a4eezf+luAuQKk8xVzNDF6Kqj7Jfdme2N2yKH5L6B0Ogr5RaMzeNxFf9fpuHFVo
 0Reu4X4DwpwScMzxWYQLgfGXttjDTEJuSRs9/n9+DcJveejcAdz8ezWzaveeUzzA
 ==
X-ME-Sender: <xms:qGHIWUWhVo0ZS1J5aTf2V09sj2xzaibJV9K8N40UK55GtWSg8p0JtA>
X-Sasl-enc: 1XmktA8cmClC1cWRutbtcvxFOCTq2SmalarNVxhS2zsH 1506304423
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29453245A8;
 Sun, 24 Sep 2017 21:53:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 mspinler@linux.vnet.ibm.com
Subject: [PATCH linux dev-4.10] leds: pca955x: Fix GPIO request for input
 setting drain instead of Hi-Z
Date: Mon, 25 Sep 2017 11:23:08 +0930
Message-Id: <20170925015308.30022-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 25 Sep 2017 01:53:51 -0000

The prior patch which fixed the problem with output inversion failed to
account for a necessary fix to requesting a pin for input, which is
affected by the open-drain nature of the hardware.

Previously pca955x_gpio_direction_input() called through
pca955x_set_value() to configure the direction, however continuing down
this route lead to a brain-haemorhaging level of necessary inversions.
Instead, remove one layer by calling directly into pca955x_led_set(),
and define PCA955X_GPIO_INPUT to paper over the rest of the confusion.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
---
I'll send this upstream shortly. LEDs seem to rebase their branch quite often,
so given the original patch is targeting 4.15 we might be able to get the two
squashed together.

 drivers/leds/leds-pca955x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 6dcd2d7cc6a4..78183f90820e 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -61,6 +61,7 @@
 #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
 #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
 
+#define PCA955X_GPIO_INPUT	LED_OFF
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
@@ -358,8 +359,11 @@ static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 static int pca955x_gpio_direction_input(struct gpio_chip *gc,
 					unsigned int offset)
 {
-	/* To use as input ensure pin is not driven */
-	return pca955x_set_value(gc, offset, 0);
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	/* To use as input ensure pin is not driven. */
+	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_INPUT);
 }
 
 static int pca955x_gpio_direction_output(struct gpio_chip *gc,
-- 
2.11.0
