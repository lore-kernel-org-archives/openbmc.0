Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBSqT15jLzDrFd
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 15:08:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KFReivFB"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id v190so1394505pgv.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 22:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7Ctgi3NMUJzjM7LAqT+8tEPBX1CcaQcJOxdUhr/aUYo=;
 b=KFReivFBgWPwpMtbxjUS6pkr2b4fzv88K3urO9sEluikGAlNGeihR5WYL19RhJpGUh
 LCiA4GqPHlDS48QigvGu3Qm1NNPtdMwFmMjMTKD3btIMTDmqhBt/szGB6nulR24Fn0qW
 VTnpqqdg85jl3014Lme/yVyt09j9YhKXMwgAtym+1aDnx+9H9SgYsILC5PSwSD17Ihfh
 8rXMm38LXHh4PaBhvCvW+AIxEUPcfIWj/zCszUPkwBuCmUlFXDp+S496saykoGzhGbeM
 KKOwipJqmI6TiVFK5XY7IU8HnkBcyvAAKWnxvOEA9sPKAVRSbaITnFJCughmeALDFyvi
 ci2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7Ctgi3NMUJzjM7LAqT+8tEPBX1CcaQcJOxdUhr/aUYo=;
 b=ZXPT5TbdjzXBwjJh1N//cAM8/Kd359N4xNWz1zdG337GwsvyJYAiiPvYSm1Tg89WpL
 4B+kC0DsjLtaR0FcQ5BtGuttOxsjLoWegA8NdFoAg1UePP20Dz4wdmbAzRS3phsPhvqk
 BfRCks7MATz7LZS1M/ttxm9LwX/1/GTSwYHycDIRUjCimlkeE1piNIVsqA0fpWJ/BHO/
 WeqhJjyyUTN/Ztm+eFWz6S0zyi0Z4XdR1n+uLMYDG+i1ES18Bh1NZyS2Tfkvql9dcX99
 3TKvQC0sud2pheIcavei7kpc8tSoO3XrZ9N7Y53STk/UKSnUneypX0tT+NQcxx1CzIOR
 pq6Q==
X-Gm-Message-State: AIVw112HEAunrfw9AhmFgWCFtSOA4TZQGxA4SsUAIqJ1BOZu6b1gRoee
 4wNHi9xeCTsmw/dibIs=
X-Received: by 10.98.102.129 with SMTP id s1mr1147641pfj.239.1500354515065;
 Mon, 17 Jul 2017 22:08:35 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id j29sm1803489pfj.68.2017.07.17.22.08.33
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 17 Jul 2017 22:08:34 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: aspeed: palmetto: Fix FSI gpios
Date: Tue, 18 Jul 2017 13:07:18 +0800
Message-Id: <1500354438-25577-1-git-send-email-mine260309@gmail.com>
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
X-List-Received-Date: Tue, 18 Jul 2017 05:08:37 -0000

Palmetto as P8 system still uses GPIO bit banging for FSI operations.
So the gpio-fsi driver shall be disabled and GPIOH6 hog shall be added.
Otherwise Palmetto fails to boot host.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index a282de0..4690e53 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -49,6 +49,7 @@
         };
 
 	gpio-fsi {
+		status = "disabled";
 		compatible = "fsi-master-gpio", "fsi-master";
 
 		clock-gpios = <&gpio ASPEED_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
@@ -291,6 +292,13 @@
 		line-name = "SYS_PWROK_BMC";
 	};
 
+	pin_gpio_h6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SCM1_FSI0_DATA_EN";
+	};
+
 	pin_gpio_h7 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
-- 
1.9.1
