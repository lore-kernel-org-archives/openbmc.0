Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHT5q2XHHzDqBN
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 13:37:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YmNe/rtg"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id v184so10644717pgv.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=UH/v1tFqu8ZPkLelaRRpgbLQTzIbUkH3zSsknfQ0vEU=;
 b=YmNe/rtgTqknpqk+lI0FJGRLJAXZ2xPcvJyRSKSuHm2P5V4/eCjIh9jpESAyLiYkiF
 pDMlk37VD8iZJlCPiNRVi2EbLPasGBwr1vX/UBEiUWRiC+Q644j8RYyvj3YIhPoo7lPN
 yQkgaugKXk9M0obg2LfuP4QmOyKnSr0THKOnoRLbaSh/UEzg/kwhR8NjQaLgaolSDHtY
 OywYaqUNKAxClNnGYorkXNie0jrzG4qAQJRL5pWS5Eoz0w86WUzjVHlbjODyznErOmpZ
 S0GP4dINh4zkk4n6JWK64daAxsRGMdTizodX+7F7EOxuRaMynXDZ0jshiKF7LYKzt+y1
 Dv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=UH/v1tFqu8ZPkLelaRRpgbLQTzIbUkH3zSsknfQ0vEU=;
 b=TPRDqj6TLHsmlR8bnpc7IkRJm3+wlM9iGq+a1DmmNfKT4uhcZjR1yZ4cl6VRbrAhqZ
 T2Qg2CYJ9pRvRTlkngvdaaciuG7cPfH087DjhSnknZUswKc4CjcUpxy6ioSfazGmua4N
 kNhMi44lusX2u8SEEhJvkHHjXhR91CAyFpI3DlAegwRzDTic3IGwwWw42eCs3yCd8/kR
 MyHq/NGw0cNdtvYDG6wxtScaQL4gRT5CaGXbR8W4BhBkKJ5kCPa24fC6Pzxj+iwkTtLT
 vcFQ0FVcHxBI25ef0P23Jh+n1HwuuND3pw8wVGVAaOqVsMFKaaGIJjc+4ykTAck0Z34b
 E22Q==
X-Gm-Message-State: AIkVDXJ1PA09MKuaGL4t9If5NX8p+N1dFfjtjw5i1ojAIPtUW/cQ0mq6qIRKeYqE+VJjuA==
X-Received: by 10.99.154.9 with SMTP id o9mr17180888pge.69.1486435069304;
 Mon, 06 Feb 2017 18:37:49 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id t15sm5855710pgn.18.2017.02.06.18.37.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 06 Feb 2017 18:37:48 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 07 Feb 2017 13:07:42 +1030
From: Joel Stanley <joel@jms.id.au>
To: Xo Wang <xow@google.com>
Cc: Rick Altherr <raltherr@google.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add FSI pins to Zaius device tree
Date: Tue,  7 Feb 2017 13:07:37 +1030
Message-Id: <20170207023737.26936-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 07 Feb 2017 02:37:52 -0000

Pin assignments for the EVT-2 board as described in pdbg. The status is disabled
so this does not enable the in-kernel FSI driver yet.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Tested on zaius5 with the driver enabled and it worked.

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e2195a641414..e1c9b3f4fe44 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -74,6 +74,18 @@
 			gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	fsi-master {
+		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+
+		status = "disabled";
+
+		clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &fmc {
-- 
2.11.0
