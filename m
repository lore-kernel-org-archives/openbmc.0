Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f1/LWnPq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nsiZMspj"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z4Ps59PtzDqmj
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 00:58:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C6B3221751;
 Mon, 23 Jul 2018 10:58:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Jul 2018 10:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=PI1+/Ga5URs1iKNiPqApuidaTFcumPBXP8a0LkCqU
 qM=; b=f1/LWnPqQZfMvaSHLWRdCT4OMWBkGROx8aLH3MAqSzLt/sjrwLugrbnMl
 L9bk4XVIxsgyiwzds4hzx2hB3ITec01vK1JDXY9zrwY2fx5KLVQPXyak+eoIzpwl
 l2O+MLrir8ayalY1/8ZJVBIvG8/m9zHc1JaQYHTLopnSat6q4S2BPG2ikrI8R8q6
 S3IAgcVWOC/3woY1Wag2NrKDPYB7hhjM9ERDWbvSLzUrIjo07bPBErNq22swUE28
 jP5rjL+1uzxSU8nixAbTKfQCbWpW2EFxzDBEWcVgkHzcpt1qG0JQS3SG/KOZ3A0w
 QZnHBhIGWJoUqai74SterBa/hlijg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PI1+/Ga5URs1iKNiP
 qApuidaTFcumPBXP8a0LkCqUqM=; b=nsiZMspjs9N1NDrt+IIlqLt67wes/R24N
 i3t6hOT8sub8mRbAsxn6L9dT3hYhrkvO45qKMjF7wFNOxOUUuxYDWu0oD9TCFzuq
 P48cOakSOxFzRbIfO6y7FlzuzEEbuGHcISil1pQiHhhd+6ncVA7KhwyPWUswdDVl
 QU24zdzSwXtuOj5YHX5Hvm7x1BSfnlmg1O6ZD2dwqrT3LoGyfuzex2LWX9EEIumO
 WtLDvW8AJuJeBJu5NwYzt/xrA0bERHOmurG+1E3EzrgK7zne8bCHN7wefMflvZfX
 bacg2SgCgXL0+/085ltJqZscD1m42bO3hzRQg11tAzNCDG5rF6Gjw==
X-ME-Proxy: <xmx:Le1VW7wUbMUzudlk8YJc9yYI4bkt80QAZjNxoE0oktipVMYtl9ljVw>
 <xmx:Le1VW035o4EE4Cw_Zico3Q6NSIcHKFT3XC7vh4Z3KS5xQnwhdFXLwQ>
 <xmx:Le1VW0nqUmRuBsrAnWGARMvkOyyCuTFuwqADIzyRp5H3m_GyketCjQ>
 <xmx:Le1VW78oFqpIhLrxSRsqNODxyjdCudeq1gwfNqIzDhpS9JDjxfmAxA>
 <xmx:Le1VWyIBuE8NORCETeR3WaKHxBzdL4P9SDGx5Ul5TB0TJA61WyLGxA>
 <xmx:Le1VW66e0j6LFqGdb-d2Fd_HhTS6mpGS99ptqKcbppurJMwwhkhBfQ>
X-ME-Sender: <xms:Le1VW1wfC1NIH2swEUB03d_lMVG5wUQQ-j4-80IYv_diBCnY0gueLg>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id F0ED5E4314;
 Mon, 23 Jul 2018 10:58:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 0/4] Cleanups and disable unnecessary features
Date: Tue, 24 Jul 2018 00:28:36 +0930
Message-Id: <20180723145840.17856-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2018 14:59:01 -0000

Hello,

This series is a mishmash of cleanups with an added dash of disabling value-add
features that we don't require during normal BMC operation. It has been tested
on OpenPOWER Palmetto (AST2400) and Witherspoon (AST2500) platforms.

Please review!

Cheers,

Andrew

Andrew Jeffery (4):
  checkpatch: Fix unescaped brace warning
  ast-g4: Fix typo in board_init() comment
  arch-aspeed: Make AHBC and SDMC header guards unique
  aspeed: Disable unnecessary features

 arch/arm/include/asm/arch-aspeed/regs-ahbc.h |  4 +-
 arch/arm/include/asm/arch-aspeed/regs-lpc.h  | 29 +++++++++++++++
 arch/arm/include/asm/arch-aspeed/regs-scu.h  |  8 +++-
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h |  8 +++-
 board/aspeed/ast-g4/ast-g4.c                 | 35 +++++++++++++++++-
 board/aspeed/ast-g5/ast-g5.c                 | 39 +++++++++++++++++++-
 scripts/checkpatch.pl                        |  2 +-
 7 files changed, 116 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-lpc.h

-- 
2.17.1
