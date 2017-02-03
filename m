Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF33z6nV5zDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 14:57:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PLktUKGz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BzIGxM+P"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C2D8E206DF;
 Thu,  2 Feb 2017 22:57:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 22:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=yajAMp6XzJJ98rq4VCUZlt3k/LA
 =; b=PLktUKGzn/gRACfAEB3EvqVdx3Z9a1cSVwxS7z7gAViTUmhD1og36BhPDnW
 x29iaGE0RFGBrifhQPVycp4/fMu8YTHe46UpZIBTtArP34JOFpi+VcAdKJsnbex6
 jNIHXsN3SwpyhJc21js2I39uQlnI3+sBRbOXgDX1KAJF2Imc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ya
 jAMp6XzJJ98rq4VCUZlt3k/LA=; b=BzIGxM+PCz0EsJWZluGzfJmRMfuq50yEbz
 U6MnLNsJG0qyNpJGa5PX8ehbbt1SnIabj4aCESzSBrifiKOqVtK52Ic2tpltFVNd
 x8biQDbHSlIEnwWrRRfWd2n4sn6vH7E7Aeo/2gDBux9qT6aZTvKzKgx46ZZ3ayZ8
 sWoaWJ0qU=
X-ME-Sender: <xms:vf-TWIA4h-87KI6KEF0mIUN8kFGDZKfp2G5ftZ9SG-CkgD1UbwrWGg>
X-Sasl-enc: OL7FAyvBhtLZ1Brcml+8CxF65zwT9w7Ox4fUZo7HzVbX 1486094268
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC3F924066;
 Thu,  2 Feb 2017 22:57:47 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 00/14] Update GPIO and pinctrl to upstream
Date: Fri,  3 Feb 2017 14:27:02 +1030
Message-Id: <20170203035716.646-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 03:57:53 -0000

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
