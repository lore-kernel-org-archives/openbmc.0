Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVpg4735zzDw40
 for <openbmc@lists.ozlabs.org>; Sat,  3 Dec 2016 09:27:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HxKtAzy1"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id p66so111930103pga.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Dec 2016 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=n/fJL3hV6PtwwsiUYteOm2YK4m8wUPKMZNisns23tJM=;
 b=HxKtAzy14wysanuXtzSxhgWNZTbm5pHvrF7y4bgMS9Aw6K2Jsg0xf1AgkQ6Qce6G5y
 UhQUX63rzdDFTIrJM6i78+5ER79Onf3Q+VuLiuqQf87YArdA7vBi0Y8F9ZFvttZMiCIP
 jQKQPh4DW26dKIeut0eEKCZWIDTDU04dOlKAwkbf2ublVlPv9kM4YCOJnk4GPm81InfC
 c0MCztcMckGAh3gv/uENs+9L5YAgTZyLsjntOnxIMXQqeWXaiBN5ibcqGcJYFGoE5eG5
 hzjKTdb5uHffKyHtUkYWBsi/Eolo+UNES13V3i4RN/g5j+xuDADckAfz/Z93kI2Z3LZ8
 XE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=n/fJL3hV6PtwwsiUYteOm2YK4m8wUPKMZNisns23tJM=;
 b=emKixOC0MSlZJgOjhfn2CnMMwgV4rHxbcdzeRmDLy5PiSqStXVfLVTg0XKZguN+m+6
 Lwas/Gr9pYefss1EvTrxbqbgzCOHRYuVRLZcSlpPQSGJoLmZcmTGFxRGZC9ebuM2YSXF
 t7abU3VuSn/3I4ynPqnirctOlYrvbFqtZQjuKi7v23rF/s/tKoeMXVzwfudltPCY5no9
 jywrBzfUwy54CuaXZSnDaOE0gw1tcrjFV40pBHXrczE2yXz7QugX4ZtO4D58LlMOs8u7
 VFLwMPyKK2ETUqvRvor0K6ip/fFEIgVkNcX5WkADbWA/LV5NlcCVMTaWqxOtsQLnkerr
 LBkg==
X-Gm-Message-State: AKaTC00rA3WvDDg+qWa76Co4veb09dNALmNR8tPSqLtdrg62kCPLTMdfDfgciQRLlXai+ehl
X-Received: by 10.99.170.5 with SMTP id e5mr83789978pgf.46.1480717631102;
 Fri, 02 Dec 2016 14:27:11 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id c142sm10020821pfb.23.2016.12.02.14.27.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Dec 2016 14:27:09 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 3/3] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Fri,  2 Dec 2016 14:27:04 -0800
Message-Id: <1480717624-24994-4-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Fri, 02 Dec 2016 22:27:13 -0000

FIT is the modern u-boot native image format for kernels, device trees,
and ramdisks.  Enabling FIT only compiles in support for the image
format.  For these devices, the kernel+dtb and ramdisk are loaded from
separate locations in flash and can be any mix of legacy or FIT images.
When using FIT images, the dtb is stored as a separate entry that
requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.

u-boot enables EFI support by default but it only builds once FIT
support is enabled.  EFI support adds ~13k to the binary and is
currently unused for any Aspeed platforms.  Explicitly disable EFI
support now that FIT support is enabled.

Tested under qemu with both legacy and FIT kernel+dtb images for
palmetto and witherspoon.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 configs/ast_g4_ncsi_defconfig | 5 +++++
 configs/ast_g4_phy_defconfig  | 5 +++++
 configs/ast_g5_ncsi_defconfig | 5 +++++
 configs/ast_g5_phy_defconfig  | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
index 4ee71c5..ab4907c 100644
--- a/configs/ast_g4_ncsi_defconfig
+++ b/configs/ast_g4_ncsi_defconfig
@@ -1,7 +1,12 @@
 CONFIG_ARM=y
 CONFIG_TARGET_AST_G4=y
 CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTEFI=n
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_EFI_LOADER=n
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
index 61fd69b..21a56c4 100644
--- a/configs/ast_g4_phy_defconfig
+++ b/configs/ast_g4_phy_defconfig
@@ -2,7 +2,12 @@ CONFIG_ARM=y
 CONFIG_TARGET_AST_G4=y
 CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTEFI=n
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_EFI_LOADER=n
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
index 6d11afb..7cd4fd1 100644
--- a/configs/ast_g5_ncsi_defconfig
+++ b/configs/ast_g5_ncsi_defconfig
@@ -1,7 +1,12 @@
 CONFIG_ARM=y
 CONFIG_TARGET_AST_G5=y
 CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTEFI=n
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_EFI_LOADER=n
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
index 20f62e0..c686dd2 100644
--- a/configs/ast_g5_phy_defconfig
+++ b/configs/ast_g5_phy_defconfig
@@ -2,7 +2,12 @@ CONFIG_ARM=y
 CONFIG_TARGET_AST_G5=y
 CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTEFI=n
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_EFI_LOADER=n
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
-- 
2.8.0.rc3.226.g39d4020
