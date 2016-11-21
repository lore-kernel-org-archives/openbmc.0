Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsS6BHdzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mgIGnCfa"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id m75so1348030oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=mgIGnCfamk2WgS5qCjDuzlW8F5vDdBPGOQenf1QwygZNawiw03MrDVoqVCOnfqS1V9
 5UYzf4dMWO6+Wli+W/lZ43v40u8p0AksrmFUNLj/2U34gUp2PRpNzYFfG3ogVqS2pNJc
 H2NNrNQFEn1Y1h9Eex93oW9evGZtMJVcS2+qAwGKCAOwY1W2DYa0TiMCq2iL4MVxTdZH
 EqXXIqlfqAvFXicKLzehvOUs/r3NXWZ8Yh4RXeWWj7LB2pnwpF5FqR07uuhEKilObAkN
 wX7UWoy0qwXa4txjr4eWqCXUo0KdFaISa/2ime9wHemrpj9/AUe46UDkb5YLgPqooVa8
 NB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=cGzSxAPXQL9jys5BV8/r5WZIb1o6a+OQJKzCYuiw2d0DQxBiHwe9+xlQ3B0OLkkeLY
 qDuij8bFgwwJIkHdfSAGOGh6FfjgxzqPb1l71pm2TnZf+Mia6Jpv9G5C8cBtlJdK9MRC
 A89V5nOCmJZ27yCcLd+l2m0Orh+QjiZDpNyyowxRKl7MXg+CCwbga7dcsv+bn8KERFJh
 Z53YoHc/rOMT7sYnbVXqW9dLCNnyk+6jCgUJttQPwKmry7eRVmRIGQfLKzDpsGe02EN2
 cMXS0+S/sxB9q8JHEr7IF/98V8RsYttzysKC/hIemg71NCgnXUzA6Fj9osaxiTov3oT/
 RZ5w==
X-Gm-Message-State: AKaTC024YiA/9FXmUPPWr9khlTO0eGp9eyQg7gh+/hiyOY7ZUqWK+GkEhv+o/ftoKbWZCQ==
X-Received: by 10.157.61.55 with SMTP id a52mr6840954otc.210.1479696059192;
 Sun, 20 Nov 2016 18:40:59 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.40.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:40:58 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
Subject: [PATCH linux 02/19] fsi: Add device & driver definitions
Date: Sun, 20 Nov 2016 20:40:31 -0600
Message-Id: <1479696048-75851-3-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:01 -0000

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
