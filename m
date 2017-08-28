Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgXRP0WMyzDqYx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 10:18:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hvaMUUt6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Dl9h4bKa"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D10620A59;
 Sun, 27 Aug 2017 20:18:06 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 20:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=f2BkUl
 DyMX57IrbII8xjZq11RcSmikYwYAsMWtUcSYI=; b=hvaMUUt6H2ZxR59fNyXEZ6
 0ZXI2LZnlcXaVzqUHmNSbZS9udAvb7bwV5GeioeXE8/lJuOgmnhfxHAUHSX4PIgn
 u4ui41i8QHnTrx3QkrFBLTIpl7G+2zHyp1x4XJxbZ5jwGLFt/CZLq9CLrrnumhO2
 G34yrPjGky/keTLjbcpMZUD4M4kA+Tor1ug3+yKHBBqiNexjp3OBF2WBB+Zhwciu
 kqSjkQX1e2amIqUmZSvQwJ4Gdd71cCWjILhIHDoGU23otbO9WwrRZoND3WyXC0pC
 2XzpJEOuRr9Xs4r4UO5+D74wB3NIcdqKFUvGrPQBS9MsuVfzGT0QuYRGnx7kT4yw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=f2BkUlDyMX57IrbII8xjZq11RcSmikYwYAsMWtUcS
 YI=; b=Dl9h4bKa3HQsw9+q0mbrDsqM9WV7riZHouAcOOEihQuIkw6ISJ/Zc0O6N
 wnQL7p4ahI6U231raQUpHN7m5kCJa+SeFlBfcM/0kpj5DtzEX+0gt1jQqXU+2jp7
 1VWUEVGeBPn7HAuGTBeme+yEeltGGYYTwhJg3c1zowzl/IKTyaUEbO3Fdvq6mNSH
 3t36OUrXs41TzW8GlgeIHQMq576dLUj5rSfUu7utr+gYmgiTuMjfYexcxlKUL4zJ
 QH1GuUfm2lzKcl1wVWXr+fbz9eJz3u5V2xe0jbbN72FLfhjOl2fUVTfF5AsToFCh
 lXYGMFdAot52b4KyZ+kVITuNw/KMA==
X-ME-Sender: <xms:PmGjWfi8VpS3geOXYqGjWRvvAuM4MG5uUjR2b2iRuMUbrfssT5dZrw>
X-Sasl-enc: +GjhHp1iqk2VRWlwOmqnqqRtqZgPH4lkj1s8xIGc7TtB 1503879485
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C02C24A82;
 Sun, 27 Aug 2017 20:18:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Mon, 28 Aug 2017 09:47:10 +0930
Message-Id: <20170828001711.19662-2-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 28 Aug 2017 00:18:09 -0000

On Baseboard Management Controller (BMC) systems it's sometimes
necessary for a LED to retain its state across a BMC reset (which is
independent of the host system state). Add a devicetree property to
describe this behaviour. The property would typically be used in
conjunction with 'default-state = "keep"'.

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
