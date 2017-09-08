Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::232; helo=mail-pg0-x232.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vWi+cnZ9"; 
 dkim-atps=neutral
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprln5MZRzDrbn
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:41 +1000 (AEST)
Received: by mail-pg0-x232.google.com with SMTP id q68so6817716pgq.1
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPaUgXH8cwxT/uLW7NWq1Axk+1yPX7JNSgGF/baMlWg=;
 b=vWi+cnZ9BY0DqS+a18fToiCjj2SRdnSWMVTNb1FcW32CeANBP0XULvQAjbutHSmqNI
 ZjSsYYyvD8WPxuroPyxZyoj6cWP4b8O424l+xbyctYhoa6GNdbi3MdxOsjlo70cgR4WV
 j2dxeTfeJTWN+bQyWiwNq/BlBNJfoNEEksLs7RtYGx5IUmBexbBVLlNnHfWsnpRTIE2t
 hAr77szN5WebabGkS5dJbB214hpNxHcfl4NajgLaJqvUrWB6Ib4VDsiddnGBDjrYIcna
 6F+BxwSosD18nO7eUo2/EMFX7hc3/LvO5/Yf/FVhRompQ8XGoX/gz+kWVCrvNAUf2rsE
 XReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPaUgXH8cwxT/uLW7NWq1Axk+1yPX7JNSgGF/baMlWg=;
 b=aSwIfGFcZ8KXSMLxZm91vGkiWo6Tfuglk0cVD/g9UNkCl537I4i2pQJil8SSqXlTDR
 ueVVI7xKXKvZ8tCHpejIFqWUzQYSZr1hkGCgAstKsINw8rzW7ENJY8rcG71WgtSQARuo
 ovrLKj74mHlw/B/EkTdwiwRDve4/F1OuFVTaS0v2UCNifGYv7AX1kubEP02wDgkDTmsl
 ejE5VvIDJ6ShAqbGuxsFMEC8l29FKDMnYZCVD0aC6C3sGWzp10EiLj/SdxxAxBKJ5HNZ
 Y+TbAGckPY0WwXCzR5EcLf1Uk81En7cJWQfa97eNQi+wrzhfm835zeo9IwQyvuvPq/tS
 Da5g==
X-Gm-Message-State: AHPjjUg8b3A6k1kPDjeUTGS3xFmcRzw6y52/OgP6YHdLoxfixaoIqbNN
 CUrISihHVPTpWT2TlpLj4Q==
X-Google-Smtp-Source: ADKCNb6NcvkihDGIJvtIvP8P6vRCUF+fzxnJxzjgRSxpMxYYQuRiX6xFmuP7jDM/Q5mgCufMvhS+oQ==
X-Received: by 10.99.109.196 with SMTP id i187mr4464294pgc.357.1504907859206; 
 Fri, 08 Sep 2017 14:57:39 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:37 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/5] ARM: dts: aspeed: zaius: Update hotswap controller
 address for EVT3
Date: Fri,  8 Sep 2017 14:57:25 -0700
Message-Id: <20170908215728.115818-3-xow@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170908215728.115818-1-xow@google.com>
References: <20170908215728.115818-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:42 -0000

The LM5066I hotswap controller is at PMBus device address 0x54 starting
with the EVT3 motherboard.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 1c39452ffebd..f178baabfb9d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -281,12 +281,12 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			hotswap@10 {
+			hotswap@54 {
 				/* Device is LM5066I so prefer that driver
 				 * support if available
 				 */
 				compatible = "ti,lm5066i", "ti,lm5066";
-				reg = <0x10>;
+				reg = <0x54>;
 			};
 		};
 	};
-- 
2.14.1.581.gf28d330327-goog
