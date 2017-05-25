Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYLx217H7zDqhW
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 17:48:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pJayoSPK"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id w69so37589183pfk.1
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=xJEDgykxVhJdI2kvoUqkis3Fl7ljg6tId1QuLIEnyEQ=;
 b=pJayoSPKZx9Op70WlsvI+s6BAzzQJxvaQ0I7fNftaIQ2A/IklOT4ACVHNSn//FvxyS
 agEeLSsTF0r8IzUTjgKaKDWTNIMAzjHMdz1eKV7v20uGb667qB6AXHcKxbqc0VsC2OEw
 l1G3V+wCGbhwN8ivCtnSRG65MGdf+vAkEDBvD2h41Oq5TGKyM06O2otl7aXYcr85YKhQ
 1wPHMX9k7qePQt6fOuJHAM7bJ1SiVz+zcW259S5cQ7IBwi3dyHoL8ugQ7784zzFV6oXO
 p8BhKAU36lhu55780yk+NCwEcDNFa/WhOy9ZGiAoQCXs1oq2Y9g71TqY6QZFrRjXGLbv
 OzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=xJEDgykxVhJdI2kvoUqkis3Fl7ljg6tId1QuLIEnyEQ=;
 b=leqwnXPZp9MgIR4q81EIW29e8FTXrQkljC/2V3ehjhZtonrwLBNJ+CvH/sGwgmhjXq
 zls7OmCP6rtGAds689D9KgOT4WRsSkcRRizoxIWIYY811Jzd2pONfZD/+8kFf+mR0FBn
 wC96m+Nb5ols4zF7QR9EqQjJ/AeHWAjwbUgP99oU3cafgksaoevmVIW9Gb2fHM2B93hL
 +OYB09WO4d91huOdb6U1qNb+gdqP+EZ0AoStnsjhhi1lww6KuC2pLY4pbFG4FugaG2Hc
 i4nVwRa3KpUPznLtL0TRulP6udD9bBnvHa9J/k4HkyYPxq/HF307F6i215aUr1CCcYDh
 kj1A==
X-Gm-Message-State: AODbwcDfufTqpCxZt447Bu8whmiEsp/AFYXKK6BHSQqABjlcXzLjcBta
 lWIiN0+m1naq+g==
X-Received: by 10.84.238.206 with SMTP id l14mr47617808pln.189.1495698516272; 
 Thu, 25 May 2017 00:48:36 -0700 (PDT)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id k79sm12360381pfj.6.2017.05.25.00.48.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 25 May 2017 00:48:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 25 May 2017 17:48:28 +1000
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Nickolaus Gruendler <ngruend@us.ibm.com>,
	Lei YU <mine260309@gmail.com>
Subject: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: romulus: Add checkstop
 gpio-keys
Date: Thu, 25 May 2017 17:48:17 +1000
Message-Id: <20170525074818.7284-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Thu, 25 May 2017 07:48:38 -0000

From: Nickolaus Gruendler <ngruend@us.ibm.com>

Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index ac728695e447..5ca0f6e6a6a4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -42,6 +42,16 @@
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 2)>;
+		};
+	};
 };
 
 &fmc {
-- 
2.11.0
