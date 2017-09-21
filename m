Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+mfZmYs"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyRQ32NDtzDqZv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 16:23:39 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id i23so2118540pfi.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=mIJ04pDISGFnDC0pzR5ChU5/lg3il/c+/LssYOenheo=;
 b=Q+mfZmYs0yeO1dRNqv8aYhuf9yqIqI0KtLRGrxFXKd+jVGzqlBS1dDK89aN3T4Gzq7
 pedbPRLHDtXD86WmBuU9OGIfkAxeVENcRlic+bhJTvcSDioCjtv2k0jeOG83oL6j2twr
 K6kTGpzPu1TTNBx8wAPfKs2iJk0X7exG5yeJBFMGdGJ7FwD39PQCGg0AZa8pqXCNsp2n
 UkpkETHrXrOFuc9bdTBqxSZdeiuYjrPTdDRf0IdcJyY0zEbell/xCCsesIjeVojosDP6
 LuAaaCsJta6CFFKn9QMYW1gJmkFhZZGK9rgPrzyWbZuuZ0aMb4qAZcC5xaxJ8MejOqL6
 /YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=mIJ04pDISGFnDC0pzR5ChU5/lg3il/c+/LssYOenheo=;
 b=b2ZM1HbuSc79pwK774cu1ZfwIeGEhTDFA/1TlWz7ls1YFtnmk80JXqptSgV4sjK1UG
 fQUz63CcCWibYDcYog0cz9qa97tqeVEWvrkdYifJcYBGuc9C+b+lC6VjV7Apr4RdyzI6
 MPU/5ruWyuZgC8wpiGRJ+RltaAw6DBxjU8ttj6L1C7gWF8hLFVX25I8NYaL31I4gcEnc
 fNJdivCuonDMnSRvBI9Pk9AiHUkjHE/IILqISVARYdbBgsBbmLN5aU6V86SgFa2KTvlq
 VnYH/q9K9nhSSNIUHMLPPw08c0FVDcM6XRyTflm7dzWs/NsLYFNi+3L72KQU04D+wqVE
 L9wg==
X-Gm-Message-State: AHPjjUgwrZN8q6igKzBhc9rdCMSxpBliR5Vt/m5wNvly3OOR37kWxgxT
 19ByPinzV36qTJgK0JWToEiDrHYDYCo=
X-Google-Smtp-Source: AOwi7QBb9jP98VJeiL/e2PyzjwawNiH6YlAxIyBSuyKQbzWS5V4Umpa/TyOmVNXddV67RVOW5vVImg==
X-Received: by 10.84.132.34 with SMTP id 31mr4424604ple.225.1505975016572;
 Wed, 20 Sep 2017 23:23:36 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id l23sm981349pgu.34.2017.09.20.23.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Sep 2017 23:23:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 21 Sep 2017 15:53:29 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed-g4: Fix timeriomem_rng probing
Date: Thu, 21 Sep 2017 15:53:28 +0930
Message-Id: <20170921062328.9256-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Thu, 21 Sep 2017 06:23:42 -0000

When booting we see this error:

 timeriomem_rng 1e6e2000.syscon:hwrng@1e6e2078: timeriomem_rng: resource is missing

Moving the timeriomem_rng node outside of the syscon fixes the issue.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index a83b6a8d73d4..38aadbf09be2 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -195,18 +195,18 @@
 					reg = <0x2c>;
 				};
 
-				hwrng@1e6e2078 {
-					compatible = "timeriomem_rng";
-					reg = <0x1e6e2078 0x4>;
-					period = <1>;
-					quality = <100>;
-				};
-
 				pinctrl: pinctrl@1e6e2000 {
 					compatible = "aspeed,g4-pinctrl";
 				};
 			};
 
+			hwrng@1e6e2078 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2078 0x4>;
+				period = <1>;
+				quality = <100>;
+			};
+
 			adc: adc@1e6e9000 {
 				compatible = "aspeed,ast2400-adc";
 				reg = <0x1e6e9000 0xB0>;
-- 
2.14.1
