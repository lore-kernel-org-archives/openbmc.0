Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BE1BC1A00AF
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 08:30:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453152628864875.0890928972908;
 Mon, 18 Jan 2016 13:30:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Add HDD backplane and SAS expander VPD to device tree
Date: Mon, 18 Jan 2016 15:30:27 -0600
Message-Id: <1453152627-13304-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453152627-13304-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453152627-13304-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 18 Jan 2016 21:30:36 -0000

From: Norman James <njames@us.ibm.com>

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 38a4fd0..27a503f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -35,6 +35,16 @@
 						compatible = "nuvoton,nct7904";
 						reg = <0x2e>;
 					};
+					eeprom@51 {
+						compatible = "atmel,24c256";
+						reg = <0x51>;
+						pagesize = <64>;
+					};
+					eeprom@55 {
+						compatible = "atmel,24c256";
+						reg = <0x55>;
+						pagesize = <64>;
+					};
 				};
 			};
 		};
-- 
2.6.4
