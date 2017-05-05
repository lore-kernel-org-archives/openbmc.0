Return-Path: <maxims@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpm0GQYzDqFW
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fn2B8/cz"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id q4so8801919pga.3
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=La/77dKKGAUuWVcaAiF3ftumDF19XwGbmlgxb8JKPzs=;
 b=Fn2B8/czmQP9UGYJyIuz3KjKZQrw23vhF6Fa8keUhL7GBjbMsL38F/p3qs6ltxsMD1
 AWODKYtJbme+H2wOrAqtNDwVEaXK8fXRJRZp8uYsBPqdYZfdifOYyUj7P/3Rj2hwLNCq
 oHcEdXXYy9uXHrEmqYDZ6jmrw5pKwLHlfTzEoBjlslEQG7xGWmK7jYVX4uKz49nte+3f
 e/665oE4JS4g8ZoGbzxgAsJT2bdReUyBfSEltkH8Dxi8nPDXHjp/r1skvt1rOecuGfOR
 RLk7ueNgtRBBWHOdn8jmE7oNbLCuJdZyrVmvSEE4lB1hLOqKCkjB87evkbACDcgBvksG
 o52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=La/77dKKGAUuWVcaAiF3ftumDF19XwGbmlgxb8JKPzs=;
 b=LRLyDnJZtEdZMD79O7FeOlH7Ggk4QD2tslId0lasyA3hd7l8blm1boPu5vWKTjCnHI
 M2XpaZ5f4f49kkkZJM0IVD5Bam8WAfEBBqDFtSymIvZZvMX8YkNgNGOKzGXgkCAc7Dxr
 /akUvCUFa8/IoYgmc5DydP8jF6LIlCTovbdbgppJQbfxUrx9ITZ0X405tk6UOY2nQhQw
 DhKNEdU/a2MvNxBvYfCUxgXKAogliGnyDih3v4NRxySA6RJGqWU5VoKs/dN//Qn6QeID
 6TaNxTrsWZb1eFI8meMJ7ZfiCmVHZI+tZnqqiPimA+j0Wms0Oy5ESo8tM8xkmRV7ixl9
 QhMQ==
X-Gm-Message-State: AN3rC/70GzqXMzC2BIitqoIxrSz2tPmxoUrNebOXrrJXywima7oPjkLe
 qGyEiLVa17gM5ZuGvq8Z6g==
X-Received: by 10.99.120.202 with SMTP id t193mr4545065pgc.35.1494021709987;
 Fri, 05 May 2017 15:01:49 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:49 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v2 15/15] aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
Date: Fri,  5 May 2017 15:01:15 -0700
Message-Id: <20170505220115.143025-16-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:53 -0000

Remove unnecessary apb and ahb nodes and just override necessary
nodes/values.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v2: None
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
2.13.0.rc1.294.g07d810a77f-goog
