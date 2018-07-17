Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RgQsjoRF"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBht0fVyzF3Hh
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:29 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id l9-v6so71664pff.9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZrXMLoLUk12UkJbWHlJbGIZleI5oAcCLDD19DpfzhDA=;
 b=RgQsjoRF/zWmBnUgLtWUtw7oprYawtQ4L/oglQiK97YRdf/h4wfJV9zZi/LjC1ISPx
 x9uZiwBqTP9tQKJm8EKOY3g/1vg0KYZDKOX3TLcfOka0f4uecwfldsw3AUJN6LQ7d/16
 P7J7jq7TX+K9WwUZkznscRDl64N82ZmuiYl11Ei4i/Fy1tPKA0iI7vw9ZbmaqFEyBPnB
 EP8SZZG5Cto2PMAo1UPK7V+9ccUuCZaNisWIUmRZZd2xgqCwagMKqG1ydvf2PMZUfL0y
 L/XKvlHQyA6Cs5jxXAXAdwTVjPC69r+4PY805YVfOViYpsRvYF+QeobZaBQTDPqR4Cr7
 g7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZrXMLoLUk12UkJbWHlJbGIZleI5oAcCLDD19DpfzhDA=;
 b=l58pFDjjEMZEr0HxOgYiLtcVuVfMdlY74xWHPBWQwnoIpdqhervXoh1zhj2HOxswhB
 SX6mzp0BwnpxDmB5oeLPSZ6bLbfhZFljS4fn5h7TQXAZnfrQUQAN52JUchJBy05SLmZJ
 YmvRTY18a5RiJE0LrecE29Xp7npJ/8XuUcupVTXUjlilH8kFHXRYOBV1ioE0UXpQ2DV9
 8aEuEBxal4mdnP4oy3oay7NFjO/CG4j2R594hUT1XQN+SApQSLdt5Iaw5eisu24JwcI9
 K//EAnFps/QVdmRJJXbGjzTjsyNuIEZM+1z0C8CAbECMLWqEhuZdFzjbIrOMB8CK96cE
 FKMg==
X-Gm-Message-State: AOUpUlHacReNibp24Hr+nvsAYqtkspUQPYbT8t621QTU30Q0vjqqSEiA
 WDH1X34ZPdGHhhvyg27AXS/65Q==
X-Google-Smtp-Source: AAOMgpez7XRdESwRNE2cjJiibeUG88yODRcOC4TBr+jdYOQPuksyxfE2RpNjayi0mpgj5TL+6XBHpw==
X-Received: by 2002:a62:41d6:: with SMTP id
 g83-v6mr505798pfd.219.1531812507780; 
 Tue, 17 Jul 2018 00:28:27 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:26 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 7/7] configs: Aspeed: enable mmc host in
 defconfig
Date: Tue, 17 Jul 2018 15:26:18 +0800
Message-Id: <1531812378-14316-8-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:28:30 -0000

Enable mmc host in aspeed_g5_defconfig

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 arch/arm/configs/aspeed_g5_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index b7f8fa1..7b99aa9 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -197,6 +197,12 @@ CONFIG_USB_CONFIGFS_F_LB_SS=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ASPEED=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
-- 
2.7.4
