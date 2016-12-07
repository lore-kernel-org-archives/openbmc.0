Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYmfC1qPpzDw2l
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 05:06:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nAGUGNbi"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id f188so163888722pgc.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=F7ONW4fopODz7+Wx2c261IHy+kgsacTcXCyaEinXZF4=;
 b=nAGUGNbi0y6TNaIRPGiN5nTtPYokexuygkXZxLGGYopHvX7LKfwtV9blPXkPH0lUwK
 0WsREqTkfnxjxCjB36jGazQB0+ngBa+M3BnM+IlEt09sv8gxW+roZURmgYf79VM3g7QI
 baf0YlouE4/DqLs7+Fv+h1fs6mzSx8yWBo3lAEu/ZujNs0mEhIikliFkFQNAgCSwJ5y3
 WIY0VjIqDtqLbu+TACFe4sVlDrFvYxi9iT0pkWM1DZazJova+eIWceDcwhyNtcwcSdbk
 I/jZjI+jdAslTkBafgnDCYR84M6Acho2cJS7DgM81pcFzfBTr8HxGm0J7/DhGsmG8/cd
 jUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=F7ONW4fopODz7+Wx2c261IHy+kgsacTcXCyaEinXZF4=;
 b=gMjI0ytHItbOoAJhSAKtV0zEmAWjaKxgVDJa1wzvkvYJ8asaOeDYbk0IAeoU6JG6yT
 q6g9vl+M1uaO4WQ53OldSAFSg07hSn/drbqJvHparfawzRHUCLruf7zcJGoTPJoG0ich
 tMnIYxx0bbrE4gUup+pwCTMmL0bdwJyfSC6TLTsdApjdUsCOp9oiuLUXKd1yLlzTLA+Z
 dM0MHc7MbxHoTYLNXww9NfbNJ+fac+ApG5ELHVWazSJItlR4UdP0Kopdm1aFTLOGiCsU
 HdNao1KLQqADkngh8rfSOfkZnAkG84OdCZurR8d5IEbbknhvKKS5ErDLES0vACZogXrk
 rwgQ==
X-Gm-Message-State: AKaTC02ju+UsZkhlNwLD1vCB9BuLf3cBiGfhuCwFEUCesgcJeyXw5YGfgv32XugFUJInD240
X-Received: by 10.99.144.65 with SMTP id a62mr123713101pge.103.1481134001052; 
 Wed, 07 Dec 2016 10:06:41 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id c2sm44098808pfl.66.2016.12.07.10.06.40
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Dec 2016 10:06:40 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot][PATCH v4 3/3] Enable FIT image support and FDT loading
 for AST2400/AST2500
Date: Wed,  7 Dec 2016 10:06:36 -0800
Message-Id: <1481133996-29973-4-git-send-email-raltherr@google.com>
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

FIT is the modern U-Boot native image format for kernels, device trees,
and ramdisks.  Enabling FIT only compiles in support for the image
format.  For these devices, the kernel+dtb and ramdisk are loaded from
separate locations in flash and can be any mix of legacy or FIT images.
When using FIT images, the dtb is stored as a separate entry that
requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.

U-Boot enables EFI support by default but it only builds once FIT
support is enabled.  EFI support adds ~13k to the binary and is
currently unused for any Aspeed platforms.  Explicitly disable EFI
support now that FIT support is enabled.

Tested under qemu with both legacy and FIT kernel+dtb images for
palmetto and witherspoon.

Signed-off-by: Rick Altherr <raltherr@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v4: None
Changes in v3:
- Fix capitalization of U-Boot in commit messages

Changes in v2:
- Reduce binary size by disabling EFI support

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
