Return-Path: <raltherr@google.com>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYmf91p0fzDw2l
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 05:06:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qp2tTr0/"; 
 dkim-atps=neutral
Received: by mail-pg0-x234.google.com with SMTP id x23so164421825pgx.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 10:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ya20jSefkr+GwEFWMjGjtwAeJDkNpCzTgz1Gqo3mLAU=;
 b=Qp2tTr0/j52HdsdiagcGR3lLYoc6r1EG5E/Xa79aX1V378RwXqkgYvrbadG2V+pPm4
 L7/0bCS7FyaJmU/Z7mpHd6UmteR5x0+RUABlyov9LYlB+vRV1xjy0iF7p6a5lA7hSILN
 ZUPuD3EKsnI03Bo/6UgKI884E2w/kRdLgYL2yWOdfX9+GTrO1b0YFO4r+F+lDstmlb48
 liLIari6UjZKDfL2ELCfaoYCWMuVxJaMH2PmZbYUZy9rEsyc0viFt6ml+laM3JYaYmBk
 rrO5xbZyqfdKZue2hmZ8FrHiOaHpWRFI4gngQ9279D7i0OJdq5fXI/km8uDWuQV5lOYn
 SfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ya20jSefkr+GwEFWMjGjtwAeJDkNpCzTgz1Gqo3mLAU=;
 b=Ab/8QRRUctibK5gKzDtYcNfPoYjg22apK2KF7ov/+/y9Ii1zbM5C/Xri87fY3UOQpg
 I+UAqQPq8v1ft5v4Aw8gJwSxU/KZ2yAeBKbFevv3mExtJG6LCHX2ULKEdweWC1EROx0M
 EMSO1zIDYmOnzZs/jylXgN2o0NDD78HUYMK+hjAMvfJjYw6YmXjSOzGRiaYb/zUEqanb
 jeh/yfEjHakkjkxrhSKteLt3qfGyha/Xp03hjgNlIqj7b/TbFoclhsSWQSXiZcagn2h6
 2aIo4i5mleDUr71j7P/CxdjSed7MyHden0VkuzBAbLuWw6ylH4sdTRHsJnIa+6SHklSN
 NS8A==
X-Gm-Message-State: AKaTC033I2tzueNkQk/sCa1pGW7IFl+MTnrQt//d7pjMEx3SdHtQhobDe4j/Hdi7wBX+Jnxn
X-Received: by 10.99.37.2 with SMTP id l2mr122817615pgl.160.1481133999245;
 Wed, 07 Dec 2016 10:06:39 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id c2sm44098808pfl.66.2016.12.07.10.06.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Dec 2016 10:06:38 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot][PATCH v4 1/3] aspeed: remove hack loading ramdisk in
 memory
Date: Wed,  7 Dec 2016 10:06:34 -0800
Message-Id: <1481133996-29973-2-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481133996-29973-1-git-send-email-raltherr@google.com>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 07 Dec 2016 18:06:41 -0000

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Rick Altherr <raltherr@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 common/image.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/common/image.c b/common/image.c
index 20c4807..0be09e5 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1069,17 +1069,6 @@ int boot_get_ramdisk(int argc, char * const argv[], bootm_headers_t *images,
 				return 1;
 			}
 		}
-/// TODO ... Check Why ..................
-#if  defined(CONFIG_ARCH_ASPEED)
-		/*
-		 * We need to copy the ramdisk to SRAM to let Linux boot
-		 */
-		if (rd_data) {
-			memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
-			rd_data = rd_load;
-		}
-#endif /* CONFIG_ASPEED */
-
 	} else if (images->legacy_hdr_valid &&
 			image_check_type(&images->legacy_hdr_os_copy,
 						IH_TYPE_MULTI)) {
-- 
2.8.0.rc3.226.g39d4020
