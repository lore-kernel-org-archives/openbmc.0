Return-Path: <kitsok@yandex-team.ru>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yandex-team.ru
 (client-ip=37.9.109.47; helo=forwardcorp1o.cmail.yandex.net;
 envelope-from=kitsok@yandex-team.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="zZewSbPe"; dkim-atps=neutral
X-Greylist: delayed 549 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Nov 2018 23:00:11 AEDT
Received: from forwardcorp1o.cmail.yandex.net (forwardcorp1o.cmail.yandex.net
 [37.9.109.47])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4342Qz4HThzDqm9
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 23:00:11 +1100 (AEDT)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1o.cmail.yandex.net (Yandex) with ESMTP id 274E220F08
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 14:50:44 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 Ungnj1A83w-oi08dn2G; Tue, 27 Nov 2018 14:50:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1543319444; bh=e+Ci+ljIO/0edGfrou6F1hK/z0JOJO866E1ZOFURTaA=;
 h=From:To:Subject:Date:Message-Id;
 b=zZewSbPepY+8I3ao8hRuXvWQGhXkGApEZX5WqV7KS3zY11BRapwqXsxTlAPe57YuQ
 bMrI+A+B8a4yH94oF4H/+WDlk9pNpXbuhs9fmsuULFhfIwfGZnivgN5zYrVU7h5M73
 rmBk56njSadwspvUTXenKxX/Ek8SshYKfvYCCOeU=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: from mxbackcorp1g.mail.yandex.net ([::1])
 by mxbackcorp1g.mail.yandex.net with LMTP id aAKgKA74
 for <kitsok@yandex-team.ru>; Tue, 27 Nov 2018 14:50:25 +0300
Received: by iva8-f16495710718.qloud-c.yandex.net with HTTP;
 Tue, 27 Nov 2018 14:50:25 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-4.18] ARM: dts: aspeed: Fix gpio interrupt controller
 description
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 27 Nov 2018 14:50:30 +0300
Message-Id: <378621543319425@iva8-f16495710718.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2018 12:00:15 -0000

Missing #interrupt-cells in gpio controller DTS  description causes OF subsystem to ignore it 
as an interrupt controller, so one can't use gpio external interrupts. This patch fixes it.

Signed-off-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 2846173..55732bd 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -195,6 +195,7 @@
                                gpio-controller;
                                compatible = "aspeed,ast2400-gpio";
                                reg = <0x1e780000 0x1000>;
+                               #interrupt-cells = <2>;
                                interrupts = <20>;
                                gpio-ranges = <&pinctrl 0 0 220>;
                                clocks = <&syscon ASPEED_CLK_APB>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e4c5de3..d9eafec 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -261,6 +261,7 @@
                                gpio-controller;
                                compatible = "aspeed,ast2500-gpio";
                                reg = <0x1e780000 0x1000>;
+                               #interrupt-cells = <2>;
                                interrupts = <20>;
                                gpio-ranges = <&pinctrl 0 0 220>;
                                clocks = <&syscon ASPEED_CLK_APB>;
--
1.9.1




-- 
Best regards,
Konstantin Klubnichkin,
lead firmware engineer,
server hardware R&D group,
Yandex Moscow office.
tel: +7-903-510-33-33
