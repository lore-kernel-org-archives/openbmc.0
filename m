Return-Path: <venture@google.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnP8d4k5NzDqL5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 08:10:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L2pI1ce4"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id k93so82504281ioi.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pp9RV4MyJlqJLgTFwGVR9xO7/y08n+jjHOGmsUZsTXw=;
 b=L2pI1ce4P23HE6R83MYPIBsdRy7Hq5L2atV9ZR9Flo49A98UdDPcDdhxrK30VXO/Sx
 G02JuWbJ1eqONt+WtTidq3cdmkxHnWzPPVwCm5PeaJnpwPS/2riXef+s3WVBtxAnV8o9
 ptw8ON4KTXBSJ7DeTupFfnjd2XjOTUnDWCGB3uQ5JEuy6f2bnWKWP+eeSL/0Q6Df7/uv
 k28nz8ZtdkAh3UnJoILQMXDC/rULhTo3W2ZpkMfhaFnAuMuNDswVFv/P++I69u5/fMrw
 i18UOI2lpfuNRVWcD13pY5VX8ah0M7e8aS7BvnoxMto4qI8YZXZYZbjZLylu+nc9Nw2n
 xQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pp9RV4MyJlqJLgTFwGVR9xO7/y08n+jjHOGmsUZsTXw=;
 b=N/uNaWK/p8CAPQo2+BvAw4Cr6skQFFCv0lY5kDtVhEjORgZI+V9d9PjIh02O3i/Eub
 ff/Tu8CwsqJX0wBPoR8ZLDVEdTkR0B8yXUiVssr5rY106ZZ/a+X+UvvpCSLjMgTq1LE1
 NINPaP8HPwi2NAJEtgQdLerEHZ73sSo8QMkpnxEq2fxfkT2iJvkaT70mf07g+3v7WE0Y
 uvJ5A7pMdkyhBL+azoc5E21q/K2pW7RZ4IHebVvtnPrz6C45Ki6v/PJZVC26i7KI0YQe
 xjqFBK2ftZJzfyt5wgG8O27JmMYxuIDDJ2Mw0xFXK4vQPTk0Z6yFAkswkOqrsv6BHRS9
 LMJQ==
X-Gm-Message-State: AKS2vOwfajE2j8EDmxCMCzhoy+J9J6fj//lY+KdZyCPtCwvGy2DFM5eV
 do030sWg10Rcg/iE
X-Received: by 10.107.32.197 with SMTP id g188mr2986952iog.146.1497391823278; 
 Tue, 13 Jun 2017 15:10:23 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id 66sm2272191itj.1.2017.06.13.15.10.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 15:10:22 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: quanta-q71l: PDB FRU
 and mux on the PDB in front of the PSUs.
Date: Tue, 13 Jun 2017 15:10:19 -0700
Message-Id: <20170613221019.100175-1-venture@google.com>
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
X-List-Received-Date: Tue, 13 Jun 2017 22:10:26 -0000

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
 		compatible = "pca9548";
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
