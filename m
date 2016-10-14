Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjT1LmRzDt3S
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QFap9Hm5; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i85so4554338pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=QFap9Hm5bKMbxpmSOTMHpcfN6KUfCwNqk3NQTbno/L7UYtOVW3zlfpShpuIngakDU0
 khloI+MoNjlMFMCpOVKHf55oDiqNB41oB71NL3AMwPiO77wYHLDsXp7ioSphWPr4mmIK
 OkRHbdr0907qdaOo5w2FLZx2jCcKDCfc/6rEl6p0dwnsR2FwhCv880VIslVfaB04NpgK
 cQ/aRDjDOF0OtYtA8hEoGC6GaPyYOsuQxtDL2SEPXFQz67WrWcbK5qz2vK1EFQyQ531R
 v+c5/x3I1Sghj7GAFzLxBmehlPjyx6bYI/BFlA9Q4OCwa9L528tIa/5QRFU0z2aqk9eb
 JIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=U6HT61wk4RbVNni8FhPJYBG1lpcg0WJiTOrXxid9Lm/LHK+7T2zMw3Yt7jp4F0iimG
 0NOhhfZ7/kJNoO+4WCy2U2n80ldNPbfHiYauPklRgdrkbzcNQDcShVwGlJ4LgXQcqsWc
 f5kTZB25wQt4BhdA3Pg3+uvgo9i0LLJsP+sAJKe0CZTvpUOjFUtuzg4TGbjpF8Kvaw8h
 1e6kK+G0F7Nm4M1LX23nVPtLT/MOzhoB4LyZV4DVnRT5KmxfUcChnQWG23Jxi94vNQB8
 8uzpWhF8sIXDZ1BchWoQHcUCwdVE9OJSiKJjHxe2YZO3l2mpqFf2N6wYr2tLunQ7F6CY
 iiDw==
X-Gm-Message-State: AA6/9RlOD9R6nIU8YihxGZ2anY5n5tlsHR2JKnBZRIEdEDuIzeJZwVrOAL8ogmiXeyFV3Q==
X-Received: by 10.98.210.10 with SMTP id c10mr21771465pfg.184.1476483291648;
 Fri, 14 Oct 2016 15:14:51 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:51 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 02/20] fsi: Add device & driver definitions
Date: Fri, 14 Oct 2016 17:14:24 -0500
Message-Id: <1476483282-85971-3-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:14:53 -0000

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
