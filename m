Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/YAxKIn"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymJFS6k9CzDrKR
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 20:26:20 +1100 (AEDT)
Received: by mail-pl0-x244.google.com with SMTP id l16so10299129pli.6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jrvoItSqE1rh6hEPI7T/0rXkbRjYBv4s/PYqnde7o7g=;
 b=m/YAxKInBDByT+TyfLyRtWiIb8oJpDXZ1mQSzw2gpNtvcc1Xn+WE1V/ot2B8QQzneF
 FtzH/W2DCzUitOPCdC7fOAKAxBM4of+OtX7ElLW7mu7Ang3Sp7/7vQS7wl/e68uPQNSC
 6FLD7lMrSr3z4j1KMeQeKzYsae1EL5N8Z+BeGuA3Uaj3N3syBor1svDv9QnnYbzjTs98
 8KHnkyKzc2fk9/3mLoAPupsCiifcBYSrqQKuxUzyxLq3chVJ/rE4CZzTLmyz0v8NseXm
 fvbxa97PgWdscV9PmH0dbCq6PnMSCjgjx6WQZf0nzVLmkPuFazcto3CiWC2QzBNhlrX6
 TmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jrvoItSqE1rh6hEPI7T/0rXkbRjYBv4s/PYqnde7o7g=;
 b=jtRzGIokGBWq8GuJ0FrLVL22fJWnqk1llu/IuScVNL0Q0zNhBvAbe9EwLKVFpYxEvo
 Amq5TF7lUQWQvEWi2jfbn91u+YlN9e63ZipRXOKGHasmVi8Fq5aSrFcMcw5+ezrqBkoX
 TvPiY6gFcmcgx2/YEGxxmVc9hr+MVqZ29HUx999RqSfoICBtKYWc4KW/zRvNSAOabiIb
 oatR87gYbY2nro7cf66YZOaxKpi4j/89BGlpUWyNrGXdBt1LZEpgDm5ccwVGghEw6CCe
 8Yw28dzk9IRsmZoFr+kPDluxzTKoJZUi/IjW8QrPVSDXB0n/JJw5L1Nnhn9Vkl1WLI2e
 ANeQ==
X-Gm-Message-State: AJaThX6pa6ptWVtx5O5NccpQd6XfR44lpet3VQq5qA6FB8479IIPEF9V
 K3QnmscQPhHn54P1QChwZ2bPDYOV
X-Google-Smtp-Source: AGs4zMbAeb14os0Lf+/Gbu+tW4A4Z6c3x8EKgEmYgDyzOMoMvaqgh0dnXMs1SZZZOx+/JlqNqxy63A==
X-Received: by 10.159.249.1 with SMTP id bf1mr38044427plb.401.1511861178299;
 Tue, 28 Nov 2017 01:26:18 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id w21sm686828pfl.50.2017.11.28.01.26.15
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 28 Nov 2017 01:26:17 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: P8: Add checkstop gpio key
Date: Tue, 28 Nov 2017 17:25:29 +0800
Message-Id: <1511861129-13455-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Tue, 28 Nov 2017 09:26:21 -0000

The checkstop gpio key is missing in P8 systems.
Define the checkstop gpio key for Barreleye, Firestone, Garrison,
Palmetto so they can use it for checkstop monitor.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 10 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 10 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 10 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 10 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 6e70ca5..026cda5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -54,6 +54,16 @@
 			default-state = "keep";
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(P, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(P, 5)>;
+		};
+	};
 };
 
 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 93ad3ea..fb7d5f9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -43,6 +43,16 @@
 			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 0)>;
+		};
+	};
 };
 
 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 95552c8..a2906ccd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -26,6 +26,16 @@
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 0)>;
+		};
+	};
 };
 
 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index ab3fee6..8ba7d05 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -58,6 +58,16 @@
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(P, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(P, 5)>;
+		};
+	};
 };
 
 &fmc {
-- 
1.9.1
