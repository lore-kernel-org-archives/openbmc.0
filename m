Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3b5zbJzDsYY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=fctnsS+t; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 80853641143
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NnfxVVTdNkgi for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0BE81641144
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 0BE81641144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971762; bh=9R3FRDWduEET7cB8nH+4I1w3LViJWk49q+o4h2n9PSY=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=fctnsS+t6M5DRjv1GrWikCvg7Gn7OJdDj+NO5qlJbA8uyrgfbqEh3UQk0+cC4ZXWh
 Y3npb4D3fCx6RKwNxAHnXx9xU1LcmnOR7yMjWyQ1PECS+/Jh1WOQQC6JSQJbdE5oXM
 wFacbeB5eijtQBe8PBKfuKDP7LBaFp/2l5xJpnyU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id W_O_5Xk1NKri for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:01 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id D2824641143
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:01 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:36:01 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <847945394.194630.1473971761780.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 08/16] Add missing LEDs to Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add missing LEDs to Firestone DT
Thread-Index: RnvcmjXxlptveGCto+LKFSFDRx8IUQ==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:43:40 -0000


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
