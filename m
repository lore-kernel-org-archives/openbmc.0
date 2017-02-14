Return-Path: <mine260309@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMvDK3kvlzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 18:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqGt7O1m"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id x84so1089476oix.2
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 23:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pNzxC6FfOwF2xIVqjX+P8FcM007NOigC69BE4c3t/0M=;
 b=UqGt7O1mHr3SC6s4ndvoezk5tfpyrjNdMyL6sqM5ppBCGKmBrRCugN1MW/x2MyKUsx
 fOvITPUICbBTo7knMtsOJXzVOW9N6uQzU0oarhdG7f3sg7rMQeEVb07iGtzeafTeyqh4
 sfJkWSQTY6dGuPYmtqL6bCiJJb52TaUihCKK/8B4nRFsl25LGyQCWs9lK1P9KAn5XPZf
 0rcigY8slDCawiXmtjIVBIghY6CTPr2f4zOWbyd5ATaVgxFzNSlDB6hYV4r4dgiPpB7e
 C/VKFVXJVOH7Z4OqpiZgB/Y/R7feSt94a6d6YaLcFD/N4Mdoy2UBaYFO6qIB+15w6bzm
 +Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pNzxC6FfOwF2xIVqjX+P8FcM007NOigC69BE4c3t/0M=;
 b=O0u7hOYR2HDt8zjzHKtwt8YYm+uGAt3uWzjCbT7X0p5u2UfgKh8hXYifQDHNwSJzgS
 t9w0AXMl9P2KypDPkhZdu3aN4oqenyk2LBAFmv14uphiY0qhoMqO2XBXdlXT5xzw6/Y0
 X2QLDmGpwwesDQ4E7aRBfK4a0xdGAtGqwBLHua2/Fgx46qDIGuwRzn/pMY5a8g8Rh2i7
 0DvsDX+qpQWhcI0D4NnRH8S4Z0JuCmGSSsBimJRqjykPH1vwJ8zSB+4GT0cbYz56nz0m
 MtV8sLcrABIaLYI3tyXrDDgO76JgP3QjVa+2nDdD/7DcTRl68ozZWrzQmIQxuFVziw3b
 4XZw==
X-Gm-Message-State: AMke39n8oCDrup7btQekaZJ31GWl6NJPxi8xs3VLXuzlN8iqLS2N8B9YRIHmg4TQhDq0gw==
X-Received: by 10.84.171.195 with SMTP id l61mr1838806plb.84.1487057324460;
 Mon, 13 Feb 2017 23:28:44 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id s65sm18605294pgb.64.2017.02.13.23.28.42
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 13 Feb 2017 23:28:43 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-bmc-opp-romulus: Enable
 mailbox and LPC control nodes
Date: Tue, 14 Feb 2017 15:25:13 +0800
Message-Id: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Tue, 14 Feb 2017 07:28:50 -0000

Also add the reserved-memory node needed by the LPC
control driver.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index c23627e..f47eb63 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -19,6 +19,18 @@
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@94000000 {
+			no-map;
+			reg = <0x94000000 0x04000000>; /* 64M */
+		};
+	};
+
 };
 
 &fmc {
@@ -44,6 +56,16 @@
 	};
 };
 
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&mbox {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
1.9.1
