Return-Path: <xow@google.com>
Received: from mail-pa0-x22a.google.com (mail-pa0-x22a.google.com
 [IPv6:2607:f8b0:400e:c03::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgDrd3qxyzDsmM
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 10:34:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=RxIw+lP5; 
 dkim-atps=neutral
Received: by mail-pa0-x22a.google.com with SMTP id qn7so16724343pac.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iarn5CKdxKUMHcMohYIrun9Y3VXFnfeUlP8h79Yx9O0=;
 b=RxIw+lP57Lw1U7X/1FJV9DGUJkiWVOYzlG/CNCht542cuG6V4NWh2UeTxCAHfy1mWN
 U63HoZZy5+wpolgNWBzI3REaBq+U8ookme+Kso6M+5OYEqrLAMEamg1Mi6EuqQP+uZwt
 zawe/7d04kYbdvO9hXdy+KG0R8k/vGeAD5wvkEXysc2tYF0Xz7HkHE4Gilc96lQ+1UGU
 eBn4QbHxAzRfabHICLJ+7jSm2vkrf1ksTMpQvEv/PPInnQBdRhD3qeTG6zhGrtKF9uaG
 IwFPxDnYIDV03W6JXhGiYb93rmfwwUMqbGnsYoSgUcwuXJmycN6HSFXKELlvF8NKETmp
 n30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iarn5CKdxKUMHcMohYIrun9Y3VXFnfeUlP8h79Yx9O0=;
 b=lxBTFuFRCUmvCoPVTcsf2W/Jr9rc9Wvzr8nEAQ9o1IlnKZRCK4Kp5r3iF+eZ3rMZqH
 8jls/WTjfP/Gn7YmvJohIKwO/Cv2T6Cv1kZ1ECRT90IphDXR3Fo35u+XyWPRYkM6KYgu
 z3h7ucNKmevV1RVFrhU6cYXhGvNlJWTAEcP00UTDlFJgVtisK6mD8dkAVeEScD5aY1R2
 bE8PKl1zAnT3tA0+0c8GNX+Wrm0EhOCvlE7SvnJNLm+Wv2/exxqjF97HajO1nDdLny+S
 gyNizccviC7ztv88FfhtnH2WlT5vDHlb7phBSlrPZGNqI0tjaVHQH0uGLs2qOWFZqIIv
 9HxA==
X-Gm-Message-State: AE9vXwPtRNmUBUvFehG1HTC24DywSU5U0tby9FmEpvA1xVUKvksIPQThwWrU8QZUZXI67ycg
X-Received: by 10.66.124.198 with SMTP id mk6mr7922639pab.74.1474590861325;
 Thu, 22 Sep 2016 17:34:21 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id ad15sm6580382pac.33.2016.09.22.17.34.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 22 Sep 2016 17:34:20 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] dt-bindings: Add Ingrasys Technology, Inc.
Date: Thu, 22 Sep 2016 17:34:13 -0700
Message-Id: <1474590854-104677-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 23 Sep 2016 00:34:26 -0000

Ingrasys designs and manufactures cloud hardware and is part of Foxconn
business group F: http://www.ingrasys.com/

Signed-off-by: Xo Wang <xow@google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c2500d..54e9182 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -130,6 +130,7 @@ iom	Iomega Corporation
 img	Imagination Technologies Ltd.
 inforce	Inforce Computing
 ingenic	Ingenic Semiconductor
+ingrasys	Ingrasys Technology Inc.
 innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
-- 
2.8.0.rc3.226.g39d4020
