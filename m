Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsM32Kf1zDrK0
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tyAiSrxh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qgrzpAo+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C2AA20EA7;
 Fri, 25 Aug 2017 02:53:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NcTUM4
 EhpW7ne/3uFo+obaqRQHcFXtOdywhZSzQTpRM=; b=tyAiSrxhggMPrYYkJ/2vJi
 PQboDWDWytqi8q9BrCeQPRTdZEzlPE3MTx1liDQqWNL+1HRcXWk9JHeURZcTk0Ve
 sgVjycg0lDGg/fAFjp/qLSLy2qPac1BA1v4BiQAWTJpShdx9F5//emDUxFrypj+5
 JYoddXf+3YGZi5YQEcb4bu1F0Y/Q18MjSpIxzF+Sap3dNm8H9LaT59m4UDLo5Zsy
 pAAHkQdNwRG0fVDYyyWQn/8WMRL0ma55mp0OuEWAL5h+5nGqKfTag/TlBMYFgVve
 75uZKs+Hx7jH6uWI2auiIm50wKq6dcb/B1sWALgXj6KNepmlQRB2YFvOEMJuXC9w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NcTUM4EhpW7ne/3uFo+obaqRQHcFXtOdywhZSzQTp
 RM=; b=qgrzpAo+G5UHIdSkkdkBnPGN5SsqAc+8g/HPAT0noT1YBXUksm6rfS1Ry
 kkrDRHYywm2c2LyuLdXJzvFDC5aRpWhoakKo3yfn4kjeb4EECxuYvXzROId4lB2a
 SO5X5DE6JuG47J/084+kg55Oz8elD2suLll98tPTkxMW7THeR2i//j/7KpPcYb6m
 a60ICIpbWNef9NlJHDL85Q8ZVEFQJjW0YXFAl+qMIoHC9cw8eAZLS7/z6a8un3c4
 rdxFrOZOBjNRyi9oJamta4pe0b6F66cf5ziWPQpYbJJSvIrcPjkyJLf17TD/NLlS
 XXwmYVYmnSWuc+6cTJ6d5MMi5Xm6w==
X-ME-Sender: <xms:bMmfWbYpbezGlQ9frD_r-LY7xa1aVX41gkWw8lfGygKwxtEABac8lw>
X-Sasl-enc: f47w9uI56yTRxt+mr2ecGHUFJf1paoloGd7yJ6rnhH64 1503644012
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9FB0240B1;
 Fri, 25 Aug 2017 02:53:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/5] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Fri, 25 Aug 2017 16:22:40 +0930
Message-Id: <20170825065244.488-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:35 -0000

On BMC systems it's sometimes necessary for a LED to retain its state
across a BMC reset (which is independent of the host system state). Add
a devicetree property to describe this behaviour. The property would
typically be used in conjunction with 'default-state = "keep"'.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index 76535ca37120..a48dda268f81 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -18,6 +18,9 @@ LED sub-node properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - retain-state-suspended: (optional) The suspend state can be retained.Such
   as charge-led gpio.
+- retain-state-shutdown: (optional) Retain the state of the LED on shutdown.
+  Useful in BMC systems, for example when the BMC is rebooted while the host
+  remains up.
 - panic-indicator : (optional)
   see Documentation/devicetree/bindings/leds/common.txt
 
-- 
2.11.0
