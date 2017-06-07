Return-Path: <xow@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjbJc4qVkzDqCt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 03:34:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n36gGSk2"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id a70so7520037pge.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2017 10:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRiuORYiJ8Tbhkvk/YPiE2Wn7vbAXftGKNvZAvXcHNY=;
 b=n36gGSk2bXO48pfZphGHlMRviPMEJJNh+t4+ovfz94yqQVra1Z9wwlOtpfylVyjA6J
 my1pgAsRLdSW0vB0aZjYf0au9PhWu3+x2HXN4YDqJNUQ/cCWhMu5UcMeu63X7/GbFVVU
 D+TYYR2LFz2CathdtgbeK0sAZ6RgSpTf8lVDJm9tZR0UP2DH42w+NR4DHJuOXsx9WiRu
 nbJq2lRQL2AXkehNpVg4LBWITXi3m8PXjV12C66Rt7Xg4EUwVwVxqKBfTzyt1vKcajFX
 IO9LqvIuu2VpEnqcSjYJNBamFGUr72qRgmREyIhYzVl6nNFplOdP8zYL6J7XPv2JSNOc
 nt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRiuORYiJ8Tbhkvk/YPiE2Wn7vbAXftGKNvZAvXcHNY=;
 b=d2xXXrDfBb3mq9Va5jBNHZD3b2hfctgwk/tRPELpg/MvY99La+tf/3bVlFPCAgLmpI
 +JSpQKa6AXcuQfj/R4Ac6iHaoUSPhYuC1FDgJJVsmE+QpuL9UcENSdXoiBRKFK+DVUSk
 TnPyva4JdBdx5Rz7sYgaWUy7Nn7fepfzHZlDr9Y05qHxbu1yOaFHgL/k9lYJMrgkQGAr
 tdFk1Ip7mbPXh95cj+NWTatY8cSWHos+T60HCEjr55grTwXk94QWAfhjjW2MWr4XI60T
 C66jK/fnPp0ABBrnTV/DArOn3Wj0qKDNsY7nqIVsHaGkohBJQ/7n2nuvq0HFlmMfw7w5
 Ku2g==
X-Gm-Message-State: AODbwcDmZmjJZ6K1/LVExO3F/cqdoioY9pX/M8Z3MWLxhxA7ta2p9tJv
 X+Przg7hDZqULmwaJ+0Hcw==
X-Received: by 10.101.76.136 with SMTP id m8mr18747694pgt.159.1496856845434;
 Wed, 07 Jun 2017 10:34:05 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id t20sm4000036pgo.29.2017.06.07.10.34.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Jun 2017 10:34:04 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: zaius: Add aliases for I2C buses
Date: Wed,  7 Jun 2017 10:34:00 -0700
Message-Id: <20170607173400.46762-1-xow@google.com>
X-Mailer: git-send-email 2.13.1.508.gb3defc5cc-goog
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
X-List-Received-Date: Wed, 07 Jun 2017 17:34:09 -0000

Make numbering for I2C buses consistent across boots by assigning
aliases to all the bus blocks in the peripheral, including the ones that
are currently disabled. This way, Linux reserves bus numbers for buses
that are disabled, instead of filling in those number gaps with logical
I2C buses from muxes.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 68baf3288263..353613344ea9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -9,6 +9,20 @@
 
 	aliases {
 		serial4 = &uart5;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
 	};
 
 	chosen {
-- 
2.13.1.508.gb3defc5cc-goog
