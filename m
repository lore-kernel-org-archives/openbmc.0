Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M41G2JzDrPK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=RtEbuMQi; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id d132so3133100oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=RtEbuMQiduSgSODhPf9cArP/EavjPKPBMo0JJpmgLTwOpf9OqILjcalfwsy7UFsWaP
 lQufCWM683EScLhC9J2trUA6n2ntEn5/wsiiRtZyj7EzzPH10nosD9rjBzUrmYjaJOce
 2gALC+ofVmrbD8u5oI6Eb9bLRY9n2+vLwNCCafi4gG6UEbdh9bpm5op7USzBVt94m5dy
 jfL+P07eRFpFMghLApOJXRmR+NIJ+9E99SDo/x0b4l2c9qmXok+5LjHM1l8YaXUUDTsn
 EI3oPASEOOf8FEjHh49h0mcBEhQHhQLIwz2N0IiSCOh+16rsGggZ66VwtFOdQ7IAyjqN
 5uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1U4XBGP0KLyjRnKBHYd+H3y8aMkGUlIxMDeUqjVd6c=;
 b=dbCFSG3YNpoeHiwW15IuPDpDf7QixK2fcjbJxvAZPDHNsHazuZAUA1znGn/18zFiCD
 bX0CA8t0qDTTv+kh6J9o2WnVCUDO/MwvjYaJzc0BSjBzSF8GO9YoUi5N7trfOAGwcSUo
 OarRXw4RUfcIeJfCniOlq0wqcsniCctGA7CMW6ovY2AitiVBrw2sCkB0wgYl26olHHsK
 LWUsacqOHH1fcOTsSHGrmK5UBAqDz6fOb3ywcyk9cw/IUFZiy+5khUPu+SflzpbJrIpo
 OUh+/Bw0L1WAVuq3/lAh25vLOwzSvJnCV79I10Fs5FFKetVv2J+XOaeVXjO5gqLQoe6p
 SIZg==
X-Gm-Message-State: AA6/9RmxA2sAnonzr0NvLXziLBdxVCsM2DaJS/Gl3vTs4BOSPwfAKJRmUvBqFUYjhzjcRQ==
X-Received: by 10.157.51.48 with SMTP id f45mr1490534otc.212.1475700878491;
 Wed, 05 Oct 2016 13:54:38 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:38 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 06/15] fsi: enable debug
Date: Wed,  5 Oct 2016 15:54:19 -0500
Message-Id: <1475700868-75737-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:40 -0000

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
