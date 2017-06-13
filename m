Return-Path: <venture@google.com>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnP655QlQzDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 08:08:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="t/SJCXDi"; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id l6so37607496iti.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sSbQ9olBdlC8bI0HZAvPxPY4IFiyEha4wQ8ZH+oMO2U=;
 b=t/SJCXDiv88Dyv5ITQvfdjWFm9b5IDLwNt7odRXOnKPHTmv6ZfQ1OzqUvu3aupOhfr
 4JZ9p/DEz2Y6oFdz1IIofUFjQPm81MFZWM9FetRYB/9oFS6xlCOWBgS5FThbPr3z+F87
 e/txdW7XhKvBfeRuipocWrA5IDz0a/UHLP7clxUG1Vbj+KlY5+QxWImYmV6iebfhx/NF
 KoJLiUlIkkU9eiRojZL6MIA715wZ4kD6snDjHW8hDHj6MDwBWkwlQFajd8zl+SV2/L2s
 MPNU63OuYbO8yMoqeCmR/pR8BIqgMKYvOR0OLiEx+SwJpWGrNgRG4oXnVt4q5zovT2zM
 YZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sSbQ9olBdlC8bI0HZAvPxPY4IFiyEha4wQ8ZH+oMO2U=;
 b=YcROzc7ELTChLH3b8MVZ5klKxZoKchTH0F+0xSzyg8yebgq5A/by7VtY18GDH2XOCU
 VjiJNmuFU4C+LBBGWHI248QBkRocL7taslj1RQ02nDLNyTspl99YOFo6JEKNC8q4P8wY
 odoaD7CPohl8ZxnF0CIX58KabzyFIj1dln3heFcueYlWpBoLnfjQDnrK9CtRn4K/e5Rj
 rgC3emBKWtFzb7IrDLYRxZ27zoQFYuOzMcU3xlc3l1U1dxRVEQ2m7ssg4e25lggouKBR
 o6g4d0IJkPvvFMIcqDS5Gf7SYO+Bof6ud32iOgbZ4RTw1R99vC0RTSYxLkSd+pX+c+dC
 JoZA==
X-Gm-Message-State: AKS2vOzkFFW6xiYUtI9+bqf9d5oDv+rqGEjG9i3ekqjXmSsAMjDS0WI2
 uI0+8aLncdAaBxve1MQ0OQ==
X-Received: by 10.36.65.18 with SMTP id x18mr2914808ita.88.1497391691581;
 Tue, 13 Jun 2017 15:08:11 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id 19sm6992005iom.47.2017.06.13.15.08.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 15:08:10 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 4/4] ARM: dts: aspeed: quanta-q71l: PDB FRU and
 mux on the PDB in front of the PSUs.
Date: Tue, 13 Jun 2017 15:08:08 -0700
Message-Id: <20170613220808.99895-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
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
X-List-Received-Date: Tue, 13 Jun 2017 22:08:14 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 4b5047b5d592..2b01c5bcc88b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -145,7 +145,7 @@
 	 *    SSD 1,
 	 *    SSD 2
 	 */
-	i2cswitch@77 {
+	i2c-switch@77 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -177,6 +177,24 @@
 
 &i2c7 {
 	status = "okay";
+
+	/* 0: PSU4
+	 *    PSU1
+	 *    PSU3
+	 *    PSU2
+	 */
+	i2c-switch@70 {
+		compatible = "pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	/* PDB FRU */
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
 };
 
 &i2c8 {
-- 
2.13.1.518.g3df882009-goog
