Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQW5j6JXLzDrns
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 17:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=KjdESAxw; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=G+BPd58N; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F856207B6;
 Fri,  2 Sep 2016 03:31:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Fri, 02 Sep 2016 03:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
 mesmtp; bh=AGie+t96/dMBhOFQwPkIJX67Il0=; b=KjdESAxwPdkPaGTWvgIZu
 IQEFPY61mChYSmUsuBjYtWUR5n5StUAbUUbFd8G7tLrhY1FO8S305YFGmxBIw4m0
 nbX8NsgxC6raLlO+C3x/Xs9CVgAcjOY887ctOawjSzkZ01doH6IN2ZboODgHjWlP
 BjDlceEJcD0+JHlh+kUFoY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-sasl-enc:x-sasl-enc; s=smtpout; bh=AGie+t96/dMBhOFQwPkIJX67Il
 0=; b=G+BPd58NX34WWfwt42D8oO33wU9zFaIOfpPar3z55UqioCSXtZpE4kidmo
 5h+x3H+9GRrIoyvbeeaU4ZZ6wG6EuJmEuiK3bLLLcll1iHTexQkUHfvmba6N0baD
 9mteM/X8NPfhrgnzXCNEYGvQTLtZmN09nvpGo2jsjnNkgEON8=
X-Sasl-enc: uTK6q7w3ZyWqntEkCqxCKfOyytL++QRBzTVZW5t1wCzR 1472801493
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1B91F29D2;
 Fri,  2 Sep 2016 03:31:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 0/3] aspeed: pinctrl fixes for I2C, GPIO
Date: Fri,  2 Sep 2016 17:00:48 +0930
Message-Id: <20160902073051.31492-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3.1.g0db844e
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2016 07:31:39 -0000

Hi all,

This is a short series for dev-4.7 that muxes the I2C buses on g5 SoCs for
"okay" devicetree nodes and improves pinmux coverage and functionality on g4
SoCs.  The two g4 patches were motivated by openbmc/openbmc issue #513, and the
g5 I2C devicetree patch helped development and testing of the recently posted
I2C driver cleanup.

Cheers,

Andrew

Andrew Jeffery (3):
  aspeed-g5: Add I2C mux configuration properties
  pinctrl-aspeed-g4: Add definitions for pins in GPIO banks A-H inclusive
  pinctrl-aspeed: "Not enabled" is a significant mux state

 arch/arm/boot/dts/aspeed-g5.dtsi           |  24 +++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 229 ++++++++++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  17 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    |   1 +
 4 files changed, 265 insertions(+), 6 deletions(-)

-- 
2.9.3.1.g0db844e
