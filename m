Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4t2gW5zDsrV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rEFMTq1o; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id p136so2125591oic.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=rEFMTq1obt2HMJKwl3GbYlcLQJyU4452G69BYk/f8SbUxVNRrlGbH0dogsjc4GFU/U
 MXBd3GBBfjxWYr67aBFqKQykGRk90uiZTbLmuRIo8Hl0L2xaLBVOusK0OEl1pbTWivem
 wTMg5gWgZBIU3lUc/LuRebksnBD4AoVy/E9fBYdJKUgcklOGGuOUecUIo4Ls+lLumm3N
 VLa8zwF9iLLR9LmZcNn+rRTsSh7A8+z8OAO1AhFTj7bsuSz18XtaGSqmnWTq8otmi4dX
 mE5+FlbI2j9LGMPvBV+WzEKqLvQcXAwt9aQlsy+w3mCH2vbi+yaTO8V/K5qtuZGe2gGm
 03UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=dCNdaIdOGP0DRR3C3q54DceEVEngwh3TsLKFWBZVCUkjaHAqtdad4cDdszoZeqIHjP
 SQqDVyrdd2qyLzmsiUG995ZwVS2puNJfUKg04CcXNQLQP1RlTNyULuEyFSmLnASDO/wF
 6LOr1w3Ry2y9m7FrotUwZxAZPMAjkUHY0broa7aOSOd1BzPTKU2Tpqvk/UnbIQwYwfFa
 Gpw3QRh7n+0EHjHVrDKsQe349/HzPhEoqoTxko07MuWap1op8HyRDvfx3Si+r/Wbz6B3
 zNj72pEx+x6WpHhid+7QxO46UgdFpQOcM96Azj9HJJYjB+U5TBYXQNB3QcY/cU7HlTa3
 YvTg==
X-Gm-Message-State: AA6/9Rlaz1mPBDoVMYJK0Hrah5U8N+QprOjUMyYsgSH/UjvcIFVgp9Pugm4o79wIo+H+SA==
X-Received: by 10.202.230.200 with SMTP id d191mr4317677oih.61.1476222012693; 
 Tue, 11 Oct 2016 14:40:12 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:12 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 06/18] fsi: enable debug
Date: Tue, 11 Oct 2016 16:39:51 -0500
Message-Id: <1476222003-99697-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:14 -0000

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
