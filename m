Return-Path: <quochuybk2010@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=quochuybk2010@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yf4/DyUz"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygt3W6J4BzDrSt
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 15:32:23 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id l24so8978415pfj.6
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 20:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YJMcN/hhgr/QTd5fZ7hT8EifwQ+D0Xpn8D++PACnJ6U=;
 b=Yf4/DyUzXxM1+R43MrOnl173hP7gWSHGPPSevrqRNwYybJCZyzH2e3TVAKN0a+KdhG
 ebKtp3ORijOFuGoh+pGKVQ7aMVDMZLjMydRhPa1J2lIkVJGhHWbRGzj1C41Lnbf2kYnO
 0AlQKw/f6A6eLGn7DT95aLFTCGNEiOnq7ON2ivach60KkkkgXsxoJMv2W9joP3awcBDP
 U6mk7Ru6O2oNwvwJrApiaHwy6RwR6jmUYTaeyn3DiN/p9dkBoAnVKtR8htvVs3aD+Qj0
 pJ2ZS1iM3fiWNgV+TUCgsg4W53HFizMssne5eDOu71F7v9xeqHm+3PgnANKOgpQH+zfe
 2qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YJMcN/hhgr/QTd5fZ7hT8EifwQ+D0Xpn8D++PACnJ6U=;
 b=B/4uXpHJxHzAmoJPmJz3EnS9KwBh7SV7uw1DnTXgWYiDrqJCuBxJD5pgFrsOUb89d+
 fdlq5wK13/1VXlZd/GNc4ykCZQhCH9t6s3yFbjZwN+CbGDGBmiYGoRco3KA/2RVz3ynN
 q58xgTYVDo+qH9ca5eWh64shCgmyF0fKRp6XNgSnylGw/7BIWhUS4SP0DVr7p97DUpd5
 vtw0VJY1Hc31Lsct7cgYSnPKPbbqAzBErCLhV/7rvPfWJ05UisNaPosbLLoJduXOy8ax
 AOlQu3B6e21/v5bH6L+VRm2df/MjTtU2F799jRLPQB/2AEG+Zr7Dw36MQEbIOxNidEaC
 9kQw==
X-Gm-Message-State: AJaThX75dje2sYYa1y+fFwje8tI5PuyKRo7o8Y/58RhtgTWPFqlXwqAA
 thpuP7Sff4sUC0Qc4ieRFJ2QZWul
X-Google-Smtp-Source: AGs4zMbIe6Q2JvzEwOwZtGsKKJhjq6jXQFHq8YcPPPqzZ+W7T5R4zuecC9t7+nlsH/PUqUr9ckqPgQ==
X-Received: by 10.98.147.215 with SMTP id r84mr13860817pfk.17.1511238741861;
 Mon, 20 Nov 2017 20:32:21 -0800 (PST)
Received: from hduong-ThinkPad-T420s.amcc.com ([118.69.219.197])
 by smtp.gmail.com with ESMTPSA id 184sm1939185pfd.78.2017.11.20.20.32.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 Nov 2017 20:32:21 -0800 (PST)
From: Huy Duong <quochuybk2010@gmail.com>
X-Google-Original-From: Huy Duong <qhuyduong@hotmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	Huy Duong <qhuyduong@hotmail.com>
Subject: [u-boot] net: ftgmac100: Reset FTGMAC100 before setting MAC
Date: Tue, 21 Nov 2017 11:32:15 +0700
Message-Id: <1511238735-29162-1-git-send-email-qhuyduong@hotmail.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Tue, 21 Nov 2017 04:32:24 -0000

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
