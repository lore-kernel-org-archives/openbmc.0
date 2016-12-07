Return-Path: <raltherr@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYmf84FbzzDw2k
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 05:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="p5S3ks9H"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id p66so164426664pga.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GkJY3hdv21OMrVjFSWnfvO1Qy2Cf3uCAL4v3R2CnmR4=;
 b=p5S3ks9H1YqUNa2iuiaR6FMzVyMW5DF8zRah7Z9Ly3qdimJz7UjlekiFnhmV2BK1e+
 NBXqyoxAIT2DfsNdugVNZFm9T6/lI7eGxTckLXIx3f4l7kWL5Me5hZfgzBNtL1a4dr1g
 qclYKfwMbQHX22HUy5b/uJY3jcsUiSwWVnzsdIBESOEzp76DcG2LYGEY7deERWwGc0fA
 sp7r2jiP3qwjLutWkTKtFY4lA+wzYroZDdjRsRG7r2aE+qIa53cMoE8s0gK5mY+4t0b9
 IA0Sm2D1aBiDHBXuHkNDByl9SvWzzfXpfmI/lN7I+Fdrr0y9HEQqaAmb8P3+MHWyamtc
 JuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GkJY3hdv21OMrVjFSWnfvO1Qy2Cf3uCAL4v3R2CnmR4=;
 b=CG3P2hbQIWvIHqlxk7X2yHCe3PhSF+JAeRp97uXr4Rd1c5LkJKcAUyA2j2ZLs+IkhS
 QuBc78svdlQsjyrYueo5NP2ejnhq492ZJQSLLXMXQ3pErXJ84ip+PJNB6yuQ+xlbQjqA
 Y68wDALQXdYerxPQ2bntu0s5dcCMDXxYykErxo25ozhta18h/42qw4uqR/NdaWlj6vsc
 WSQQ2ha9qMdVM1U8m7312iHKF7KksVv8kqmTY/jmLkeTHmoZdcNgz2HN6+UdFWl4tz0T
 LSJgHIwrgLUWtV7EzD+ewROK65t+bBKe29RbWRSOtP3Ef7du9gXEDDBbiy9Rw49EgkfG
 0dPA==
X-Gm-Message-State: AKaTC01zO5gxZkDwz+iGB8/FQrB1ULjATlujb7N3dYmJhZwkADuoTrZpdRojmYxck1a8diJ8
X-Received: by 10.99.175.26 with SMTP id w26mr123528543pge.144.1481133998318; 
 Wed, 07 Dec 2016 10:06:38 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id c2sm44098808pfl.66.2016.12.07.10.06.37
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Dec 2016 10:06:37 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot][PATCH v4 0/3] Enable FIT image support and FDT loading
 for AST2400/AST2500
Date: Wed,  7 Dec 2016 10:06:33 -0800
Message-Id: <1481133996-29973-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Wed, 07 Dec 2016 18:06:41 -0000
X-List-Received-Date: Wed, 07 Dec 2016 18:06:41 -0000

Enable support for loading from FIT images and passing parameters to the
Linux kernel via FDT on AST2400/AST2500.  Replace a hack that forced
ramdisk relocation with a proper fix as the hack was broken with FDT
support enabled.

Series was tested under qemu by booting images for Palmetto and
Withspoon.  Both legacy and FIT images for kernel+dtb were tested.
Legacy image was always used for ramdisk.

Changes in v4:
- Remove unused variables from image_setup_linux()

Changes in v3:
- Remove unused #define IMAGE_ENABLE_RAMDISK_HIGH
- Fix capitalization of U-Boot in commit messages

Changes in v2:
- Fix compiler warning caused by ramdisk relocation hack
- Reduce binary size by disabling EFI support

Cédric Le Goater (1):
  aspeed: remove hack loading ramdisk in memory

Rick Altherr (2):
  bootm: relocate ramdisk if CONFIG_SYS_BOOT_RAMDISK_HIGH set
  Enable FIT image support and FDT loading for AST2400/AST2500

 cmd/bootm.c                   |  3 +++
 common/image.c                | 21 ---------------------
 configs/ast_g4_ncsi_defconfig |  5 +++++
 configs/ast_g4_phy_defconfig  |  5 +++++
 configs/ast_g5_ncsi_defconfig |  5 +++++
 configs/ast_g5_phy_defconfig  |  5 +++++
 include/image.h               |  6 ------
 7 files changed, 23 insertions(+), 27 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
