Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNWWW4DX4zDrgx
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 11:43:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ftfremqb; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id vy10so273892pac.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id;
 bh=6GppgCzGVmyWM/6Q/7BRBsj2R+9OWI4Euox1b0IhJB8=;
 b=FtfremqbpskydhNEz7c0WkYzFBovgqVBg7daioH3Oh1BDtMfWA2JTZrBA9btoWcdIU
 Jy6kl/aSRIxZ8r3jZsUbIvG8jswuGfG8Q8AXXAQUTCnXHfjEYpSl3qvOmS5svnzGUbml
 0PLvIo+hm5rwq6Jq5zp904hf0NvoOEWqrBc4O4QVsf7ZB7W6/x2+wADsH+YTd4h4ss1e
 FQ/ZjBb1m76OGF/LbP0Ji1WkzZTI3J3BM9Q/omZk3WvceIqvgydySbwltnbdsS5qg6fK
 QecqHOgjeg7BWfWGee6iZR3M+JktTuXuuOteZ0gSzvkIKcKVw8WVP9It4kZT2JnF4rEM
 PFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=6GppgCzGVmyWM/6Q/7BRBsj2R+9OWI4Euox1b0IhJB8=;
 b=bCRhZiF9moLZAWiCbCdSWuMMF475vyrb+BILREnVl52emzFZwEHB7FOOGLdgQ59b7p
 PSt3M0mqdWTNphxKvhFtfQhJVJtryjboTpmir7NFObv1gwfTiJF0hSTADfDf14AYXAPK
 LeRTppMCnp6MkzEn6VFhX1LXTLhfOy+sUCwbVUWpzZZGXoWlavYcCuHj0hsbEP3Giuln
 kHPQAkMEzVGfEd4tR/pA018nGMYFmqxfF5diH8oJMNI74Xud2JWAOg4nKQrYWVCiNbBU
 Rxf++5VybDQPew3h+zYbmDNWA6aCjoTfQNAzE2QdEpEI+JO96aitym5uAK5JuAL+qUCe
 1s8w==
X-Gm-Message-State: AE9vXwNKKx393Bf5ZE8bX8rCg0eEb5j5LdBq8WlPKLk/SScm4ObU60z9YnoANy1egI4Low==
X-Received: by 10.67.7.170 with SMTP id dd10mr1803271pad.152.1472521412456;
 Mon, 29 Aug 2016 18:43:32 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:b1a2:bd57:435c:ee82])
 by smtp.gmail.com with ESMTPSA id g21sm51989696pfj.88.2016.08.29.18.43.28
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 29 Aug 2016 18:43:30 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 30 Aug 2016 11:13:24 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] arm/dts/aspeed: Alias vuart as ttyS5
Date: Tue, 30 Aug 2016 11:13:18 +0930
Message-Id: <20160830014318.26711-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Tue, 30 Aug 2016 01:43:36 -0000

OpenBMC userspace expects the vuart to be at /dev/ttyS5. The userspace
will soon use udev to correctly identify the vuart, however for now we
will un-break existing images by adding the alias.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Boot tested in qemu as the witherspoon platform. The alias appears to work:

 1e787000.vuart: ttyS5 at MMIO 0x1e787000 (irq = 19, base_baud = 1500000) is a 16550A

Needs verification on a real system.

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts   | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts    | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 6ca618bd331d..af1ad2810f84 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -9,6 +9,7 @@
 
 	aliases {
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 2ec9e4450515..321ab1127843 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -8,6 +8,7 @@
 
 	aliases {
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index a4471fb3b36b..5a1abf550961 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -9,6 +9,7 @@
 
 	aliases {
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 21619fd8cd8d..f705847625e7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -9,6 +9,7 @@
 
 	aliases {
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index fcc880a80ee0..ab205596c6ff 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -9,6 +9,7 @@
 
 	aliases {
 		serial4 = &uart5;
+		serial5 = &vuart;
 	};
 
 	chosen {
-- 
2.9.3
