Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGqWb1YDFzDqm7
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 17:24:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hi/YOoVX"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 1so4231188pfi.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=0eOm4DDwAfpuxha+aH0/HjROLeXZ0H2cFzbU4NMCj2E=;
 b=hi/YOoVXBg0h7ywZH56agl69Sg4BTNdsTD9pEKq2EgIpiTdr0eygtXOIMQngAlbJpv
 +JzbZgXBMad6FmmEBnPIEdpA9sZkWcwW/AYjmCa6FoiImCGfP+4IKuEaTgw0GR/0NLI8
 XX31n6VTzGTloBOM8epHY2GHPdKiJiKwqejkKypAhNp/WsonFVQ7uyf1X+2TrxVKmuF5
 9BdYhQV/KAkp+2qYBaU2A8646l2zAFt0J7hXlKqNPnYmZ2+21H7Q8u6oKgyntIHywKIU
 BKRXLNDaGXnJ73jbiuHR8T2vNKmZlV9ThFjmdfEVGcKEcZvytNZisOF6mro/5RFcPfDF
 orgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=0eOm4DDwAfpuxha+aH0/HjROLeXZ0H2cFzbU4NMCj2E=;
 b=oeiSzZSGKQRLtUJeNSA4Yu0cyRohRO+AqqnNRO3wSc3YiUAOPJKBaFe/Ykgw2x8OC5
 m5Wp9ee8iV6PbtjI3+X1f77tAnpCQ+54zwSsMngudt6Os9Gf9HVIbSDGD33SjPVK7mpK
 sC+WpVcPhK/Pg3Hxj1zTP5OtwS4Yw+3Gq3Kg/0OE7MusL/kt9nQUf8eJT3vIShK4ZO83
 nEK5FBP6YnZOZ2KPOaULvw0RwZVg8E4bvlduckpGckR3OkSzqZWh+xLdUaq31xx2lUyg
 p3XdFgLxqpuLV7DM6DsqEO5J/Q3ZV2lQvmm7RznkGxPIpxhQdZdbJJlD4B6hzwQwRY3k
 ff0g==
X-Gm-Message-State: AIVw110RYOUKaLq0wtS2GH8h0rWnOYC3yV/si7JxfU0MxdLGq1SiePgl
 jj4sb6EgCDpT8VJ03oQ=
X-Received: by 10.84.142.133 with SMTP id 5mr4440778plx.148.1500967497261;
 Tue, 25 Jul 2017 00:24:57 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id e10sm811578pgu.16.2017.07.25.00.24.54
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 25 Jul 2017 00:24:56 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 25 Jul 2017 16:54:49 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: firestone: Fix i2c
 addresses
Date: Tue, 25 Jul 2017 16:54:47 +0930
Message-Id: <20170725072447.1947-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 25 Jul 2017 07:25:00 -0000

With the 10 bit addresses we fail to probe.

After this change, the drivers correctly probe on a Firestone system with this
kernel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - match node names to addresses
 - fix tpm address
 - add ucd, found this was present while browsing datasheet

 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 33 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 794e8fafbd3e..3d4232975b7f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -142,9 +142,9 @@
 		reg = <0x50>;
 	};
 
-	tmp423@98 {
+	tmp423@4c {
 		compatible = "ti,tmp423";
-		reg = <0x80000098>;
+		reg = <0x4c>;
 	};
 };
 
@@ -157,9 +157,9 @@
 		reg = <0x50>;
 	};
 
-	tmp423@98 {
+	tmp423@4c {
 		compatible = "ti,tmp423";
-		reg = <0x80000098>;
+		reg = <0x4c>;
 	};
 };
 
@@ -189,31 +189,36 @@
 &i2c11 {
 	status = "okay";
 
-	leds@c0 {
+	leds@60 {
 		compatible = "pca,pca9552led";
-		reg = <0x800000c0>;
+		reg = <0x60>;
 		// led9 - led_fault_n
 		// led10 - pwr_led_n
 		// led11 - rear_id_led_n
 	};
 
-	rtc@d0 {
+	rtc@68 {
 		compatible = "dallas,ds3231";
-		reg = <0x800000d0>;
+		reg = <0x68>;
 	};
 
-	si5338a@e2 {
+	si5338a@71 {
 		// SiLabs clock generator
-		reg =<0x800000e2>;
+		reg =<0x71>;
 	};
 
-	idt@d6 {
+	idt@6b {
 		// IDT 9DBV0641 clock buffer
-		reg = <0x800000d6>;
+		reg = <0x6b>;
 	};
 
-	tpm@a3 {
-		reg = <0x800000a3>;
+	tpm@57 {
+		reg = <0x57>;
+	};
+
+	ucd@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>
 	};
 };
 
-- 
2.13.3
