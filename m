Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLki+TaC"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQnM4lrYzF21m
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:22:31 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id p15so1981056pff.11
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=GFrq/gzjUcPB5mvwTzqD/M2OGuICZRub+/0eMfAnldE=;
 b=CLki+TaC51dvcTghvYNkRDy83lgJWvahp4DbcC93I1O+so/GxYqvRxc0cbu25i+byG
 7MYTbqgSeMHMoPYkU0J8+3p7I4GjXnODolVgBubodNqz2dHIE2nMqO3qN5rrrbHg4+pC
 lzroCHsVoVYTclcqUoEVl6bbETfdVkW7xTZD53nOIFObVnmH/DYlq0ajHuOIEOxfokkS
 VGfk9W5biqF5wLdjisebYQmRjt423LC8Pxcmw9sxtcCVbpn6JtDR5mBEEF4jyiJfkPQO
 1ghlXBuD8/kbQoN+em3m3AZMiJmfoczOWxg7V43wwz+y4wHR9ZIRmbthIgq2cBLrqBUc
 OHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=GFrq/gzjUcPB5mvwTzqD/M2OGuICZRub+/0eMfAnldE=;
 b=TRW3sBZL36nrAY+afuEr0QEq4RPflT9VSNIHi0NdSfgeZvdW/8MlegI1xVOEVVHA+h
 Tc+u3fPpjmKEii34JN9KcpzR4eY3K99oCnM+qe8EPuvTrlS2G/EnJKSmtY77eY6BFfy4
 eLzeBkXIta/aqiv/doUHD5jdstQ8/B4w4blMOdLb9r+ZqNXy2xGNBHujpm0JJNfUqh+7
 xo68vLWFD7wAEZxPvV9sCByudfMGddI5/OABJZBK1SRLRKZAq2A0FvnJSxy5skHj8V55
 ov5tN2TABgJhOt6xx0Tr3K0AI1FBo42htV+iLDTqT6qzQu5QXNAQLFGWGAE5As7NUgMB
 FRrw==
X-Gm-Message-State: ALQs6tDXiRZOcbQsDPq8kSGewvpTs1E4p+SpWLuNl6FCi5Dca+vkzlvN
 j5TYph8jf04IzzuPSaiBQm0rMVQg
X-Google-Smtp-Source: AIpwx48UJlkZzStKWRkFyeEzRqfnwFFZ/iIO4jbybeughJaAFO5cXlZKfV3OmUy+v+YnZtrYZQ7H/A==
X-Received: by 10.99.136.73 with SMTP id l70mr3929524pgd.49.1524111749302;
 Wed, 18 Apr 2018 21:22:29 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id k83sm6381554pfg.153.2018.04.18.21.22.26
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:22:28 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:52:24 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 4/5] ARM: dts: ast2500-evb: Enable the GFX IP
Date: Thu, 19 Apr 2018 13:50:03 +0930
Message-Id: <20180419042004.25168-5-joel@jms.id.au>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:22:32 -0000

The GFX controller is the internal graphics device used by the SoC
(opposed to the one connected via the PCIe device and used by the host).

This configures it with a framebuffer region and adds it to the command
line so kernel boot messages appear on the display.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 45efac8f8806..c0a7f51e7eb6 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -13,12 +13,26 @@
 
 	chosen {
 		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
 	};
 
 	memory@80000000 {
+		device_type = "memory";
 		reg = <0x80000000 0x20000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
 };
 
 &fmc {
@@ -80,3 +94,8 @@
 		reg = <0x4d>;
 	};
 };
+
+&gfx {
+     status = "okay";
+     memory-region = <&gfx_memory>;
+};
-- 
2.17.0
