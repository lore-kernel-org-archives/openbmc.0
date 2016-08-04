Return-Path: <xow@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s52Cr1YP8zDqTn
 for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2016 06:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OPEQNMvB; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id x72so89924075pfd.2
 for <openbmc@lists.ozlabs.org>; Thu, 04 Aug 2016 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cq2Tp4nuLjkzQMru7qNxDo9xB4HWbnHbXJKQ1J+RKBM=;
 b=OPEQNMvBovenrRz1fo5U61U/e5JkiBNv2OoE7yDM98LtBmuXKzWMgsS8DHGQvtDeuM
 /3Pg2N1pK3GO3IjSoFu0XBSBSNPx1pvaX8vyut81qQtW3i2DAvz8IVlUBPOvYdZ1Fcyf
 9TfMwj7Nx/JpqrCDI/ClCBWPh0PRZxpGRNZKDOHH5A556znlkig0cbcoDc8N6Fm7gSH9
 Idi+29Uqww+zkGx2jZgqd0NnIPji6ut+U8mgL7Lr9opQe9wZGqYN1pW0rU8AS0cGvC8U
 rjBgexYl/qTmcfWLUJSkW4oD7DaSUTTltDsGRIjKhV8wawSV/uz/EB+t9QutePRpU+4Y
 6bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq2Tp4nuLjkzQMru7qNxDo9xB4HWbnHbXJKQ1J+RKBM=;
 b=mH/ExHenvje3XYWdUhUIbmdIA5GNLZobxTOI43J1jhittS2uTUgMJEmRmLXGPvftJJ
 hy/xO5HyM6jpvDd+yWJrCG/0bOfuoAf1dya3ZVLai/YvYPe+HfxAtuC7cRc/H7IjY/Ga
 mS2mhcioyKGd8opH+xPZ5x+gCpcZ/9nKVt4sfWoiXczmLd84TE/rOlcJe99LyGCrnrWE
 6CzBx6UI/o/ZTATVb5pDj9f6LHQqKI9g2OuJ4BQnYRS6Y082xpdzKi+BSQ4QCnX9YcKv
 b6Ku1ZM/jOgrh8vc2Os0gQyXQmHmwVTka+13hBjr0WfpsmmJ3QjN72SaHXjww3uc+1t4
 HLqw==
X-Gm-Message-State: AEkoouuXB+GV4ILLqWZAmEY0bJ2//05UfBHNA/dq+hPMNGfa0d1zzbgwTMm/agfUe/pOqgjA
X-Received: by 10.98.35.145 with SMTP id q17mr129003108pfj.42.1470343877860;
 Thu, 04 Aug 2016 13:51:17 -0700 (PDT)
Received: from pewter.mtv.corp.google.com ([172.18.64.22])
 by smtp.gmail.com with ESMTPSA id c125sm22453495pfc.40.2016.08.04.13.51.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Aug 2016 13:51:17 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>,
	Xo Wang <xow@google.com>
Subject: [PATCH linux 2/2] arm/aspeed: Enable VUART driver
Date: Thu,  4 Aug 2016 13:51:03 -0700
Message-Id: <1470343863-81892-3-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1470343863-81892-1-git-send-email-xow@google.com>
References: <1470343863-81892-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2016 20:51:21 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change makes use of the new VUART device driver. We need a separate
compatible property for the VUART node, and a fix for the interrupt
definitions. We also change the SCU setup to notify host firmware that the
VUART is available.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi  | 6 +++---
 arch/arm/boot/dts/aspeed-g5.dtsi  | 6 +++---
 arch/arm/configs/aspeed_defconfig | 3 +++
 arch/arm/mach-aspeed/aspeed.c     | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index ff1eb0b..41c59ab 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -174,11 +174,11 @@
 				status = "disabled";
 			};
 
-			uart6: serial@1e787000 {
-				compatible = "ns16550a";
+			uart6: vuart@1e787000 {
+				compatible = "aspeed,vuart";
 				reg = <0x1e787000 0x1000>;
 				reg-shift = <2>;
-				interrupts = <10>;
+				interrupts = <8>;
 				clocks = <&clk_uart>;
 				no-loopback-test;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index afddbb8..6aaddfb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -191,11 +191,11 @@
 				status = "disabled";
 			};
 
-			uart6: serial@1e787000 {
-				compatible = "ns16550a";
+			uart6: vuart@1e787000 {
+				compatible = "aspeed,vuart";
 				reg = <0x1e787000 0x1000>;
 				reg-shift = <2>;
-				interrupts = <10>;
+				interrupts = <8>;
 				clocks = <&clk_uart>;
 				no-loopback-test;
 				status = "disabled";
diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
index 4d850fc..003d39d 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -94,6 +94,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_ASPEED_VUART=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_ASPEED_VUART=y
 CONFIG_HW_RANDOM=y
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index dd9b3b8..9c9f6bc 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -119,7 +119,7 @@ static void __init do_common_setup(void)
 
 	/* Setup scratch registers */
 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
-	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
+	writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
 }
 
 static void __init do_barreleye_setup(void)
-- 
2.8.0.rc3.226.g39d4020
