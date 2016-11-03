Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t906M29dzzDsyc
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:30:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=S2Dnr2fa; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n85so5954804pfi.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=JK50jZFcDiyNiag8QNi4TsyXpDVutUI0piiJQnjyohU=;
 b=S2Dnr2fa/RP0Oan0A0xF73TZUfkRvOR5+24Z3hz8lbJlQomfWcix5sL93niXiMtHyi
 EoKl8i5Q0fPolg/VnJTAdaJ1AEsGjVbnogixqlrmRyTY/YzMmtHb9SrI/cnzDk8IlPZK
 aJhu5CnHk5tzvD75mi9jBgN4iOf6sIIZi/WKhou+A1h6WYhKCc8vYKvnLdyqj55n9/CL
 7OZcjOYcn4qG1356SKPlMfnN9obmE8Ts89bFULHyHPwYjS8EnTpPaciQhlp7ZuYTr9zd
 MaLcTdG10528QT9LBSLT3ODXorJ5h6ivLmLtxucUtbji8qvD+LymEMcWg9DU4v2SwWaK
 wFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=JK50jZFcDiyNiag8QNi4TsyXpDVutUI0piiJQnjyohU=;
 b=ChLw7s6t919vmeH+AZE1QACWvedwhMMODOAl/1Ot1fDtsf0myQYgulvmSZ4kGSkNut
 uP41Nz7pLSgiBnj3/EG378rtSbtVwDjEQ58tWKELiP/eVHe8GSji3HQpcE+GPw52V4nr
 WDk86yt+yblHOWelmtkdPA0ILkfuX5PDmUSpmWL161jcvX/fD0hXz4V3kPbjiBJ8ojdM
 7fGgcD/1AGJvueNJJesrQ7ZAtpb+ybHzRCaRLZMSCDrZfsO40dsLQi6mimV37al9u6Ip
 oA2P3Jgun7dUKTOmauG6lw+UXZb0GSTj+qgE7mULKNWABqC8h8dht7anikXve4OAgfPg
 IuCg==
X-Gm-Message-State: ABUngvcxJziLy82RVHSTtC4o2zv8qNC2tcvPcTxn6Tn6ZdHNhzkMrdeUJMjGOVO4zmsPkQ==
X-Received: by 10.98.24.136 with SMTP id 130mr5894787pfy.73.1478212233697;
 Thu, 03 Nov 2016 15:30:33 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:3922:4bc4:ef17:3570])
 by smtp.gmail.com with ESMTPSA id p6sm15058168pae.16.2016.11.03.15.30.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 15:30:33 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 09:00:25 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH 1/4] arm: aspeed: Remove MDIO hack
Date: Fri,  4 Nov 2016 09:00:06 +1030
Message-Id: <20161103223009.4794-2-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161103223009.4794-1-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 22:30:35 -0000

The ftgmac100 driver now knows to configure the new MDIO interface. We
can remove it from the early init process.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 57c32ff0fa83..202bf3d9d467 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -146,13 +146,6 @@ static void __init do_garrison_setup(void)
 
 static void __init do_ast2500_common_setup(void)
 {
-	unsigned long reg;
-
-	/* Set old MDIO interface */
-	reg = readl(AST_IO(AST_BASE_MAC0 | 0x40));
-	reg &= ~0x80000000;
-	writel(reg, AST_IO(AST_BASE_MAC0 | 0x40));
-
 	/* Set strap[13:12] to 01, Enable SPI master */
 	/* Set bits in writes to SCU7C are cleared from SCU70 */
 	writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
-- 
2.9.3
