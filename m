Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXXz71hTczDvjf
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 05:17:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OPTkGyCt"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id 189so64879940pfz.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 10:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zrW0me/b09d5dvDLiOT3oLUmOIQ69UlYQq7qwNmP5NQ=;
 b=OPTkGyCtLijnK9skQm38ur+KVwCDoOVF1iRevLJEWYnu/K4A/o6wdq1rBg0zVomJ9u
 VCErG4SIgMQoB7M/M8Kos1ySgmeYjctOCpNrbTvJcn4aqk1Zi9+qZpv5C3SuowTxdG35
 Mcnw8sV33fJUSChuf1MysBzBipN/zhXz7jsNvn1BCQB2otCYqpuVjPkvjD1u0QBILF+p
 Z3oIbY9npqwFZFg/OHBKn2W4TvnJPc2MrvbI1IWbOpnPMXrRaLaWTDXLt0D/p+D4bYen
 tAVkaB+5cX/w6Iufu8yVl/qA3Umqv1KKzKeZYjv4qCCRqNzBpwHsyEPe6Sj43RKJWx8X
 xxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zrW0me/b09d5dvDLiOT3oLUmOIQ69UlYQq7qwNmP5NQ=;
 b=HQ7zhk62WThAnkW+hHIPhlFadqhviKUZOmXyB4dlGc8r0QeBphZtWark9YUnRevTg5
 6qUMQ8wBMJuQSd97rxUoQfrZBLWL+mhJylQPKQhi/GviWfTubAHXXQa7/aXHbC7XZhBY
 wvveDxVGZet1ZnTr6goFvbCAPQDtOfoiDW7HzivBxTmTzMOTidLCCo7zg5Zmy9iSgDRH
 bWu2c7U9r9QpdFDYbfgi4xBBCHN4ySyb5AHehg6nGPkcHWCtaFMnDHk5baU7SqjIWqGW
 /AgQLIz6q5emI1GEToAYYCyzqOAwoeIDF7rT0SahsKvL6BVUrYJKq7GHZsdI8QyszDTh
 mLrw==
X-Gm-Message-State: AKaTC0155HUnmM7lSqsBxLZHUezx+CRhmJ8CCAYqqXBZpnW9piYPk9ze45ssNlmkB/VYcw/3
X-Received: by 10.99.24.84 with SMTP id 20mr105447209pgy.12.1480961824466;
 Mon, 05 Dec 2016 10:17:04 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id p13sm29059192pgf.47.2016.12.05.10.17.03
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Dec 2016 10:17:03 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v3 0/3] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Mon,  5 Dec 2016 10:16:59 -0800
Message-Id: <1480961822-6631-1-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Mon, 05 Dec 2016 18:17:07 -0000

Enable support for loading from FIT images and passing parameters to the Linux
kernel via FDT on AST2400/AST2500.  Replace a hack that forced ramdisk
relocation with a proper fix as the hack was broken with FDT support enabled.

Series was tested under qemu by booting images for Palmetto and Withspoon.
Both legacy and FIT images for kernel+dtb were tested.  Legacy image was always
used for ramdisk.

Cédric Le Goater (1):
  aspeed: remove hack loading ramdisk in memory

Rick Altherr (2):
  bootm: relocate ramdisk if CONFIG_SYS_BOOT_RAMDISK_HIGH set
  Enable FIT image support and FDT loading for AST2400/AST2500

 cmd/bootm.c                   |  3 +++
 common/image.c                | 18 ------------------
 configs/ast_g4_ncsi_defconfig |  5 +++++
 configs/ast_g4_phy_defconfig  |  5 +++++
 configs/ast_g5_ncsi_defconfig |  5 +++++
 configs/ast_g5_phy_defconfig  |  5 +++++
 include/image.h               |  6 ------
 7 files changed, 23 insertions(+), 24 deletions(-)

--
Changes for v2:
  - Fix compiler warning caused by ramdisk relocation hack
  - Reduce binary size by disabling EFI support

Changes for v3:
  - Fix capitalization of U-Boot in commit messages
  - Remove unused #define IMAGE_ENABLE_RAMDISK_HIGH
-- 
2.8.0.rc3.226.g39d4020
