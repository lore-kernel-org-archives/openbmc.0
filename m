Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGc4G38RgzDq9m
 for <openbmc@lists.ozlabs.org>; Mon,  1 May 2017 17:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MWhKcMPY"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id v14so26858046pfd.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=VRddJnx0HldSsgSomGXQFtsONICy7RMbxs4apIzwhY0=;
 b=MWhKcMPYZY8rv10rRqiWvxgypIRA3nKvrZrp8BClnjPwMhrhMNWCQRM4lXfPnzw0ET
 RCm6OgEHJqTOrT3LcrGy6dzvC70YyAgMsl8/5luNP6Bz8iEbdEjHd4Om7hyowiZHQhS7
 vsaHfg64WRYgbljmEytnR99exqk41v7ahQF3G4REmxEXVkQ6hbw22zV7tXKBHqr2rFof
 /1IU/GbctZKhMSou6mwYUbIoZ0j7lpCsXYi3pphB6LcXNrce/COEusMlaKdfNFxuK1n3
 NHDZ3/58qA+BlJU6H4IMgI/l5axug/eM+zbA9wFRi9kBNtxqoo40ZAewp2J3zwUm1dq3
 WDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=VRddJnx0HldSsgSomGXQFtsONICy7RMbxs4apIzwhY0=;
 b=KVpP157SNE736Y9bUl3eHK7p6InOOgqbvHfOBcWnGHZtElLjfbZ5rIZfexgVbQu6ev
 nIU9Ecv5oL1nbZpNrN0ZiHO33JkbY/0DXg1sSc07xt++AcJYhTCUz+0NWCrJA/P1ChvV
 rpj7rnmkt8VSdhVnBJuxJxzPE38Nj7oSQvWc+hk/50yFuYrmWWn6XCCYjk0joI7f8WaF
 /BQB7BYdduJvUpInfzlnq8tdamioXV3ajU0Kz54n79elIxvS/M1RM1mNokIVJCFzPCHh
 EFk+spyvWV5TUjMaVMaIK+5ZkO0Ex4i4rRaT/OO4GMsbOEXr7UC+Yu1Iqj5sfh8x1Jr0
 6P1g==
X-Gm-Message-State: AN3rC/79p7bOcUu8JPwnKseWwpLoQuqHX1lEahGM7pwUUCksMWPxBAAr
 MFe7dDV1SG9EEA==
X-Received: by 10.98.217.137 with SMTP id b9mr25031008pfl.136.1493624923643;
 Mon, 01 May 2017 00:48:43 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id w23sm23002956pfl.133.2017.05.01.00.48.40
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 00:48:42 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 01 May 2017 17:18:37 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7] ARM: aspeed: witherspoon: Take UART1 out of
 reset
Date: Mon,  1 May 2017 17:18:36 +0930
Message-Id: <20170501074836.14814-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 01 May 2017 07:48:47 -0000

This is required so the UART can be used before booting the host.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This is a workaround for manufacutring.

 arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0717181cc890..d2ffcf4c2c93 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -216,6 +216,14 @@ static void __init do_witherspoon_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+        /* Disable default behavior of UART1 being held in reset by LPCRST#.
+         * By releasing UART1 from being controlled by LPC reset, it becomes
+         * immediately available regardless of the host being up.
+         */
+        reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+        /* Clear "Enable UART1 reset source from LPC" */
+        writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_romulus_setup(void)
-- 
2.11.0
