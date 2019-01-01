Return-Path: <axel.lin@ingics.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ingics.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=axel.lin@ingics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ingics-com.20150623.gappssmtp.com
 header.i=@ingics-com.20150623.gappssmtp.com header.b="El2PiEnW"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Tbh84CdXzDqD1
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jan 2019 01:11:16 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id y1so13514927plp.9
 for <openbmc@lists.ozlabs.org>; Tue, 01 Jan 2019 06:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=9KPwdGFUYdkvNG0Ezhe7BWu8nYhpJ8F+NYDoLekHp2c=;
 b=El2PiEnW3HTxwY/GwuvVnSw7FuPS+NlPtX4GY6VCAmKX8gMogT5lxS3DJLiXJzfrh7
 XsESiy3QFCMPq96roCynGdtbSOUmhHo3OV7hpjFVXk4EwGbVhuxK+3G9bACq+EB5CYo5
 MaiaWLcu/GXmVoWduJHb2pTKVH4EAdkyr0FWhIqFMaa9vPfTP4lx4H7TJy4xdHGBSkpF
 BwZy9YUaBjs8rBYuo5ZQrljNl0Vy8hzfVu+QjKWNrhV9DlzN7U2Um1gL8HC/67HqMYFN
 rpqygg0KltREfI1PAYd02j88cKZpBubkgmYuoFgvfEAc256r1ic7IndwcM/jku850lnb
 3Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9KPwdGFUYdkvNG0Ezhe7BWu8nYhpJ8F+NYDoLekHp2c=;
 b=qzxxoXZ8qrxTntLQQnKTso4lUm0Cnrit+w3LS4OMTY0EUPWqTsFQ7zmQxPIw2qsLvC
 +AgPTs8WBX11KADH/RemRHmWCcfwycDUK6FVEe053+HkKYOOvknePrrV38FiMeVNh6v+
 d1XtaqvYs0nF6vsPenMfnKy4n4Uy7Bz9W6GVy0Vl1jg1WLIrIApZEfBj3GVNi3S7aW24
 0Hke8D4UXwaxg5sDnDjjQOAUcJXdZiGHazIm+bhMy+eY9zFXgimmRgCwiyyZIN00dC5R
 BPcbhA3uCw8LMefzywDZtfuCOYE2GUuodoK+9NwgqhO6ck/eNa5FcLKo5rWfWv1rU3ZL
 dTFA==
X-Gm-Message-State: AJcUukeGHG+EdxTR14AF93yS67ytp9/K9KRUDoWLM0eEenhcWsaJmIiq
 RevaHbroB8wUE9wFBA31OQNEOA==
X-Google-Smtp-Source: ALg8bN47sQAmPfAaoThjTldEL/M+XBcRsxjlzCB3Rix9007dlcHsM7FnyQyQWSLrn9gWkvj+Bn2ArQ==
X-Received: by 2002:a17:902:f01:: with SMTP id
 1mr39404917ply.143.1546351873759; 
 Tue, 01 Jan 2019 06:11:13 -0800 (PST)
Received: from localhost.localdomain (36-239-205-119.dynamic-ip.hinet.net.
 [36.239.205.119])
 by smtp.gmail.com with ESMTPSA id h64sm77544556pfc.142.2019.01.01.06.11.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Jan 2019 06:11:12 -0800 (PST)
From: Axel Lin <axel.lin@ingics.com>
To: Mark Brown <broonie@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] spi: npcm-pspi: Fix wrong priv pointer
Date: Tue,  1 Jan 2019 22:10:53 +0800
Message-Id: <20190101141053.3792-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 02 Jan 2019 10:25:34 +1100
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
X-List-Received-Date: Tue, 01 Jan 2019 14:11:22 -0000

In npcm_pspi_probe(), current code set platform_set_drvdata(pdev, master);
so in npcm_pspi_remove() platform_get_drvdata(pdev) will return pointer to
master rather than priv. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/spi/spi-npcm-pspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index e1dca79b9090..734a2b956959 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -465,7 +465,8 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 
 static int npcm_pspi_remove(struct platform_device *pdev)
 {
-	struct npcm_pspi *priv = platform_get_drvdata(pdev);
+	struct spi_master *master = platform_get_drvdata(pdev);
+	struct npcm_pspi *priv = spi_master_get_devdata(master);
 
 	npcm_pspi_reset_hw(priv);
 	clk_disable_unprepare(priv->clk);
-- 
2.17.1
