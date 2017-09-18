Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LS8iRgDI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TnrX+qUD"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZpj5NyvzDrZv;
 Mon, 18 Sep 2017 15:50:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 91C8E208A1;
 Mon, 18 Sep 2017 01:50:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=AM4v3BLQsCek5vZhg09F+v5N1Hfwx9
 sv/M+tw9K44C8=; b=LS8iRgDIVvrFpy/hB2gfK/DCiRbeJSUOJpKI9RFBVsFdjr
 l3xRKPa8TFYch3zbgqHpru+AEnNGE67FncpKQxU2sHFAYf46kNRYNdrWscmi2wjX
 4+BXR48bVUGNYD6f6/q1fLlZMIIY+8ojWH8szm3MVeHOKP6BYVa54OEBYZU7I2Xs
 Z9Rel0ALozIujKtgbBAOIrynjshqtN69mW06DjTxZVvc8qG2kWGmTg3KjlVz/ICN
 Zr5n+O4x68QZ7+nbsTkF0Q3G08QdvfWsvq92qv6go0NLDvsznmtVPrtoTaWeX6Dl
 1mbB+XBdz9OvZLWrldCnZgc44+jVWrkboUEakh7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=AM4v3B
 LQsCek5vZhg09F+v5N1Hfwx9sv/M+tw9K44C8=; b=TnrX+qUDYbxMVc24oqXy6N
 BYhbDm7LpROcvf98DyL7kuaJRW/aFuf1mY/WriPusv2/A4e2li3hoRwiwO/lOFDU
 W1XQxbXRJJ8Zdvg0GW+UxPGAk8bawv2AkurVOmIVMUKNoMoj5Ss7IeNXJQXZjuVL
 KxJqzqYmH6snix0H5D88xu7uKgR00Pv/mgRjh7gjmY9I2YKusiNJTLrzem/HmgZz
 4AGDHycq2+3YKWsgC2JtB/h76M3SGFsg84ZYZo4YxzU9Znjwxd5xoukIGp9Baz8X
 mf9ICWjcQh3hRuKEhZ48cCqqKfTiBI1hArU5m9UCsa+KlDdif1W/TsBffRXbY+tg
 ==
X-ME-Sender: <xms:il6_WbrFruhAX0_1H5KctvW0Dvn9s0xFgW8vY3ZGpolWHHY__OMQgw>
X-Sasl-enc: 7Ig/HjrQR4/JN/YQI8MU/hrN10Et9r2vq9pPgFj5vF0U 1505713801
Received: from keelia.au.ibm.com (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25F0F7E183;
 Mon, 18 Sep 2017 01:49:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH 0/4] watchdog: aspeed: Retain enabled state and move to
Date: Mon, 18 Sep 2017 15:19:01 +0930
Message-Id: <20170918054905.16470-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 05:50:08 -0000

Hello,

We had reports of Aspeed BMC systems entering a reboot loop, each time
attempting and failing to probe some PMBus devices. For whatever reason the
PMBus devices weren't appearing on the I2C bus, and several factors came into
play:

1. i2c-aspeed's transfer timeout is set to 5 seconds
2. The kernel's pmbus core now tests for the presence of the status
   word, then the status byte. Not all devices support the status word,
   therefore on error we fall back to probing the status byte. This leads to
   back-to-back uninterruptible transfers, totalling 10 seconds of delay if the
   device is not present before propagating a probe error back up the call
   chain
3. The BMC watchdogs are enabled by u-boot to catch a kernel hang
4. The hardware's default watchdog counter value equates to a 22 second period
5. The watchdog driver is probed after the I2C subsystem iterates all the
   described devices.

Thus as it stands nearly 50% of the watchdog period can be spent dealing with
one missing PMBus device. Arguably the I2C timeout value is too large, but as
the watchdog driver is not probed until after the I2C busses are iterated, the
work to ping the watchdog cannot even be scheduled to take place between
transfers.

Patch 4 shifts aspeed_wdt to arch_initcall so the watchdog can be pinged as
needed. Patch 1 fixes an oversight that lead to the watchdogs being disabled
until userspace opened the chardev. The remaining two patches are minor fixes
to the Kconfig.

Please review!

Cheers,

Andrew

Andrew Jeffery (4):
  watchdog: aspeed: Retain watchdog enabled state
  watchdog: aspeed: Fix 'Apseed' typo in Kconfig
  watchdog: aspeed: Remove specific reference to AST2400 in Kconfig
  watchdog: aspeed: Move init to arch_initcall

 drivers/watchdog/Kconfig      |  8 +++-----
 drivers/watchdog/aspeed_wdt.c | 16 +++++++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.11.0
