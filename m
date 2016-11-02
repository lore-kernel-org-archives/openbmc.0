Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7xH90YmVzDvqB
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 16:19:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=H9TvZAdg; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id i88so4817990pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=cmrOu7/1yux2ttHkzmG4t3krRAScsp38tQnp4F1dzFQ=;
 b=H9TvZAdgytSeObzhfaShn6Xk9oQJKHTHnammH8dXJ+QYIGiL4CWbVURkujz8N9seGE
 JOo27SgJf0aJLeRSPcHlZ/ZL/+BPlu2veeOEtGR1PDrwk7gaYfZfJcY2bBWDiojgtdJt
 GI5+nxlionm0BCRiyY1p3ny+kLklqwoQrU00aOk4YUkNyO4HGTck8+Pm7l4H10KN8sSr
 MJ0JfxdSubQkSMRyl2Ap5L438f85shu+NDU5ZzWNgoYFO+XL+/PAKoy+PJ2FYix/pAi5
 kfghtD9a4/aG8H/35Frveln6UfOc5HcCqGF0MZ2+gN0cUR0KvJ10WPbxYN7vOEPa4X36
 9zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=cmrOu7/1yux2ttHkzmG4t3krRAScsp38tQnp4F1dzFQ=;
 b=Y9jzLak4MkgC4583qCvpA1+EAdGk+yuuT7VVi+3ZJmKKl35XHSZx1N9GdEazsSOe/K
 34BDTtk7pd4HNh+kdB0efrTBs02RatTCQHXz1a1aNJMhYrqFaom9C7B33tu9p13IJbhq
 nap+Sp1tkB2pjTnNXF2HDa/4OHmYU9sAoWt9auc/jAGYBjQMBNrKINAZ3E8Et/yJx1pu
 E1SkftjyqP462ntFVD+0QOkv4lRPg4Xz0wZCTT2siCO8xh7W1S6ak98rFHtTHgltk9BV
 X0+koixf+rKn50ex9xPgdLG4LQQHwtzreK0Zb+0fCXWue1pC6KLahwCAFbVEd24hTw1h
 m+KA==
X-Gm-Message-State: ABUngvcnXolJOxk+QN6qoHfj6TCc6J15yhdKJ1tPHwyaiF+64ksndQ9gnnkobnYcnycwB8Te
X-Received: by 10.99.213.21 with SMTP id c21mr2874066pgg.176.1478063970450;
 Tue, 01 Nov 2016 22:19:30 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id rx1sm742300pab.32.2016.11.01.22.19.29
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 22:19:29 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Tue,  1 Nov 2016 22:19:27 -0700
Message-Id: <1478063967-28301-1-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Wed, 02 Nov 2016 05:19:33 -0000

FIT is the modern u-boot native image format for kernels, device trees,
and ramdisks.  Enabling FIT only compiles in support for the image
format.  For these devices, the kernel+dtb and ramdisk are loaded from
separate locations in flash and be any mix of legacy or FIT images.
When using FIT images, the dtb is stored as a separate entry that
requires additional support to load it into RAM and pass it to the
kernel.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 configs/ast_g4_ncsi_defconfig | 3 +++
 configs/ast_g4_phy_defconfig  | 3 +++
 configs/ast_g5_ncsi_defconfig | 3 +++
 configs/ast_g5_phy_defconfig  | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
index 4ee71c5..70cd3c2 100644
--- a/configs/ast_g4_ncsi_defconfig
+++ b/configs/ast_g4_ncsi_defconfig
@@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G4=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
index 61fd69b..468fbc4 100644
--- a/configs/ast_g4_phy_defconfig
+++ b/configs/ast_g4_phy_defconfig
@@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
index 6d11afb..8a9c297 100644
--- a/configs/ast_g5_ncsi_defconfig
+++ b/configs/ast_g5_ncsi_defconfig
@@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G5=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
index 20f62e0..fd450b9 100644
--- a/configs/ast_g5_phy_defconfig
+++ b/configs/ast_g5_phy_defconfig
@@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
-- 
2.8.0.rc3.226.g39d4020
