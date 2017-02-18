Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQW9M3s1zzDq5W
 for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2017 00:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WLiolM3Z"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id 5so7376487pgj.0
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YSWe3xVZ6KFJTq0LfoV2oF3HQDyydlJZk/a8FkW0f6A=;
 b=WLiolM3Zv3UMIeqmVRLwgwW8LEjA+MHlHuqHbPXg4xm3N89UxXFqWwj8j+jDGW/XsB
 Ww9RPrYKqlt8jvA+4FnU3jtjSOeEANw/XcRlknmgM1YXeEA2CwOXKgLJW0zqbBpEpjCn
 y+gEKiZ8I2m7PRuIM4rmvBBIkFIGnAM3vvf3oPZxNt1uKKwT52UsiyFXUS0bk6TCzOaX
 JbtYsSepxu98BkqMSBfJDV0zI3XFg7Ql3GbCMkMXDc4a5sDe7yBc5lV9fuGw6i9jllgK
 zuaazY5Nbm9rMyj5Wndgt2N8rK9+pYj65Pok2k9wxV9H+bwLn+WfqCeO4+Tx6CkRpOWc
 oGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YSWe3xVZ6KFJTq0LfoV2oF3HQDyydlJZk/a8FkW0f6A=;
 b=Mh3K4bnJfeeX0F/Wu6BAto3qYk/5e6g37jw1yshd0n8UR1sHFJ5OLTu1cCbL4c4/Bq
 cUb5W2qn5cMIrvnE1npQwMEb/eDL+BAc26vl76TpjmCHQPPvHF8KBKCdW5FPMtdlKCPZ
 NdG2g/afBPbm2UFM5XKFeCsMnBWjNlGFAdE2lHL/Hc6YtmCo8pgaxcU7AWzquss9+PqH
 MGVv99AvjNi28VrM8+IPQic8B3inl84puMT7agc68Ng9YMzVcKtsc7BwmgVp616EvefB
 HyPNMxC3kSxV4SB8YZyu5tTY/wopoGOT4bGsWTaulckmxVxUY+UJv8u8Sg970D3EPC3j
 PA9g==
X-Gm-Message-State: AMke39l0+mTS9duuHlpp4AbT5emjhvOsQMUMxHwh38iXnEtpvgngKf44kYItOkzsWWaBlg==
X-Received: by 10.99.65.1 with SMTP id o1mr16203469pga.93.1487424917716;
 Sat, 18 Feb 2017 05:35:17 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id i73sm25592259pgc.62.2017.02.18.05.35.16
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sat, 18 Feb 2017 05:35:17 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] arm: aspeed: romulus: Do common setup
Date: Sat, 18 Feb 2017 21:33:30 +0800
Message-Id: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Sat, 18 Feb 2017 13:35:20 -0000

Call do_common_setup for romulus.
No other romulus specific setup is needed.
Consider moving do_common_setup() to a common place.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 2a11c2e..726b8fa 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -218,6 +218,11 @@ static void __init do_witherspoon_setup(void)
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
+static void __init do_romulus_setup(void)
+{
+	do_common_setup();
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -253,6 +258,8 @@ static void __init aspeed_init_early(void)
 		do_zaius_setup();
 	if (of_machine_is_compatible("ibm,witherspoon-bmc"))
 		do_witherspoon_setup();
+	if (of_machine_is_compatible("ibm,romulus-bmc"))
+		do_romulus_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
1.9.1
