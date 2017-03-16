Return-Path: <maxims@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhd022r1zDqYw
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rL3G/zc/"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id w189so30115580pfb.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wMrzgiTBImK8WTCmUpdiDeRT4RWuTEtkPkycyWvSje4=;
 b=rL3G/zc/AWiJ1M/BjyNW0OeWY5dgvQmO5PILwJWLTtC5Wxe1Ece8H9u4ervhHZq6a/
 bxYptlPKePx+zIh38udqHas5ZQDRosmN5SDmoWrtWDenYYKVujUxbmOPHw81RjZ4cAgi
 6fSRf6XF4ikRx2kedlLSE4ZZ4fRaebDzegGfaRvcWGC8VPJoPVP0rbx4CHXHvtgWZoDW
 E1qvzpdNNa6qaySVcz4t34N65cCWkmR7xPc4xQoKGTXpVMsdne08AAE5sXqy5ZLBJZhe
 exH20sokErdm7wQu8eszHLBdtTqxIpvNnyr52F/BeePdBzfy02qsLUNk+dwKGMcqrff/
 UtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wMrzgiTBImK8WTCmUpdiDeRT4RWuTEtkPkycyWvSje4=;
 b=abhiKWAO5vtp6pSK6FP7KXcMh3T8Y/0GWaQkcreKgrjIJGPWjvW4qiHmkwh5Bnq/yS
 huDQekWVyz/Y/KY6pQ1fl8wnf6j1QGMygN88nNlVykNEDwSakUx0v3ri57bN18OBtHIn
 pI6WOqirlBZByQ9IMhL1DGzRCmDVDGfZDfuCbRfpcQl1SHZrlhfZV+cpos3LKXIEXqZK
 ii+MbbjpUPWUZASBWi1a0ik2CSTEOFojiFH8cd75cES0MnhfXlDoeRVFL89pkiaKOWlK
 7950QRo9Hzvh44qRTodSAUUK7wNG63oy6DtqPrRdB4kwIoVa7pjeCjj+m3l5yDpmAwBO
 HMnA==
X-Gm-Message-State: AFeK/H2gjSVNGo+UE8ibW32+q6j/Xv/x16aAGCCsO9Qjl/Krqhh8ltiho/iyx/xiXcqJX2rw
X-Received: by 10.84.231.193 with SMTP id g1mr2787846pln.1.1489700210579;
 Thu, 16 Mar 2017 14:36:50 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:49 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 15/17] aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
Date: Thu, 16 Mar 2017 14:36:22 -0700
Message-Id: <20170316213624.140344-16-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:52 -0000

Remove unnecessary apb and ahb nodes and just override necessary
nodes/values.

Signed-off-by: Maxim Sloyko <maxims@google.com>
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
2.12.0.367.g23dc2f6d3c-goog
