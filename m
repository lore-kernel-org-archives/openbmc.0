Return-Path: <quochuybk2010@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=quochuybk2010@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bJFtclia"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygszR2XWWzDrSt
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 15:28:51 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id 4so9206099pge.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 20:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YJMcN/hhgr/QTd5fZ7hT8EifwQ+D0Xpn8D++PACnJ6U=;
 b=bJFtcliai9DFa9CSCc/+QM9DBgnnpFOYHYydZ8B0k6A8yx3S+IwcyLPpZwmScco0M+
 9yNWpx3cH+z0ZCMuCT19xmgKrMYeJMGHNZGRc1CZeQ5gtDp2FHVBMd9Y0SgE7+9/CEtc
 I0Fis4slhoB5F7LE/pVa5e21u7r+TBaBbyKyaNEMxtOkBz7ucWqWimJSgRQjQO9WqiYk
 Kq1l5oRvu4QrznYUC8HDiOnLdaPbsAOVBmo9MgtSFQaUCubUQPI1rlTbsY+FyzxVPNGO
 VSKPXu/G+n96oy034Rdh8qzfYiwlLNf5Tsjmx3r3GLESWpiUd/bT8XwcmiCjy2znBN65
 neqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YJMcN/hhgr/QTd5fZ7hT8EifwQ+D0Xpn8D++PACnJ6U=;
 b=Lq2uMmuXtdhWULUfJQgxt+1tcrn0D4iEmkjhHo+bEePM+Xq0aV/BFU2Vt32tPi0Vak
 u7gC89zWqVBVPM9xtQqSytblHNM2gTKlC3urG8rYiiAbwabuAaI4tFSY138x6DByZ2qR
 1n+0GkpWqw6HzT58/A4wM3lMTu0t9zsNu1ERMXiEAL0SG2j0823GLTpdsUBC1CiHbVSu
 eUXM8BLnuWA2KCU4cEbQs2DRJv+XWy0NtonDa0LCxpOj217rXuA/1x1rm6Icph0zAG2d
 ZoStQPRkMIf4Tj0yhIPRtgElJRGobMCYwBjXcDak19CZO5ZtXDxFWudHEeirAmgs1Z9k
 A/jQ==
X-Gm-Message-State: AJaThX4O1BpHSCHdyHRdOJHTSjVISFiBOXeLvOu0NysZFwp+VZumgb9f
 WkuROarFytwWdCfkLnezNm8=
X-Google-Smtp-Source: AGs4zMY+DF53eBa5hJ1mM6u2Gr+PKGXwoQ4uOV52m9I2EfngV6ICu4vLs07TqDMXtE4aTvJe0RuaSQ==
X-Received: by 10.84.251.144 with SMTP id w16mr10464537pll.11.1511238528930;
 Mon, 20 Nov 2017 20:28:48 -0800 (PST)
Received: from hduong-ThinkPad-T420s.amcc.com ([118.69.219.197])
 by smtp.gmail.com with ESMTPSA id y7sm20551809pfy.144.2017.11.20.20.28.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 Nov 2017 20:28:48 -0800 (PST)
From: Huy Duong <quochuybk2010@gmail.com>
X-Google-Original-From: Huy Duong <qhuyduong@hotmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	Huy Duong <qhuyduong@hotmail.com>
Subject: [u-boot] net: ftgmac100: Reset FTGMAC100 before setting MAC
Date: Tue, 21 Nov 2017 11:28:29 +0700
Message-Id: <1511238509-28279-1-git-send-email-qhuyduong@hotmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 22 Nov 2017 10:54:32 +1100
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
X-List-Received-Date: Tue, 21 Nov 2017 04:28:51 -0000

In ftgmac100_initialize(), FTGMAC100 is reset after MACs are set, hence
all MACs set before will be erased. This patch moves ftgmac100_reset() to
before ftgmac100_set_mac_from_env().

Signed-off-by: Huy Duong <qhuyduong@hotmail.com>
---
 drivers/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 9d5ba98..5779057 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
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
-- 
2.7.4
