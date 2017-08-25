Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdryv0TnDzDqZ1
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kqLC+EK8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QM464gPS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8504C21479;
 Fri, 25 Aug 2017 02:36:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NcTUM4
 EhpW7ne/3uFo+obaqRQHcFXtOdywhZSzQTpRM=; b=kqLC+EK8SWqx9CgaEjsIZx
 cnqYOvU4+nGYCM9LyucVFPAtf7QmulTYF9nx06NolRdOlAcZ6X5zB/xgdn/Mo4py
 zZ8UKMQJHQ3WpxWXMrQuZ+JRBvMe1EpjkYVRGqW6UmezLPXWvchebBTH5Zrj5Dfu
 6BFNZmBqNcQry0IH1mLCw/zNowU/+4YTY4bWs/MyfZUroVcJJ1AyOH2vhUrz/w3d
 YnMqJFmevPCqqWvCEkXh4kWGBss7DArqUiWEYW038bc1w8lATXGkZqnZfQj5JFrk
 OYn62lc+uPRZlQXv5klLcS5lMJTcrxCk/5MtIj5R6sVX73ORZLqRsi4nEKCqvY7Q
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NcTUM4EhpW7ne/3uFo+obaqRQHcFXtOdywhZSzQTp
 RM=; b=QM464gPSgVo5/00yUz4RK5/AK+w4b9QhnJSH5APH9X/cQDnnqgo3tkpFG
 WsaZLJ4lDZsuk79NliwLgVtHUgXMvKj2HtTBqz62DriRKAV1LplKXopeYzH3pwZK
 +sp7mi2k32gZQBnQpV7fSai++xXeSGywGOyFQnmdpR+QOnc0K0myxf1dC7UkDwLz
 9dPDDzt17BsSoysK/8w4PelXBuebKxVsn3amgS+72BK7XITr9Wido2lI+k6RxB/k
 Y6MR8SIt/jVVR1Dw1quagVaytVUWGnBSNDsbKCTyXuvEaga8Xz716zx5fdNxRiCF
 pFG12gf9P0DyrRmzjzPVv9Hf31yuA==
X-ME-Sender: <xms:VMWfWWCZ7yHYdH-pyREz1oJXxVHBZ1UDpNE3_aqwYMwuEcRtS8jGug>
X-Sasl-enc: JzDY7hYVZZSzW2hiCXhbgCZ2kQvemiy5xwYzOJzvPEGD 1503642963
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EBBE7E1B4;
 Fri, 25 Aug 2017 02:36:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Fri, 25 Aug 2017 16:05:02 +0930
Message-Id: <20170825063503.31577-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:36:07 -0000

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
