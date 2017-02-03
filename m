Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3Zd4RPlzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CQyKEqAq"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ESqG1YAg"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E90720A72;
 Thu,  2 Feb 2017 23:20:55 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=yajAMp6XzJJ98rq4VCUZlt3k/LA
 =; b=CQyKEqAqXQBOmd9bvUtW2/nVhhofXnKLsijlXrTveKkDC3g/lNnJ6Fg4qQv
 oQVnPSKt7LCrMR1EWjJvKTYeN34wTzv1cOvDK/htlZlu25vVbg4rxkBFCAIVUV2R
 vMSJoMmqw02xaPucsITm2QsWqgyztep4jiIZYjAQc2phRF6g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ya
 jAMp6XzJJ98rq4VCUZlt3k/LA=; b=ESqG1YAgR0Y/vcTP89FuK7rmTsgRtBo/4/
 WnW3ejnO5rtrL8x2AB2MzUOk+YAd9mZvZdoITeSO80PttNUEVd3HY+dabGe9AO6B
 Xf9/MKqazeDnNiDUsqZMlnq3q62C802UeEWhogXTBVhcTQ2Wp0PBoRxdjFomcA/2
 nnuywpPRA=
X-ME-Sender: <xms:JwWUWPHIakqDtSZDASU5hjmuRddiMxbxJ43Hm4-6MFElvHtDOWvtpw>
X-Sasl-enc: yp+1/Szbm/Qc+MUkC9chwBlCyv9ulkOnnyQez6qpzUAl 1486095654
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69AF7240CC;
 Thu,  2 Feb 2017 23:20:53 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [RESEND PATCH linux dev-4.7 00/14] Update GPIO and pinctrl to upstream
Date: Fri,  3 Feb 2017 14:49:59 +1030
Message-Id: <20170203042013.2719-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 03 Feb 2017 04:20:58 -0000

Hi Joel,

This series gets the GPIO and pinctrl subsystems of dev-4.7 into the same state
as upstream. A handful of patches reset things back to mainline, and then
patches applied by the GPIO and pinctrl maintainer are cherry-picked in.

The series has three checkpatch warnings, one for "lack" of Kconfig symbol
description in 2/14 (which simply resets some state to match mainline), a
second for a duplicate S-o-B tag in 5/14 and another regarding commit message
line length in 6/14. I've added my S-o-B twice in 5/14 because the patch
doesn't backport cleanly and I had to remove some code. The commit message
warning in 6/14 is for a link to the upstream patch and isn't appropriate to
wrap.

Other than that, it builds with aspeed_g{4,5}_defconfigs and boots in Palmetto
and Romulus QEMU machines. The cherry-picked patches have been tested on
Palmetto and AST2500EVB hardware.

Please review.

Cheers,

Andrew

Andrew Jeffery (13):
  gpio: aspeed: dt: Reset bindings to mainline
  gpio: aspeed: Reset to mainline
  aspeed: dt: Mark GPIO controller as interrupt-controller
  gpio: aspeed: Add banks Y, Z, AA, AB and AC
  gpio: aspeed: Remove dependence on GPIOF_* macros
  aspeed: g5: dt: Update GPIO pin range to mux banks Y, Z, AA, AB, AC
  pinctrl: aspeed: Reset to mainline
  pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
  pinctrl: aspeed: Read and write bits in LPC and GFX controllers
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins
  pinctrl: aspeed: Fix kerneldoc return descriptions
  pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-7], AB[0-7]

Joel Stanley (1):
  gpio: aspeed: Make bank names strings

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |  20 +-
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  91 ++++++-
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   3 +-
 drivers/gpio/Kconfig                               |  13 +-
 drivers/gpio/gpio-aspeed.c                         | 299 ++++++++++++++-------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  63 ++---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  76 ++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 216 +++++++--------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  48 ++--
 10 files changed, 507 insertions(+), 323 deletions(-)

-- 
2.9.3
