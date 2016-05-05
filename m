Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0ckM693QzDq5v
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:43 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:28:42 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:28:40 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 932E42BB005E
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:28:39 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451SVtl60817602
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:39 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451S7r3005392
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:07 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451S6Ar004960; Thu, 5 May 2016 11:28:06 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2AEE8A030E;
 Thu,  5 May 2016 11:27:40 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 4/6] arm/dts: Set I2C_TEN_BIT_ADDRESS in Firestone BMC board
 i2c addresses
Date: Thu,  5 May 2016 11:27:14 +1000
Message-Id: <1462411636-7225-5-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0021-0000-0000-000009738ED4
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
X-List-Received-Date: Thu, 05 May 2016 01:28:44 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 2b988e7..379b561 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -75,7 +75,7 @@
 				i2c5: i2c-bus@180 {
 					tmp423@98 {
 						compatible = "ti,tmp423";
-						reg = <0x98>;
+						reg = <0x80000098>;
 					};
 				};
 				i2c6: i2c-bus@1c0 {
@@ -98,27 +98,27 @@
 					status = "okay";
 					leds@c0 {
 						compatible = "pca,pca9552led";
-						reg = <0xc0>;
+						reg = <0x800000c0>;
 						// led9 - led_fault_n
 						// led10 - pwr_led_n
 						// led11 - rear_id_led_n
 					};
 					rtc@d0 {
 						compatible = "dallas,ds3231";
-						reg = <0xd0>;
+						reg = <0x800000d0>;
 					};
 					si5338a@e2 {
 						// SiLabs clock generator
-						reg =<0xe2>;
+						reg =<0x800000e2>;
 					};
 
 					idt@d6 {
 						// IDT 9DBV0641 clock buffer
-						reg = <0xd6>;
+						reg = <0x800000d6>;
 					};
 
 					tpm@a3 {
-						reg = <0xa3>;
+						reg = <0x800000a3>;
 					};
 				};
 				i2c12: i2c-bus@440 {
-- 
2.8.2
