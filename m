Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfD66M4bzDqbC
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:12:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rJRNrkXi"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id 21so61431245pgg.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XOCpHlfjC0Otp4kutqaghMDBWvwYp4vkYf0NrWq1D7M=;
 b=rJRNrkXi3KrVO90fbgjjSVmnBOjOTo1RBizhL7i8D+jDRUgFMDnxY11BCPvimA9ST+
 ipvKYeVV/dqAdlDFjqos/xgmNV3b5VZ7Me36TBzweAArVhBBMOUj2dB4z+1348FpJeZ5
 zTQXamW7bWW+kd1AGCpmUxiirWWUBuItgjCrEsUOdXwhQorTokq2UeT2C4ZSVpMkfuk4
 0DAvwkMT+J+imZK1vrrZ/xy0pHAwLB7VQv0aFWlR9C33h2S1jhkioz1Y7R3QlNvLstir
 pbit0t6KagzGFFqiBT9WiDyUMoGFRyg+vcPf8QBAnofNhYI6v3sGiv5S+FKpcU57g137
 ckyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XOCpHlfjC0Otp4kutqaghMDBWvwYp4vkYf0NrWq1D7M=;
 b=bok7ZV0kjNCU6rDjgKjaKT/3wU4H7Oof3nI9MUVTZM/QWUFstrTXrBua7+1CiHUO40
 qzpr8NVeO8FdqKFmko/SSnTsfS0n/+j2CZebIeMPcdxNDm24RfFvIjd19vjk2yRGWGTb
 4b05z1zJtYolIulBw1KuEkMhWwj/IBffpdClC8tfu8+q0cNJoRv1p7co+lJoo2YVjm8z
 yLAiUerDbsR8gjb8+/JZiIAZ6YHY77NIaPQeNSCZSOONqq95HYMdVv54wCB3JHwfM2m0
 +AQaGfZCz9M/5ZGwcB3/Vy+C4/asH7wE89TuxOoCqrqheLdx+ZG/d1zMHaJl/F5VX5Jn
 5ibw==
X-Gm-Message-State: AFeK/H0snw3bVnkj4lng92hOzbrd5atTzTFXGi75AtnypONWX8dK0PB4LP67sPams1KDlzP8
X-Received: by 10.98.209.25 with SMTP id z25mr29706429pfg.200.1490677973029;
 Mon, 27 Mar 2017 22:12:53 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p19sm368233pfl.15.2017.03.27.22.12.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:12:52 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Mon, 27 Mar 2017 22:12:22 -0700
Message-Id: <20170328051226.21677-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
In-Reply-To: <20170328051226.21677-1-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:12:55 -0000

Added device tree binding documentation for Aspeed I2C Interrupt
Controller.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
    what it actually does.
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
2.12.2.564.g063fe858b8-goog
