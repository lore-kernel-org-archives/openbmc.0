Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WIZokEiP"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygdF85PrCzDrCx
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 05:54:52 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id z74so16776926iof.12
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=Agj6gVBKluDOuyurPUqwilv3C93JWj9fXedmz5Uf/2Y=;
 b=WIZokEiPO2w+zfpnJpEzG/T+eBmQTRxSWWSPczr7WIC5SZ8PR723GZ/xGt/9Yz/W/X
 0Yi8o3AVyU2kqrtPRpR37ID8/mlZLfAVbxtpbLSGxCpXql654UXssra5JVY03xnrZa01
 2x0RQp7K2Lw+TU/Z3PvlVtr/h41cNPW72kKtHTWpPIu2eEqljDmklLl9hza24fo+8I4j
 mVV52dn7XK8Y7r4pHQnvm4QXvG9P0jd7Vh0EfsHSvQuXd/3HJRJYSg9UzF08pGymEbU8
 GcaLDVu3lDNkOEOikMNfY2Q9O4+ursGzUKoO1GOvJt1a5Txjfh2Av7n8FiYeOVXhb9gT
 xcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=Agj6gVBKluDOuyurPUqwilv3C93JWj9fXedmz5Uf/2Y=;
 b=HP4DnhGJMXqkXF63ZO+njOY9O9BUkKeO0yn0BzIQJOgOVjUf1pNlLuvjqAghIx163O
 jvCdF1iHZ72sr70kqmj3uSqVhVWrZcH8zjoU2B2zLySnWWq4ajwZztFTZvN+aXLBrqEG
 Cfvtr0yYTDzbVO9iurz9ZFtwiI8aBEyGgBMBk8DE9ZTq2ZRs7/f2qnlYGfFt3Mpo32vO
 WERSeecP7fceyFElitthHDlM1JTo+eHF0QZGTIqm1ylMI5hStPR3HZOgWdGE0J9n+n/C
 dYOxb09TUlE8dCn0Gv/P2DJ/am1ow5TfiPiJXtQqZkK/FWtcULYHwn9U4Drer/xujQvR
 Gl8A==
X-Gm-Message-State: AJaThX78xYL66GScQxyzuNwxJt/v6/SoBEvLkPs5mVs5TmKiWMEPE8Rj
 AOnnrZIbRHENR1/B82C7CZCdCw==
X-Google-Smtp-Source: AGs4zMa7Uh2s2g1UflPQ99Ja3eCqGtFGFQEotUxDVYJUnnGpOzuklfBfvjv9krJGFBqTfjmO6OG7gQ==
X-Received: by 10.107.128.1 with SMTP id b1mr15457445iod.164.1511204089794;
 Mon, 20 Nov 2017 10:54:49 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id 134sm1324738ion.0.2017.11.20.10.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 Nov 2017 10:54:49 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
Date: Mon, 20 Nov 2017 10:54:45 -0800
Message-Id: <20171120185445.146061-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.448.gf294e3d99a-goog
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
X-List-Received-Date: Mon, 20 Nov 2017 18:54:53 -0000

Instead of 4k, it should be 512 because the latter
part of the memory region are registers for the serial
gpio driver.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 6505062ac6c7..424d843ec1da 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -231,7 +231,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				compatible = "aspeed,ast2400-gpio";
-				reg = <0x1e780000 0x1000>;
+				reg = <0x1e780000 0x200>;
 				interrupts = <20>;
 				interrupt-controller;
 				gpio-ranges = <&pinctrl 0 0 220>;
-- 
2.15.0.448.gf294e3d99a-goog
