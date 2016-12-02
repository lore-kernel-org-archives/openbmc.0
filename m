Return-Path: <raltherr@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVpg24vB7zDw40
 for <openbmc@lists.ozlabs.org>; Sat,  3 Dec 2016 09:27:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZuweiSv8"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id p66so111929778pga.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Dec 2016 14:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1OkIsD/N6Znx2WgMTRfBITZiRDSkX1QCZagrqJH188=;
 b=ZuweiSv8yDnUbY5bVKhoWJP5ytmyQGLNIRlg7FFlJyOno1IVF+kRJKxNErMYqFWpGu
 UAH1oJZEKVWMVP7Dh4PKuBruPKRKiqaiiXkgLvmrBxKYy3Azdd1AZ9tuS45w1nv+dJRl
 Lk5vuD6JkXwh+/THlBvRRw8zxxuNWjl7WQa0/Kaxi/3FXBdX+8Y9oAfM6NLsIBah2Uai
 Qs0zXa1OAVEoGYw+3pUXsJ9aOBdadQU8/vmiy/xk8gnEUhDQoPhl6SogAyKIvtQSsaXr
 WFkq/CQncUXqZ4VTnMlQawcV0YH+DRxBawrwQGv3EbT9h0/W5Fu649TXWlcbblIfqo5Z
 oafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1OkIsD/N6Znx2WgMTRfBITZiRDSkX1QCZagrqJH188=;
 b=Z9ROgjpI30cMkHr+IHyHP3jUkUiULpwstxIZ/aBLPtoIPWne6+UV0xmtNYM46H1wPA
 1v2g5iP+TqnXNvyn9898BTSSZqRqsJaZEqF5halydfA24ml932ESUKIA3Zj9gKwpZxqH
 FFzInkyYDPwBOXQjDYEEsOeuXxVNY0q8GfHX7K6I/hdinU9tAG8c9cUttuKFbpaKRpBw
 wmAV3VqjypBcmIT49hCPrV55+PBsUVttZmYl/ylEYX71NEq3rPym0Uo8h5e7k/yG0lo2
 73surH7yiSHw4rqZaV2UAB5w8H1MYAaZ+uP/VQx3SKAAFpG329vI5BC8NnRz21CvMBgS
 ArPA==
X-Gm-Message-State: AKaTC01EtQVagp5ZqewzG4vu/1O8eCboi0JLHUSaA29r7MqQMt1BuDpoFtwd/hbesDPkALz6
X-Received: by 10.99.101.65 with SMTP id z62mr84152998pgb.74.1480717628430;
 Fri, 02 Dec 2016 14:27:08 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id c142sm10020821pfb.23.2016.12.02.14.27.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Dec 2016 14:27:06 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2 1/3] aspeed: remove hack loading ramdisk in memory
Date: Fri,  2 Dec 2016 14:27:02 -0800
Message-Id: <1480717624-24994-2-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480717624-24994-1-git-send-email-raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Fri, 02 Dec 2016 22:27:11 -0000

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Rick Altherr <raltherr@google.com>
---
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
