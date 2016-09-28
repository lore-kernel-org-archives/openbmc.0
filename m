Return-Path: <prvs=90796fa14b=mattconolly@fb.com>
X-Greylist: delayed 2956 seconds by postgrey-1.36 at bilbo;
 Thu, 29 Sep 2016 07:34:20 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=htviusY+; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skrZ43s19zDrZr
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 07:34:19 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.17/8.16.0.17) with SMTP id u8SKiEgJ031868
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 13:44:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=from : to : cc : subject :
 date : message-id : mime-version : content-type; s=facebook;
 bh=KFkavjbSHBrLkHOdidabFsSbM5fCKb7ni1/zcMMjUro=;
 b=htviusY+C2rXDOR62fJimh0AAba0wAXbPP6dSiWUL1f4OrV/Xnz3A/UAjOCCPvEbfrPJ
 NWoGnGScriAPlVeg5fit5AdxVB1XzFzV29KHABupqRHrJKhyPg6/HxgJFrMhe2M1ilG4
 LKk28cWZVtEsPCt7C80sdNrtsfV9e0Q1b+s= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 25qjw9rqbj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 13:44:59 -0700
Received: from mx-out.facebook.com (192.168.52.123) by
 PRN-CHUB01.TheFacebook.com (192.168.16.11) with Microsoft SMTP Server (TLS)
 id 14.3.294.0; Wed, 28 Sep 2016 13:44:58 -0700
Received: from facebook.com (2401:db00:11:d0a6:face:0:31:0)	by
 mx-out.facebook.com (10.223.100.99) with ESMTP	id
 6a96a0ac85bc11e6b12a24be05956610-816f4a50 for <openbmc@lists.ozlabs.org>;
 Wed, 28 Sep 2016 13:44:57 -0700
Received: by devbig297.prn1.facebook.com (Postfix, from userid 9402)	id
 922BF58C518D; Wed, 28 Sep 2016 13:44:56 -0700 (PDT)
From: Matthew Conolly <mattconolly@fb.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH] arm/dts: Add i2c devices to facebook cmm bmc board
Date: Wed, 28 Sep 2016 13:44:51 -0700
Message-ID: <20160928204451.959347-1-mattconolly@fb.com>
X-Mailer: git-send-email 2.9.3
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_12:, , signatures=0
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
X-List-Received-Date: Wed, 28 Sep 2016 21:34:21 -0000

Adds i2c devices to the facebook cmm board.
  3x pca9548 i2c muxes
  3x 24c02 eeproms
  1x 24c64 eeprom
  2x lm75 temperature sensors
  1x adm1278 hot swap & temp controller
  1x pca9534 I/O expander
  1x slb9645 TPM module

Signed-off-by: Matthew Conolly <mattconolly@fb.com>
---
This should apply to the openbmc dev-4.7 linux kernel branch

 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 1b3bb22..e6d61c3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -49,14 +49,34 @@
 
 &i2c1 {
 	status = "okay";
+
+	i2cswitch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+
+		/* To connect to SCM_LC & SCM_FC */
+	};
 };
 
 &i2c2 {
 	status = "okay";
+	/* PCA9510AD buffer to connect PDU */
 };
 
 &i2c3 {
 	status = "okay";
+
+	lm75@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	lm75@49 {
+		compatible = "national,lm75";
+		reg = <0x49>;
+	};
 };
 
 &i2c4 {
@@ -65,18 +85,97 @@
 
 &i2c5 {
 	status = "okay";
+
+	adm1278@10 {
+		compatible = "adi,adm1278";
+		reg = <0x10>;
+	};
 };
 
 &i2c6 {
 	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <16>;
+	};
+
+	pca9534@27 {
+		compatible = "nxp,pca9534";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <1>;
+	};
+
 };
 
 &i2c7 {
 	status = "okay";
+
+	i2cswitch@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			seeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+				pagesize = <16>;
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			seeprom@51 {
+				compatible = "atmel,24c02";
+				reg = <0x51>;
+				pagesize = <16>;
+			};
+		};
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			seeprom@52 {
+				compatible = "atmel,24c02";
+				reg = <0x52>;
+				pagesize = <16>;
+			};
+		};
+
+		i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			clock-frequency = <400000>;
+			tpm@20 {
+				compatible = "infineon,slb9645tt";
+				reg = <0x20>;
+			};
+
+		};
+	};
 };
 
 &i2c8 {
 	status = "okay";
+
+	i2cswitch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+
+		/* To connect to Fan board */
+	};
 };
 
 &i2c9 {
@@ -97,4 +196,5 @@
 
 &i2c13 {
 	status = "okay";
+	/* CPLD at reg = <3E> */
 };
-- 
2.9.3
