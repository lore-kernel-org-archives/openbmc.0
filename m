Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYKdB0vcKzDqcG
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 16:49:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CzeKL7xK"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id m17so158359383pfg.3
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 23:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=07xCGHzxVwY8KU8LipaOqXkM0AlKm9KhcDajvm+43G4=;
 b=CzeKL7xKhdysRXJNIZ1yOp/vXGfqOvjETVTycLMU48xyVvSQ/Nc4nU+103n9sys2jc
 0kcmrlAcMJ9SemedlPWpc4+X3AIkNmSDRN479VElViEaC/1WCdoveisinvsL4Gdk+5J3
 OLGA2IRQboxpwbk586zeQYYoRUUa1XNGtD3xZfTdMcDDgTldNOLpQvCimuTXgkfRnGcC
 OX49KavAeFp6iYIL7El0g8yO3mO27b9YV9ZL2ALtxi2ujggjwGE05Gg0pWdepwavoDGI
 pvlsHmzE0YPXSIU2hL9vkjDaYcckeqVHRJ7+u1J7ZXYdqu+32TKghrMAGibcLp/8fEXp
 mIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=07xCGHzxVwY8KU8LipaOqXkM0AlKm9KhcDajvm+43G4=;
 b=ODNTsbL9C/iwpizeID1M+OLgH4TO8LX0L/qaVAnIXVoZR9GN8fLRtoH66QbGHGCGKL
 XTBWqn8hdUvlFiZw+wdGK/RrEAbCM62w68vA5Yh4hgsjKvUR12o2P2lW2sj/m3JbQgFJ
 l/pYvhFcn2ofEwBlzHH1nzlPZ7Ip1Pf8aXGeiP3LNoTHqeUSTnxRCkc3UiYp6ptAAOT8
 PS2Uh2C3zmsdMGH1bXOoqtmpMiQ278SrdxAPyq9wP04WyYrXRu3JwZG0RuK9ZwLC2Fec
 f1YIBQyyN83RqW6ice6XBa+LTsCQwosjfTYrNlsawhYZXvTUiwh/z/FdFRq0tUGJjkvB
 1kEQ==
X-Gm-Message-State: AODbwcASM9WU2ExlooWj6pcb7FxswTgTkeK1VorckTz1MOKMIfLX1/1g
 KfzVmSgAWXrENh6a
X-Received: by 10.98.70.198 with SMTP id o67mr41863850pfi.79.1495694988250;
 Wed, 24 May 2017 23:49:48 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g63sm10995700pgc.59.2017.05.24.23.49.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 May 2017 23:49:47 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v8 3/5] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Wed, 24 May 2017 23:49:23 -0700
Message-Id: <20170525064925.16867-4-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 25 May 2017 06:49:50 -0000

Added device tree binding documentation for Aspeed I2C busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes for v2:
  - None
Changes for v3:
  - Removed reference to "bus" device tree param
Changes for v4:
  - None
Changes for v5:
  - None
Changes for v6:
  - Replaced the controller property with and interrupt controller, leaving only
    the busses in the I2C documentation.
Changes for v7:
  - Changed clock-frequency to bus-frequency in device tree
Changes for v8:
  - Added multi-master property to device tree
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 000000000000..bd6480b19535
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,48 @@
+Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells		: should be 0
+- reg			: address offset and range of bus
+- compatible		: should be "aspeed,ast2400-i2c-bus"
+			  or "aspeed,ast2500-i2c-bus"
+- clocks		: root clock of bus, should reference the APB
+			  clock
+- interrupts		: interrupt number
+- interrupt-parent	: interrupt controller for bus, should reference a
+			  aspeed,ast2400-i2c-ic or aspeed,ast2500-i2c-ic
+			  interrupt controller
+
+Optional Properties:
+- bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
+		  specified
+- multi-master	: states that there is another master active on this bus.
+
+Example:
+
+i2c {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x1e78a000 0x1000>;
+
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2400-i2c-ic";
+		reg = <0x0 0x40>;
+		interrupts = <12>;
+		interrupt-controller;
+	};
+
+	i2c0: i2c-bus@40 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x40 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <0>;
+		interrupt-parent = <&i2c_ic>;
+	};
+};
-- 
2.13.0.219.gdb65acc882-goog
