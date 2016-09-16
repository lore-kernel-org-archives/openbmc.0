Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr40xV1zDsf6
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=iizwKhSc; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DBF8964113B
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zKUxjrkiOuat; Fri, 16 Sep 2016 15:35:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E8DE66404A3;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com E8DE66404A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058137; bh=e2P3Elaq51RNVhRnNaFvp/9u31zp89mW1v/duiWjmu4=;
 h=From:To:Subject:Date:Message-Id;
 b=iizwKhScfNif2C/T7SAQlsy52PSGuIkSOLKQmOd6xGiShRUnzZVIOUqwA2hyhST/R
 +zhBUBWiPJmAfivk1CL9ApJgFMenMMPB0lIsL3QiUWSzAX04XzEmtCTxmXO4D8uqGD
 U4vI2BNjN8W05+BWEosqhBpIDF5amf0FR9V3jERg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FS6S3q58a2gc; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 32054641141;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 15/17] Enable vuart in Firestone DT
Date: Fri, 16 Sep 2016 15:35:31 -0500
Message-Id: <1474058133-27363-16-git-send-email-tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:48 -0000

This allows the "startup-hacks" service to load.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 36c95a0..38f1b4b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -9,6 +9,7 @@
 	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
 
 	aliases {
+		serial0 = &vuart;
 		serial1 = &uart1;
 		serial2 = &uart2;
 		serial4 = &uart5;
@@ -209,3 +210,7 @@
 &i2c13 {
 	// i2c hub PCA9516A
 };
+
+&vuart {
+	status = "okay";
+};
-- 
1.7.9.5
