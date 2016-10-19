Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhf2dMKzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=03On+yDD; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 139so3149739itm.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=03On+yDD93DgDeyrbmDyIQpyADoI8tRwaVcEd0AZF3dnwxfX65eccwMxi58+Qf14tE
 upTKM3okH9m5sqiZ49A/2kfHLyhqhFQjSEbYvIzPedIl7FC5WoYx95FGVBHqut2pjejb
 l9F5p2QLLyLmyha0DwrTuQMi++gPH8r8ryPsOtZVqvc1Bbb+n2ezEplpL1gdP6YuGgnj
 mN3FnB41s01TP8ywwddDVp8+L4eEFxhK61Z23evb7nUR7J5p4Y4aihPt3vnNRwQqMogE
 jWjUubfwPJ47vxnXWOIRBt+GioBLJnhJojKdakv5xW11TT3WM6V1k6PucYdJVZHnKwAP
 HAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=HZ4Rg+o0/6ArU2V1gzFcPp2axvvA1GXi1fJYTYig7aaNM055Cq0v7fatkko1tXKRWk
 hx0g4fIpH6/U5D+XTovBe2pvUFGxHieBpKdoiZkXhIhRXgWKjaCN+N+dOp1XoVrIPwAY
 +N4kG7GaTpnMySBAPg5BNegVEn3Dk+5YhXXsk+CuAbjPcWbnLSs/J5eaVuQuU15Xoagg
 Kaenyr55eIC/bQqNfvKgLpl3j2nNEgDvfz9v/Mmd8xd4mh5UEcAzCP1IGOakt6DJoltJ
 vrrQsPxBvx7tSbeyE2IQO85prvzEfsWBp4tV/Vn+AFwr1Ce4Mp3gH8Ccvb6NqbGtU4Ju
 0JAA==
X-Gm-Message-State: AA6/9RlsFeyq+qA8YNKaqbfsZhSGzruJDoZVO1q0ny2Euo0GiXwKBzSFPY6HCg/vJBSQiw==
X-Received: by 10.157.35.81 with SMTP id k17mr4464018otd.23.1476918592703;
 Wed, 19 Oct 2016 16:09:52 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.52
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:52 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 02/18] fsi: Add device & driver definitions
Date: Wed, 19 Oct 2016 18:09:30 -0500
Message-Id: <1476918586-13475-3-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:54 -0000

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
