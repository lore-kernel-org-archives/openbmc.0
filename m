Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Znb2Zd8J"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wKQX1wTczDqC8
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 17:47:47 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id t39-v6so310688qtc.8
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TW2vqQVOXsJoasVTtOfWTIs6j6CqNkZ+dhgzXMiD/Pg=;
 b=Znb2Zd8Jqm+kjjU2YybJ+WaC7uylF9Q1b6JZzMO70eRtAfPLOU0/OguXyH3ip//sdy
 muizGBZXzlLrsjlwIb4M1NOhvoPhgOz5U/bEOx9FaWfOI1Mb8tkV0x0D7XVvBFwa1k4u
 bJqmx6KbNM6UWeHuzUjRHDwardUTS99V9u6s7NNhf7LW705UH+LyGV/BrFkQ7a2GKz/s
 D9JFw8wmiCZY5kOvm2MO0WAsTbRIvkX/SdMpcyd/+JcAljdo/kyqU6saI/rMrn959rHz
 hBWChEVyOwrVHHM4mXYf2ZxUCN4DzsF6pCu97zmtvjlLOg2ZWzrzSrxTjumFXEk8y0ZN
 T6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TW2vqQVOXsJoasVTtOfWTIs6j6CqNkZ+dhgzXMiD/Pg=;
 b=ExiIs5Fo3pKYypqWPoDz4a/nnKQIddIQAjkIZZVBcP6smjoAITjzOItaHmJHG7P4aS
 rsfk4ZkgcblpXLInwBdUmsw4v9losvFXc2Q1g9U9R0cN3SQEPX89JnukyplQl4xAhe9T
 g5PjivYRQDgbij4Xy17i+tmm99yCiLUXmAvsxzjhURVmAmzzynABPY+6TPlCdFGTbtVr
 4PZ4qQnjZIoohN5/GJ16tawSKDxE3sfuS2Sxoeq7z+1qZvKd/2+5kPI75scGKOpUwbwk
 3RIx8I9e0CmNyrfyENLBigmahxQHP9uoiNy0iIP2j8cxstHgPEMNS7hGQpZwNYpW3/3m
 9M7A==
X-Gm-Message-State: APzg51CrVH23uDc6nmyZ93045xpgeLdhL2fl4s7TqTywr5/AEAV74MEa
 DRM4bFuaxWjXlb0ldZTlPsXi16gE
X-Google-Smtp-Source: ANB0VdYGgZUgfpw/nsqbbQVdr5DM6Dv8d3Sd0CizLgI2U33inQkUuTTm1qV0z5nEJ8PFuR6/VYvl/Q==
X-Received: by 2002:aed:23b0:: with SMTP id
 j45-v6mr2806764qtc.145.1534924065042; 
 Wed, 22 Aug 2018 00:47:45 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id d138-v6sm589790qke.18.2018.08.22.00.47.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Aug 2018 00:47:44 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17 v3] hARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
Date: Wed, 22 Aug 2018 15:47:28 +0800
Message-Id: <1534924048-51891-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 07:47:49 -0000

Add iio-hwmon-battery using adc channel 12 and enable adc to make
adc running. This channel is used to read RTC battery voltage.

Note with Romulus hardware design, it requires GPIOR3 to be pulled
high to read the voltage, otherwise the reading is 0.
When GPIOR3 is high, it consumes battery and impacts the battery life.
So it is left for user space to toggle the GPIO when trying to read the
voltage.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 9784a59a..cf59472 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -91,6 +91,11 @@
 			linux,code = <ASPEED_GPIO(Q, 7)>;
 		};
 	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
 };
 
 #include "ibm-power9-dual.dtsi"
@@ -311,3 +316,7 @@
 &vhub {
 	status = "okay";
 };
+
+&adc {
+	status = "okay";
+};
-- 
2.7.4
