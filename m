Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzdR3MnwzDvvW
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:04:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UTLqfCEU"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id n204so19623593qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=wPDALed2NcA3EA7fAaY0Z9U6g641z5dTjZLVEI17gCY=;
 b=UTLqfCEU4Cw1cZowGqZj2WE75MsfcP0eGnX6K94r7G0xV7MfEAP5aKGjcOd0eThF9J
 Ub182kFakRl0TMilsR6O4iZ9FwKl5rJmSqinwKpxwrhvZhOIkqy27bpVk7boIB/iqlUr
 +a+EHxITr8bqo17OYnqifi8nBDsrDsC4I4vp7oB1Z359mrVnEFA8Cw4fuBkQ36zU5dFO
 IaRUFq5LbBtZvjRIyQkTzYcU/oT20dnaTcLy/pfxnqte6QYwyg0LA8BknKlRcQNM0iAc
 YJP/A0wDX5vYc1/JjZrM48rlkJa9BxPDZrWWsrR3K8L1T/cQFUKh75XqMdf99qr/3tDi
 8ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wPDALed2NcA3EA7fAaY0Z9U6g641z5dTjZLVEI17gCY=;
 b=I7TGQDqM2texn+BcdYbKMwYx2XjUyqKDF01Ok8XaAAX1ba5MrImhEzm9qePY02anT4
 l1SShYqqrtY4bgr7A9o6InFoOULfSKu04Yj8rUmrjMYaStJIpvhIYZLs/C39QdgUHVun
 fB5HLL54Yvn3/wGOVms+o3o7Jy11byKUSReQZ/Q42aIpTZPovsgwdH6gbbFtjzHWgisr
 jCoBqJYv8HrH1G69wP6KJQp+MUHsKt4QSIsfPRNk8Ck7n0lbkzzMJnTvynOKuKOAN0OG
 LV0A9ftcyAvktsPfIfzf84L4JFLuG7hCYlu9yh5CTkeqljuyeVhW4AHfNMInVEm0688Q
 mCmg==
X-Gm-Message-State: AKaTC00Fu0zZB+aM7oeZQgbHSEQ2mWVgIC972bWEGNd1OuPuvtsmTsLouF56Vjv9GywVwQ==
X-Received: by 10.55.127.129 with SMTP id a123mr25937298qkd.129.1480460665313; 
 Tue, 29 Nov 2016 15:04:25 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id r188sm31990018qkb.6.2016.11.29.15.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:04:24 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 7/9] arm: aspeed: dts: Fix OCC compatible strings
Date: Tue, 29 Nov 2016 17:04:18 -0600
Message-Id: <1480460658-28945-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:04:28 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index bedff97..42f734e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -110,12 +110,12 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
 	occ@51 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x51>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index bbe09fc..df12e6b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -122,7 +122,7 @@
 
 	// turismo
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
@@ -137,7 +137,7 @@
 
 	// turismo
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 7737c09..38d51bf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -63,7 +63,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
@@ -72,7 +72,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index e17158f..8d9aaa3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -120,7 +120,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
-- 
1.9.1
