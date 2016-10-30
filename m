Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrF2d1KzDvNf
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=tA7Q9XFr; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so2660778oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=tA7Q9XFrbIh5Ba7I4UIO/k0zDLoUqaXEUSfKhP/J/npinVFRSS6zz/mGRyKIGwAJLb
 aLha+v+uUJjVshLPubYII6cNHM9xS6MP/dpvNWeWkNHZrDC4lyOvc39s85RSJgWHDWue
 32iha2iEaA7k3YZePYnx5YLySurTjvgwXwCflBOxWX7D9yGCgg0BFfCYUDQQBJLZ0jBz
 QXaUDt/pG6ZUUq+eBn7VnLq/AsALzbuCX/QZ0ZRZuaXtLCZd0Q04toNf+CD+SL1KOPtS
 O98ehbd6pS9GI6t0W4NayM+sqrYEXPo2X3/rPfQ6OMmkLnNelhaJL8l6y8BmqUbeudmT
 4Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=NOz2wmK4hBLFpvxibgao8kX4PAuupzSXrjI4+lrec5Kg66vKq5RZHxD3j74w+y7vXX
 ttX/0gRzK+Dq2+SPlNyIHuNEbqTALKzlY/SkrbxsGj+o44RCDixPn3H4fphp0DknzwI2
 3CKfZvJ64PzALKB3C1J8r6MqtOqO8FGZuEyoN+lvVaK1CVloap3/NUdJbnifMYUPGLTj
 8dYoLuTpP2jrHamda0R2r7w3MAsQ4PxbT7oPB3dVa9ERiQhmqa0lZtczCC2cXXSlETp9
 QP9w+CyuJgYeQXyDIn7pgrMrmKkwGmawi+casqM52bzQ2zgSkYNckYgBlajh0LdeF5UV
 hL/A==
X-Gm-Message-State: ABUngvdPofwsCLBEkTJzhqV0T0V6grwm00kyKrjOiY025/bxfQ+l1VZbrPNeN2usvNx2mA==
X-Received: by 10.202.242.9 with SMTP id q9mr22609471oih.140.1477865387678;
 Sun, 30 Oct 2016 15:09:47 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.46
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:46 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 02/18] fsi: Add device & driver definitions
Date: Sun, 30 Oct 2016 17:09:04 -0500
Message-Id: <1477865379-11566-3-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:49 -0000
X-List-Received-Date: Sun, 30 Oct 2016 22:09:49 -0000

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
