Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tIH+m6m5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KfJc7yJl"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLj14Rr0zDrKj
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 81AF620D53;
 Tue,  7 Nov 2017 02:31:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TPCKxlcFHgIkXcfhI
 3HxyDv55YceWyRnX0NFLKt2EZ4=; b=tIH+m6m5aGIGPRfulMuGDCmdoRbmoi75Y
 RjnjH615ggq21P8IABoNZJAzHC+eX/98b9tkS7ELgnlFrAQdTIpCU9WPSav84u1T
 EIVg2+pRQWwWhB2pMBgWwwL1Ap+LJhEhYy3epmAAMIPTed5FnN+wv4RaxBrgWAS1
 vi/k9kPSV7HKvhvd0EUGg1BUroXRV5aqcezHU2Uz1YVoLJAho0eS2OjaLVnhDE4M
 pFa9cW0Rg2gTy+jLRy24nyIYSCT1msOmO+0bwnrHQsA+YXVWfYhSJx/T6dy5TWef
 f7k7F1ZKK82DiVoOYE/hFGV4aefhuJsiLPePNKI4+CjhZlY4W5Dyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TPCKxlcFHgIkXcfhI3HxyDv55YceWyRnX0NFLKt2EZ4=; b=KfJc7yJl
 q8XzRIK2wbVfNUpj6lo5CPQ1dFtjtzjJ1cEBQqR1WdG4Yjw1K/0djVqydFb9vlWV
 I7thruXopxh1kaUQ62izcIXFYyYiagS5a5OeeZGe/vnoanawWydXgI+TEwNsPeXP
 HFTa3SZEfO7KKvSkzlDtf1ReUeIA2bftMpdG7zx+Tu7qulR/7wGjUnyd7r5k1QuJ
 TaFmMfknPoh/jbDQfMpLaxo8jkQVqpWL/HZb9BdyBVWocrBT6I3V56CAYLZAA/88
 038CSU8z8lRx7sGqzyjiP1xcZzw8oQuHh+yv3lplRATf9cUBiSaAIaoSXMJqtbhW
 tmrngR8XWvPM5w==
X-ME-Sender: <xms:Y2EBWs_nqe-5ltVg1klLyhuOqz454D1UyhiBN6NMoUrumM1s6LRNgg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8FC7324BCA;
 Tue,  7 Nov 2017 02:31:45 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 10/23] drivers/watchdog: Add optional ASPEED
 device tree properties
Date: Tue,  7 Nov 2017 18:00:33 +1030
Message-Id: <20171107073046.13319-11-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:50 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Describe device tree optional properties:

  * aspeed,reset-type = "cpu|soc|system|none"
     One of three different, mutually exclusive, values

	"cpu" : ARM CPU reset on signal
	"soc" : 'System on chip' reset
	"system" : Full system reset

     The value can also be set to "none" which indicates that no
     reset of any kind is to be done via this watchdog.  This assumes
     another watchdog on the chip is to take care of resets.

  * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
  * aspeed,alt-boot - Boot from alternate block on signal

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@iguana.be>
(cherry picked from commit ffbb29d62d6bcca3eff88111b58e4865506e95bf)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5e74d7b4406..2b34ce9b60b9 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -8,9 +8,41 @@ Required properties:
  - reg: physical base address of the controller and length of memory mapped
    region
 
+Optional properties:
+
+ - aspeed,reset-type = "cpu|soc|system|none"
+
+   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
+   to generate one of three different, mutually exclusive, types of resets.
+
+   Type "none" can be specified to indicate that no resets are to be done.
+   This is useful in situations where another watchdog engine on chip is
+   to perform the reset.
+
+   If 'aspeed,reset-type=' is not specfied the default is to enable system
+   reset.
+
+   Reset types:
+
+        - cpu: Reset CPU on watchdog timeout
+
+        - soc: Reset 'System on Chip' on watchdog timeout
+
+        - system: Reset system on watchdog timeout
+
+        - none: No reset is performed on timeout. Assumes another watchdog
+                engine is responsible for this.
+
+ - aspeed,external-signal: If property is present then signal is sent to
+			external reset counter (only WDT1 and WDT2). If not
+			specified no external signal is sent.
+ - aspeed,alt-boot:    If property is present then boot from alternate block.
+
 Example:
 
 	wdt1: watchdog@1e785000 {
 		compatible = "aspeed,ast2400-wdt";
 		reg = <0x1e785000 0x1c>;
+		aspeed,reset-type = "system";
+		aspeed,external-signal;
 	};
-- 
2.11.0
