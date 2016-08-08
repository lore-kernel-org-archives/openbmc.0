Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s76js2zk9zDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:21:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1470637260762899.3988393984472;
 Sun, 7 Aug 2016 23:21:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] boot/dts: Keep the LED initial state during kernel
 loading
Date: Mon,  8 Aug 2016 01:20:57 -0500
Message-Id: <20160808062057.26873-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160808062057.26873-1-openbmc-patches@stwcx.xyz>
References: <20160808062057.26873-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Aug 2016 06:21:06 -0000

From: johnhcwang <hsienchiang@gmail.com>

Base on the Barreleye HW spec, the beep LED shouldn't be
turned to OFF until BMC ready.

Now the LED will be turned to OFF when the kernel loading,
so enable the LED sub-node property "default-state" to keep the LED
initial state.

Signed-off-by: johnhcwang <hsienchiang@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 0e567e8..3146ea9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -132,12 +132,15 @@
 
 		heartbeat {
 			gpios = <&gpio 140 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
 		};
 		identify {
 			gpios = <&gpio 58 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
 		};
 		beep {
 			gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
 		};
 	};
 };
-- 
2.9.0
