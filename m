Return-Path: <mine260309@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDXyV1prxzDvb8
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 04:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xk5aoiel"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 144so957280pfv.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=EnQIJuNQAb2s5oZy4DZ1VeNz7sbTZEPt0wB2IvBmTbg=;
 b=Xk5aoielsXnpi1eKjLmG8cDnUghAZQr67d+8YMSW1B4VX5qxO+bbQZhIYS69+4S9Fo
 jV3NZ2cV0kmrMU50wBFJqaeo7rGBWcg8V53GKSOldApLUg0n8/HqaJfcNyMBOoDgXUQC
 cC5c9/NSWAgImcAATu6a+TbhXINnRKDplx+qSYyWy9LCDQWl1zD2Tz60bX8i9GGwRgfm
 8GOY6vwwyg+hRRc9KuJ5dX+8/NhXCpNp3+wmjekgC04klNT8QFks8G+czieQdp+4PXdI
 PjJzRa28r1bZswX19wDsLdp5WFHzjsdkvYhN5GwQY5VolR0bUjgq1URztLRbAh+myAy3
 U8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EnQIJuNQAb2s5oZy4DZ1VeNz7sbTZEPt0wB2IvBmTbg=;
 b=byDkuXGUdCfsLj/efvl8wdhTanFAKkh3IKsnEiyPdV2lNboh9Wj2pzdr77UXkM+iKS
 F0GEU/hs+vuSWTVk9M8EHY4eTUuTLuSgyCL7tBB4aKYcQC3W+o/Mv9/g6CdCKNjvGx2n
 dwURdhSVynUapo/fT7MFRF6VwbQfVUfg3y3G+OIYff1a4CgGQzc/0Sl0zeBDNE1vK5h0
 KBe1Mk+YRnbjB1610+UlqaGJfPg6AZFzMjz2cAYMQlQVglXOCzEVmwnNKbeTRHkj8+wP
 ljqMGesYiyr0qyASzjgu9uwJjQ6wp1gaLwzUHiN9Y+Rq29FLfmg2Qq7d+RfpzCuIfpL7
 VTSQ==
X-Gm-Message-State: ABUngvdfW/yHtFcKEye4nMlg9XE+S6Vma7egNBkag0Sboi7otjtVqm/Pdq6QxI63a1F9jA==
X-Received: by 10.98.133.9 with SMTP id u9mr1035995pfd.137.1478712064089;
 Wed, 09 Nov 2016 09:21:04 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id xn11sm640700pac.38.2016.11.09.09.21.02
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 09 Nov 2016 09:21:03 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: witherspoon: Add bmp180 sensor
Date: Thu, 10 Nov 2016 01:18:53 +0800
Message-Id: <1478711933-11135-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Wed, 09 Nov 2016 17:21:06 -0000

Add BMP180 thermal sensor.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 5c93139..f8a3264 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -84,9 +84,12 @@
 	 *    Power Supply 1
 	 *    Fir Card ->
 	 *      MAX31785 Fan Cntl
-	 *      BMP180 thermal sense
 	 *    Regs 3.3VS, 1.1VCS, 5VCS, 1.8V
 	 */
+	bmp180@77 {
+		compatible = "bosch,bmp180";
+		reg = <0x77>;
+	};
 
 };
 
-- 
1.9.1
