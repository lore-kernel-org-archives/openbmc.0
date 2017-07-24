Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGKtj0pvvzDrK4
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MplxPin7"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id v190so11575940pgv.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=9TlbUX+bDjsLtmSC+4VPoWT1xo5BgQdhWEE37Z5Kl9s=;
 b=MplxPin7ZZKiSE/SzmuGGpMibQ/zKJnR/yKgkP+1/xXijcw3mbCZDiw1EHCpjyv8bg
 E+8TRCcjI2L+zCqMZlBYvaxbq9RMrXRPRYWn0lN/svh8/6h0Wt9aoLgXhRN3WfZAqqZ7
 AnQMDXShqs4xZEXoUpxZm1tcTZLOujn/z8s3cLy0Kxuv263AwThzrbJw7Juhg3swCvaO
 pcM1v1/DUfBCihisJzzrl1QH4RXzpS01umz4CgMoefO6dLsiAIhl7IrMtf0IswP0+84T
 iBslVPOvBa4jkQEiR2256jmAkr/zWgSKZUbZ+Q6mv/8tl/8bB+CulcL5+BJxp/bmJ435
 vK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=9TlbUX+bDjsLtmSC+4VPoWT1xo5BgQdhWEE37Z5Kl9s=;
 b=P2+JBlwPKLJc8k2yA183MpLh/V8Ow70YDsBXVrXp5WR14ooKzWG5QgKV/e6fPVU6aI
 tDNFQRRPz9rjPyV5ceibVrmY3lFP+l9b7LfzoVsEDxRwlWW/Wuf36NWTwGDQbUTSzn79
 CIA7uAveYiTnFdpR4DubP4uSzx8bd9gfJE4/aQRrGLUtJZbsHCPrPG2Ub5zoJeGRI6k8
 T/SZ/bkt0utKpdTR3IW6H2UvxLj6StWqE8nPeb1myhoOTlpmH7qsuhbzLLrUR6/jSxEZ
 +yfKnZrN3hrrStLPgoDcmqJfyEOa6nTsByRM1Sk/Jy7zk+Ydi9adQ+cQwQMOCcaulmcn
 ht0w==
X-Gm-Message-State: AIVw112Qol7jZtJdMukME2sONu0ul66wVwpm3AO5ncG2Sgj63gHJ1QEI
 LX+ghTGb/gkE7/8q7B8=
X-Received: by 10.98.160.146 with SMTP id p18mr16045470pfl.322.1500898185626; 
 Mon, 24 Jul 2017 05:09:45 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id s3sm20725269pgn.70.2017.07.24.05.09.42
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 24 Jul 2017 05:09:44 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 24 Jul 2017 21:39:38 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: firestone: Fix i2c
 addresses
Date: Mon, 24 Jul 2017 21:39:34 +0930
Message-Id: <20170724120935.1862-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.3
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
X-List-Received-Date: Mon, 24 Jul 2017 12:09:50 -0000

With the 10 bit addresses we fail to probe.

After this change, the drivers correctly probe on a Firestone system with this
kernel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index fef73ea7fd0c..cc479efd1763 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -124,7 +124,7 @@
 
 	tmp423@98 {
 		compatible = "ti,tmp423";
-		reg = <0x80000098>;
+		reg = <0x4c>;
 	};
 };
 
@@ -139,7 +139,7 @@
 
 	tmp423@98 {
 		compatible = "ti,tmp423";
-		reg = <0x80000098>;
+		reg = <0x4c>;
 	};
 };
 
@@ -171,7 +171,7 @@
 
 	leds@c0 {
 		compatible = "pca,pca9552led";
-		reg = <0x800000c0>;
+		reg = <0x60>;
 		// led9 - led_fault_n
 		// led10 - pwr_led_n
 		// led11 - rear_id_led_n
@@ -179,21 +179,21 @@
 
 	rtc@d0 {
 		compatible = "dallas,ds3231";
-		reg = <0x800000d0>;
+		reg = <0x68>;
 	};
 
 	si5338a@e2 {
 		// SiLabs clock generator
-		reg =<0x800000e2>;
+		reg =<0x71>;
 	};
 
 	idt@d6 {
 		// IDT 9DBV0641 clock buffer
-		reg = <0x800000d6>;
+		reg = <0x6b>;
 	};
 
 	tpm@a3 {
-		reg = <0x800000a3>;
+		reg = <0x51>;
 	};
 };
 
-- 
2.13.3
