Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr108pszDsf5
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=rmyjQcx1; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5973F641072
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nk8XRomext5b; Fri, 16 Sep 2016 15:35:38 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4CEB364103E;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 4CEB364103E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058136; bh=SYGuUzxcboaW2cXfus8269rI++0d0kUribxClhfG+qo=;
 h=From:To:Subject:Date:Message-Id;
 b=rmyjQcx1GZkpPXZYL1QW9EUvR4RbQswY1iQhtETCKT8fn7MXuLkeLhu7cQjNWUIf6
 coz2NOdpi9MwnquE+ONZ99FWZ3WRzo3eg3rViKskw/qeMH6gARjf3MCdoLL0U8NCSp
 GDyn1RTY14HlVlsDvO3B+xXJSCseIj78d8WhYBq8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X_jjLtbBqLBy; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 98A74641072;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 10/17] Add missing console UART to Firestone DT
Date: Fri, 16 Sep 2016 15:35:26 -0500
Message-Id: <1474058133-27363-11-git-send-email-tpearson@raptorengineering.com>
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

This is required for the BMC serial console to function.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 4f04e76..82df794 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -73,6 +73,10 @@
 	no-hw-checksum;
 };
 
+&uart5 {
+	status = "okay";
+};
+
 &i2c0 {
 	// grounded
 	status = "disabled";
-- 
1.7.9.5
