Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06rLyzDsf1
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=Que10lF8; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F01BF641077
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3eoxO-ysJTU6; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B1F71641137;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com B1F71641137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=7LVzH1lNCchIIdlymeO4qFl7wzCjAI7WN6EwHSR17Fo=;
 h=From:To:Subject:Date:Message-Id;
 b=Que10lF8urQv/RnmgWaG5A32BnU4jXo9l62PxUHKOABa+Tqm3NP2u7U6LzZ9jbYH6
 Q46ZIfbU0bfR/++6HGzLYbfiltm0JRDrTAoEDFQpkrlWi4j5PebBwjVhoqTd7Wdkqb
 6pa++COEbI3XGVb2wAz+QVPKO069Y/GU2CKv0pVg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OZ5iqCynX9k2; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 0863E64113B;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 13/17] Enable I2C hub and connected devices in Firestone DT
Date: Fri, 16 Sep 2016 15:35:29 -0500
Message-Id: <1474058133-27363-14-git-send-email-tpearson@raptorengineering.com>
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

Firestone contains an I2C hub with mostly uninteresting
(i.e. manufacturing only) devices, except for the main
chassis fan controller.  Add this hub and the fan controller
to the device tree in anticipation of a Linux driver for the
fan controller.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 9a56510..053fafe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -102,7 +102,17 @@
 };
 
 &i2c3 {
+	status = "okay";
+
 	// i2c hub PCA9516A
+	// spruce / madrone PDB
+	// APSS
+	// FIR (fan / SATA backplane)
+	fanctl@52 {
+		compatible = "max,max31785";
+		reg = <0x52>;
+	};
+
 };
 
 &i2c4 {
-- 
1.7.9.5
