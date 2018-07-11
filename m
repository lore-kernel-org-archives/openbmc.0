Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ohQCJ1bB"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS6D01KQzF35Q
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:59 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id i26-v6so6192406pfo.12
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZrXMLoLUk12UkJbWHlJbGIZleI5oAcCLDD19DpfzhDA=;
 b=ohQCJ1bBpjRh+NxUeH3A9NXH+upwdRV4XwWX0lNN0ta60bQz4W1W+hvDESfgbSnZDu
 KFBj11tVWcC84Kno3lA9ZR6P4Y6jjfSfVHVri6w5j+veR1zCBnaaM8s5K94Eh7pKr59D
 wkjCFUo6BUWRfNxvg0gu311FgYQlaWylfG8nBGvnk6RhdlYn02bj2lDo9ZKFtz1+HTd2
 ZvfFYSKhxKG6mn5ilQuHXCcGVtOq6cAW5JYHhxATuwzMJFrRrtQM8KlKw6Y9XLSJe+OG
 Thr3FrgseXj2pk8cSIS5qk6RJggEjBDTTFOiIUtYT2evCThtluV+buscILq0YiVya8vA
 7RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZrXMLoLUk12UkJbWHlJbGIZleI5oAcCLDD19DpfzhDA=;
 b=msiMwzs1czLIvERgfzx6ZAOoGuqe3FBc64z0qNXmsQ+tairOTe3jopK3eFmTwzmoC7
 uAyDrRLbWHlNpMprm1ei8ljordDe7P5DhIVa4iv6ZO7yCpVQOfdKBL3y3ADQzHgYSXsK
 6IDnIyuxsm20Eu6bHfU5GcGvnOdX7njUQ2b+CWe/IDnSr/4W50QCK31smHI3Oe5yBBu6
 H4BZiW23Z9yYeYIIrN9Jl4QOfF2tio5ptno9SQJeGDB9OxENi9d5FutWywUzUhJCZr0N
 JRTh8ThD+PWHfzXOZQ76rEh0nZe0R+GlwuLVyuVieozXvnmK10zsJZOLrBOE+Nzo7X3o
 719A==
X-Gm-Message-State: APt69E2fWRSfwA2ru5t44/ptXA8Diemtj5oWeiTh91t6HLLRG90ghdfu
 f0BQvQ7rWlw6D1bExee2TQoLkA==
X-Google-Smtp-Source: AAOMgpckEVe5bJ7h7v4ekGSGsYP9sMurmhyXxlykKjnOMaQSyzWUoDYHnRMD7vBwWty2AZU0MxTgDQ==
X-Received: by 2002:a62:9c17:: with SMTP id
 f23-v6mr28693338pfe.209.1531286338165; 
 Tue, 10 Jul 2018 22:18:58 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:57 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 7/7] configs: Aspeed: enable mmc host in
 defconfig
Date: Wed, 11 Jul 2018 13:17:10 +0800
Message-Id: <1531286230-28453-8-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:19:00 -0000

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
