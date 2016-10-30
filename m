Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrn1J6TzDvWv
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XhSah6Vz; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 62so5826587oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=XhSah6Vzcu9CCnUv7AmfY25H9kSIWNgAgGOeFtxbfFeDS0VsaMQttz8sZdBzlV2Yrd
 Nx2mrMd4Q8DJT5ZxKEKCJloFCXQfo+W0ioQl6nms+UGYN8Xi7Y6C5XxIpYNHT/VzSZJB
 R02Aorx37BYjFVmKPlCJOrwBG/n/K3Lvg2/WtsCvmfpVwd7y0iyH4JkZHFJfLn15EvJH
 MP5BNVRib+xlUB8d5oZWA+oxlzur3fm4An7TqhpO8yw+vBB9qdhINRhIGGpcWl3cK3L9
 r3ABDotPLe/E5TGgu71B6yUbotgFwkrrYxiBGwP3qRIpV5/KK1btdqW3tNvBbpcCur5O
 5FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=aPqj4pFkDmIceQSmQNkUs6OjxxqvSu+66tWLAanAIwRAic1M57jNIWcdLwK5CO3hhh
 32z27Eah0X6Va9UY3DjYXaga26Qx0jGFMLLuAbGPMy2m+LYhUPzjpzf6lv+3UAoKuRzN
 WW/WrAlpGCrNi/8bXalHHv3vpH2EuRflr8PxAmMbCfCLOpukpRN66IhQcAtqPyQ8/81n
 l1/Q+NRu2a1f6P2Aaok4Z7fRkTOnLnrjoTuKqrEAJYzAs81PKorcvO7oQWhu/57JQ/kD
 3aAXRj1+uy0ICCxNhQ8tSjD+3KzjR0I3u9vSq5bxxJ9P7UA0K3lGAoHPEOMDDf/4ye4k
 zSfQ==
X-Gm-Message-State: ABUngvfUD3YAwFA88gMaLDzDR2DiHezyGJJUAPWGNYRaIOhhm6cYquQMrFkQjypAraVqpA==
X-Received: by 10.202.0.206 with SMTP id 197mr18690716oia.144.1477865415469;
 Sun, 30 Oct 2016 15:10:15 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:14 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 06/18] fsi: enable debug
Date: Sun, 30 Oct 2016 17:09:27 -0500
Message-Id: <1477865379-11566-26-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:17 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Enable debug for the fsi core during development. Remove before
submission.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9428d..db1a1ce 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -13,6 +13,8 @@
  * GNU General Public License for more details.
  */
 
+#define DEBUG
+
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
-- 
1.8.2.2
