Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyN5V6BsGzDq7c
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 07:53:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H4Ua4Xv4"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id 81so164371352pgh.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 14:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cUBR881XsdcihsKwHsKNri8a9UHtFMxQbkBz6FlqmTE=;
 b=H4Ua4Xv4nfaH9Lnc+rmwJu+HcWf3IEy2Tt6UdWL2bdjsKpygFVQsyzUmLPcVXVx3v8
 GGn+LGvEwuNWOcYmhnHt5xJAnUsFqEPwHUaUzc4YZCuL0P3OzAEEpo1HMBkE2AfGG4rh
 dKU3rXgENJGxeN3f3n5ya1+d6SR09aS64CXnzR7T3PMzF2xRn+vnUwtB9W2U8ehrsAxs
 s4NVCj/x7BdLPcmpT1WJBSw4g5/s+Ea8XJlo9xjOErrtBYAc0Qn5qptqmHyN3gONvJ43
 xzS/0ajMVEoCi5a0AMy/XMBMeFdC/79Mz1jNVqyXQBQ8k5wkJOqaiXrYjXnTeEIB4QjP
 QHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cUBR881XsdcihsKwHsKNri8a9UHtFMxQbkBz6FlqmTE=;
 b=r7n0FXkG9ru/GUB0NrxDMlepX5iySRFHOhXMYUnuBS0ljIt63rvka1DH/AnrwSAWyH
 WhLalkONUqFsTIAYO5M6PIRdKs+blEugW4y2fock8skE5VZc+6BNtG6gh6/3ThpzgJGD
 Yk9ohMGl3VLbUFLOk3D3PPLAaDKzRfLOtiw+ZsoTrphd8oFNAde2of5DHhV3NxvmRzoh
 5nSjjGR/sFkcnYzlnHzs/PEW8c6zPI4zPuqIE0ViMPfeL43Qr8EEwU0ggEVkHGmkkZZC
 O3kvhUKCP3Pi8qsoVfwYe5pqx8l1kQaXqPpb9gpibL/NmM1U3cWyF8kIQLJ6Jdrch6Ki
 KcOg==
X-Gm-Message-State: AFeK/H3cqsPobTqAkjR81IA1g1E6umh4AT/JW6FrzqNx1b5PkRmR7Bmj/eF04bXMiuApzB1/
X-Received: by 10.99.232.21 with SMTP id s21mr26584266pgh.67.1491342812193;
 Tue, 04 Apr 2017 14:53:32 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id l126sm33500036pfl.56.2017.04.04.14.53.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Apr 2017 14:53:31 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v1] dts: aspeed: Add hardware RNG to aspeed-g4
 and aspeed-g5
Date: Tue,  4 Apr 2017 14:53:29 -0700
Message-Id: <20170404215329.14823-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
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
X-List-Received-Date: Tue, 04 Apr 2017 21:53:35 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 arch/arm/boot/dts/aspeed-g4.dtsi |  6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e5be87076a6b..ee735e92c3d9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -840,6 +840,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			hwrng@1e6e2078 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2078 0x4>;
+				period = <1>;
+			};
+
 			adc: adc@1e6e9000 {
 				compatible = "aspeed,ast2400-adc";
 				reg = <0x1e6e9000 0xB0>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 48fd068251d6..4f29dcfcc134 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1009,6 +1009,18 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			hwrng@1e6e2078 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2078 0x4>;
+				period = <1>;
+			};
+
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2500-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-- 
2.12.2.715.g7642488e1d-goog
