Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i3K3yHHS"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNXRj1DqQzDqjm
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 16:26:40 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id 15so4453329pgc.12
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HHd6EaZIDRXwipbsaPEvKGgUuslWZ550Uq6M3JAP3D4=;
 b=i3K3yHHS3/LxYnymXoCpo/Od2DzMaqMroP/vnZifipRJ+4XSdZdllsfoTPUeybvm5h
 29b17SaP9cjhmrqOQiBFyiMcbp2/IFrRdR09aW14rAAv1rMvMWYx4NHRvzMylbAaSkIH
 xk4fTv6KwBOPA+XAuEmTkBAhLtDUwVOy1kJjFiARNbAN79NaQoHuAnsf6Ir4vbDLsu4T
 XFacXi8CEVL9xwnTA7G3pb526Y75I/7jlPVz4Tk3pY5u5juXkUPx1w2O7pJBEgC7d7Iq
 lHMHWJWUUNEqLozT29f3h8joBgpn3cLbd6L+zynBIn+jZNUBXM4/F3KCtQCddmvXZYRZ
 0Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HHd6EaZIDRXwipbsaPEvKGgUuslWZ550Uq6M3JAP3D4=;
 b=TWFbCzyCmJs/r2VWoSVX01EAJvAj0ZZgXxpSp1u1USnEftA/zP6PWGFRgObk86gSNJ
 fsRqNAbwO9LOGUhTNrrA9ZaPvjinlRgOrp0mRiujUsmhsTBVvj5FXan1Fe5CZr83dTvw
 RwsG0qpje2juOcy5y2B+BvMNB0L9wuFrc4WEJvMEAgslB8OfJars+t046BO8750hkIZo
 7ppuGf3fx3bdmCc5n4yylMR1gUvPbSzyPsGNymvGVylcd/FXp0fG4WXfP4/CMnA3qTqf
 PATGQ+1LcNot8k0UPnWncdzRH9Bq9MqgNJVIxsCXW5lqhVO0RnSClt3bsJSUSrjuL2Rs
 49sA==
X-Gm-Message-State: AMCzsaVRWyCYr5cYtiqBgo7O/Tbv+jpXjBUCDNBA2O1tom+PBYgRz5cT
 1awyhOidRPSuvb2vV8pQRTORrjKT
X-Google-Smtp-Source: ABhQp+RKqpqCsWIwfz8CXACCt2Gs1eVSQvWusMJyqtPDzgcrgJ58ptYKvzXmZvL2EdFYniFK90Z4zg==
X-Received: by 10.159.234.2 with SMTP id be2mr6067352plb.125.1509081998320;
 Thu, 26 Oct 2017 22:26:38 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id o65sm10408896pga.71.2017.10.26.22.26.36
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 26 Oct 2017 22:26:37 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Use new occ-hwmon driver for
 P8 systems
Date: Fri, 27 Oct 2017 13:26:02 +0800
Message-Id: <1509081962-21694-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Oct 2017 05:26:42 -0000

Use the new occ-hwmon driver and compatible name for
Barreleye and Garrison.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |  8 ++++----
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index d37d0ea..6e70ca5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -124,13 +124,13 @@
 &i2c3 {
 	status = "okay";
 
-	occ@50 {
-		compatible = "ibm,occ-i2c";
+	occ-hwmon@50 {
+		compatible = "ibm,p8-occ-hwmon";
 		reg = <0x50>;
 	};
 
-	occ@51 {
-		compatible = "ibm,occ-i2c";
+	occ-hwmon@51 {
+		compatible = "ibm,p8-occ-hwmon";
 		reg = <0x51>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 6b96e36..95552c8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -156,8 +156,8 @@
 &i2c4 {
 	status = "okay";
 
-	occ@50 {
-		compatible = "ibm,occ-i2c";
+	occ-hwmon@50 {
+		compatible = "ibm,p8-occ-hwmon";
 		reg = <0x50>;
 	};
 };
@@ -165,9 +165,9 @@
 &i2c5 {
 	status = "okay";
 
-	occ@50 {
-		compatible = "ibm,occ-i2c";
-		reg = <0x50>;
+	occ-hwmon@51 {
+		compatible = "ibm,p8-occ-hwmon";
+		reg = <0x51>;
 	};
 };
 
-- 
1.9.1
