Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtmsK3whkzDqJX
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 12:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D2C2r9Hw"; 
 dkim-atps=neutral
Received: by mail-pg0-x22d.google.com with SMTP id x125so23103122pgb.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 18:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=P9qtgcpTN9DHQUdlMZacQxOUK9KwQudd7oVIi717xis=;
 b=D2C2r9Hwsvvczw/wfeyT9XDvJAAxkWt0Vu5hCn+cvyACKzo892BOZnXCjmdsRjaOXE
 ZmPWiV0lG6Ybq98QktOZg2uER9RSDSbaFKoYGuUVLj/kTdZvBj8u1SsumY2T+PBQPEQP
 CGnwM+RQlA1ddUYmt3JEsXl1ywJuvOCRtWoTVkolT8aQpPGKKiva1Fh4YSrbDWaQZm0n
 GnlBCQV6wd4/lluv8KeAzk4vr9Cit1P3cKwtIEbZAD2I4IORcthZHiNTi6WZpvxXy1jm
 Ehj/jBzPZ7ZynWbYQd/NGwxkWY0yJdNYGz/679hmYuf4dPAZ2zNgzHB7IaEvcDmfTAqg
 xi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=P9qtgcpTN9DHQUdlMZacQxOUK9KwQudd7oVIi717xis=;
 b=mxORdCuqxqlw5tZZX3BazajylIAs5klN6A6VfJqkCicefDSqAfQTXNxEsvTsAAkb/w
 LGQlWaZXUUVPaqqc5hnl1ziviyOxVMWPzAGPtaSRWEalEY+HbGFcT6u1QcG2PL7RTDCU
 dGt9Egd9bRap4jXCgQ6Afk7pQaSp/EfmSLV69ajKx5Ul0ZjS7Wt4UZkjd+EqsdKocyTm
 nHkYvz0NKytWtK4fcAMzvp1yDY2C6UsSAgDe21F89HCUTfLbRfzXK/SKUWoxvuRDXkoC
 9X3JUGDEUza9n+wemq8ugGxPcZmBWZAXn1dggl+h77iRbN0bOVO/boVr5EF1NQT7Kucp
 E30A==
X-Gm-Message-State: AFeK/H1qNE0yqBIjlGYIMtpxuhkZ7ANaFPqfN9UL37OrWvwOAXGCWa/ahmKjx9Qr97hObdLA
X-Received: by 10.98.252.144 with SMTP id e138mr3297944pfh.266.1490836530970; 
 Wed, 29 Mar 2017 18:15:30 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id x15sm503573pgo.56.2017.03.29.18.15.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Mar 2017 18:15:29 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-4.10] arm: dts: aspeed: Describe ADCs for
 AST2400/AST2500
Date: Wed, 29 Mar 2017 18:15:28 -0700
Message-Id: <20170330011528.8915-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
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
X-List-Received-Date: Thu, 30 Mar 2017 01:15:34 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 101fd5a1bffd..2c46e8949b0e 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -841,6 +841,13 @@
 				};
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2400-adc";
+				reg = <0x1e6e9000 0xB0>;
+				clocks = <&clk_apb>;
+				#io-channel-cells = <1>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x8000>;	// 32K
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 2d2cf723d7dd..de7ceee4857b 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1026,6 +1026,13 @@
 				status = "disabled";
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2500-adc";
+				reg = <0x1e6e9000 0xB0>;
+				clocks = <&clk_apb>;
+				#io-channel-cells = <1>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
2.12.2.564.g063fe858b8-goog
