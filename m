Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMvGy3N7vzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 18:31:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Liv5JTDy"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id r141so3679649ita.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 23:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kv+E/hEUv1L96Ux70C7caBJBz8aXZc2GfMer7U7xgSU=;
 b=Liv5JTDyhmoLIgjDpxwRD1lHt79QzyhodyWZ2c1Dy61lZi3mdcSG7WYrmb8OwBWYgD
 o+h7xszmi0Z4bbCTH3I7ZdIZIf0pUqGP7Ko7jpkFLem/WQxY545xe4xDr5PiLCnaq8zI
 QHHtPz69jUErIrRjGyICguQZq2KLTz/ZQvKg8f/c2uLrqV/VkyZRx7LqCqg86RWuRdFM
 I2b/aBRwJk7arp/Jz0wJ1+6xLbv0T3yOSZ6hcSbLrc7Mgsgk8nIdIfVnadjGImlMingb
 8GveUHk7OPb2NCIAQPXkCusJjJ5zu7mf1uV2zPp6aqRAZXy+hyp7sMIKyDdrj99wd2RZ
 o7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kv+E/hEUv1L96Ux70C7caBJBz8aXZc2GfMer7U7xgSU=;
 b=IXXFpKmSyqkUfultKBvoeIbzdYcHvi/sX+A8xEVpy/My66A70OLbTrnvFIpVkAW3j9
 CXLymgx4elsVont0+yU3MQy4eawPXhp1lBL1ulKGZrlrEymfLuRhx9DHZnyFoK4QS4+f
 JtbtSx3Fs02QiKBBI5UTVWTGckc697S+hlMere5E3yYNB9DrnKVRpNYHmIrgchvQRk18
 WHq3SxmqdbxYFgNFtLIwIdK8jEQEm/STBz4b8msyWu4rIKWZJBbmUDLGjRVB+eDHjs/c
 OAJyPGMblEW8ogMwIPrzvRYMe7gUGvwHjVRrJE3P19w6g9hIZ2yJD1Wq3ktDzEvpGRRq
 x0ag==
X-Gm-Message-State: AMke39mjnTf/fiK/6+50p2EUOdUMh+Vk93PRQ5yezZ2oa49emt6AfHDoaL1PWBwd3BeIYw==
X-Received: by 10.99.164.18 with SMTP id c18mr31472115pgf.40.1487057464266;
 Mon, 13 Feb 2017 23:31:04 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id s3sm18702563pgn.55.2017.02.13.23.31.03
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 13 Feb 2017 23:31:03 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add fsi-master
 GPIO bindings
Date: Tue, 14 Feb 2017 15:30:09 +0800
Message-Id: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Tue, 14 Feb 2017 07:31:07 -0000

Define the pins used on Romulus by the FSI GPIO master.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index f47eb63..bc13ad9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 
 #include "aspeed-g5.dtsi"
-#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
 	model = "Romulus BMC";
@@ -31,6 +31,17 @@
 		};
 	};
 
+	fsi-master {
+		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+
+		status = "disabled";
+
+		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &fmc {
-- 
1.9.1
