Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6ydj4jZCzDq8b
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jan 2017 17:17:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b2Zxi2ti"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="REc8dx6v"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 80AF82084A;
 Tue, 24 Jan 2017 01:17:27 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 24 Jan 2017 01:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=02G2eWOxAmGpRGz2IOT9rwVwrCQ
 =; b=b2Zxi2tiljiMs9qJIuTkCE62je3BQfZHim0JgHVlw4HLtjYJHgfw6KcmriC
 4TJ3+STXYYk/LXJF3uXwqwwhzBY+eiyVPlj/f7n4s8187p4S431N2Vff0ISe3Lg4
 p5w0LiJ3Ci0UNLkFX+Z2bnNf1jvnMyx2MlWLa/hw1zCQRRYs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=02
 G2eWOxAmGpRGz2IOT9rwVwrCQ=; b=REc8dx6v9G+mXAudbK6kHoZ40jRuL5Pdnz
 S2b0jsXJi5mFdqwADtXqs34PXiYAzGyWU9+pO8UoJmMSp+X4SHNSa6Y96qv1l8OX
 M7/lnxwfs5HBYWMXrl9iS3xxl/Xy5zPynAEiNbF7NUgwyLQZuj8x6zS1TWZDPIz6
 fcszb7IB4=
X-ME-Sender: <xms:d_GGWG9Qs6c5FeeiaFlfTpbYk2cPSX_no0q45RzYdFOTGp6uZVyXJA>
X-Sasl-enc: IiJ0EhO2JQ57bfhzXmr2bkVGBEDyxrhdhL3NiyaxK9tU 1485238646
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF53024180;
 Tue, 24 Jan 2017 01:17:24 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/2] gpio: aspeed: Implement banks Y, Z, AA, AB and AC
Date: Tue, 24 Jan 2017 16:46:44 +1030
Message-Id: <20170124061646.9317-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 24 Jan 2017 06:17:30 -0000

Hi Linus,

v2 simply fixes an issue identified by the kbuild test robot. v1 is available
at: https://lkml.org/lkml/2017/1/23/12

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
