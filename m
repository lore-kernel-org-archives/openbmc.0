Return-Path: <3R965XAcKB9YN6FLMJ68GG8D6.4GEGH6F3E4DAKLK.GRD23K.GJ8@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=3r965xackb9yn6flmj68gg8d6.4gegh6f3e4daklk.grd23k.gj8@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qzvcsky1"; 
 dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lzG81kNYzDqVv
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 00:42:17 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id x58so5029461qtc.1
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NPvt7sSc1zkwaIBM5xgspuUUhdwpA/3SPScemFlYhns=;
 b=Qzvcsky1PqfEko2GP+coCD6w+0USPn7xAASCWegXLRtxn81AKHAhr8qV3xwCqZXUD4
 V95pcjpSRooYbGZb/Dv6qYtnKpSrysxXB4a6uIChTo324WGNSmWxEU7SNbQKN2OOwkor
 RbF5tNztrOtPaSEqq5oXXImbXJGrPyP/nsqUo8h8wzHlry+TUqU2ck1MSAwz4N7Vp06Q
 RXh6UOJ3JfrBdTC25rTtxWIrSSalunoOGBKB1kQ+xBdbRLkkypz7NHODkTbHubsx4qif
 i0UgBxF47pdWZpGvMJnBFwanmtBKty2Oo/8gDb6XQ3wWQZt6vXsavelQ80Qe6AgwdBy6
 suDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NPvt7sSc1zkwaIBM5xgspuUUhdwpA/3SPScemFlYhns=;
 b=hT5dWcY8QxW4MPtHmTYbQGFRLRMRM3HFcm380mWuQDQNkYOxTfuYWQL4da+9ZLNC6X
 U+WtRAO1s48dBevG/Tcuq9WwIvqjSqjOtq3A4KKugy/e+jTPhJR84goe/L0N3sIMS50h
 DoX85cRbXtsDdIOnMKxc1VNxG6fa8xThvWeyzCDmoGtvTZNzOWE7qzoa50GXD3C2kDx9
 HvpHYWYz2BmckrwQdH6HWy2RufJJpBevbzdffcr5bqEZMsRZU4lD0KqGtIjdbzeZIHbH
 RT2yXajdIrwfJRZtT3+zUQYYiQhXelta/UvlNcXU798nAlpYht80My5VQF35tR3MDI+2
 bWTQ==
X-Gm-Message-State: APjAAAWeYvGdmoi6+gkube4EDCnUt8IBGEXtc9gYdYGP8HnB35xUMeH7
 sykpuxE2zEQRTIl6YBtov1AI59s0a1VJ
X-Google-Smtp-Source: APXvYqwvszUidv3wAXBWdwOlsgpiYVJO4zoHXF+iaCl5Hfqc4U5KhkHI+iX+xREBNAIUEkyX0mUA/hvxl9d4
X-Received: by 2002:a37:4a51:: with SMTP id x78mr3237123qka.287.1555684935253; 
 Fri, 19 Apr 2019 07:42:15 -0700 (PDT)
Date: Fri, 19 Apr 2019 07:42:10 -0700
Message-Id: <20190419144210.256679-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0 2/2] ARM: dts: aspeed: zaius: fixed I2C bus numbers
 for pcie slots
From: Patrick Venture <venture@google.com>
To: venture@google.com, andrew@aj.id.au, joel@jms.id.au
Cc: Robert Lippert <rlippert@google.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 19 Apr 2019 14:42:24 -0000

From: Robert Lippert <rlippert@google.com>

The change to include ibm-power9-cfam.dtsi resulted in a renumbering
of all of the I2C bus numbers behind the on-board muxes.  This breaks
some tools which have hardcoded the bus numbers.

Add device tree aliases for the I2C buses routed through the PCIe slots
so that they return to their former numbers before the cfam change.

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 51265af622574..c12f89e042efc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -7,6 +7,14 @@
 	model = "Zaius BMC";
 	compatible = "ingrasys,zaius-bmc", "aspeed,ast2500";
 
+	aliases {
+		i2c15 = &i2cpcie0;
+		i2c16 = &i2cpcie1;
+		i2c17 = &i2cpcie2;
+		i2c19 = &i2cpcie3;
+		i2c20 = &i2cpcie4;
+	};
+
 	chosen {
 		stdout-path = &uart5;
 		bootargs = "console=ttyS4,115200 earlyprintk";
@@ -223,6 +231,27 @@
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		i2cpcie0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2cpcie1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2cpcie2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+		i2ctpm: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 
 	/* MUX1 PCA9546A @71h
@@ -253,6 +282,17 @@
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		i2cpcie3: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2cpcie4: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
 	};
 
 	/* MUX1 PCA9546A @71h
-- 
2.21.0.392.gf8f6787159e-goog
