Return-Path: <raltherr@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXXz83MB8zDvjf
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 05:17:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cZBcdmgB"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id p66so139209351pga.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=DXXwS/AdMAMX7uaSoJvxOzsMnp3odP9WiBTS29vkuZA=;
 b=cZBcdmgB2ji9PaRfGflZ0eIVPSzVr1W6ABwxucxL209SDSnrFoKuPRLRpwwGSy1aIe
 d6pjdcoRb2dLj9CtU4eWF+ROo5NAKSKxy6ullkyaK3sUHDFhm7lrEE/Bx6qpObCVFI0U
 8EVUisfoQfArMOiVzI7Mlk2MweIKPvIhLXuVY6+jR/uotP78HEfbiKrTf6oiu5nNHOwz
 Cngdt1XO6cZ5PBqx17Mgt7kGWMJYI0v3QOuk0lq0TNHWWuNhKEvAUAU7ZYcNHStiTocJ
 5QWNo9FDPze5Zdy3GEdSjJ1dKszXIJuQ0K//zPpy/MlCmoI91NMDMAfDioABtNI+yCHm
 SfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=DXXwS/AdMAMX7uaSoJvxOzsMnp3odP9WiBTS29vkuZA=;
 b=gx9XbTcv0eLLrxJFZtoOHdv9ai/UKGymoxfhpGcIk+XgEQyDQKYm+8TYLVwRMTLp8Y
 h4E+4PyG0swmqVESdbOngnnISqzYh9mDEdIm+P2aYPTVKyJxyNCQrPVEMvF5gB0UvXvD
 amZrUz8wcV1ckD7/4V/eUuKGxiDS1NdZ8g8tulq7d09M8FIRHBN4frLZFk3Fh9PvIZCM
 g4d0I7ZJ8ps/00GHgQ0GwPcC2qSXRrIDV281tRZOeCYB+B7w4n7HJO9LPVi0L7sTm02n
 W08e/VlfPGCfMbUqjkjUOVfBkfHrF4eo9DYiBe1xGvViKWRcoCzg1AIoP0Ba1NkprT+q
 XRgw==
X-Gm-Message-State: AKaTC00Yq1qXxjv+k4QOQdIqSG1bV490kmzljPsKXnMzLny59ItY9DEjnzZpbNQce/G69vX5
X-Received: by 10.99.1.132 with SMTP id 126mr104388037pgb.129.1480961826348;
 Mon, 05 Dec 2016 10:17:06 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id p13sm29059192pgf.47.2016.12.05.10.17.05
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Dec 2016 10:17:05 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v3 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
Date: Mon,  5 Dec 2016 10:17:01 -0800
Message-Id: <1480961822-6631-3-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480961822-6631-1-git-send-email-raltherr@google.com>
References: <1480961822-6631-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Mon, 05 Dec 2016 18:17:08 -0000

In 35fc84f, bootm was refactored so plain 'bootm' and
'bootm <subcommand>' shared a common implementation.
The 'bootm ramdisk' command implementation is now part of the common
implementation but not invoke by plain 'bootm' since the original
implementation never did ramdisk relocation.  Instead, ramdisk
relocation happened in image_setup_linux() which is typically called
during the OS portion of 'bootm'.

On ARM, parameters to the Linux kernel can either be passed by FDT or
ATAGS. When using FDT, image_setup_linux() is called which also triggers
ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
called because it mostly does FDT setup.

Instead of calling image_setup_linux() in both FDT and ATAGS cases,
include BOOTM_STATE_RAMDISK in the requested states during a plain
'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
relocation from image_setup_linux().  This causes ramdisk relocation to
happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
the OS being booted. Also remove IMAGE_ENABLE_RAMDISK_HIGH as it was
only used by the now-removed code from image_setup_linux().

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 cmd/bootm.c     | 3 +++
 common/image.c  | 7 -------
 include/image.h | 6 ------
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/cmd/bootm.c b/cmd/bootm.c
index 16fdea5..8da750e 100644
--- a/cmd/bootm.c
+++ b/cmd/bootm.c
@@ -131,6 +131,9 @@ int do_bootm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 	return do_bootm_states(cmdtp, flag, argc, argv, BOOTM_STATE_START |
 		BOOTM_STATE_FINDOS | BOOTM_STATE_FINDOTHER |
 		BOOTM_STATE_LOADOS |
+#ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
+		BOOTM_STATE_RAMDISK |
+#endif
 #if defined(CONFIG_PPC) || defined(CONFIG_MIPS)
 		BOOTM_STATE_OS_CMDLINE |
 #endif
diff --git a/common/image.c b/common/image.c
index 0be09e5..6584f7f 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1470,13 +1470,6 @@ int image_setup_linux(bootm_headers_t *images)
 			return ret;
 		}
 	}
-	if (IMAGE_ENABLE_RAMDISK_HIGH) {
-		rd_len = images->rd_end - images->rd_start;
-		ret = boot_ramdisk_high(lmb, images->rd_start, rd_len,
-				initrd_start, initrd_end);
-		if (ret)
-			return ret;
-	}
 
 	if (IMAGE_ENABLE_OF_LIBFDT) {
 		ret = boot_relocate_fdt(lmb, of_flat_tree, &of_size);
diff --git a/include/image.h b/include/image.h
index d788c26..a16187f 100644
--- a/include/image.h
+++ b/include/image.h
@@ -99,12 +99,6 @@ struct lmb;
 
 #endif /* IMAGE_ENABLE_FIT */
 
-#ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
-# define IMAGE_ENABLE_RAMDISK_HIGH	1
-#else
-# define IMAGE_ENABLE_RAMDISK_HIGH	0
-#endif
-
 #ifdef CONFIG_SYS_BOOT_GET_CMDLINE
 # define IMAGE_BOOT_GET_CMDLINE		1
 #else
-- 
2.8.0.rc3.226.g39d4020
