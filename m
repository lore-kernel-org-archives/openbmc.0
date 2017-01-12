Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzTnp3QwKzDqPB
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 13:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U6QjmiwI"; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id 189so3873886pfu.3
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 18:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=+NyM+8kFd9ySbUVU0XQi32EhbeE2WoEvDy711I9M/Fw=;
 b=U6QjmiwIEnc5RB/PS9dhD59m/D+BmfpmYDwUWpj1QVVWaawxkSYbFYZvA8axPRZBIW
 zcMhx9JyZrazDgvP3A2q8wqsgxKB4sV2zPshIqtURfNF6C42Qfiomrz5w8d43DJse/hM
 uOe+fw98p6ceiL5bnaGrLvFO7rmfYQDRjaMAJGGfbtpIWzyBvd04WyHpkcHyslujt0rm
 kBIbDGobvMIUzcOmF89tZMgGcxszOAoyoqZCnmm8j5PN282s2314EhujxiUzsl8SMryA
 dwP4607T1wKzNIzg4ip9yLj30qMlzqU1pLcNOrKslZzWKCgBnmPClmriLFi0IHlnx51C
 TDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=+NyM+8kFd9ySbUVU0XQi32EhbeE2WoEvDy711I9M/Fw=;
 b=TNu+74Q8gcVOEcQ+vQF294LkLSfOxh/VItvjs1Eu2+dagris7dA6B1aSlFBlZGwhkx
 GDB25/duMDMJRCXG790L9J1PT+WchPU2KdfCcnMrzQEUtDqVUlBg5D+CqHAyM+tmevN6
 LjB5RL6eXLvm3FNYJVQX99q6pWd3g2SVNubwXiyDiLKeM/N/oR6AB8Cujqoz7yYoDFDi
 qra7YQOLdGi+S1cggCQjPn5399l0Dp0PNFp1tZMi1V0zobn4O3E8GCveiDpKSalAREBh
 j2w11UZTnsNycct0gprFNPee9y731eqEgvDX5u5pcBi6sreRgQDjxEmgeeMNq7zMckaW
 czJg==
X-Gm-Message-State: AIkVDXJyUn09s4QI29VFXBEyCYMNuD86Yy2lSJoOYHILSF1AgIENcJN7anYnFlvzCsdrpunZ
X-Received: by 10.99.111.201 with SMTP id k192mr14513077pgc.176.1484187210922; 
 Wed, 11 Jan 2017 18:13:30 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id e5sm16617141pfd.77.2017.01.11.18.13.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Jan 2017 18:13:30 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [U-Boot PATCH 0/2] aspeed: Use FIT-provided ramdisk if available
Date: Wed, 11 Jan 2017 18:13:26 -0800
Message-Id: <20170112021328.27200-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
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

Changes the default boot command on Aspeed SoCs to use a ramdisk from
the kernel's FIT image, if available, and fallback to loading a separate
ramdisk image from a fixed flash location if not.  Supporting both
allows for an upgrade path while the ramdisk location is changed.


Rick Altherr (2):
  aspeed: Use HUSH shell
  aspeed: use FIT-provided ramdisk if available

 configs/ast_g4_ncsi_defconfig | 1 +
 configs/ast_g4_phy_defconfig  | 1 +
 configs/ast_g5_ncsi_defconfig | 1 +
 configs/ast_g5_phy_defconfig  | 1 +
 include/configs/ast-common.h  | 6 +++++-
 5 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.11.0.390.gc69c2f50cf-goog
