Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVpg35Y9zzDw40
 for <openbmc@lists.ozlabs.org>; Sat,  3 Dec 2016 09:27:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kA01fLhV"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id p66so111929957pga.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Dec 2016 14:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Yhz9oodqKjelYwtjtTojKRzouIPogjCGCaKN9mPv66w=;
 b=kA01fLhVgOCbOpG0pv1VKBoN5FbJJcBbLFswB59fElNHcXQ+a5eBrfjSNrmIShfNDs
 9wFpSPLPC2DcEUi0ix6XmYZCZBOg7i2AFDPty+yIuk7x+ZRS+PLGu4WAa+vaPIlnUB8O
 gS9WLPcNWJdqcTS0yRBwd26/k552JvY6joDphoxyklVFf7XLuxoQ9lAaoxegiJ486evH
 AppFHTbAzotxdw55PCGVRHHSn5QS1N5KfY2W2yxxmZ2Lv4xs5fTJZ8BVBtXcCjyXPWmp
 H3/HQufgtoZqinwnIDyeW+isdklDkrls7aYeKk/r8lQfeS7V2MztdE08JHq5o5HVsgHm
 Yt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Yhz9oodqKjelYwtjtTojKRzouIPogjCGCaKN9mPv66w=;
 b=j/wYX/I1K/KWBWxYKqewEewoA6SfZY3s5ytIfiZ784v5bvFaelFknl/p2w18OConfy
 7k/pwO7BS7+sow/XLdhOb3eUK3in7s3gTddOqchqSt9jy+ketpZ29MB8HCiG6r6j3/qa
 Je86MUgmOVKKZDRmiXWVaN4xLq5uX+r05pw61QtrXYGDM1wFVDheSgoPEUFZNcZ6ELW3
 8DqovVi/bbpT8DuKzxHldn2nD3UL8poFznVex2hYDV2Qm0s20zwwicXQ9181cDT1hh26
 jpDVKfGw/McreYZA7HyaUfgF6LofT76IV933KQQdJ3sAO6CsReXtAUtdF6ZF5Dfjjs26
 rYaA==
X-Gm-Message-State: AKaTC00aWxzKHes3r8i+FgBgq1c26+hLnhGIEv1GK16Aw1VbCht8CxfpSNZuOyZ9LCcQnWcc
X-Received: by 10.99.102.69 with SMTP id a66mr82409459pgc.49.1480717629384;
 Fri, 02 Dec 2016 14:27:09 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id c142sm10020821pfb.23.2016.12.02.14.27.08
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Dec 2016 14:27:08 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
Date: Fri,  2 Dec 2016 14:27:03 -0800
Message-Id: <1480717624-24994-3-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480717624-24994-1-git-send-email-raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Fri, 02 Dec 2016 22:27:12 -0000

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
the OS being booted.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 cmd/bootm.c    | 3 +++
 common/image.c | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

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
-- 
2.8.0.rc3.226.g39d4020
