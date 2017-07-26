Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHg5S1d2qzDqmV
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 02:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qpyV2e6a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FW6jWmOE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD3F420823;
 Wed, 26 Jul 2017 12:08:41 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 12:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=tslbIAN1T6416RyyG35aorNhAOB1jj
 O6ZocGUjTekd0=; b=qpyV2e6aLxCM5MBaucCuhlrGow0GNDEAAryRj/LfmV/MDa
 a8II9fNJYYf5BWcwU5hha8COV+Ny0lVEDlmVZNS05eS37dkyWj6aZJmaE51hVMM5
 yXkfId0iPuA9edPGGj6gDC72iCo5J885Xu9Gbh5e+2ipX0jADpqb6bkR+6MsR6vc
 TOC0DlNBCYY0O4nxD5Myp2wsDC2Cg64tMI7eqn3gXonQ70iyIh2OZYhG2bpReE52
 91Ch4yy4qpB74MvQpL/nsoYXlnDEJaW+hTRZcjYeyNWO6FlDSEzvPNnVoFD3yby/
 Txrw7zNLeqPzdl/C2xi9OFktYA3iEUe2wdxE/Ozw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=tslbIA
 N1T6416RyyG35aorNhAOB1jjO6ZocGUjTekd0=; b=FW6jWmOE6kuVMs/y7YFwet
 JTopPqybC3dQqSNT2v3t+TZVMX4cE+UTUSluIsztHVs8TcJH5tsT5PJx2DBTLB+j
 weFFliNMT/Z390H8MxhcDYC6hCvkNY4mUBPpziaTZ0moCNrg9v3zbvYD9kflATa8
 PrGg2mhRqDOivoSNwSdTNzJuG54ym3YMc71O+6Kt06I2b3kgdRrka7YHCsFtiIvu
 +HcGMwPvMMkhMpa49api2oPxRbLWBWzog3yO72y+QiO8BOKAnJFm2Tl0XfpsvKC4
 yD1liaaAaaLOX7mb4vi/fRzcQxcdK/rRUcjPwSMh3S7DF9PNr/Yh8kDyc+cfOsFQ
 ==
X-ME-Sender: <xms:ib54WbKh0N1722SkTQOAj2gs8ayMXS26-l7h4HeonkdfbYUR2EYAfA>
X-Sasl-enc: FhN1YKcFgrGQdnzRTenVl1JEOh3Zd75/pvDN+Gy2Phs8 1501085321
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8C902466E;
 Wed, 26 Jul 2017 12:08:39 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 0/4] Witherspoon WDTRST1 enablement
Date: Thu, 27 Jul 2017 01:38:27 +0930
Message-Id: <20170726160831.17867-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Wed, 26 Jul 2017 16:08:45 -0000

Hello,

Earlier I sent a patch fixing the wdt1 pinctrl bindings so that we request the
WDTRST1 function:

  https://lists.ozlabs.org/pipermail/openbmc/2017-July/008373.html

This series builds on top of that patch (and contains it, hence v2), adding
new bindings to further configure the pin's behaviour through the watchdog
controller itself. This is necessary for correct behaviour of the latch
asserting the MAX31785 FAULT pin across a BMC reset.

Cheers,

Andrew

Andrew Jeffery (4):
  ARM: aspeed: Request WDTRST1 pinctrl function
  dt-bindings: watchdog: aspeed: External reset signal properties
  watchdog: aspeed: Support external signal drive and polarity bindings
  ARM: dts: aspeed: Witherspoon WDT1 external signal is push-pull

 .../devicetree/bindings/watchdog/aspeed-wdt.txt     |  7 +++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts    |  4 ++++
 drivers/watchdog/aspeed_wdt.c                       | 21 +++++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.11.0
