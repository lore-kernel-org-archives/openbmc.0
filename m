Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ErjYRl7u"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hzgt3kDCzDrpY
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 15:49:45 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id i5-v6so2665025plt.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=EisHY2sR9P1BatKe6P2ejUAdbGDEtSomNPFrP7YYyOs=;
 b=ErjYRl7u50m/j67XJcskVZog5ogQpbDiVS2H9imwF9NupZx0wQMEkTskYPFt5H8i5I
 42qF4rRmp7jeo6psx6WAnBSsAJIfMb0+j4fbKWGfWalzkyWRVW++J9KoHnmD6WsvcaJj
 RsA9TPvZ43/bh1XxGHXHmTtlLXF+tn5awe7k5LXgDByVdKuLRgZQKAR8y5TZMiBiX7R1
 T8VlTZ8w9uxReIdB26yyyadrKsmpki+lmPrgVAjn7y7lMPJ32ihHx8+8KlgrNYqD/qWO
 g+wOxJZ9Wu/eux8BVmF9DvUJX2jfJ+KBYwEM6QbAt+DQ3ObqvyIZJF++V6cKoA48b5UV
 wm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=EisHY2sR9P1BatKe6P2ejUAdbGDEtSomNPFrP7YYyOs=;
 b=W1AEJSmFanZF9UigBxzwwxsyHTcTuDQCdLOtmGQ9JUgdlf1/MyzbJ6B40wdzjbfwSv
 K14j5zRrrblGS7DZo1cjwLd/Xz/7jMU9Q0xCI4EfD5a8zJbIE+eRjtLu5P+JBi7qu97p
 brVYGgvs+Zaxy4Z9SckglhkkjxxxLEQXWhwGx5ylY5LFrbKb7Ha7ipkTx+1GmsJD5idg
 NUPlFBUZHFmpBbl6X2hfpGWBPh0ZYz1QUS1dYQDi78g6Ej2fs7BLDX10VWyXf2T1PnKN
 Esj0k63xiV0sA0GmjeD9ZSRkBIhEXsKr7ytaGNudpv0ZYcaVHGAu69Rbef6ODkeXAsLX
 USOw==
X-Gm-Message-State: ALKqPwepVZYcP9lwPLWH2eajiIMiyY9YDYig3hmWVKaZe8FqechrNACY
 EaxwPIDHlUxTz5NUKK040e4FIyB7
X-Google-Smtp-Source: AB8JxZoCltmsS+EN7mPkD8pvldDdeNK9DUJ3swRG2hY5SPlwf360H7VqUxvOm3h98in7iv94T6pJXg==
X-Received: by 2002:a17:902:28a7:: with SMTP id
 f36-v6mr3326140plb.155.1526017783009; 
 Thu, 10 May 2018 22:49:43 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id u86-v6sm6326720pfg.71.2018.05.10.22.49.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 May 2018 22:49:42 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 11 May 2018 15:19:36 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed-g5: Clean up sio registers
Date: Fri, 11 May 2018 15:19:35 +0930
Message-Id: <20180511054935.31164-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 05:49:47 -0000

Remove the unnecessary reg property. Drop the 'rx' in the name, as this
refers to a quirk in the datasheet and is not useful.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 37 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e9e039a6407c..7588a4c9643a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -328,9 +328,8 @@
 						status = "disabled";
 					};
 
-					sio_scratch: scratch@f0 {
+					sio_regs: regs {
 						compatible = "aspeed,bmc-misc";
-						reg = <0xf0 0x10>;
 					};
 
 					mbox: mbox@180 {
@@ -1487,83 +1486,83 @@
 	};
 };
 
-&sio_scratch {
-	siorx_2b {
+&sio_regs {
+	sio_2b {
 		offset = <0xf0>;
 		bit-mask = <0xff>;
 		bit-shift = <24>;
 	};
-	siorx_2a {
+	sio_2a {
 		offset = <0xf0>;
 		bit-mask = <0xff>;
 		bit-shift = <16>;
 	};
-	siorx_29 {
+	sio_29 {
 		offset = <0xf0>;
 		bit-mask = <0xff>;
 		bit-shift = <8>;
 	};
-	siorx_28 {
+	sio_28 {
 		offset = <0xf0>;
 		bit-mask = <0xff>;
 		bit-shift = <0>;
 	};
-	siorx_2f {
+	sio_2f {
 		offset = <0xf4>;
 		bit-mask = <0xff>;
 		bit-shift = <24>;
 	};
-	siorx_2e {
+	sio_2e {
 		offset = <0xf4>;
 		bit-mask = <0xff>;
 		bit-shift = <16>;
 	};
-	siorx_2d {
+	sio_2d {
 		offset = <0xf4>;
 		bit-mask = <0xff>;
 		bit-shift = <8>;
 	};
-	siorx_2c {
+	sio_2c {
 		offset = <0xf4>;
 		bit-mask = <0xff>;
 		bit-shift = <0>;
 	};
-	siorx_23 {
+	sio_23 {
 		offset = <0xf8>;
 		bit-mask = <0xff>;
 		bit-shift = <24>;
 	};
-	siorx_22 {
+	sio_22 {
 		offset = <0xf8>;
 		bit-mask = <0xff>;
 		bit-shift = <16>;
 	};
-	siorx_21 {
+	sio_21 {
 		offset = <0xf8>;
 		bit-mask = <0xff>;
 		bit-shift = <8>;
 	};
-	siorx_20 {
+	sio_20 {
 		offset = <0xf8>;
 		bit-mask = <0xff>;
 		bit-shift = <0>;
 	};
-	siorx_27 {
+	sio_27 {
 		offset = <0xfc>;
 		bit-mask = <0xff>;
 		bit-shift = <24>;
 	};
-	siorx_26 {
+	sio_26 {
 		offset = <0xfc>;
 		bit-mask = <0xff>;
 		bit-shift = <16>;
 	};
-	siorx_25 {
+	sio_25 {
 		offset = <0xfc>;
 		bit-mask = <0xff>;
 		bit-shift = <8>;
 	};
-	siorx_24 {
+	sio_24 {
 		offset = <0xfc>;
 		bit-mask = <0xff>;
 		bit-shift = <0>;
-- 
2.17.0
