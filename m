Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHqn4tSkzDqLS
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:46:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="C0hdcyC9"; 
 dkim-atps=neutral
Received: by mail-oi0-x22c.google.com with SMTP id h4so83836513oib.3
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/Wk2WgTn92JyyprIDvaDcpuBRW/MEHYUPas+fWhy+cU=;
 b=C0hdcyC9nwVbyy4YOkCZgzYwLrrVwTywFApy/F7PNiqKnlfp44pNVMn3gZ9dHgoA5Y
 dS+eqMEVYUG0GfrOVmrVzX7qcO8CT/jSJIVlXYIBaOiCe2DtvTxUnCZsOy9vZfFJ/lWV
 MfMRj+hthaoirprNRTECOswFBdtwf2yHZgkNNBexGQ72XQ7q3NM7xnfDJuca62zZzUAw
 HWLU1OAlfcksrj4ek9RBXYUCZrEs0CHtf7C8dVvZ2D5Dr+jx2IodqjQWGH9NNqM6SGEs
 ysgoe6tPV33ZP8sGpvu3+aDRw+RjBEq9vsMF/WpcuY8svRW1Y5biUIRlRDdTUq6VUUkG
 rYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/Wk2WgTn92JyyprIDvaDcpuBRW/MEHYUPas+fWhy+cU=;
 b=AO5BeIp1MgS47TBq6G/pqBarvtooH1YUg0oUVlX6yIBkmHMShFw91bYf4SASmOcQnA
 c+qm9q9J1k7muRi/FK/tVzUC05jCy0vR63un3VHnkgUtaOHuMOqiQNZea/h3mPWaOcVu
 yBc6pNfW0F8zmL/Gdy4AF1K/0xxjsF4MBjTVLt/HvR8vRCP5zB/ju2LRKm5MjESJA9Ld
 vDJLWzf7mT+I1L+63jvD9OEBecPfhlFuz0bfq04gPWgeS9CN4CUSTqSOlZdx4IzOh8iY
 9PSy3XiWswBTIq/ryoWOUrTjGR61hUIJovUVl1EZ+lG2t0EQAnq23EOtcsw46GavSKGk
 vfPw==
X-Gm-Message-State: AODbwcBbRWjy0clDW+VBccyga0+q5kGQcVlgTx1YMCYFc1y4+MDnX/4l
 SzGTmIoNXvmQjgQ/
X-Received: by 10.84.216.30 with SMTP id m30mr6131148pli.156.1496393171680;
 Fri, 02 Jun 2017 01:46:11 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id o76sm48911007pfi.119.2017.06.02.01.46.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 01:46:11 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v9 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Fri,  2 Jun 2017 01:45:59 -0700
Message-Id: <20170602084603.30811-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
In-Reply-To: <20170602084603.30811-1-brendanhiggins@google.com>
References: <20170602084603.30811-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:46:14 -0000

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
