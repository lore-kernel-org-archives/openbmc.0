Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E31041A00BF
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 11:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448064624574168.08749056391048;
 Fri, 20 Nov 2015 16:10:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] device tree not compiling
Date: Fri, 20 Nov 2015 19:10:23 -0500
Message-Id: <1448064623-12049-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448064623-12049-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448064623-12049-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Nov 2015 00:10:30 -0000

From: Chris Austen <austenc@us.ibm.com>

Needed to remove the 0x and make things lower case

Signed-off-by: Chris Austen <austenc@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index b663dd8..4d1a215 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -8,7 +8,7 @@
 	ahb {
 		apb {
 			i2c: i2c@1e78a040 {
-				i2c0: i2c-bus@0x40 {
+				i2c0: i2c-bus@40 {
 					eeprom@50 {
 						compatible = "atmel,24c256";
 						reg = <0x50>;
@@ -25,7 +25,7 @@
 					};
 				};
 
-				i2c6: i2c-bus@0x1C0 {
+				i2c6: i2c-bus@1c0 {
 					nct7904@2d {
 						compatible = "nuvoton,nct7904";
 						reg = <0x2d>;
-- 
2.6.3
