Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w005h3KN9zDqJ1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VQgX2kok"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i+dY0lIx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C1EA62090A;
 Fri,  7 Apr 2017 08:59:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=UYHvdFcId3epiJHnTOuEXjBlw0LHk7
 nc8thn3Veo73g=; b=VQgX2kokj52/Jcy1LjywV3FeMjX5Bjg4lT7iqCfYOrJZLk
 02e45FJ6+2eJ4uEtHAgmHHwmhGXclOM6xyzVYVAVZHa5y00O4mZK+i3HS84xL/KT
 I89RsEieROk6LVS22WsJ5TNij/gcrplHkHT54xpFUyqIs9Zq25S9XXb+zsF+Out4
 X0Ca3DQRQHSBf90E0Jw64k5tdzES0/O3VQY0qoZj/t4AYFc2QVL9gtp9AdQCCpuY
 3pUEfBkL7sh5v718ZHW5ZSvdD+nLDq48GNEh1pNiWQQYwKPUS28wsOW6mmBhq56R
 R4IV4ygWj8xyUxKxhs+x25ArnOUiXwGEYPwLzpNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=UYHvdF
 cId3epiJHnTOuEXjBlw0LHk7nc8thn3Veo73g=; b=i+dY0lIxpn71cN0Pdxx69g
 bJ4n6V0aywiNLCh1zPH6Q7hW3bVYXpT9nlxbYcorDJFTObKMjp/DRuPDyeBOzzSy
 GX25Ru62+iFdEzrBVwQ7K1xPue7G+ft5VlIiEys7YsqxDZjlhsGfAx0LUHyduKXC
 rCcEB699P4SMScgKkBfn0StWIoZeI15rVf53gyGDPP72s8HYiExomO2usym5oQqw
 1ewArQRjf38cUAezRqmQmEKjZr+5yUMOTwzPQd6LGIfNOtg+wxj4KYGKK5o87xdj
 bP9CqlcFLmjKDR0A9A6KGVhKSxE0Msr3rcu2/N5SoVguocqtxACWjSPqtZyoarTQ
 ==
X-ME-Sender: <xms:JY3nWNKkGT4xwe7t_WgWZmO72C5oo5iSEqzTkdLbmPlfTC9J5FVwUA>
X-Sasl-enc: UtJFr9PJkwPZec+TD6BCn/uC7AKUZ81V44ujgFFpBn5u 1491569956
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 37B947E737;
 Fri,  7 Apr 2017 08:59:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/4] gpio: aspeed: Add debounce support
Date: Fri,  7 Apr 2017 22:28:58 +0930
Message-Id: <20170407125902.15960-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:59:20 -0000

Hi Linus,

v2 of the Aspeed GPIO debounce patch expands it out into a series, resolving a
lack of devicetree binding documentation updates in the initial send, and
completely reworking the debounce timer use tracking for space efficiency.

I do wonder whether there's a more acceptable way to track the use of the
timers than what I've got, but it at least works.

The rework was largely an effort to resolve Joel's review of v1, in the absence
of any other feedback.

Cheers,

Andrew

In v2:
* Update devicetree bindings documentation
* Address Joel's comments

Andrew Jeffery (4):
  gpio: aspeed: dt: Fix description alignment in bindings document
  gpio: aspeed: dt: Add optional clocks property
  gpio: aspeed: Add debounce support
  gpio: aspeed: Add open-source and open-drain support

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   3 +-
 drivers/gpio/gpio-aspeed.c                         | 285 ++++++++++++++++++++-
 2 files changed, 282 insertions(+), 6 deletions(-)

-- 
2.9.3
