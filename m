Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4q687fzDsrW
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Pv9GUerP; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id e12so2264114oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=Pv9GUerP/xO3SfxQ7eiD0n36EnNbKt8IUfI5eZivcc7bZxpk55AksoYCGRfT27E4+m
 86iw0DTHKwlp2lYzdSv8XkeiXMaZHqUwp0HG6CsWEteJkwgpk8Zy/I9D+lCfd0JGX13B
 TVzio+TZCa0SO8DK+ml36TMp/k2R09vWcPzH34Yki22eby9binVQmP8xZyvV0lqjYL/n
 BzBx4OvWqYQ/KY6/rqhchRn1gj54KjkxVyGInQB4FPT7/6lYsKr9VgdB8GK4uLpPwiin
 D3E/F1c311UAibyRMu4FSbkrzox9DV1trzxkDj1CPghNdBA6/eWpfw9p7KNH/bgqd9k5
 b9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=amdiqo33FA31PYjuyCra1jsBTGm6Bh8LSvn5eS6UpS2a3tZFRrMBKKgnu5VD98Mltw
 mk2nYNnXMByNJtEWNUwlctOVY5fVR3lvF6cBv0n1nLUh7uzWSALjHDY9VEu56w3PWm4s
 cAWyzwxanDxdkAP8u244wy49zDD/Aa25BWqJm6hc83gQ8RZtT9wVJI5+lwgR7MGcWLAx
 wf8WQSs2GUZxqZSaTGzkxFZqjGfRP6M9ohgLJt9gN7CZD5bA5hLKjv+dqeLVRdBHpaV2
 ZUGTwISEWemRVF6QOl5WEBQfc0RBnnTMI3kbBVpQyLMRbi/anwdsPCBBIdZHmMyFh2OJ
 pthA==
X-Gm-Message-State: AA6/9Rm96chEb2bBvy66pIUjQbTbGYBwjcawhPw5mCKaRoIQgA9LstPIAHZGXhXoKqK+xA==
X-Received: by 10.202.56.132 with SMTP id f126mr4327724oia.73.1476222010179;
 Tue, 11 Oct 2016 14:40:10 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:09 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 02/18] fsi: Add device & driver definitions
Date: Tue, 11 Oct 2016 16:39:47 -0500
Message-Id: <1476222003-99697-3-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:12 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add structs for fsi devices & drivers, and struct device conversion
functions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 include/linux/fsi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 8e8bdea..66dcf25 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -18,6 +18,17 @@
 
 #include <linux/device.h>
 
+struct fsi_device {
+	struct device dev;
+};
+
+struct fsi_driver {
+	struct device_driver drv;
+};
+
+#define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
+#define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
