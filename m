Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVpg06nJMzDw40
 for <openbmc@lists.ozlabs.org>; Sat,  3 Dec 2016 09:27:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ehJUUL79"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id p66so111929481pga.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Dec 2016 14:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nX2uYZirPvRgZGYcryIDl8UtRY5DasgY0stWLyhHc9E=;
 b=ehJUUL79fVkvM7tYrHQ+LhQFKt51l/6KfOvbVH/c4mw4LERO76cgkhVjAde1RyKAss
 OCZ+F4cmGRfwUGi3LhYWxWZbCdaGPuNEyfOHG1i1QWViNkFXG94nVTfbwMArJmkTBYdR
 hxG3MNInGbyUP0hFMX0+tigDFxZ9ByEHF3CFFltjyH/h+cNii35KJGC7mDc6Yj72Vjj5
 OaKOnSsXj6WNvbmdNh5nlv74xUzW/dRLZ8X4MoyPBapCjXJtUul7eN7FF4UhabQPRRkV
 nSWdyxZPLbx0r9x+vRngFohNNwlDMmA2aZ71qvlI8XcqwHV+nx6g5rz6Qk1sD9NiLm11
 Titg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nX2uYZirPvRgZGYcryIDl8UtRY5DasgY0stWLyhHc9E=;
 b=bCnclK2FbgZlDi5ZR6g+5uCP50jwFdptFYofMDNLPbJXAqgyvrXMQk+0gufdudGOI1
 rYcdchmRMMqHa8zhWZ1NiODGLijfZgn28umL0T/b1NF3eyjR0Zp73BzJXeRNzXbm34uj
 48JXA9JI/JCH4qlPgkRwoX5lUSWgUe0eToCyP1Pj4I/3hMY3BS+x3eiutH20bo5pupPu
 9rhhutlTaHqvWRf+a/ocG6dQX/EYo5VsNgHD4NT5E4Mndx5Ne0f2dmuInqklnwvMbzVw
 3oM8ODHGxnKcXZ1Tytha7VEBsx80X8EV5iw/X0ar7SYGh60jeVk1Q8wLhgR5a1QA+vsM
 1bvA==
X-Gm-Message-State: AKaTC01nQbuhzhfDbImzJzlIDC3sykRAm4gLfQBaLrpkf3sdOvATzXsjE04ODzZYP7VjR9kh
X-Received: by 10.99.174.75 with SMTP id e11mr82514914pgp.89.1480717626206;
 Fri, 02 Dec 2016 14:27:06 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id c142sm10020821pfb.23.2016.12.02.14.27.05
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Dec 2016 14:27:05 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 0/3] Enable FIT image support and FDT loading for
 AST2400/AST2500
Date: Fri,  2 Dec 2016 14:27:01 -0800
Message-Id: <1480717624-24994-1-git-send-email-raltherr@google.com>
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
X-List-Received-Date: Fri, 02 Dec 2016 22:27:09 -0000

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
 6 files changed, 23 insertions(+), 18 deletions(-)
--
Changes for v2:
  - Fix compiler warning caused by ramdisk relocation hack
  - Reduce binary size by disabling EFI support
-- 
2.8.0.rc3.226.g39d4020
