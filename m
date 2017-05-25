Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYKd82JBmzDqfN
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 16:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="wOZnZ2HG"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id m17so158358590pfg.3
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 23:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BHDtLP/VcQvHAHQxKkHde6nr1KtpJquSntoWTt49XXU=;
 b=wOZnZ2HGbkfqlAqiMKdeukL3/pW3E3nVonGPedqPjsT1KiyGgGFA5ekV2LSsX/Ezs3
 d1zG7/FUBEl0q3GIy5oG4yz/sFDb7CAMyli4QX5AEPT68X4nujdiZhu9SMmTG+O9HPFX
 yx3/yUwpF5UGSVqiFnPu67PzopO9rNQuUplYbJ2F6HxqDNmNpG9LhAUL1GQ3DO5cckrB
 u0nrdIr6qfe062+C5cCYHkHujLk+VEuskjF+/NBTWWp5r6NkP2zMLGbxFkLuCuFMGI2Y
 iA6DMynevGThFDLP7kqh0YQwJTUzXzE8zKzZ6o9LtNjIeOf5q2dKsMg7GkEC5O8RKr+t
 vfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BHDtLP/VcQvHAHQxKkHde6nr1KtpJquSntoWTt49XXU=;
 b=m7wEJYt15b5t7vDIN76J0I8jQwCwXR3Pl/77KJfU8nDQdXMq0CMEO81AwAVm9OwLni
 zQEtw8JU1Uvzfo5d2OpEpEQ3MozZScRqRKhnpodTtXvtUO2U/HEkCBNLOCtspVBZNcZD
 SdcMV7GQkWGuY6PQT/KBSKaX+MeMPkR/IPBSRtB3mCbuVcBht8ta84kdHalq1x78JQVC
 FHlvpvBT9QafEb+lM3TJftYLW1wg1pwleOppS8emkDLZpw1w1lWyS1VnfjjTFS+++pew
 fW5FMKeajHPZRoaNG4u896p7UZYUSpAaLBQxc14bJdl5HtaugN4O98j2ESG5etKqXsdW
 D6EA==
X-Gm-Message-State: AODbwcDUxG2ZekQiNly9pnwlS1JRVKbDEMCeQQXqlKrz/jL55RX9OLm2
 9s0LMUQNwFQio3Zg
X-Received: by 10.98.194.66 with SMTP id l63mr42794633pfg.234.1495694986224;
 Wed, 24 May 2017 23:49:46 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g63sm10995700pgc.59.2017.05.24.23.49.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 May 2017 23:49:45 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v8 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Wed, 24 May 2017 23:49:21 -0700
Message-Id: <20170525064925.16867-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.219.gdb65acc882-goog
In-Reply-To: <20170525064925.16867-1-brendanhiggins@google.com>
References: <20170525064925.16867-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 25 May 2017 06:49:48 -0000

Added device tree binding documentation for Aspeed I2C Interrupt
Controller.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
Changes for v7:
  - None
Changes for v8:
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
2.13.0.219.gdb65acc882-goog
