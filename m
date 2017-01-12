Return-Path: <raltherr@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzTnp3SQYzDqPH
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 13:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S5dzYGHB"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id y143so3952603pfb.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 18:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=oPd0FiMzumwb/F2TZoalCNTj0hucZWxoXm1BLPUycVY=;
 b=S5dzYGHBs4ZEzTxA1znciDhtII0KrLEcDSmCb2IsW8GvvFNsO+oAOdgjB+oV0gVUps
 2Gh/gk95rB5jfWEjKCydodMfIrVITgfxI4yMrQC/MJWasyRHcUdWhAFbsmHVrrDKZXlI
 jhsy4v0MOVrNW8GyLXQHuicxF/5NLvskEQufki0x2KU1Vlg6WF0/XMGs6RPuoSgQjFai
 dZjwFLGQUwpFZz7Tb99bXVV1YOTphP+Jw3plhvRolnzucvxpOMN8QBpQReFoD8RCXWgj
 Rbzy/ZEihtHCXToC/FwOvlqs9UZH1qDNvPzPZ1L/TdOQxA/mMIbU/BqXUIdrfAh288mX
 rwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=oPd0FiMzumwb/F2TZoalCNTj0hucZWxoXm1BLPUycVY=;
 b=UTUHen/YlR61It0KKkagFm2Di3voYW0+eFnPRwMPuazzSu0aDEYjOppeTcUjemjLtX
 w13oDJIle39kPm0xpkF86zuHpVrV7VKgmK4vzu3z46NAoVsq2VJi943WBqxQ1N0raP3T
 ZHl5vWD5vN8+l8UXLdVGi2StMx6KSEAbZ8eP3nbhrRAn+/nF5xoAuP9GxQXsrga5xde3
 JELkBDDIe6DlTgqVWyZirCO4PVUWbO9KEcpitS0sGKdWvfS/bY2QyKk2BaeRxdEITL/y
 f3EIFxidmEY3f75/WNPe7OybU0p/1tGewm/8Iy4Dmix8zAMj55xoRYZzpL1/522Z4p40
 wjAw==
X-Gm-Message-State: AIkVDXIrn2aVNQD5OTHrJswj2TaH2kzMrUi92HgLDUPc7QIi5ZEesAjGTNCOTcnEo8Hkh4Af
X-Received: by 10.99.116.22 with SMTP id p22mr14443247pgc.161.1484187211838;
 Wed, 11 Jan 2017 18:13:31 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id e5sm16617141pfd.77.2017.01.11.18.13.31
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Jan 2017 18:13:31 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [U-Boot PATCH 1/2] aspeed: Use HUSH shell
Date: Wed, 11 Jan 2017 18:13:27 -0800
Message-Id: <20170112021328.27200-2-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170112021328.27200-1-raltherr@google.com>
References: <20170112021328.27200-1-raltherr@google.com>
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
X-List-Received-Date: Thu, 12 Jan 2017 02:13:35 -0000

HUSH is the newer command-line interface that provides scripting
capabilities.  Those are needed for an boot command that can boot either
a FIT image that includes a ramdisk or a separate kernel and ramdisk.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 configs/ast_g4_ncsi_defconfig | 1 +
 configs/ast_g4_phy_defconfig  | 1 +
 configs/ast_g5_ncsi_defconfig | 1 +
 configs/ast_g5_phy_defconfig  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
index ab4907cfe2..54686bee5c 100644
--- a/configs/ast_g4_ncsi_defconfig
+++ b/configs/ast_g4_ncsi_defconfig
@@ -7,6 +7,7 @@ CONFIG_CMD_PING=y
 CONFIG_EFI_LOADER=n
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
+CONFIG_HUSH_PARSER=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
index 21a56c4b96..f8db39ef13 100644
--- a/configs/ast_g4_phy_defconfig
+++ b/configs/ast_g4_phy_defconfig
@@ -8,6 +8,7 @@ CONFIG_CMD_PING=y
 CONFIG_EFI_LOADER=n
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
+CONFIG_HUSH_PARSER=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
index 7cd4fd116d..74029ed514 100644
--- a/configs/ast_g5_ncsi_defconfig
+++ b/configs/ast_g5_ncsi_defconfig
@@ -7,6 +7,7 @@ CONFIG_CMD_PING=y
 CONFIG_EFI_LOADER=n
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
+CONFIG_HUSH_PARSER=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
index c686dd2297..767f3af605 100644
--- a/configs/ast_g5_phy_defconfig
+++ b/configs/ast_g5_phy_defconfig
@@ -8,6 +8,7 @@ CONFIG_CMD_PING=y
 CONFIG_EFI_LOADER=n
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
+CONFIG_HUSH_PARSER=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
-- 
2.11.0.390.gc69c2f50cf-goog
