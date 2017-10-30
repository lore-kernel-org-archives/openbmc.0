Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l4QU+lKT"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQTVS6h7DzDqMY
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 20:20:48 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id y5so11064027pgq.7
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6mCgqx8YPcBVNcyWon9O3M5jeDG6L3yjz+jyNy+1YE0=;
 b=l4QU+lKTJzihGCAUqKGAh6YwFL48+kSjgWs/xpub58WAmkM9ktD6aKkOduInIXQFB/
 rLemcu3fl/CqX/yD5HQ+M56iOYqT4jGXRv+w9aG2iNKUbH9Sb5YC3G3vU5oaLB4IUHwT
 bGHqLdgrtXgexOjTIOv3lCqitsO9k/Qc7wJtNFBGgsmQ+eBO4I0Fxk1KIbumJKyQDNFZ
 jLFuM//zgGba6NFk4w+knvwjAbJ/asADx9Vpj0ymLBsqmcWs+YrO8Mwolgd0GxTXSfge
 TmPctldLY6zxkERc/yt3Hs1/SZJEJOKEbUY6U7oMaS4BfTxbUW9GI5YyBkkFZRaIYjCW
 MDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6mCgqx8YPcBVNcyWon9O3M5jeDG6L3yjz+jyNy+1YE0=;
 b=WjqlbC+O2hSw+UvkUT4hyvwJ2noh4ZoDPHLF5Jj7e2FaUt1KmWvTRirNJp9UUZVeQ8
 UArkBGlmyqBtGi9VIgEK//3mxgyEUCuVLuVnLdWse+7UZ/hw7470VY6DcipkvAOoucQl
 nvQ+SsVipR3qpGXVSlgAJMGJMy/oJVTwuCjtBAUYw0Ogq+BKmSxrauSFG9KSCstQkbdV
 9yFqTKXOocbQblJM9xwxS8X2ZRsRar2xHsnPxuA8ghSSHbVpvCXspcnjipazHkHIJdi9
 AgifZpsfMV9ElvA+k57h/aldMMXOMem9QRgJV9vMUeFp3iBsNz9qzxuKDuihyRzRLXbp
 fTNg==
X-Gm-Message-State: AMCzsaWbEFlDXrZGS4HEJ8zQKhkR1N1kG/RoexrKvVyVGAt9FtJ4TIN7
 0THzvjIjxKEv7DAilwAp8XQfjdRR
X-Google-Smtp-Source: ABhQp+Rez8Wlc438BNvT6mdudd4j/9E/waeJY/LgndB6S2uxJC/eOOKbiaG6RgI0LJ2OG9XYNIHsAQ==
X-Received: by 10.98.166.205 with SMTP id r74mr8152139pfl.285.1509355246831;
 Mon, 30 Oct 2017 02:20:46 -0700 (PDT)
Received: from localhost ([204.110.13.80])
 by smtp.gmail.com with ESMTPSA id 77sm28018726pfl.133.2017.10.30.02.20.45
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 30 Oct 2017 02:20:46 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.10] ARM: aspeed: romulus: Add reset tolerance for
 power GPIOs
Date: Mon, 30 Oct 2017 17:20:14 +0800
Message-Id: <1509355215-28727-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 09:20:49 -0000

This is a similar change as Witherspoon, that enables the host to stay
up across BMC reboots.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index c84c871..5965bbf 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -196,7 +196,17 @@ static void __init do_witherspoon_setup(void)
 
 static void __init do_romulus_setup(void)
 {
+	unsigned long reg;
+
 	do_common_setup();
+
+	/* Reset tolerance for BMC_POWER_UP (GPIOD1) */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x01c));
+	writel(reg | BIT(25), AST_IO(AST_BASE_GPIO | 0x01c));
+
+	/* Reset tolerance for SOFTWARE_PGOOD (GPIOR1) and SEQ_CONT (GPIOS7) */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x12c));
+	writel(reg | BIT(9) | BIT(23), AST_IO(AST_BASE_GPIO | 0x12c));
 }
 
 static void __init do_lanyang_setup(void)
-- 
1.9.1
