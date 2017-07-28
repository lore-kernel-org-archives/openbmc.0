Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvK474Z1zDrS4
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h4eQPbCC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A3mz+WyA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E3FF520FC8;
 Fri, 28 Jul 2017 12:23:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=cKe2p4
 hVqgvTaQOegnUenG8f4eYuEd2ZWymt7OiRJnw=; b=h4eQPbCCqaaAQqYlL+21pN
 7ih4sInL8hZEwJKhW1JNjP9szPTRauoi74VS1Pm5z4C7oHoDO2TUoWJL3nnIFicu
 jI0yi1jsHt47PniTwE9YuKKK7fQDItjmqGMb0VcRs+WB3OuMVwg5cNtnO0rVVxx0
 d0tj8eoV1nBhaMp11lPpkdhNOADm+6gEvdlCx2c6WOBR84wZ8QTUbRYQ/rEt4vQf
 X8czn+T7DUSjJpKEIeytE34q3olQZRjt9ewAECY448GIDruAocZop7zl3ls7a9BN
 a4aheoFbVM+UiYUKIhL70jrFpn1qzY5Ud6iYNHwOZB3R99EN5u+AMOU+yZO8Sq7A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=cKe2p4hVqgvTaQOegnUenG8f4eYuEd2ZWymt7OiRJ
 nw=; b=A3mz+WyAcqzz/0QtBK6yOrOUn/CLlGeHuixqczU3vQ6o/z6vHV53ZCUKW
 jy1ERMoUI8Ek/wAdM7/Wnm3dj42r+jKOd3gYiVZnbDPq59uEjygMxst4d/MQRygB
 EEY/6jlYrzqqW8j8edHiPhMCS0Bvn3DUuqVzxtdjkSKObu5AIkL68fymbqrNRQr0
 vKFQcFXxhTSouYGklyQRg8iv2Z2TZkr7ezmzbjMmsItTMobk/cjSIxAnaLZX/W5y
 fLhm6NsO/yDUSHgLBRMAEOApv4pvDi+vktt10k4I6MGJJNRKAgLK3xDNsWJYop8C
 OrZFaEDs0LFaBANG7RSsxTEyTIytw==
X-ME-Sender: <xms:5mR7WS8opXXq0lulc6WlbiYWglCGqVunXoh-_3zMrD8uS2zHHayBaw>
X-Sasl-enc: aBCKnDx31yhmUEANLwBYJrvj5HHZ7tNF2b+9gD4/DsQm 1501258982
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id A438A7E057;
 Fri, 28 Jul 2017 12:23:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/6] dt-bindings: max31785: Add
 mark-fan-installed property
Date: Sat, 29 Jul 2017 01:52:44 +0930
Message-Id: <20170728162249.9145-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170728162249.9145-1-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:06 -0000
X-List-Received-Date: Fri, 28 Jul 2017 16:23:06 -0000

It's a system design decision with regards to managing the default
values of registers such as FAN_CONFIG_1_2. Do not assume the hardware
is configured such as the fans are marked as installed, rather expose a
devicetree option to inform the driver of whether it should mark the
fan as installed itself.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
index 96e705434a59..f2ab18f5f503 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -31,6 +31,8 @@ Optional subnode properties:
 - fan-mode               : "rpm" or "pwm". Default value is "pwm".
 - tach-pulses            : Tachometer pulses per revolution. Valid values are
                            1, 2, 3 or 4. The default is 1.
+- mark-fan-installed     : Mark the fan as installed if the hardware doesn't
+                           already report it so
 - maxim,fan-no-fault-ramp: Do not ramp the fan to 100% PWM duty on detecting a
                            fan fault
 - maxim,fan-startup      : The number of rotations required before taking
-- 
2.11.0
