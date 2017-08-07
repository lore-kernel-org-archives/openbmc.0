Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQsTC6bdlzDqkF
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 19:20:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDOi6Nyc"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id u185so8261675pgb.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wbaPOsvBVO1NEhyQXx0vDcOh9By/Q905AXvJ8yHovwk=;
 b=JDOi6NycLC7rNZgKtk01RzsC5Y2q8yT+yseP0L4uL1SWxqDdanmmkc1yatskRRydg/
 ujg0YUFIaZKcyHerzf8/01l1WQjmEmbOgjLHPy6JmCEwEh9ZCI40twcpP9mMX2KiFaJz
 LxBN9HGft1Uj4N4kzRD0bcCM5ME7FQhgo0ZV6/X3Pxn6QEY425ABIE/XuofPWR/fGV0W
 4IC/oHyc30o/XUlU7a7yenpcRfBRR6YaZ37EnQJjI4RsBCC8VnbhuAcr/kif5IOx5ooh
 m7UvHRhvo/SVjmjTLDgIBUFA7q3tbiITslvb1UiNauhATpoZ4T4eY5a45doDRIzfHzpI
 qg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wbaPOsvBVO1NEhyQXx0vDcOh9By/Q905AXvJ8yHovwk=;
 b=Wtc0xoWQ4QFqq/G5Ew5eLMgZnjzmPJuhijwmjDXywTZIspBTA0KU0yuYLgTpd22DfH
 62Sn9/jFDpUoDIWh27Q9ssjvoo8jxfvd7Wek1owcBGbUuXv+7t57nHCvknIvIkvHDZHW
 ISetuoJm0gLtPl4ecSSlpnpFBU3gODA5JaYVToCN82JgYDH0DGfxEuIr3ZPSE573HOLP
 0WxOPUtKVP2ZY2WikEC7TYaNA78AloJYGCvHX29Lv8XqcQ2lQ/6vEn7VrWY48Vb4VI3x
 q49CxrZacHnWtVGtCYeSOq4Co7m65XNmG1/k7BrHH4UPBEFGfvwSTQNwPE2XAww3qu0W
 HcuQ==
X-Gm-Message-State: AIVw113CWxIkAAomgTLDxlSYuWlg+GhFBTDcSOr5YnryrCyUItFfYMKE
 sqZWfXKoRw1pj0XYC4s=
X-Received: by 10.98.78.73 with SMTP id c70mr11167523pfb.17.1502097645303;
 Mon, 07 Aug 2017 02:20:45 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id 139sm12287564pgh.60.2017.08.07.02.20.43
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 07 Aug 2017 02:20:44 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: palmetto: Use new occ-hwmon
 driver
Date: Mon,  7 Aug 2017 17:19:00 +0800
Message-Id: <1502097540-10201-1-git-send-email-mine260309@gmail.com>
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
X-List-Received-Date: Mon, 07 Aug 2017 09:20:48 -0000

P8 OCC hwmon driver is updated.
Use the new driver and compatible name for Palmetto.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 4690e53..ee3a1c0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -136,8 +136,8 @@
 &i2c3 {
 	status = "okay";
 
-	occ@50 {
-		compatible = "ibm,occ-i2c";
+	occ-hwmon@50 {
+		compatible = "ibm,p8-occ-hwmon";
 		reg = <0x50>;
 	};
 };
-- 
1.9.1
