Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::22a; helo=mail-pg0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="giQ/xh8d"; 
 dkim-atps=neutral
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41F5St65sfzF1Gj
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 09:47:42 +1000 (AEST)
Received: by mail-pg0-x22a.google.com with SMTP id b10-v6so3086491pgq.11
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=rYVn0gEao64PhOFyhG0pNZITmvh8yKv2CsmIOjRXE+Q=;
 b=giQ/xh8dQD48NnsBbO3XhQnptDCmoIZ96oQRdCH8GAkwvaRCQwkFrT0EqzudZMqnvr
 wRKGos3TNoDmZeRiluObozxfX/YICjCMO3RSln/LigpLTvOWbmpnzuZXBvyXb1ymoTXQ
 ZQKTTgEmi1a5Nxg0ha64fGIvdMAk30fVddhiTMjMMHxokreWABVy2jo1DJIpUC8ixOE7
 6srFT9E4xROpz6J4XDzd89N7d6KomTl6j82RRRjUI2viPX7V+/HdKqy8tXE02VYr0hZe
 N6V/vcKzZISR57xJCz54rPoVFuuH0WuL7OkHCS72THbIr6S1SWHmI9egpbI8f8QK/vUW
 FuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=rYVn0gEao64PhOFyhG0pNZITmvh8yKv2CsmIOjRXE+Q=;
 b=E05slNxT5ogTSQuFcAgCCtMXH4x71Ofh16hWSHS1zZM8VphHB5s/XUi3oxeaW1ZHMB
 X//n1HM+GjWS5SSLpFAGSVGCG2qVXisfyYThpnO7JTiVEFT43RuOsq9AW4xb5lmXVVFi
 iUJgr9+gOwCM7M5WxUQH8RpGUPhkxs6oHZHfDgjNziTdNStuxkJkpa/MGj+8R2emB2F7
 eO3ut4TCSHmV1WcbPBDZyRrVBuK1SAuLkkJVHUXZUlB/xvw6ESOOL+HgTGXLZY8Wlb3N
 EwsGHNTJuYXsobZQZrxNvMxjxYPjzKyMsf7NSL6OSF2F61mkx3uXn5hAYyp4C60aPX5A
 V5Yg==
X-Gm-Message-State: APt69E2qi9pdz2/+D14HIwQ1zSsJIWFiWPy5ExtirpPzfrVNSEiXWgke
 Ga8XzwuZIe55wZPRfAbZWKhPFJbi
X-Google-Smtp-Source: ADUXVKLYYq5jZaLrcL5666EnsWbNy/6JRo0ajFZ6izjSX5KVrkSEsF4WZbpbtcee8eh0pX7X29bO9w==
X-Received: by 2002:a65:448a:: with SMTP id
 l10-v6mr7546651pgq.382.1529970460114; 
 Mon, 25 Jun 2018 16:47:40 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id w7-v6sm133701pgs.68.2018.06.25.16.47.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Jun 2018 16:47:39 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 26 Jun 2018 09:17:31 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17] ARM: configs: aspeed: Enable BLK_DEV_LOOP
Date: Tue, 26 Jun 2018 09:17:31 +0930
Message-Id: <20180625234731.6455-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 23:47:43 -0000

This is required for the updater mechanism used by OpenBMC.  Remove
BLK_DEV_RAM from G4 to sync it with G5, as testing by Lei suggests that
this is not required.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g4_defconfig | 2 +-
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 6b3f897892fa..0f53291a33e8 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -79,7 +79,7 @@ CONFIG_SPI_ASPEED_SMC=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
-CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_LOOP=y
 CONFIG_ASPEED_LPC_CTRL=y
 CONFIG_ASPEED_LPC_SNOOP=y
 CONFIG_ASPEED_LPC_MBOX=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 73efa17cbeb1..a458c7eb32a0 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -79,6 +79,7 @@ CONFIG_SPI_ASPEED_SMC=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
+CONFIG_BLK_DEV_LOOP=y
 CONFIG_ASPEED_LPC_CTRL=y
 CONFIG_ASPEED_LPC_SNOOP=y
 CONFIG_ASPEED_LPC_MBOX=y
-- 
2.17.1
