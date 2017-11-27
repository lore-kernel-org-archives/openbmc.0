Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PdB+yPTe"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylyP6352xzDqn6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 07:01:46 +1100 (AEDT)
Received: by mail-it0-x244.google.com with SMTP id m191so22873290itg.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ai0oTsms7lhZiE3OQaYVX+Ey6NN9qE4eE0SaSzhiwiU=;
 b=PdB+yPTe/b66N8KJ2ZRic4BouMTTULQmkA/bZs0wwoRs7eriQpcVxlEKe1ggK9UJ7o
 EtKaH/06wUNK6jQbJzJyvzLhKZAVXcKkzZQ88VUhXfFmmins/JgsRhpjSK1zNEktB3Rf
 wKuaGeG1XggJtJH1B6SnFwepAEhJBkk+2dvey0kGPKpdqxvoYXAc9o7jfwehYgnDkNDg
 wW5pP4Vq2nx8VMHZOFEmChkAgB4ulXp6Eu+D93DIN8XbKRiiWAWdUt1k1PGZtggnkhWe
 FS5OWr13z1Wu6+99Gs1tUkZ+p6Ignff9Zqjtp46/GbjeR7TX0Z5ZmjQh98Je754h9067
 Gwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ai0oTsms7lhZiE3OQaYVX+Ey6NN9qE4eE0SaSzhiwiU=;
 b=WRKZcdS6riA+WqyJ/ZlX3FBo09jbaabbrESdWvqeFIq6YOVE/qi3t6avDn5VZZbnbl
 1VwSVd21Cr8/jtNIndZ6cgUCzCKfPQwrvQ7JesoZm31T8HumT5AadrlpXYhid4+5tCsG
 U84T/4qBaMIROd1NKD/W2OyX1NAKYoVgDhAMNQpzoq6Y9zVVelU8dQEhtPnfndzTENIZ
 +dBfh056WLHObj68v8sXXBv++NYEvfUYD/USo3lGZUooTSZSh63DPOsLfwBgx9TZNMVS
 NZh7nte/QhspeHXHbuIPRk4PB52xSBlB66aLIrayZZfF9ymaZ/Jx5z5nBGGRCEI2xhZ/
 dP/w==
X-Gm-Message-State: AJaThX55K3/+rTzg4V7NL5VfnsWE6f9lZ6dmhHIj+mr8rvvuTSHrFixl
 qDt5tm4H+uSud+PKPNwtulQWaA==
X-Google-Smtp-Source: AGs4zMb3WD/JeyNY5rD1OAInsGb0Z9jHiXADxFmhbmjSBssDy2UFZ3PJcD+MaJK+mz56sjjbfh/6/g==
X-Received: by 10.36.130.131 with SMTP id t125mr30347061itd.104.1511812904137; 
 Mon, 27 Nov 2017 12:01:44 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id f11sm2366498iob.52.2017.11.27.12.01.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Nov 2017 12:01:43 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	yuenn@google.com
Subject: [PATCH linux] ARM: dts: aspeed: quanta: add aliases for i2c pcie
Date: Mon, 27 Nov 2017 12:01:40 -0800
Message-Id: <20171127200140.186551-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.417.g466bffb3ac-goog
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
X-List-Received-Date: Mon, 27 Nov 2017 20:01:47 -0000

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
