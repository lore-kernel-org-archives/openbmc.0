Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BG3ht+j2"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WfpJ1qrVzF24Y
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 11:37:58 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id j5so16808688pfh.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Lzdk9Fo/XpSIXEMunDL3AU7Liwp4AzjQf3BLNVkqkvo=;
 b=BG3ht+j2yYczoAxjTRCwQn0ulBi1q325ITiSfavHZMJMYP+l/NxU2B9aHCqUv9bIjr
 S4TsC+u5IKXvJOi5XDJM9j6bFLVs86yrxgevpUcXW7FGtncJ5TMcHonCjgvokGxoH/Ce
 oRhS6Bept/UkPCuTWFq+jMqXJwhqnv3RScsgJwd7wP+ndB6KeESWK9i2CmXLrvW3iHQ3
 PvdlHvj7DZeg4jjbR5O6Ix+tc0JV5F6jETI/4IB7hqbm+KW/N2ioQp8S/PRvKJogincj
 BtP4xerDHP0GCggNikX+lmbEApP24GLycdNCKKDn8z5ePDNjo1O7J+GL0DJqBEkUr0DJ
 WzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Lzdk9Fo/XpSIXEMunDL3AU7Liwp4AzjQf3BLNVkqkvo=;
 b=Sdjs0/KEkAENBUG60q41QIoKQDZtoqAXZG3pRYJpEKYqTIqApe8EXY5cNfly7sZfRU
 CsQLa3InOZ0NfkBgiBTa9rlNygqdfLcAexKZ4jURHl7T8OL0wdd3f1fO7F1ZmeWcnU4J
 ZerQqclYXtBc32VlUTTEtyYJeDHkpZtDD5gNPzwnd8DF3zrzoEccEZdA6eh7NkDDHrqc
 fOp26ym1+4h+q7EoRBUEDQ7sxJ0XwIJkPhkOtmKR2ik3BrC82aDxknKb2agVCAQwGLrp
 ny7uzcnfCjeDRd8hVhcmeizvQcLS95YbtvQaCAabOWg9wtDN8p6cDmf9csLsIQiDge1L
 HTMA==
X-Gm-Message-State: ALQs6tCC82eTEdxGQjg5PoazcR+sh+4XIo7WKLRrevdZqYp3dQYENiAu
 kWv0q48u3mVI66aaNcIQNDi0wot7
X-Google-Smtp-Source: AIpwx49VaNVbLCZDsrNhmyVmP4GrZSK0mmcj0FxWEbUP0jfUvwb2mkycQjbTbt69htMCqXlFqGH4wA==
X-Received: by 2002:a17:902:6086:: with SMTP id
 s6-v6mr31125503plj.307.1524706676080; 
 Wed, 25 Apr 2018 18:37:56 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u4sm19964891pfn.3.2018.04.25.18.37.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Apr 2018 18:37:55 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 26 Apr 2018 11:07:49 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] ARM: dts: romulus: Enable the GFX IP
Date: Thu, 26 Apr 2018 11:07:46 +0930
Message-Id: <20180426013746.27256-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 26 Apr 2018 01:38:00 -0000

The GFX controller is the internal graphics device used by the SoC
(opposed to the one connected via the PCIe device and used by the host).

This configures it with a framebuffer region and adds it to the command
line so kernel boot messages appear on the display.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 00812a2fecf0..d746e562e8fd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -30,6 +30,13 @@
 			no-map;
 			reg = <0x98000000 0x04000000>; /* 64M */
 		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
 	};
 
 	leds {
@@ -280,3 +287,8 @@
 &ibt {
 	status = "okay";
 };
+
+&gfx {
+     status = "okay";
+     memory-region = <&gfx_memory>;
+};
-- 
2.17.0
