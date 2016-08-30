Return-Path: <xow@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP01V5m3GzDrhs
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 06:07:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Hc2RK28Z; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id p64so11128605pfb.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 13:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iarn5CKdxKUMHcMohYIrun9Y3VXFnfeUlP8h79Yx9O0=;
 b=Hc2RK28ZB8sq51JvEc7dyDVysrAs+U7n2DhA55Y7+ceLok5V5+gIfqDs8N++rQOP5Q
 8tT1fq/iNfHeXn3WuHyUoaLU4BYMN7C+e7iRz2m8v5Y4UKRIklHJN7lYJHBsGFiJGsXP
 3+tmzQAGJwqNx7WjUXGaP5/qMTqhysw3dKTRhS4WxVkAv9Alb8Sl+2T+HGsRi7HOPAGZ
 MwbFzyueX0BH1s6osI8goF+RfyWWhB33PlGwRy5WPDXGWUwKZW+YFs5jgFQa8Qjk6RwD
 DTXLfFBgEcdobQkn6+1zuvORRNqvHnZO6hbeZ4ocOZj8Mj2GS2PHNh/eVn/DhlP5bygY
 N+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iarn5CKdxKUMHcMohYIrun9Y3VXFnfeUlP8h79Yx9O0=;
 b=OdUKYt+Gfo9+Jv6ACqszMaqTxBMXHQkCDW/zazwzwl0xswjZiJoighvHs/kaP5WP66
 8E6CQXMbG9AqA1j77ZvguKn2Z797XUcHSNkM4pf3rUg9dM8hJtDEHD3NJI2QbOqkMthT
 TCALLn6VzS9efJVEvGg9W4UscPI1ggtUL/+5kohJ4KfpE2bb69szG5X+i0aE10WTVt8r
 eEboDvSuX1mABHHK6s7tZyKJoNQEcFb86HnpCM2DqGU+VZAdhRyVLdUt7LlEKzb405sH
 o5q7WlY8Alj5B6FoU8uZEli2zNB2mECWxDeZWPgOqiIomN0g4iJ3XbKf5jEu/gg2/i8+
 Wlpw==
X-Gm-Message-State: AE9vXwMz76UIDu4KAOdrWWpFUVYd9SFdg+U7s5tjmgNjyO8VdstONgaEWaXMTRzf5bIjY4tE
X-Received: by 10.98.8.142 with SMTP id 14mr9520679pfi.57.1472587659841;
 Tue, 30 Aug 2016 13:07:39 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id y3sm59169033pfd.65.2016.08.30.13.07.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Aug 2016 13:07:39 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: Add Ingrasys Technology, Inc.
Date: Tue, 30 Aug 2016 13:07:23 -0700
Message-Id: <1472587644-73391-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 20:07:44 -0000

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
