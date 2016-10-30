Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrh19m9zDvXn
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cfyvi65x; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id 62so5826394oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=cfyvi65xBjDfT/3yw3RZg5yoh/CJWtUPyhlixb6JKfJW5/cMXmC2XbeGdJ4MlQ+ggO
 ZJhMXDbLJoPQk4MlX4IswE/+D6DU9avoI2plg04E/MdF6y5tMJry1AdfuAbRziJzq6UI
 +68P6xT0nCWCg/hu62X4nic576eHwv6jXbqfYYvTtQRwax0wMt6lCuuM4SV8hOI83p3g
 xo6GDui5rGIepgM2yjdGK6XwDa5vS7zjcogEu8YDmBlwIkNHOl0dF7G05fNOh8cWpzBo
 vGlUO1/v4nu3nLVj1E3P7l0mf9zHGO+2/sW6k5nggvztpkLWSINd6XqEpidcyp+rlBXm
 Rw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=Axgw4OEhlO4FCD25Mliclx4i6Qm+kz/0TmFXOwC1Xy99rswx0RqJQHt4UdCcWqcNpn
 jT0ut5+CIl5DKz14xZLGBTpDhC6pZCt9jJK+wUlFdylMasjSDRGGObOPYTPgB28e8oAU
 zmXzu5Tv6VtG88e+1GHowRtCExO2qGlj9UCqt1N52hvvqZFeTPzKxTvXqvCemnKsuZ0I
 /gS+BuLac+cPIu8IJYPyP4F9x8KSM5fGz2Rijlii4r2Y1/UAE2YF7alVkgnQnOhXEKli
 mRIrlZ3amlyuQc5MI9LVFJpOCMofBEZADIZyj3KE4EmChyv70+i8DPVq9Gx+ai+O6tzQ
 NqPg==
X-Gm-Message-State: ABUngvfJFXuN6/UXsis4BDRwKdANqY/p9qilCwrdzV4yN+mkwALVWQZ70dD62Nl2LitS7Q==
X-Received: by 10.157.44.38 with SMTP id f35mr17482569otb.192.1477865410489;
 Sun, 30 Oct 2016 15:10:10 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:09 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 02/18] fsi: Add device & driver definitions
Date: Sun, 30 Oct 2016 17:09:23 -0500
Message-Id: <1477865379-11566-22-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:13 -0000

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
