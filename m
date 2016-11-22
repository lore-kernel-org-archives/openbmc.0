Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 307 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Nov 2016 17:29:21 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="ZEN+hHHQ"; dkim-atps=neutral
Received: from forwardcorp1h.cmail.yandex.net (forwardcorp1h.cmail.yandex.net
 [IPv6:2a02:6b8:0:f35::e5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNFtT380gzDvp9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 17:29:21 +1100 (AEDT)
Received: from mxbackcorp1h.mail.yandex.net (mxbackcorp1h.mail.yandex.net
 [IPv6:2a02:6b8:0:f05::301])
 by forwardcorp1h.cmail.yandex.net (Yandex) with ESMTP id 3764C20DCD
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 09:24:07 +0300 (MSK)
Received: from webcorp02g.yandex-team.ru (webcorp02g.yandex-team.ru
 [87.250.230.45])
 by mxbackcorp1h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 6sAhNBB3qq-O6gWcUgZ; Tue, 22 Nov 2016 09:24:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1479795847; bh=Typ+R2lslECFL5VFgWDO8G46C0KAgC2+AoTxw8B4hGs=;
 h=From:To:Subject:Message-Id:Date;
 b=ZEN+hHHQSDMli6WGLl90sJi5pFIRvHTzlmeMrZerrEepSkpvR+V4GOQ0DJrxWvmhg
 9F+xZ/J4IzfJHTRm6ri3vntum7FKUuiYMO8bgIxobxhWv+fZzY2mtnm3OGEmyrTkMH
 7P7nh1qz3HuPnyaqAZ5vAzjg7lLuIJ90LGLPbcvc=
Authentication-Results: mxbackcorp1h.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp02g.yandex-team.ru with HTTP;
 Tue, 22 Nov 2016 09:24:06 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH] ftgmac100: fixup MAC address set during board bringup
MIME-Version: 1.0
Message-Id: <12131479795846@webcorp02g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 22 Nov 2016 09:24:06 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
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
X-List-Received-Date: Tue, 22 Nov 2016 06:29:22 -0000

Hardware reset leads to clear all registers.
Make the hardware reset first before actual MAC address set in ftgmac100_initialization loop.
Based on datasheet only one bit (SW_RST) have to be set in order to proper MAC reset.

Signed-off-by: Anton D. Kachalov <mouse@yandex-team.ru>
---
 drivers/net/ftgmac100.c       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
--- a/drivers/net/ftgmac100.c	2016-11-22 07:07:44.000000000 +0300
+++ b/drivers/net/ftgmac100.c	2016-11-22 07:27:12.131940971 +0300
@@ -457,7 +457,7 @@ static void ftgmac100_reset(struct eth_d
 	debug("%s()\n", __func__);
 
 	//Ryan modify
-	__raw_writel(__raw_readl(&ftgmac100->maccr) | FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
+	__raw_writel(FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
 
 	while (__raw_readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST);
 
@@ -791,11 +791,11 @@ int ftgmac100_initialize(bd_t *bd)
 		miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
 #endif
 
+		ftgmac100_reset(dev);
+
 		/* set the ethernet address */
 		ftgmac100_set_mac_from_env(dev);
 
-		ftgmac100_reset(dev);
-
 		card_number++;
 	}
 	return card_number;
