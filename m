Return-Path: <raltherr@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXXz92GNpzDvjf
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 05:17:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AAvt+Xd2"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id p66so139209431pga.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=JG+zcaCP+Jzt5DBAePEPqkq6v+rvX10uR0ASosO7Avo=;
 b=AAvt+Xd2lpHHnkET0GfvzjyEOZDgr8BwJWThfYLSJHDsFZ0ap9qFiEUcsFCDeHgFlA
 tSZZyIrk2c6fNTGbkocaOvgKo1NC1Ow3tY2mJ43yfvbvvioTMMeKxSUZ64hGPiIvLKCO
 qVB2gRt2ZHYBJPgzg+n6IG0Bi8ZiEjHhHjaFKXltqDtzJ7ZN5wP3BN5SaumQDqWIRYp5
 B8KUaoR26rr01n3uWS+SaxEaQ+RQrENFI1M8Yi1pgiHDNLWpkiBw8VDJuAKl77/dsQFw
 Cvph4toke3yhuZqg9iQLUfU2hw6ZMg6FYUmAbMMlKRNwgmIAaJxoe2P8V55i1hJtY1Ns
 tCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=JG+zcaCP+Jzt5DBAePEPqkq6v+rvX10uR0ASosO7Avo=;
 b=hUe6ItR8szAdUFSbPjkFxQuF3kW+TNR/ANPOLcxl5SYupBQAMGtgFo4RNbfw88Hg5E
 0mwvyVOMEjMVOm+VBZo9lHeQTORr8RX7ef7JMLycUALwOWBW4w039ULnwwcnKVWAbJKF
 e2joBHtcHCnHcGk8xTN5trwvA2GPR6UQ+n1WXaj2IHkXnwND1qjHzt6v+4yUQV+bXcOs
 VPYS2gKEF1XATQOFdVQ54VZYDEbZgewYceDCfRcbfCLQBoDAGNrdNCx0B9jsKb/ndAYS
 oMX4PWMfBKN5Jk5w+1OFqz6k/xXbC7jzLrVCvEDj9c1S1zPNyV9ZjWJKgb66aPceEmrO
 koZw==
X-Gm-Message-State: AKaTC01VkyD5KA8rr+D0K+MYLoOyL+IsmVy3giCq0kBGbxQFeRiqZOLg34EQk47aSrG/IaZa
X-Received: by 10.99.204.81 with SMTP id q17mr104875932pgi.168.1480961827143; 
 Mon, 05 Dec 2016 10:17:07 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id p13sm29059192pgf.47.2016.12.05.10.17.06
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Dec 2016 10:17:06 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v3 3/3] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Mon,  5 Dec 2016 10:17:02 -0800
Message-Id: <1480961822-6631-4-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Mon, 05 Dec 2016 18:17:10 -0000

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
