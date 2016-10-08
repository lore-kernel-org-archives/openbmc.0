Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt12lSTzDrWR
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=KtTIjYqM; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id h186so5451358oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=KtTIjYqMxdAxoyZzF4SypWrGlcpzaHsgH6xJfNu3ALD0J9WjHRMIBG3v7jcHnZoQsp
 Wl4cS2rhfOIT0LAG5Pr4Y0F/naKoUI4KdfC3llD6Alzvc2jclkfOO8R9e9f75Fw9n7NF
 4z7EoMa4wi57FVUAdjAM0o3AkSFbi73yjQsxMLYofg9cYPjv3rPMMkZyiFWGxjnySvHq
 D7YYqqctpybJQ3Zfb5j5GFzcEwJt01rkExD4V6if0obSxrM4SRRA3BPhev9vdeUzCqf9
 UKPX+qS6kzosm5/xvuWw/9jzpJeqIqVgmhTyQRYxhdVxSphzFGsL7VdXooJNjJqPxJ5T
 3r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=PnbEUmxey76SKV3NsiYaN12B9ZMTLKkXNrrlEy/vNXImCZvznAsd2JZKIVs/bjjsfd
 D3hwfbWBbtgJ6goqx17PORJTnzE94omKXkM1hP4J8nM4q3ZdtRjYk53QGQfiCn4N8DI5
 TRBv2Dt1mwpPXahdrRPSHZKzd7V44256UqEn70zfw09eeIFSclnQBlYcT7SnvOzNsexm
 8+9TOXaBhJ+4q86D+5SCEAXt4KQb6tQFTnFtpDLdiWs4R70dUmZBo9kckqA3DHlosaoo
 osdkXFOml//ss+wn0Y6r5o4jz15jAUQmQx9Y72xNYlUxXFtbqCxkuc+U8F6O0WjlGIkF
 /HEQ==
X-Gm-Message-State: AA6/9RkkBUj3bYdB/ZtNpprcU/yqGFbi+v0gM9ZWYsrPxVGQxlC06ksuQSOnT2n4VPNDlQ==
X-Received: by 10.157.5.72 with SMTP id 66mr15240448otw.185.1475948343629;
 Sat, 08 Oct 2016 10:39:03 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:03 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 06/17] fsi: enable debug
Date: Sat,  8 Oct 2016 12:38:42 -0500
Message-Id: <1475948333-55960-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:05 -0000

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
