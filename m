Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr40vnPzDsf3
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=jpxEsITv; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6D9FE64103E
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bF3m2_v1qJxV; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4A14464114C;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 4A14464114C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=CymHhF7RSWBs+m6WwZPaDeDeSUVHdFqw2rtulE3C5WU=;
 h=From:To:Subject:Date:Message-Id;
 b=jpxEsITvo6BVe12H4OlSbou+OBppdPHwc2B7uP0pms/uuoPD8f8htKdR8YKByjB0P
 Yh8vUr0Va8Oem0mdqGvipx9UsCWA1kTH64RGZq15qhvRkh68lVkynTqz7+X4xE1Slb
 Wx2lqnN5Zo7EpCp0uUNxR7xnVs9hVN5/8uQbfh0I=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IPyE9AvOMsrB; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id DDD0E641147;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 11/17] Add missing UARTs to Firestone DT
Date: Fri, 16 Sep 2016 15:35:27 -0500
Message-Id: <1474058133-27363-12-git-send-email-tpearson@raptorengineering.com>
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

Firestone has two additional UARTs.  One is the rear panel
RS-232 serial port, and another is an internal TTL port.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 82df794..c6e81f4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -9,6 +9,8 @@
 	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
 
 	aliases {
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial4 = &uart5;
 	};
 
@@ -73,6 +75,14 @@
 	no-hw-checksum;
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
1.7.9.5
