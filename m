Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8RyL2W5KzDq9p
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 05:21:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463512866044323.73407492905255;
 Tue, 17 May 2016 12:21:06 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] Add motherboard eeprom located at i2c4 address 0xA8
Date: Tue, 17 May 2016 14:21:01 -0500
Message-Id: <1463512861-7156-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463512861-7156-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463512861-7156-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 19:21:14 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The motherbaord eeprom in Barreleye is accessible through i2c4
address 0xA8 (54). Adding it to the device tree since its vpd
contains the system UUID which is needed to be added to the
inventory.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index a06252a..0e567e8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -82,6 +82,11 @@
 						reg = <0x10>;
 						sense-resistor = <500>;
 					};
+					eeprom@54 {
+						compatible = "atmel,24c256";
+						reg = <0x54>;
+						pagesize = <64>;
+					};
 				};
 				i2c5: i2c-bus@180 {
 					adm1278@10 {
-- 
2.8.2
