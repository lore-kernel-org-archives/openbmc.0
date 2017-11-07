Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hPjyB6lw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="do6znTCp"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhv4GZxzDrL2
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AC4C20D53;
 Tue,  7 Nov 2017 02:31:41 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YcH8TqHtaPXnPEns1
 sifzViEKR1dP5w8y4YIQASBeII=; b=hPjyB6lwE54R9anCllueqw+jT8UxNRbdR
 z7+VnuwbgAuS7UZY6R9CN8xIxbqmaAVa16ZGhUWuTkyyY6MBn+uc3ZGZsh9ZdPg2
 H9IXsIkRJ8RjubJYrq6rFb8gUxFqOjh8RhYjnUq/9zllAn/x2eoPIvenIvFqasnF
 LZXidDfVQVE7jENuQjw5znoVi7fhJfUy/lVJf0M5Px24o/O34g1UKgj8nqSe8ZbW
 en4VhFOVCWa5qi/2E4XVt3Hoz0eBYQO/5Yf5lx5xOfj3LSXDhCHDvVtCq1/D1es6
 QLnHT08HqGzBmXvxjFsRLLUJW5Ia+n5I3tvBcOkuekBwerVQQ2+JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YcH8TqHtaPXnPEns1sifzViEKR1dP5w8y4YIQASBeII=; b=do6znTCp
 mMxLG9GdrovQmLrA4Vqlw+LxijR8rW9AnzIMPfjsiMRiF8FllpBQlHbwR9CE+cTz
 D/zzPecemzsD2Vwka80V42MF4phYpZr/acWuetUpGI/eTiAzlfSEsiNpVeTDm6DE
 2emhhavl8D2d+86dQl5F+r7DKevWY8f33GLEmbWZjtvdFYuUUjDdZEeiNYIfRVAq
 /jbNQRN8Fq3zG3S1ngmkX6f0CI9rseLHf1x0vo8zc1Mc+RX7vmK3cG7RWesDqnam
 1WMDJNGqNIA43pvoFXRy/JoESBml+hNE2EKSW8SYakSlIByeOgL/v9RfcsM4v6nJ
 wjOl8KtIzIsNYQ==
X-ME-Sender: <xms:XWEBWvCrlO_D4hTXaoGgklE_Up_dssLxlUlb3s2f9HVN3c4L6WRy6A>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B494D2494B;
 Tue,  7 Nov 2017 02:31:39 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 07/23] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Tue,  7 Nov 2017 18:00:30 +1030
Message-Id: <20171107073046.13319-8-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:43 -0000

On Baseboard Management Controller (BMC) systems it's sometimes
necessary for a LED to retain its state across a BMC reset (which is
independent of the host system state). Add a devicetree property to
describe this behaviour. The property would typically be used in
conjunction with 'default-state = "keep"'.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 6fe7dcf33700a21a8e4441881fbb84384f3fe838)
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
