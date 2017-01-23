Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6KYw1ysmzDqRF
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 16:27:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AD4ux6MZ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A0p8nblw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D3BD92133D;
 Mon, 23 Jan 2017 00:26:57 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 23 Jan 2017 00:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=VJi+6POsMaPjmeuQY3iiEmRU63k
 =; b=AD4ux6MZvWPqzlqrhgzr49VOhTWYHb4qo+2Lu3aNUW6I3xpUttVuGsDcw5+
 EsQFQee32x9/ANM7wuGtw0FIwSBzWBLOnIDyt+xk2+14mjlOTyMKKd6FrT93uDVQ
 4X+Iqi8HnAprARU+YwTva3rhjpv/s5WZhnoH/EqcpCgH5Dcc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VJ
 i+6POsMaPjmeuQY3iiEmRU63k=; b=A0p8nblw7BwP8C54GUe2RjFw9zmFkFC6su
 Jkt71f2yXscSw4kwoXkVQPS8Nk5+Y23Vy0KaOoL1AeF7T1ja+AxJO+pUpOJXjtQG
 KesBUyYNI7ixDR2SpXhVuy8b1D24VAcZupeuo3RHPg2zQMCndcf1L3LHtQM5SaVo
 9akWYsWzU=
X-ME-Sender: <xms:IZSFWFDSNv0-W6_GxlQwCxcjqi3b9YQ4Tb3h7zgIH-78xk-NuIMP_Q>
X-Sasl-enc: +PHYRe0jU/vyemgszZGvqsuQ/JYyD6iYW2ZCwv7O+iEQ 1485149216
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3AF47E188;
 Mon, 23 Jan 2017 00:26:54 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] gpio: aspeed: Implement banks Y, Z, AA, AB and AC
Date: Mon, 23 Jan 2017 15:56:05 +1030
Message-Id: <20170123052607.9424-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 23 Jan 2017 05:27:00 -0000

Hi Linus,

This short series resolves a TODO comment in the Aspeed GPIO driver regarding
banks Y, Z, AA, AB and AC by implementing their support. It's a little involved
given some of the characteristics of these banks, but hopefully nothing too
controversial.

Cheers,

Andrew

Andrew Jeffery (1):
  gpio: aspeed: Add banks Y, Z, AA, AB and AC

Joel Stanley (1):
  gpio: aspeed: Make bank names strings

 drivers/gpio/gpio-aspeed.c | 187 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 166 insertions(+), 21 deletions(-)

-- 
2.9.3
