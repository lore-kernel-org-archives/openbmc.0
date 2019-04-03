Return-Path: <35jSkXAwKB8ssv40r3z4wrz8x55x2v.t5356v4s3t2z9A9.5G2rs9.58x@flex--benjaminfair.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--benjaminfair.bounces.google.com
 (client-ip=2607:f8b0:4864:20::a4a; helo=mail-vk1-xa4a.google.com;
 envelope-from=35jskxawkb8ssv40r3z4wrz8x55x2v.t5356v4s3t2z9a9.5g2rs9.58x@flex--benjaminfair.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DvnADh6s"; 
 dkim-atps=neutral
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YtFt1dD2zDqFD
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 15:22:01 +1100 (AEDT)
Received: by mail-vk1-xa4a.google.com with SMTP id z75so7428832vkd.2
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 21:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=LyjH/f743G58PT+FcjGvXuZZHM7ot7ocEx3DQTHM658=;
 b=DvnADh6sr2VXZ0YvFMBado0ADjhBNsTJGcj5iDgE6CL4piHBT16PurZxNxJvzWEFVk
 qN+4E5H5velLXbIfTb5K1LGzi52bIT6m/R4Eom/gaIZ5kmY8VLxBdRM+iQxRAEzX1Xhs
 vo+UTeRY2Zg5tlnqm+TVOZe/pjAfeLPKmjEqb/cpUse6QxGSiajS1rR129MiRzAG+Mo4
 Hd9quD1y851UqK8Ff7sQp8AWfrwMNJ9ct8d0JK5aKmc3soawg10nv4IkpjgOSo8mFWLU
 Ybe1M6DWzgL4lD8zeI4WyBUW2Onpd4Wmsiqruh9owPq+109EIzj3XpKluu+Gn7Nhwubt
 0VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=LyjH/f743G58PT+FcjGvXuZZHM7ot7ocEx3DQTHM658=;
 b=IsAc77rhwJYs4bC4b+1EKZfHG3m0vUsbjhK2A6byj0mzJ+I12PAFr0sPX+e7UzPgq6
 vwcBRcbRbm8Hzg8nD0YcXx6na6ddcSXuPLncrI15to5RL6A06cRjnOiJ+HcCg4n475c9
 HssNSZDwNR8gOMboUSVEUjcHHUJDtepfQLcEQMGZa75Wqw/E5U7d+oEywdccFJGTRBaM
 LeiDBFpyhdHm0ZaxAWYrOcVoqx9CzIws7a6pJ9QoVeChMl32+Azgjx+4ZMDd4PYVH+wi
 bxOPtNio+zsVqszk/8C4XOaUD9DV/k+hpo35hz0P5MekIk613kfk/IVFZGvvNx6PLMA1
 qohQ==
X-Gm-Message-State: APjAAAXytcSNDvwhMd/zCj0T3ZN13MYymhv5yGCq6Kvu0tLF0TLn4blP
 rtAvxFz0TWiwaQ9q7Fm93lBe8+24//bbrXAEuW0=
X-Google-Smtp-Source: APXvYqxOOTuQr63BDdwKvTlf7SFIOESPUULaAPvnYLL2szYNx75Kym8zo7NmxMbP5DRJCV7XR65zHhZH7eL15mEvAuM=
X-Received: by 2002:ab0:2856:: with SMTP id c22mr9600066uaq.13.1554265318200; 
 Tue, 02 Apr 2019 21:21:58 -0700 (PDT)
Date: Tue,  2 Apr 2019 21:20:52 -0700
Message-Id: <20190403042051.105948-1-benjaminfair@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0] net: npcm: use bitmap functions on link mode params
From: Benjamin Fair <benjaminfair@google.com>
To: joel@jms.id.au
Cc: Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, 
 Tomer Maimon <tmaimon77@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 04:22:11 -0000

This fixes a compilation error caused by the phy_device "supported" and
"advertising" parameters switching from u32 to bitmap.

Fixes: 35998b5c4073 ("net: npcm: add NPCM7xx Ethernet MAC controller")

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
---
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
index 3615e227545e..efb441d511c5 100644
--- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
+++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
@@ -1829,8 +1829,8 @@ static int npcm7xx_mii_setup(struct net_device *dev)
 		goto out3;
 	}
 
-	phydev->supported &= PHY_BASIC_FEATURES;
-	phydev->advertising = phydev->supported;
+	linkmode_and(phydev->supported, phydev->supported, PHY_BASIC_FEATURES);
+	linkmode_copy(phydev->advertising, phydev->supported);
 	ether->phy_dev = phydev;
 
 	return 0;
-- 
2.21.0.392.gf8f6787159e-goog
