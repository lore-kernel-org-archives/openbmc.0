Return-Path: <raltherr@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYmfB0nxszDw2k
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 05:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cFs4lXvQ"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id x23so164421991pgx.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=01bKwxoY/j0Bfe365iIxWTbGUio2Z5mF6R4xSiqfIos=;
 b=cFs4lXvQgwvmxC74edqc67wKylYejGXvithXnCA1pBbvtZ62pXZzlDpowIyLnorBSG
 V8B0U976cVoSbLjwKma09GrLMBIIOUH/0FiAIk5mWRxnmql5FgPD7dQtJpAGDfyXezkG
 kFf+cvx7ogyKGgVwpx1kxBfhR0jWfWqFfkEGxZX+o/G20lQTcBxzo4YTFOIQVF7kjUGC
 RZtCNwzRGlyOqSBfVQO1n713Qe/YNBX0pdISP2xwMSI9RlQr+G6Ig0jD4QTR0RdDVuOP
 KUgespeSo3WcCS9KYaAVKNARYlTkQywxVJSLBOCf8U9FtJqBMwhPqt4ftWNvzUfkaFI9
 GboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=01bKwxoY/j0Bfe365iIxWTbGUio2Z5mF6R4xSiqfIos=;
 b=fL0tlD5YBpwr+LoTo1aeKS73CH51OYKlVL24sk8NHj62yuQQeGI3oeo5GeLKSQ7h7l
 eNcmPmueMEwK2JctN460Unc5LzHHkZ33lyB1UJ52JaQMTk4wAf29yowXIk9cacrl0ZvA
 KahSsyVuHCTlCi0leaKFTx4dcm6aBlB/hoObgJA3pcx6Or6UdQjTIRQO0AY2+iO/TEco
 HkyVtp8VV1vmaXipFtuZLx6snC4uvwNVwgsa0z9ijHBJRm+50dHEy2AF+h2wKhW6RK7o
 BB2oDnHvGihwDSaDs8JCw3unxn64wAqAMl9AOYRnG5Qv8H6gmWRBRJXL3LJhEykqIsrO
 VBzQ==
X-Gm-Message-State: AKaTC01Vx4cLEDzwcu5gAJmsywAlbHNyt3MoxDZWQYECzJPu9yyF7khXM1LGSESh37Xsk6uv
X-Received: by 10.99.136.194 with SMTP id l185mr124250309pgd.106.1481134000188; 
 Wed, 07 Dec 2016 10:06:40 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id c2sm44098808pfl.66.2016.12.07.10.06.39
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Dec 2016 10:06:39 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot][PATCH v4 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
Date: Wed,  7 Dec 2016 10:06:35 -0800
Message-Id: <1481133996-29973-3-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481133996-29973-1-git-send-email-raltherr@google.com>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Wed, 07 Dec 2016 18:06:43 -0000

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
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Remove unused variables from image_setup_linux()

Changes in v3:
- Remove unused #define IMAGE_ENABLE_RAMDISK_HIGH

Changes in v2:
- Fix compiler warning caused by ramdisk relocation hack

 cmd/bootm.c     |  3 +++
 common/image.c  | 10 ----------
 include/image.h |  6 ------
 3 files changed, 3 insertions(+), 16 deletions(-)

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
index 0be09e5..f9ee9d5 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1453,10 +1453,7 @@ int image_setup_linux(bootm_headers_t *images)
 {
 	ulong of_size = images->ft_len;
 	char **of_flat_tree = &images->ft_addr;
-	ulong *initrd_start = &images->initrd_start;
-	ulong *initrd_end = &images->initrd_end;
 	struct lmb *lmb = &images->lmb;
-	ulong rd_len;
 	int ret;
 
 	if (IMAGE_ENABLE_OF_LIBFDT)
@@ -1470,13 +1467,6 @@ int image_setup_linux(bootm_headers_t *images)
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
