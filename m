Return-Path: <jaghu@google.com>
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svX4j2vQ9zDsy0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ZlzJjyWN; 
 dkim-atps=neutral
Received: by mail-pf0-x229.google.com with SMTP id e6so25873398pfk.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 17:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gdb0HK5b4cX6ZDjFkmNT9PPjUqq3bRwLlqJz1i3O7AQ=;
 b=ZlzJjyWN2qpoY2Dde6ybqSUNVah05wmaqh/BGccFzidCCh8Fb+NyCtCk7lU736tH4K
 13raz1oiMxUlt84Al+JRlZTAT0cL7h+rEDXQWV1/fqcOaPvGst756yl/X/0Iej7bdHGV
 q+xjzjNckMUFXycGqKW2MpeR8JDxD6vLbPOIaZZxDPRBWJ2+IIJ0LetPORDRwkoaCBt+
 fxG5XKbiFMUuxBRZrL6IDVd9+WTovS1wGMtdMNt5wkh8CBVYVnrol9HazeQjtjGGOnyP
 8eLr65hVzx7GwpiVBc2Pjzk6bSOgpCBZMEhKkNpW1cKt8eAMLmHz0PtYAYj9St9omi2r
 VLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gdb0HK5b4cX6ZDjFkmNT9PPjUqq3bRwLlqJz1i3O7AQ=;
 b=QyWy7jS2SwICJ5z0T2Mm8aQA5GEksaXm2dFofPCwJ8vNxnQzu7bQZAd+pIHf78p6Am
 FZWF8yZe8697xzIvqLOTah06snjm9ZOAan1p2oKHLJb6/m6iptn41qgnz08cQJxX/3AH
 zwjK6Vv6WffkrLGqHwb9d3Tn7gev1oaTsP/9q4U1s0QHdULShyzBnlDNJz+V42jJ01dB
 Xmm5mzIDMF9Jjt1lpnhvil4XkhZ77QMMFiTMAEM1ZlhTsJLllDLtxMYW3IYvfygArfCM
 cOmPVM5s4DZFpeNIMe+ftvb2FtHl+FiMUJ4TKvLGyNhkw3C0LEWUGeBPAXwZfyRD3us6
 ZHgw==
X-Gm-Message-State: AA6/9RnUoHhwgrAxrYoqaJOLiHgFGX5ff3MkdoaK9AUWm/OiznAn4nlYgoVMlMI8hrzJFPOE
X-Received: by 10.98.61.202 with SMTP id x71mr5905719pfj.163.1476319347356;
 Wed, 12 Oct 2016 17:42:27 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v86sm14450239pfa.91.2016.10.12.17.42.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 17:42:26 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 3/3] devicetree : Add device tree info for POST card
 display on zaius
Date: Wed, 12 Oct 2016 17:41:45 -0700
Message-Id: <1476319305-29981-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476319305-29981-1-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 00:42:29 -0000

Add clock, data and clear signal lines to control POST card display on zaius

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../devicetree/bindings/misc/postcard-disp.txt         | 18 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts             |  8 ++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/postcard-disp.txt

diff --git a/Documentation/devicetree/bindings/misc/postcard-disp.txt b/Documentation/devicetree/bindings/misc/postcard-disp.txt
new file mode 100644
index 0000000..164449e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/postcard-disp.txt
@@ -0,0 +1,18 @@
+POST card display (two seven segment LEDs) connected to GPIO lines
+
+Required properties:
+- compatible : should be "postcard-display".
+- clk-gpios :  Should specify the GPIO pin connected to the Clock line on the POST card.
+- data-gpios : Should specify the GPIO pin connected to Data line on the POST card.
+- clear-gpios : Should specify the GPIO pin connected to Clear line on the POST card.
+
+Examples:
+
+#include <dt-bindings/gpio/gpio.h>
+
+postcard {
+	compatible = "postcard-display";
+	clk-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+	data-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+	clear-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4c4754b..d555ff1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -1,6 +1,7 @@
 /dts-v1/;

 #include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>

 / {
 	model = "Zaius BMC";
@@ -58,6 +59,13 @@
 			};
 		};
 	};
+
+	postcard {
+		compatible = "postcard-display";
+		clk-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clr-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &uart5 {
--
2.8.0.rc3.226.g39d4020
