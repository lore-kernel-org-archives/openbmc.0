Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBmt6VcxzDw0L
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pj/dJsNN"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id y68so480896pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=+aQAxYSDN8dvoVMLpQvr0xeoAOiHjyLuKnZm/0+GARs=;
 b=pj/dJsNNSVzNqZYed34DdCvVQxPsf5bThG9UU1VU0fFG8/0bs36IqD8gy2rgfMnqX2
 LZSyWrXM0/xdG0dfEIfVq/KRXT4DasurooNbSDVG5qryg+zCzEhXDh45AI1mG+NvZ6H7
 7ZgoIaXfB+TKf74VbGH4wvi9YukOmCRCTwuL9Z/S3tHzUgjOIje33MXpeB8pZEz6Wg0f
 OqkBRwVVohDfyhPLZgC+FQ1pu/mlv5n39nKlgdnW8ZqzEfLMJfvoVx/1inpaX23fbkTE
 rpStWcMmpYeGGrc1H3GUOHo2DDhwLw5j24rp4w9vrDsqdYYBmNQDMm9xkkF9Zpsl80qY
 6T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=+aQAxYSDN8dvoVMLpQvr0xeoAOiHjyLuKnZm/0+GARs=;
 b=Yjkt8uit0i9i52yBSAUD2jOPkZy2Im8q1rnVtUz2Sd2x6G3M2xAzZVwfCC5OVT5GDV
 aUbvCYcOollX3VDBCwT3DoxwQT4oKs328JLTwbG/wYpqUY7O9Mpg9x4IfzmwCDgDrNqJ
 8m7sSPNE5tgHiuYx+dMPQaXsxXZaneet6WG5tgXjqKlx+Qe007sPL6EbNHElY/tMTIYO
 zLtXdrZyTP7XJEv/i2r+vqPtA+uXu+83Y7+oiLOrnuZkrK8B//kBeESHHxzGr4hY3eIq
 ToewupvQrDS2dMldNsgjas5OlEqR31WbYS9PX4Z8LJSEkN8oUCX8oH06HUVIYYKrRuPL
 /djQ==
X-Gm-Message-State: AKaTC00r/1Tb4rOJMcw3z9ew/fwHXj20rsTFrhhs/59pH0A+7bCesjlIaF2hhbFwTUQVGQ==
X-Received: by 10.99.19.65 with SMTP id 1mr24346741pgt.71.1479787757187;
 Mon, 21 Nov 2016 20:09:17 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id a24sm24742286pfh.57.2016.11.21.20.09.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:16 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:09 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 3/7] arm: aspeed: Remove SCU88 hacks
Date: Tue, 22 Nov 2016 14:38:45 +1030
Message-Id: <20161122040849.31604-3-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161122040849.31604-1-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:19 -0000

 - BMC IRQ (GPIO P6): This is set to "BMC IRQ# interrupt output". This
   is an input connected called BMC_PE_WAKE_N in Palmetto.  It's driven
   by a PCIe device. Userspace does not read it from a browse of
   skeleton.

 - FLACK (GPIO P7): This is set to "Enable NOR flask ACK control
   input pin". It's pulled high on Palmetto.

 - The other pins are the PWM/Video pins. They are not used by OpenBMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0e4c34a91ac3..ea76c95c33fc 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -46,7 +46,6 @@ static void __init do_common_setup(void)
 	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
 
 	/* TODO: This should go in the GPIO driver device tree bindings */
-	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
 
 	/* Setup scratch registers */
-- 
2.10.2
