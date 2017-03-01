Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vY1FK6wNjzDqKJ
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 14:31:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sa1q2rD2"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id x17so4157352pgi.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 19:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u4q5rtG98IfimxP7o9Y+vtakCqIMDx8nU0DVYHR8jPg=;
 b=Sa1q2rD2wFdzr7BC3fOOZaq3YZM4LzZQY/tsuAMZ++N8dCIQXoqKKKwPvfXdJguszc
 vRKOBL/vXeg45LupnpXtlj1B0sbBUmFUr8Qhg+nQvrrEqIyv0uVSQAnEd/gjlm9DZclG
 nkRKDU/EIsGYmnI0IyQb/AlnYvWYXQiT4VSDvdt28pxedLQABD8yqvbT+fUAcgfj8BqW
 zQDc37ziKQMnb4x0vdnWLsEcBb63FvSTgdwPILCt71zR+iEJh3spblLZ3slpgES5BDwJ
 WJYtvf7+D7K48G0zoaWcOQly7sraNbeHDOZa/NqezZnACGxZoH5gULyN7q2Dnb2fr3w1
 AjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u4q5rtG98IfimxP7o9Y+vtakCqIMDx8nU0DVYHR8jPg=;
 b=N8rEh4cVXGqMI3GiQ1SrAQLDcrhOHpBgKXyjz9XPmxU8yKzah4ylvc034W7l2w33TW
 Y9gQBB5Ic2mrA1vnWBL69iE+GcFDr+kgiiUEELerj2yN4uvLnTW0uhQyhVtHDdqCB8gI
 Qb8vMdM2aSXVR20RTaoIU/FcjhAZzFdXHD2+SPOY/QdEYCmbydMFZ6WHqr8UKerJmJig
 aH7jXK1aM4rrSusN+m6EsfHv1q3IVQEkjJulbmdnIIUMCTG76rlfAYxXpjrzBkiRPG6C
 JhWQerrVR7/hrQsSSL1+C/RGmqxRA/QsA/o7cWikLgyx+ujAxFs033gXVAKCzzj2KmcD
 xSfg==
X-Gm-Message-State: AMke39knDaJTerQ+jGKMH4fJ9EzhhXUNhdRoZNMlYp9KnU8nq/jspKkSsKkVd3g7RbYs4A==
X-Received: by 10.84.143.1 with SMTP id 1mr7323952ply.81.1488339075869;
 Tue, 28 Feb 2017 19:31:15 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id b70sm6743150pfc.100.2017.02.28.19.31.14
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 28 Feb 2017 19:31:14 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.7 v2] arm: aspped: romulus: Set PNOR SPI address
 mapping
Date: Wed,  1 Mar 2017 11:29:50 +0800
Message-Id: <1488338990-2365-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1488337524.4258.9.camel@aj.id.au>
References: <1488337524.4258.9.camel@aj.id.au>
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
X-List-Received-Date: Wed, 01 Mar 2017 03:31:18 -0000

The PNOR SPI address mapping is the same as Witherspoon.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 726b8fa..7ac006a 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -221,6 +221,12 @@ static void __init do_witherspoon_setup(void)
 static void __init do_romulus_setup(void)
 {
 	do_common_setup();
+
+	/* Set SPI1 CE1 decoding window to 0x34000000 */
+	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+	/* Set SPI1 CE0 decoding window to 0x30000000 */
+	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
 #define SCU_PASSWORD	0x1688A8A8
-- 
1.9.1
