Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s75ZB0dlLzDqQ4
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 15:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GLp/pP+9; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id i6so24355933pfe.0
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 22:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=MzVtXhGFCDsjYePzrbvWue1jX8WWhH3AjEUEICn7piQ=;
 b=GLp/pP+9IWtjTs2nswEzntA8dDABUI1wIzvFSRky5jpd0nyNIMgI9PEM/FGxmfoj2e
 ka+BCWdOEicENGiFuDKl4c2RYdd/rLF/7Pzh14h8EZb8qOHHTM5CbQR2hq2Y9GN7tbm6
 rCT4Ncd3GBZ9c6asho4YVQA3w5VGnOcYaPXQjMjcTHFOyl9YSSavyYgOOOnksLVi9N3q
 wJvFa8xORZFeSvWRQETdaau/sQRbjxho+3GfVKG4Ex8vhgUsUXYXm8e519K7f033sLOq
 Bom7ua1+dU3LLbeJu2imzLUXQ0rzsi39gXqPaHzHyZWsBC7vfKD6KXwbjUYVvRvsspKO
 b9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=MzVtXhGFCDsjYePzrbvWue1jX8WWhH3AjEUEICn7piQ=;
 b=EUy2LSbvQ6L4gG9/jawchrH5uRgnxgBHK8ydVJZEkf/KO9RpKh8mmoDVDQ6bXQAJFS
 wszY5Exwsg5sCdjYfWQYbyDR5CuQ8Al51MWTvwbxKV0hFX4HjakY9dIz564W/3GyGxtQ
 O/uoy3twOs8GoVa/P6/EqlkTdKwNg8R1jw18V4t1A7bxtzeQ8W4/+I0O7a/vui3I4Mqn
 hcCZUUopV1r9dNS+WIqqfAkIA7f2dl3NpnWab49Oq3MCLfmehS3XmOrh7pMOTGIjE988
 6cJmxR3W+MyKDS6HA91pWpyQAeL/Tqm0qhNfVd14fjlObyKPNj1B20DObaXtQCtKrsw1
 uxkw==
X-Gm-Message-State: AEkooutVWXhv9/hBh2zvzHMiHIU9bTgkv8nYZfNhPp6dqrG3YX7hC0rWP/0cb0Qfm4ZAWw==
X-Received: by 10.98.60.217 with SMTP id b86mr159979000pfk.129.1470634160221; 
 Sun, 07 Aug 2016 22:29:20 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d3sm44196876pfk.37.2016.08.07.22.29.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 07 Aug 2016 22:29:19 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 08 Aug 2016 14:59:13 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [linux] arm/aspeed: Reset AHB on boot
Date: Mon,  8 Aug 2016 14:59:10 +0930
Message-Id: <1470634150-17291-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 05:29:22 -0000

The Aspeed u-boot port from the Aspeed SDK performed I2C initialisation.
Part of this appears to require a AHB reset in order to successfully
access the I2C registers.

So we can boot the stable kernels on systems with new u-boot we add this
to the stable kernel tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index fadbbb666e1d..1102b896cab0 100755
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -200,9 +200,14 @@ static void __init aspeed_init_early(void)
 {
 	u32 reg;
 
+	/* Unlock SCU */
+	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU));
+
+	/* Reset AHB bridges */
+	writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
+
 	// XXX UART stuff to fix to pinmux & co
 	writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
-	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU)); // UNLOCK SCU
 	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
 	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
 	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
-- 
2.8.1
