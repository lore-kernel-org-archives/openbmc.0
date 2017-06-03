Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfk6B161YzDqKc
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 11:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uQpS5mjw"; 
 dkim-atps=neutral
Received: by mail-pf0-x229.google.com with SMTP id n23so58884854pfb.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vdNmOc7yrEuct7dN8JVy/YUsDY7Ba8ZEUPNL+yDGj4w=;
 b=uQpS5mjw5fnkuAeSslWKcLchITxyaGZwo5PKb/GzkwCNZ+B38P43qhTwf6mdRJlALf
 Q5lzz5CBvCrtEoHwlhoLuacYKeGbAHjQm/i0vyCTerNlB2A4Fx9DYjPRLdQfYeWCyaT6
 dHPCF6NJh2ZPwua9OBfnEuv3YROWMF3qLzGR9tQE03RIkCAoiai0mpnZUxuU7miahmRZ
 Dc0yiyNrD0oEjgfTP8SGoREuyAZyPlurcap1IgWKp/UpnZETaef93fOSpMOpxl/SeCe9
 WLsP1l25BpsdbzHwBKTvLkHqCNdpj6tUQihbddlr6/vVZSnio9O11tPhL2XNgwQnRFuT
 2xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vdNmOc7yrEuct7dN8JVy/YUsDY7Ba8ZEUPNL+yDGj4w=;
 b=k5qrPPXNJdHaXHDTbABSDx+vIXjx7NWYa5iInuhQhxI+FLfDB7tZm4RZZp8XftDWK7
 GmnwP7fUr/PzZH6E9+SWxb3oKxCsAN/r+8CLCyvLDLSuDra7ENt+e5Pq3QTnl/qajLM5
 2HXzLQ/RF8Nb/vnvtcZ2hF6+Xh4ayfZZ2YTIxn5TccQstNHMW4NhuINTtWnFVSkJuF+v
 GEewQ5hs0rUCeDf3ADyzAux3aiH0qwMUwogDRrm0A8l+h/Md8WQob2nDzg7DPYOl4dqv
 teoqfEeBjd93AippTOVXfd5bfA4fkKMPLRo4EKNMmm/0Vhm9QGU9DHuSofvS5w2/cgnB
 imJQ==
X-Gm-Message-State: AODbwcD4FuBjQ/JkRmshopOj7ofk/SUwyCS5cjhcTMDWNFqKvejYsc5n
 4sBZdxexh6G0mKjy
X-Received: by 10.98.74.13 with SMTP id x13mr9654468pfa.149.1496453408134;
 Fri, 02 Jun 2017 18:30:08 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm33462651pgf.14.2017.06.02.18.30.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 18:30:07 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v10 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Fri,  2 Jun 2017 18:29:48 -0700
Message-Id: <20170603012952.2192-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
In-Reply-To: <20170603012952.2192-1-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 03 Jun 2017 01:30:10 -0000

Added device tree binding documentation for Aspeed I2C Interrupt
Controller.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
Changes for v7:
  - None
Changes for v8:
  - None
Changes for v9:
  - None
Changes for v10:
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
2.13.0.506.g27d5fe0cd-goog
