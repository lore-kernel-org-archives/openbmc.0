Return-Path: <raltherr@google.com>
Received: from mail-pa0-x231.google.com (mail-pa0-x231.google.com
 [IPv6:2607:f8b0:400e:c03::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTfdG2yklzDqgn
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 05:21:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=a4gJASGM; 
 dkim-atps=neutral
Received: by mail-pa0-x231.google.com with SMTP id b5so59010917pas.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 12:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=lvBq+tPCNdAaS8hB3MzUVMSio9mAt69JKRW374PgpGY=;
 b=a4gJASGMaRnDXm/fGBhKvxnT0WLccEqFu/IwC1ghih8f0q2duH+JLpfyKcOc4jX/He
 5NFvnvwHJLT9qHc88+1jk3jlWGDFjzb+4QNDOSyHGSSJJ3pcjCl6mAC6NQydqWvkGxtf
 8mJroGy5ngZvZx/aj5BLE93HxQ22NnJBdyp3CjeLUxyK5AzcmTdZ9+f9VwazokMRU9xq
 2vgqB6BQSMPVkixu/++viJMAvXSp36fM2+dhOA8T9eQ54CLpR4fHmGfQaL8lB1s2rKCI
 0xz2aZ4TA7PJBQptKB76HvpmWxziVrNCyBJl+t0SLvOY1M/Ou97DcIkyp52R3QSOCvgr
 LtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lvBq+tPCNdAaS8hB3MzUVMSio9mAt69JKRW374PgpGY=;
 b=acdoMNRbgn0R35YYygzyGkS+Ip1EP2+c+DhkURpuhkeieo6ZwmRQot0MjrFEq6N3mg
 rgupwjCXoHVD3K6Xxe+35A09GXJvWcvDUtVc3HtgFIpezGfJsjaKrVHA1iT5DioORMCo
 0qo+OGMbRRaQm02f8I0p1cADNVoHBYRT7XLepxtdyyppctU4TNJ1rwuSQ9fJhwqAp78W
 Q0LORZBiQg77tDEsv7IhVigGwx4Af51eZTHe6PD1WXRRmA4YYd7Dp2aGqCzGUjBW2OA8
 xdGLBsmW9Yrx4ytlgKXbm2D2GfBwEz74CH9UnrjivbuACn6NR9qjfN5tyqoVUfAH6pHz
 nYWQ==
X-Gm-Message-State: ALyK8tJOGXowQZEO7uvSUqSBUxp4iUxUrm3MRsEqRax7J57whh0JOqkPcT5CxHwhyQnKWinm
X-Received: by 10.66.126.179 with SMTP id mz19mr29671592pab.27.1465932063309; 
 Tue, 14 Jun 2016 12:21:03 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id vx4sm14617614pac.35.2016.06.14.12.21.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jun 2016 12:21:02 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Cc: Xo Wang <xow@google.com>,
	Rick Altherr <raltherr@google.com>
Subject: [PATCH] aspeed/ast-g5: Simplify default bootargs
Date: Tue, 14 Jun 2016 12:20:59 -0700
Message-Id: <1465932059-5531-1-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Tue, 14 Jun 2016 19:21:07 -0000

From: Xo Wang <xow@google.com>

New arguments set default console for DEBUG_UART on the EVB and allow
the kernel to choose init path, root/overlay, and memory size.

Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb
Signed-off-by: Xo Wang <xow@google.com>
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 include/configs/ast-g5.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
index 6c05e6d..149cac8 100644
--- a/include/configs/ast-g5.h
+++ b/include/configs/ast-g5.h
@@ -139,7 +139,7 @@
 
 #define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
 
-#define CONFIG_BOOTARGS		"console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
+#define CONFIG_BOOTARGS		"console=ttyS4,115200 earlyprintk"
 
 /* ------------------------------------------------------------------------- */
 
-- 
2.8.0.rc3.226.g39d4020
