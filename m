Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtsy66DlzDrWV
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rgvKiTJB; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id h186so5451295oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=rgvKiTJBdS18ivq0Rch1+d5g/O1MJOFveHHoF5FthaGMAa5wy1ReaM+cImMXmpmDOP
 ONieYFpvVozieAPF/bfsXgxAqBaitNxeAoUl4o+eNe3eX290IItmeUcdGmQKc2vnewpU
 MhQTSHTH9amHEwYjgTpqJ0hHwaFyQUHI7z8AiclXIIGpO8l6ththdLy38EpBV3onmiM5
 I6sVdTFbWtvjJmJnc8yTkWW9eV+mlxuYy6I2+ZVSlVK5aJov86g4P0zdsNdNfm8GNTYY
 L4nxeY/JpUjT3b7NT62kAXFJsKBFgHGLbS7tR2RayK/kUSFdYSKwUFClSaXnwctneWh4
 Vdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=SaigHta2JbelKDDAmdu7tKExIRiP38svgwD005qL+VYBWpdiWWUCNTwgoW3ttl5I6O
 X9wzM3XE787Ut+owItveQmobkP1x9E+6zlLRGqA1c1P59i7rZ1XIoMZV0KPDx8Cg+d7N
 +/HbNx8EhaCXzY+bBYLeDVqGFwsH2uo/xQKFsSQRluBTckuKzKYqX3N+dsh1WP1s2DVf
 R0V8JxFv9top7s0hgKKtoen6obqXPOe+myKm3iiWZPg2iBctOnTLAtS6+xiBNff31ibv
 Tui65FyMtNuiYT1iXY3VwAcbuRarXJ2KYBOXDkQ3RZ4cEBMz3uSdGOE7mJ2oqlKOh1kC
 zS8w==
X-Gm-Message-State: AA6/9RnBGFxuD3Zo+mj37WBC54FR8brwTqeFPbB53mTvsPovQ8Gabw77iWWT66WV7bFP5A==
X-Received: by 10.157.5.73 with SMTP id 67mr15791487otw.47.1475948340916;
 Sat, 08 Oct 2016 10:39:00 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.00
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:00 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 02/17] fsi: Add device & driver definitions
Date: Sat,  8 Oct 2016 12:38:38 -0500
Message-Id: <1475948333-55960-3-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:03 -0000

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
