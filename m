Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ye0NJHIz"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yr9xh00g0zDx69
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 03:56:07 +1100 (AEDT)
Received: by mail-it0-x243.google.com with SMTP id f143so8230805itb.0
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ai0oTsms7lhZiE3OQaYVX+Ey6NN9qE4eE0SaSzhiwiU=;
 b=Ye0NJHIzj0xRzQTHTjB+lQ99OL7mk/WLMMoAOH8j0LoaG/2Jh+rOtsQMyqOcs+9BDA
 9xkH9nl+XX/oI9XeJCwFDm0vtdPBGtO2JXRz4BQlLcY1G9NWL0LjB/MuVFauBKHyQPS6
 cDVxDw2fhMYLPsVqTSAu6E4DDO4LhBLg2pRfDcnnifV6Q2E74LNw8mr7Mkd/Ar5pdpLb
 vVogZlbRi3yjcpR+w/r7SBJjIcDGfob3iXPnk3BjM8UmMTJkIQaoIsOU+b2FmeCuiGga
 ZJGK3b2EO3ivk+w3H1INIuFhHNi96LjucIZHx023/lgyZ3X9SXvWo225bGukTH6QaZS4
 SjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ai0oTsms7lhZiE3OQaYVX+Ey6NN9qE4eE0SaSzhiwiU=;
 b=A6Jias1yVcawNwqmh8nNHXTwQUVVnX3AMBGHv7M0hU0iJmHJZSFM989vA/d1f9hsXT
 gzbSOkpt9xIiAw7YYGRwjccE9NAZ6I5Kn3KAtO7XuiubjgeYW4oPs7dU9SkE04y1iop6
 J8tDYpA+AT5SHXWGQztOQHvNqefmBG5aib3kcxIL3TPxXUxQQrWJ0SxcKmquv1vVeSoI
 LczWV8IjDVWu/UfkCp5biuKXI6ui+mM2A2C7Jyrj6mbKLqgF0+fkOSWm5DZeujty5G0V
 6vvL6l/D1inAp+3VgTsFw3X2UTJ0h9KFE0coCmScEyaLJonu/NiGs62fZcVY4y3RD0l4
 Fksw==
X-Gm-Message-State: AJaThX4MuAUoDOPYshCHQWV44UYxEu2lygXttAcuoxD60mCQiTEGEmZs
 RQ22MhzIu0id6vlY98FkeChySw==
X-Google-Smtp-Source: AGs4zMZ7Br73+iDrbgZ+x/MKAJkRkGYFSb3kK95fZrKnqk/Mp4MAAyDlwzCcZ616wxk+i+etmr34/A==
X-Received: by 10.107.129.35 with SMTP id c35mr24923915iod.258.1512406565857; 
 Mon, 04 Dec 2017 08:56:05 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id e12sm6211300iod.4.2017.12.04.08.56.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Dec 2017 08:56:05 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	yuenn@google.com
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: add aliases for i2c
 pcie
Date: Mon,  4 Dec 2017 08:56:00 -0800
Message-Id: <20171204165600.111462-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.531.g2ccb3012c9-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Dec 2017 16:56:08 -0000

Provide aliases to each i2c bus per labels added for
each PCIe slot, etc, that are downstream beyond a mux.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 115 +++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 05cfbf086c84..42b1d8007316 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -7,6 +7,25 @@
 	model = "Quanta Q71L BMC";
 	compatible = "quanta,q71l-bmc", "aspeed,ast2400";
 
+	aliases {
+		i2c14 = &i2c_pcie2;
+		i2c15 = &i2c_pcie3;
+		i2c16 = &i2c_pcie6;
+		i2c17 = &i2c_pcie7;
+		i2c18 = &i2c_pcie1;
+		i2c19 = &i2c_pcie4;
+		i2c20 = &i2c_pcie5;
+		i2c21 = &i2c_pcie8;
+		i2c22 = &i2c_pcie9;
+		i2c23 = &i2c_pcie10;
+		i2c24 = &i2c_ssd1;
+		i2c25 = &i2c_ssd2;
+		i2c26 = &i2c_psu4;
+		i2c27 = &i2c_psu1;
+		i2c28 = &i2c_psu3;
+		i2c29 = &i2c_psu2;
+	};
+
 	chosen {
 		stdout-path = &uart5;
 		bootargs = "console=ttyS4,115200 earlyprintk";
@@ -228,6 +247,30 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		i2c-mux-idle-disconnect;  /* may use mux@77 next. */
+
+		i2c_pcie2: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pcie3: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pcie6: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_pcie7: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 
 	/* 0: PCIe Slot 1,
@@ -245,6 +288,54 @@
 		#size-cells = <0>;
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;  /* may use mux@74 next. */
+
+		i2c_pcie1: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pcie4: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_pcie5: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_pcie8: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c_pcie9: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		i2c_pcie10: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		i2c_ssd1: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		i2c_ssd2: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
 	};
 };
 
@@ -283,6 +374,30 @@
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		i2c_psu4: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_psu1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_psu3: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_psu2: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 
 	/* PDB FRU */
-- 
2.15.0.417.g466bffb3ac-goog
