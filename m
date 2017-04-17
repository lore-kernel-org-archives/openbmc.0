Return-Path: <maxims@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfY50JnzDq9H
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FGirdKFT"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id 72so67538642pge.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VxHZpaV/2FG9fe1LRu9HA/xmfNKoESSG6iiz2d69yd0=;
 b=FGirdKFTuE8JdRWGC0Me1CY8fZ2uZ4NZF3q1R45DBpIL6UYxm+H/OtoO/e1gVpC3Wd
 rcyGmDZui26tvWMnVSm87g5oTvhmDCPDuZf0iqEhYIyTlb5G6BXRAhTUgVU3LqpmDy8b
 eGtxtjFUeNm9TXMr6wa3J+t6nYKfSfHUNfEowICY7hN81ng/q+9rOlOQYMchCOZmn6iU
 LbMPyUCA46dDFXJKCqQ4uxOCTi1HwyiMNvp3akUp2O1mLxHZBCj9n7mdslZL0/7czCSM
 h8kqJ/ZeXJhNl+9bX+H40O0DgNKIircUdWWbB7P5jcNfMKiG6GdwJx2TTu4QExUKN0Tp
 Trng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VxHZpaV/2FG9fe1LRu9HA/xmfNKoESSG6iiz2d69yd0=;
 b=Yq/rkzRr8eKMBkLu9qlYLYa/6qvZCPXJ+GhU2+TiVsVz8YD8ABUHp1wVCLW2MzLmDY
 de61hPUojq5aNEBsWauqQ8LANB6UzLz5IlTQziMbHavKMqGiPJ36BuW1DF7gyBECLdvf
 jsIDxQ3FNWhUtHh1OgXkBm6q6mRSxD4NnMoM4kQksDDrz0yoIfHgGByaQrTTJ77CGf3I
 nj0sv4zyRKWfS2LXcLoA1YN7gRVSI7tyIZuFoWpC41O0JDfLjeq9e8lzCOb/sLptFR/E
 Bgyc2KfgbxXufuZ7ygoteAFadpK8l9B4IicFTuTdat2jUVksOINNDpGm4Iaz1oocUKEP
 8MoA==
X-Gm-Message-State: AN3rC/68Naxf7XwDGsCj70vQJQk3+iAXGtoCCWJ4MGddpmaWk0ctA/gd
 f71O4saMwgN/dEga
X-Received: by 10.98.211.27 with SMTP id q27mr8171051pfg.126.1492455667969;
 Mon, 17 Apr 2017 12:01:07 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:07 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 15/15] aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
Date: Mon, 17 Apr 2017 12:00:34 -0700
Message-Id: <20170417190034.71945-16-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:11 -0000

Remove unnecessary apb and ahb nodes and just override necessary
nodes/values.

Signed-off-by: Maxim Sloyko <maxims@google.com>

---

Changes in v1: None


---
 arch/arm/dts/ast2500-u-boot.dtsi | 41 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm/dts/ast2500-u-boot.dtsi b/arch/arm/dts/ast2500-u-boot.dtsi
index f826646095..7f80bad7d0 100644
--- a/arch/arm/dts/ast2500-u-boot.dtsi
+++ b/arch/arm/dts/ast2500-u-boot.dtsi
@@ -34,32 +34,33 @@
 
 		apb {
 			u-boot,dm-pre-reloc;
+		};
 
-			timer: timer@1e782000 {
-				u-boot,dm-pre-reloc;
-			};
+	};
+};
 
-			uart1: serial@1e783000 {
-				clocks = <&scu PCLK_UART1>;
-			};
+&uart1 {
+	clocks = <&scu PCLK_UART1>;
+};
 
-			uart2: serial@1e78d000 {
-				clocks = <&scu PCLK_UART2>;
-			};
+&uart2 {
+	clocks = <&scu PCLK_UART2>;
+};
 
-			uart3: serial@1e78e000 {
-				clocks = <&scu PCLK_UART3>;
-			};
+&uart3 {
+	clocks = <&scu PCLK_UART3>;
+};
 
-			uart4: serial@1e78f000 {
-				clocks = <&scu PCLK_UART4>;
-			};
+&uart4 {
+	clocks = <&scu PCLK_UART4>;
+};
 
-			uart5: serial@1e784000 {
-				clocks = <&scu PCLK_UART5>;
-			};
-		};
-	};
+&uart5 {
+	clocks = <&scu PCLK_UART5>;
+};
+
+&timer {
+	u-boot,dm-pre-reloc;
 };
 
 &mac0 {
-- 
2.12.2.762.g0e3151a226-goog
