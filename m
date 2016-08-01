Return-Path: <xow@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s3Fw36Ny1zDqWK
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 09:31:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Cq5nybZo; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id y134so59720130pfg.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yk9CJ2lFUkALaBJgzudGjL5O195RaC5aSk3008OEhuE=;
 b=Cq5nybZoG1Un4/d/g6butZ7uV43kJywy1jRnCXp5vRxRmQnyS4fOVavQr950G0FwU+
 xN0a58PeTDiH/q2zr3Lzd+cCPMa42h+QtjqeEnUy6dj0XYNTds4v1rWmlCeZ6eIz/7H4
 HBilKbYqr/lhVeUzHkOH95Ai3db3griad/O6l0HB9E+EQ8nj67p0MLV0xfHTFbgZDCf4
 L9KdTsaXaeRDD9feFYYnLY2vDrjiK+G/iYtmjKxL7YWA1Opv4cheX/ZE9xCe+fHHsnPg
 oOis3FS9CP3kljl7ST4DCzJ46WJnz38WHf7Vp17I5U+73BJbjm3G87GNlbNAHIYflpuD
 +qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yk9CJ2lFUkALaBJgzudGjL5O195RaC5aSk3008OEhuE=;
 b=bUGkZJZyvhuV9bQjYU4y5u0I4DJbiWsPjthwoz1puw9+Zz5rRK1v4vcjdK4CZdQr+C
 FPVSHIzb3hdZYfaAW5KLh/7SCCJokPCzlHgCiaNpznOwBxoJZXm2rdo/NFsq00etN8U8
 rFqpAu6+rHjQ0Noq08Nbsvp4B8kLR2UCh6lHFwH9tXCgGQHjRTpFAKFqAis2OhjNFbJg
 Km9Gu77PbzAReEqW2Or3abi3yK6W6URQa1h05E8xcTxLCFD+phEYK5epcKsHm7O4b54r
 EFLDl2ZdW+/eUhd+lXizIeDbkyDnZCo0odJZT8LE/JpFZVG6cLpGO9sY1NPnZe4QFVV+
 /UGA==
X-Gm-Message-State: AEkoouu9YABiKQ7cuFGanXXFVfv/vnpWDseV5dpcAs9BUTA9rs8/+4HedAU0xGRpAMoKny7S
X-Received: by 10.98.47.132 with SMTP id v126mr101410928pfv.152.1470094289408; 
 Mon, 01 Aug 2016 16:31:29 -0700 (PDT)
Received: from pewter.mtv.corp.google.com ([172.18.64.22])
 by smtp.gmail.com with ESMTPSA id ao6sm44727711pac.8.2016.08.01.16.31.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Aug 2016 16:31:28 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Cc: Xo Wang <xow@google.com>
Subject: [PATCH linux] ARM: dts: aspeed: Add EEPROM
Date: Mon,  1 Aug 2016 16:31:10 -0700
Message-Id: <1470094270-37885-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 23:31:32 -0000

Uncomment existing EEPROM device (U24 on EVB), move to correct bus, set
right-aligned 7-bit slave address, and add write buffer size.

Tested: hexdump -C /sys/bus/i2c/devices/3-0050/eeprom
00000000  aa aa aa aa aa aa aa aa  aa aa aa aa aa aa aa aa  |................|
*
00000200
(CONFIG_EEPROM_AT24=y)

Change-Id: I1e9df8e3aee5f0257c90e045b35e19b615615447
Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 79d2005..795dcb7 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -57,6 +57,12 @@
 
 &i2c3 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c4 {
@@ -65,11 +71,6 @@
 
 &i2c5 {
 	status = "okay";
-
-//	eeprom@50 {
-//		compatible = "atmel,24c08";
-//		reg = <0xa0>;
-//	};
 };
 
 &i2c6 {
-- 
2.8.0.rc3.226.g39d4020
