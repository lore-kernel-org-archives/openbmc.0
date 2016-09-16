Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06fqlzDsdw
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=j1CWuqwD; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EBB54641054
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SHx5X44CG25n; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 32D5B6410D0;
 Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 32D5B6410D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058137; bh=IuxN/Qi9zeAKkcuxnfDhrvtk7D3BT23M+3aye3qO1RU=;
 h=From:To:Subject:Date:Message-Id;
 b=j1CWuqwDwihtxjQs1cG2S16zduNmpSUMez8W6yyPbCEAnuiwHP+xDYl37hmaiWPFZ
 dmkJG5n+yG6orF1p8olNj+Z7HIVey9oyMLDgyRQtLhHGRavyzcYsKtkEvgqpf/Viv7
 NYwEX48ruexznSJRKGBcs0JqGyavaWWE25jl3dHM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fYSDY_2A6iZb; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 9148B641150;
 Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 17/17] Enable FSI buffer on Firestone
Date: Fri, 16 Sep 2016 15:35:33 -0500
Message-Id: <1474058133-27363-18-git-send-email-tpearson@raptorengineering.com>
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

Firestone contains a buffer in the FSI path that can be disabled.
Ensure that this buffer is enabled to allow boot.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 8b25ba7..65e9549 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -257,6 +257,15 @@
 	// i2c hub PCA9516A
 };
 
+&gpio {
+	cp0_fsi0_data_en {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "cp0_fsi0_data_en";
+	};
+};
+
 &vuart {
 	status = "okay";
 };
-- 
1.7.9.5
