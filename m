Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7xRB4whKzDw95
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 16:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Rwgui1An; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id i88so4932208pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 22:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=pNDYkkfTHBgTPSFYIubm5mX/YoNQGDwQOe3SHHOGYqU=;
 b=Rwgui1An/tQef1NWMod6qXKgf0wlGew45CuFc9Ekxz4s/CLizS7Etw+7VZa3g8Jk6t
 zKTRj4RcNLHG7G7IzvA3L6KqKhjGDYHL1b1RZ00aQWwFVWK1I9cAUQ8pprzvtF4sJmLR
 V6rnaVx8kq3++5AAMQjl/dpYGaxq+iPBSAB1dHEP93TsEbVb3SE7BIHlMCFs8N+TgrD3
 ozp+arMeHlAOs4hXV1ZrfOBzjb4jcEy9835RRA25v6i5JKWHhYU5jFkmZ2ruo+ei+M5Q
 t6pqlP0QlXFjqpkL20Ebo41NGJgHae97v+6KJ9ejDymFP+0CBEgpf+64NpZXSik2LBpB
 TAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=pNDYkkfTHBgTPSFYIubm5mX/YoNQGDwQOe3SHHOGYqU=;
 b=MGLqzjEw0Ahl7VgwLysrkt1bz+L7vKvB49ZcvtNC49gmElRDkqUCRcCa9JbzZDEta+
 f68DIn+BuYF/mExxnIprF+kBUqhjvxaeQd1LNmtj5zFvJT083fC6b5t1DPNF4hE+w/hs
 b2myCoSKF6Y5cPX8QLmEp34j1HR9NX/u5Ey0DQxyJ7KyVTAUbO7wQfD4jLmhPBAgTw06
 QJ+y0jaYPOwk0OJUyn6zz2UDL/7TdhNq+axvfknVGnf9LLgthAJRMVnMvLB/rkFmqE0P
 v2HgkKJKVVcn893NfKbn4fnaXUtnmRQ+xfobGYFl6GXK3z/1j55CunsvvNA/iwNmzCvy
 dLDQ==
X-Gm-Message-State: ABUngvePnsSZUz4mEf/fe3eyRR/rO23RBuCR4Dl0f1QzlzwtbFt8FASwM+DHP04o0qpcV6YU
X-Received: by 10.99.49.213 with SMTP id x204mr2884661pgx.92.1478064388739;
 Tue, 01 Nov 2016 22:26:28 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id jz5sm837381pad.10.2016.11.01.22.26.27
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 22:26:28 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Tue,  1 Nov 2016 22:26:26 -0700
Message-Id: <1478064386-29575-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 05:26:31 -0000

FIT is the modern u-boot native image format for kernels, device trees,
and ramdisks.  Enabling FIT only compiles in support for the image
format.  For these devices, the kernel+dtb and ramdisk are loaded from
separate locations in flash and can be any mix of legacy or FIT images.
When using FIT images, the dtb is stored as a separate entry that
requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.

Tested under qemu with both legacy and FIT kernel+dtb images for
palmetto and witherspoon.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
Changes since v1:
- Fixed commit message grammar
- Clarified config option needed for FDT loading
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
