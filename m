Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBnL46FbzDvyf
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q9ozaHC/"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id y68so481616pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=iS7NM8t0JXteAtsFzvuw/hZBQdN78Ado1uZrzwHlWbQ=;
 b=Q9ozaHC/ZjqQbBBAxm4AIT9APPrGZvu7XiPmwQB2hMkLkRL81qkhMF8tJyKxKSNuYV
 DYnegqZzmfowNw4hB+PJu93A7u6B3E/+q4JzW1VOU6r7gGDhsHK2lxclgxcCAGDa+SSO
 yhoxeWAUJ81TJ4n0MiY0hRhPgWc+ek+uDlbQ/Y+/yG7zhRm2FWzG6iKQAjFgQ4aVfSlP
 231kJBG+6/h7zw44rzDt6s5ZOAmKGqFNcrGMC9McDxgxW+sXYvgbhJ7qEs2bWZrTDCKX
 Gw8Gps97XaFZu7AR4WZoIiYiBhl03zbo9flZrfm/IPq0M3Yq03xzhpILEHmnO+fH3V+I
 LwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=iS7NM8t0JXteAtsFzvuw/hZBQdN78Ado1uZrzwHlWbQ=;
 b=JLoxQY+wJKkuh9+Q539RYEwGxBYHfBLIExGGsMWXpwolgS8rXN8dV6j6oot5W4t6ic
 czxu80r5zSCRPBHkSsE/y/Ej9LexE4H14mHKkL+XaPlM3MQWKFHEyssgiu3V7pzmtBj+
 bBplOzPK1pTMzrJp59m6lSMKLGtQThhQpRnJHaZ//AGbNm+qisz37wKN/8rP/DxkE2KZ
 1SqbdoKuZY2D5Ox8Y1EfR5jIroeu7DQCr98e07w7ph67v74faNc+quSwFLnriAxmcAS+
 XhREdGblji0dAk302K/6R4dr1Zfg4GmLU74fND00qZSEXzB8CzQ5eGbsORPI/kCuR0iP
 /R4g==
X-Gm-Message-State: AKaTC03bhqYI/gSw93VM5AbJcstR4Jlhu1ZTYXPgCyefmyY/+ZeHyK6PdZGCGC6G/c6fBQ==
X-Received: by 10.99.66.198 with SMTP id p189mr40140226pga.30.1479787780979;
 Mon, 21 Nov 2016 20:09:40 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id y200sm35782467pfb.16.2016.11.21.20.09.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:40 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:33 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 6/7] arm: aspeed: witherspoon: Setup LPC to AHB bridge
Date: Tue, 22 Nov 2016 14:38:48 +1030
Message-Id: <20161122040849.31604-6-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:43 -0000

These values enable a 64MB window.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 55447123bf39..e64497a297a1 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -166,6 +166,28 @@ static void __init do_zaius_setup(void)
 	}
 }
 
+static void __init do_witherspoon_setup(void)
+{
+	do_common_setup();
+
+	/* Setup PNOR address mapping for 64M flash
+	 *
+	 *   ADRBASE: 0x3000 (0x30000000)
+	 *   HWMBASE: 0x0C00 (0x0C000000)
+	 *  ADDRMASK: 0xFC00 (0xFC000000)
+	 *   HWNCARE: 0x03FF (0x03FF0000)
+	 *
+	 * Mapping appears at 0x60300fc000000 on the host
+	 */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* Set SPI1 CE1 decoding window to 0x34000000 */
+	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+	/* Set SPI1 CE0 decoding window to 0x30000000 */
+	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+}
 
 #define SCU_PASSWORD	0x1688A8A8
 
@@ -200,6 +222,8 @@ static void __init aspeed_init_early(void)
 		do_ast2500evb_setup();
 	if (of_machine_is_compatible("ingrasys,zaius-bmc"))
 		do_zaius_setup();
+	if (of_machine_is_compatible("ibm,witherspoon-bmc"))
+		do_witherspoon_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.10.2
