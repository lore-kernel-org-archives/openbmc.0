Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sIe9q5fW"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQnT1sxKzF221
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:22:37 +1000 (AEST)
Received: by mail-pg0-x242.google.com with SMTP id j11so1888688pgf.2
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=vp8CamDJ1YnlfaUvTorIuRv22aA28Lr5+JI+3WZKaU0=;
 b=sIe9q5fW32dJEEZeqkiFfxph76LoC/v0shXy/TcGWn6gCyioVrFtFRCI31aKcRhmQw
 WXP8KJnTZPmHnt4L78rUvavQ4TqgxBwi01wo/LCgRRuhJ68BjitGSTy+/7ZY92ItWeMc
 fegtYzuPQ/kbjk06GP7MBvYMGTEJSyFMxyFqZUC7y91YqHjrPApNT/TURaexVBbdGuzf
 fAMMvSbIdd/CbRGpaQJMvfhgkGgRyczYpslYe/ySQ56B9WLOp1LDsG+YGTRXMVQ73zBU
 QwqrZaBkEv1Im2rafeWlOmiT8rJgSE0wEsVvbqm1a9rbhcowDQfaUK4e2w0FdeVmYECU
 CU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=vp8CamDJ1YnlfaUvTorIuRv22aA28Lr5+JI+3WZKaU0=;
 b=Mx89rl62xZGc+yJPR8mkGui3IFC6xX+r3S/FelK/FpcMZ+Ii2qOpiPJOJmimtLcGK3
 6eP16BEc0Lunv72hBLKMoUG0bZWfVQFHeU1taCe6f4uqWNmOAQ+9Q1aWVvV4CF5Knd5p
 Qvt/iKnf6eo1ee0RgwAZdUw4/F+D8kfTLcfs1Ma2nC9mupe+y/kio6piHB3R2eq8WSxT
 1lU6qDm+6UyRAljmQCEsw3ShK3UWENsq+hT0dlnHt3KVfJlMGQEEm2cB6/9wzVRbS4Wa
 036CKxltpLbqWckVIBP6WezLBjpeZYe9/jaVWO1D98KHaCKJpCsSdNd6+08o1D401+Ek
 2fHg==
X-Gm-Message-State: ALQs6tDQiL26LHZh3ie4NcEPoldA0ymibvzC26MfiYVWzBIdh2k2ON54
 AJ6KciBV6IkyfLrw9cmGApT5Qhgh
X-Google-Smtp-Source: AIpwx48WFHC2QwXI6CMlv3kifRvZDqkGjPlII5TzBybvEyUxGJBPQVOtsxikBrojoYJ29H/5mkKLcA==
X-Received: by 10.167.131.217 with SMTP id j25mr4340919pfn.5.1524111754962;
 Wed, 18 Apr 2018 21:22:34 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id w134sm4895117pfd.132.2018.04.18.21.22.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:22:34 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:52:29 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 5/5] ARM: dts: witherspoon: Enable the GFX IP
Date: Thu, 19 Apr 2018 13:50:04 +0930
Message-Id: <20180419042004.25168-6-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180419042004.25168-1-joel@jms.id.au>
References: <20180419042004.25168-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:22:37 -0000

The GFX controller is the internal graphics device used by the SoC
(opposed to the one connected via the PCIe device and used by the host).

This configures it with a framebuffer region and adds it to the command
line so kernel boot messages appear on the display.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e8e4d305a9cf..596608f4b936 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -26,6 +26,13 @@
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
 
 	gpio-keys {
@@ -617,6 +624,7 @@
 
 &gfx {
 	status = "okay";
+	memory-region = <&gfx_memory>;
 };
 
 &pinctrl {
-- 
2.17.0
