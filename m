Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBZNH6XRfzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 04:18:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AOANccWl"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id 194so16033160pfv.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/d+n1gLkMUPKcYH1s8pf18pxcaRyGd8fnZGFlCK+K9c=;
 b=AOANccWlEz5AorpY5HYiH42fOiGB191Ddfr+paOwJ/5YsPwRRkEf/hekcEC5pn6r4h
 syVJdWqcKk8ut94Il/C4iiXRnprHVANBu/e1cnog9YGVXycPkvIQg6wVgG67RT8G07p+
 IMfMQpLStV8ODI+BvPWjuZNkfe5THILG8KzqOYRqMSzL7whuaR7KwZK5DProvksEpFOl
 PI/3nRkAvNQsLeir3JS+xweeoYGJBzF7LvN6ZsUbLrZ0y+Mt71oN7r5vnCovSsc1SP2g
 D4qCI59iAuHsQ4gm9lOiCsLW2MhAcodp0T/Awf+ojYGwTp4kymatLQBF0S9fn3Uy4qS7
 PIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/d+n1gLkMUPKcYH1s8pf18pxcaRyGd8fnZGFlCK+K9c=;
 b=pp4qtT/+ekuiBtTpQ5cezBCswl7BEzhE3ICF1+axBG/sLdPuBaisutw/QmGnKIalsa
 /OQIDqaBptY/crSevxNvanbq9Yw1ND2zKO84ek3krTSvDnOoNr7guTYmxGgoxUjOAx5V
 ocrs7HwjoKBGAnfYmHf1jlE4d+IzHR8NWEX/G6ROCvnNN3DSbcMgaJx7Y2o+oSsDhNJt
 WFIunQYQLI57D0mcqg7DppUIuLktrPr3jAyuTFNVtVQqOnZxI2TP50bBwXGAI8X6i9Wx
 IynYDly6GWS4nLOOR0yXTPXwZuFS1gQpIA0HUwxsDVoTg8p+8fVcgaHGPexvwrcfkJz3
 t+9w==
X-Gm-Message-State: AN3rC/4Rir6kiuAGf7CbJ1mGqr3UDSVJbGp2rD2GUEorqfiq2UH+wuir
 1HI89C78/zgElj+J
X-Received: by 10.98.202.80 with SMTP id n77mr26756060pfg.158.1493057917842;
 Mon, 24 Apr 2017 11:18:37 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm32220630pgc.1.2017.04.24.11.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Apr 2017 11:18:37 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Mon, 24 Apr 2017 11:18:14 -0700
Message-Id: <20170424181818.2754-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.816.g2cccc81164-goog
In-Reply-To: <20170424181818.2754-1-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 18:18:40 -0000

Added device tree binding documentation for Aspeed I2C Interrupt
Controller.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
Changes for v7:
  - None
---
 .../interrupt-controller/aspeed,ast2400-i2c-ic.txt | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
new file mode 100644
index 000000000000..033cc82e5684
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
@@ -0,0 +1,25 @@
+Device tree configuration for the I2C Interrupt Controller on the AST24XX and
+AST25XX SoCs.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells 		: should be 1
+- #interrupt-cells 	: should be 1
+- compatible 		: should be "aspeed,ast2400-i2c-ic"
+			  or "aspeed,ast2500-i2c-ic"
+- reg			: address start and range of controller
+- interrupts		: interrupt number
+- interrupt-controller	: denotes that the controller receives and fires
+			  new interrupts for child busses
+
+Example:
+
+i2c_ic: interrupt-controller@0 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	#interrupt-cells = <1>;
+	compatible = "aspeed,ast2400-i2c-ic";
+	reg = <0x0 0x40>;
+	interrupts = <12>;
+	interrupt-controller;
+};
-- 
2.12.2.816.g2cccc81164-goog
