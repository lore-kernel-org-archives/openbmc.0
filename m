Return-Path: <kunyi@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t13l90TkZzDvbM
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 11:46:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MZ8QSSn/; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id e6so65243289pfk.3
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MSu2kk0KRKfv76tgFh6IgLeZ9BAc4/kCLJfLU+Je9ss=;
 b=MZ8QSSn/MrYe9POnINKKYaeKnlPjJlrNVD0hae+O8gcMz7Mlp8SF3QUlLEGNYBPya4
 2zBqSp2cQDM3/WgVgUhPJtCEqlXVytQzTAFP7Qqksm1RvP/xCr5zi/0+/maj28Ns29Pv
 7rlMHhkZDrOl7B1pPJyyoeDIJH81PJtFxlGIoeroHX32ODEHM0iiruNDvyxwL1qao7MY
 Fu9BoJimrSlFrV/8RxwoK+hutKoNI8lmnENw37+b3UNVv6arPrjCJVUvwd/Yqas5p46A
 osAa78sXeWVyG83yRm7POLSsYpjHlzycrnkNRzw3HgE6ITxqDut1F+G3C1hJ4tUupbus
 svIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MSu2kk0KRKfv76tgFh6IgLeZ9BAc4/kCLJfLU+Je9ss=;
 b=Lw8jlGUSbUtzsXZPcOVekuPiDU5ZzmLNeudaIuOhronRln7uTYs9RUe827YFCi601G
 Aa5khPKf0jqNnihG8n0aHBEPy4Em5Cf27xbPPG6ENZ5SIFwlcuDO3s2rOTKTnqMeZ/ov
 o+zKfc7DbxCAx167PRRCL5anYSeUdwNq+KYdS809SUzn89Tlkoa66KpH5JO0cV4DJ5Mu
 baO2AVSwN1Ka4qYTp2Pp5ubPYGvn2VZQPGAmRuIVgZxYhmBs318qg58OfGUkZdUuxEcQ
 WlsoF9CpWv6EbvcAIzScp83VTqt00RKYI1mk0N6Vv4wBe9A+quJF5ILC3Lfl+1xwPpX9
 lcdg==
X-Gm-Message-State: ABUngvda61bHoCKXP4FJ1UgFC+su2ONEbh4dypv1k6iTx/50gS5UM5bwZOJejPJ3PIroxudT
X-Received: by 10.99.188.1 with SMTP id q1mr5329802pge.145.1477097187284;
 Fri, 21 Oct 2016 17:46:27 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id yk6sm7682599pab.43.2016.10.21.17.46.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 17:46:26 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org
Cc: kunyi@google.com,
	brendanhiggins@google.com,
	clg@kaod.org
Subject: [RFC 2/2] spi: aspeed: documentation and device tree bindings for
 ASPEED SPI1 mode controller
Date: Fri, 21 Oct 2016 17:45:58 -0700
Message-Id: <1477097158-139095-3-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477097158-139095-1-git-send-email-kunyi@google.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
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
X-List-Received-Date: Sat, 22 Oct 2016 00:46:29 -0000

There is no accurate HW representation for the driver at the moment,
thus it is represented as a "virtual" platform device node. The driver
is placed in misc for the same reason.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/misc/aspeed-spi-mode.txt   | 29 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           | 10 ++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-spi-mode.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-spi-mode.txt b/Documentation/devicetree/bindings/misc/aspeed-spi-mode.txt
new file mode 100644
index 0000000..540b101
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-spi-mode.txt
@@ -0,0 +1,29 @@
+Device tree entry for SPI1 mode controller on AST24XX/AST25XX.
+
+This binding enables the SPI1 mode controller virtual driver that exposes
+the SPI1 interface toggle capability to userspace through sysfs interface. If
+optional argument "start_mode" is defined, it also configures the SPI mode.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells		: should be 1
+- compatible		: should be "aspeed, aspeed_spi_mode"
+- reg			: addresses and sizes of HW strap register and HW strap
+			  reset register. Should be < 0x1e6e2070 0x4 > and
+			  < 0x1e6e207c 0x4 > respectively.
+
+Optional Properties:
+- start_mode		: spi mode to override HW strap setting during probe.
+			  Can be 0(disabled) 1(master) or 3(pass-through).
+			  If not defined, HW strap or pinctrl setting is kept.
+
+Example:
+	spi_mode_ctrl: spi_mode {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "aspeed,aspeed_spi_mode";
+		start_mode = <1>;
+		status = "okay";
+		reg = < 0x1e6e2070 0x4
+			0x1e6e207c 0x4 >;
+	};
diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 33b3907..f50812a 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -18,6 +18,16 @@
 	memory {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	spi_mode_ctrl: spi_mode {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "aspeed,aspeed_spi_mode";
+		start_mode = <1>;
+		status = "okay";
+		reg = < 0x1e6e2070 0x4
+			0x1e6e207c 0x4 >;
+	};
 };
 
 &fmc {
-- 
2.8.0.rc3.226.g39d4020
