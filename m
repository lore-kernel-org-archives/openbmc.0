Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06mmLzDsf0
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=cdR7DnBa; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 153A4641137
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0fiU06DaUbU2; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AFC4E641072;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com AFC4E641072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=qYLbJvkfUt2F+OvGlYbRniOtOGPPZT1Aho64svge2ns=;
 h=From:To:Subject:Date:Message-Id;
 b=cdR7DnBa/DML1MXJHTCGVL47kaoiYDPMMhcyoumVQo7O9H/hNXKYxBF7yoMDePoMq
 P8C/O9++w8csUqTvCW6sndyy3CWiTD5HiA0eKm3fzVKd6YfqXhr7T7ISVkNZ9tIWJX
 wG8e00bTqzexFg1klPL116t6SHJpNc6bfOiApRpM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7L4IVyZTzq_D; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id F06AE6410D0;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 12/17] Fix Turismo I2C OCC mapping on Firestone
Date: Fri, 16 Sep 2016 15:35:28 -0500
Message-Id: <1474058133-27363-13-git-send-email-tpearson@raptorengineering.com>
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

The existing mapping was looking for only one CPU, and on
the wrong I2C bus.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index c6e81f4..9a56510 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -106,12 +106,29 @@
 };
 
 &i2c4 {
+	status = "okay";
+
 	// turismo
+	occ@50 {
+		compatible = "ibm,occ-i2c";
+		reg = <0x50>;
+	};
+
+	tmp423@98 {
+		compatible = "ti,tmp423";
+		reg = <0x80000098>;
+	};
 };
 
 &i2c5 {
 	status = "okay";
 
+	// turismo
+	occ@50 {
+		compatible = "ibm,occ-i2c";
+		reg = <0x50>;
+	};
+
 	tmp423@98 {
 		compatible = "ti,tmp423";
 		reg = <0x80000098>;
@@ -129,7 +146,7 @@
 };
 
 &i2c8 {
-	// FSI
+	// FSI (bit-banged interface via GPIO)
 	status = "disabled";
 };
 
-- 
1.7.9.5
