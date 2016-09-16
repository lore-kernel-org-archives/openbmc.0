Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06tzQzDsf3
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=WKfpPpGS; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 14DBB6410D0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vSSebPXYOXUu; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3DB4564113B;
 Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 3DB4564113B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058137; bh=cZb/bfv61Ne0NUTFMYBSwF46hsa+VJRUpeC2PCZhqLc=;
 h=From:To:Subject:Date:Message-Id;
 b=WKfpPpGSFMvjjj88U8rfybsalEzHCZxLX2VAIN9GPwfOCvChdgmLy4NtiK2JRT+jZ
 KV2b+Y14+DhsuyP/VDb4lTiClz90hIB+c2DoC1CfD9GEd6lk7GKi2jLmUsGa6nnmz1
 ZE18yfm+e/icgQOyOiFZjL29ZwIvVgMP9SP+581I=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SepGx0AEVIyN; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 51C4664114A;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 16/17] Add LED expander mapping to Firestone DT
Date: Fri, 16 Sep 2016 15:35:32 -0500
Message-Id: <1474058133-27363-17-git-send-email-tpearson@raptorengineering.com>
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

There is a driver in the Linux kernel for the PCA9552 but it
is not yet devicetree-enabled.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   54 ++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 38f1b4b..8b25ba7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -176,11 +176,57 @@
 	status = "okay";
 
 	leds@c0 {
-		compatible = "pca,pca9552led";
+		compatible = "nxp,pca9552";
 		reg = <0x800000c0>;
-		// led9 - led_fault_n
-		// led10 - pwr_led_n
-		// led11 - rear_id_led_n
+
+		centaur_present_0 {
+			//
+		};
+		centaur_present_1 {
+			//
+		};
+		centaur_present_2 {
+			//
+		};
+		centaur_present_3 {
+			//
+		};
+		centaur_present_4 {
+			//
+		};
+		centaur_present_5 {
+			//
+		};
+		centaur_present_6 {
+			//
+		};
+		centaur_present_7 {
+			//
+		};
+		no-connect-0 {
+			//
+		};
+		fault {
+			//
+		};
+		power {
+			//
+		};
+		identify-rear {
+			//
+		};
+		no-connect-1 {
+			//
+		};
+		power-supply-smbus-reset {
+			//
+		};
+		spi-vid-standby-reset {
+			//
+		};
+		apss-reset {
+			//
+		};
 	};
 
 	rtc@d0 {
-- 
1.7.9.5
