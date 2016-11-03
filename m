Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t906V3tfQzDvWh
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:30:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QnHCv70C; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n85so5955076pfi.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=VZjmt9z+5bcRp6OFU4NDUAM/L9ghV5YvYt3UqQ5lkdA=;
 b=QnHCv70Cpxc2+GrIWst4xoVW0G6DNMfITwI+kL43KtTIMSFcxZCNy4e1CxWKQnKLqj
 rExFGX4qlq2vwQLHW+5sptFphGxcYPESKUKuf6UUSF3e4aRSTAJCtReJxzlV6P/Rfdv3
 PKtlRpCF0o1FD9HEDfPCMXrRzWJ2RlL488+IiIFznVNQlPHraDuFPtOu5Iu+4CHsbhC9
 0lvFhe0mA5BFj+pL/Kb+0MVCt7oODqQMvXR3cJ9imeiYUKVdVA7Yfo3bLKiFBnlPu1nY
 8EwiYbBhWXkANGlhVX9hunAPCm7a1YGbQmeG9Hxg2ywIRM5P2zhVL/qnr2ORQCUt8eFH
 tMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=VZjmt9z+5bcRp6OFU4NDUAM/L9ghV5YvYt3UqQ5lkdA=;
 b=QQ0ydRVmbl6vVNjvjpjvnubt8eV9V9bmV9ByzuuH/fVbkqe6gBPO6v6M4b4+NRry5i
 wBPQsRpMzBuMSw1Nqh6Imw1hfrqlDpwhmNiK5wme7ddS7mp4oUOx3EvGp3o0K9veaHfR
 7A9v2kfxSY5+hjeGHmyOy+kCyC8FPQLp//T0V3JMVP6tdApV3lQcpeleCKE7LZJqjyuR
 c71VPV2+FyTHGapceF3p5qoU5OsIomuAqPWuJ1a8P2yLpyG/KxjQ3/HOcCQSDWmtXRf7
 dsgpT9QVbp/lCsMLbIztR11on9wECjV13VB4TjirF4XdxHo8yEiDtuG7keQIxYF07W4N
 V84A==
X-Gm-Message-State: ABUngvcyk5m6V2Z2jexD43vOhG6ZL6wor3Tln8O+zy/UIIfUvSC5JJRAr57ln4hPbovtkg==
X-Received: by 10.98.160.140 with SMTP id p12mr20648748pfl.122.1478212240953; 
 Thu, 03 Nov 2016 15:30:40 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:3922:4bc4:ef17:3570])
 by smtp.gmail.com with ESMTPSA id z3sm15006247paw.48.2016.11.03.15.30.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 15:30:40 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 09:00:33 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH 2/4] arm: aspeed: Remove Palmetto SCU hack
Date: Fri,  4 Nov 2016 09:00:07 +1030
Message-Id: <20161103223009.4794-3-joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 22:30:42 -0000

The Palmetto would write the following state into the SCU, which is now covered
by pinmux:

                         Enable MAC#1 MDIO1: 0x0
                          Enable MAC#1 MDC1: 0x0
                    Enable NOR flash ROMA25: 0x0
                    Enable NOR flash ROMA24: 0x0
                       Enable flash ROMCS4#: 0x0
                       Enable flash ROMCS3#: 0x0
                       Enable flash ROMCS2#: 0x0
                       Enable flash ROMCS1#: 0x1
     Enable NOR flash ACK control input pin: 0x1
           Enable BMC IRQ# interrupt output: 0x1
  Enable BMC IRQ# interrupt output polarity: 0x0
                            Enable Reserved: 0x0
                               Enable VPIR9: 0x0
                               Enable VPIR8: 0x0
                               Enable VPIR7: 0x0
                               Enable VPIR6: 0x0
                               Enable VPIR5: 0x0
                               Enable VPIR4: 0x0
                               Enable VPIR3: 0x0
                               Enable VPIR2: 0x0
                               Enable VPIR1: 0x0
                               Enable VPIR0: 0x0
                               Enable VPIG9: 0x0
                               Enable VPIG8: 0x0
                       Enable PWM7 or VPIG7: 0x0
                       Enable PWM6 or VPIG6: 0x1
                        Enable PWM5 or VPIG: 0x1
                        Enable PWM4 or VPIG: 0x1
                        Enable PWM3 or VPIG: 0x1
                        Enable PWM2 or VPIG: 0x1
                       Enable PWM1 or VPIG1: 0x1
                       Enable PWM0 or VPIG0: 0x1

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 202bf3d9d467..cfbd6d3b3b73 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -115,9 +115,6 @@ static void __init do_palmetto_setup(void)
 	/* Setup PNOR address mapping for 32M flash */
 	writel(0x30000E00, AST_IO(AST_BASE_LPC | 0x88));
 	writel(0xFE0001FF, AST_IO(AST_BASE_LPC | 0x8C));
-
-	/* SCU setup */
-	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
 }
 
 static void __init do_firestone_setup(void)
-- 
2.9.3
