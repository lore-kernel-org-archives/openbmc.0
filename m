Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZqxh4jNhzDsYX
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=dPMYVY4V; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4C7DC641151
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0CnUy7Ca2HIJ for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:29 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D85E2641152
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:29 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com D85E2641152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971909; bh=yatlsC5DplblJGmC7E7W8ryvb0ZEomuE7wJguPE50Bg=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=dPMYVY4VW78Du4khhXAooBCITIc/RkuTvjuBNoN9cW5vyUHantlbM1llhUTUUpZ8X
 bZ7A25ETDvpmqGFT/LtFpSMSymfwY/lNF36S+SJxDw0O2tAcPO4M3SWfUqVnitCs5/
 SQ5pRfdgnQUgOPXijpbguDeQwMC/SgVQEe3bpNZg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l-ZOeXklX95n for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:29 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id ACC46641151
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:29 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:38:29 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <2026816150.194639.1473971909614.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 15/16] Add LED expander mapping to Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add LED expander mapping to Firestone DT
Thread-Index: 4j5jviGxYETrZtGVsF21+3QbI3phNg==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:38:33 -0000


---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   54 ++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 90931fd..3b13cfd 100644
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
