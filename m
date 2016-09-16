Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06S06zDsds
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=PgWjs5L7; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 768B964114D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DFuRAWQlMyDv; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 211F5641148;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 211F5641148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=DO1T8baYSwHSgSx5i+IY4aVoFaaN2xv5lmitEzS5Tsk=;
 h=From:To:Subject:Date:Message-Id;
 b=PgWjs5L7N+EP+X23fw1oNj7GX7tJS+3LgWLLAKJzihLRuz6vJ/K6ReD4CVg4Ao3Vq
 6NAA6cjHzeSU6g/aKEI9lGUUbQLaRtkB1ST8QqXqvZwiq5JNXcTNMjOXQae2UD8u3t
 boNWVs8xU5WMSTvZjPe/JNDaqcVXC0u55q+NCaFY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3mGavHhPhJ9T; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 5C4CC64103E;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 09/17] Add missing LEDs to Firestone DT
Date: Fri, 16 Sep 2016 15:35:25 -0500
Message-Id: <1474058133-27363-10-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:45 -0000

Enable the front panel LEDs controlled directly by BMC GPIOs.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index ae1a633..4f04e76 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -2,6 +2,8 @@
 
 #include "aspeed-g4.dtsi"
 
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
 / {
 	model = "Firestone BMC";
 	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
@@ -19,6 +21,22 @@
 		reg = < 0x40000000 0x10000000 >;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	ahb {
 		fmc@1e620000 {
 			reg = < 0x1e620000 0x94
-- 
1.7.9.5
