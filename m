Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ7Fd3nFjzDrH2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 20:17:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HqTOzfmZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H/2UrbxI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 560CC2095B;
 Thu, 27 Jul 2017 06:17:22 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 06:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=QTXbEk4q4UOQroBUrJ4ZzsONK7EPoI
 hWGAV0EG8a9WA=; b=HqTOzfmZZ6mIsfSkFx6nOD8WW/ACVdfAwgipepFBz87otd
 ooGBKuS0aaCWLn0GeJHPKm2YS1OXOqsYR//MqTWcZk7Vco9zx+zsRaiodPEMwIsX
 haqD2JTUkvRXq9I7L34NpXtQ0DvsjiWAVA9JhgNkG/cO2C7WQL2z+8hf5FJHUZQW
 3NEWfS5JnyQBMax1tCPlrh2WYFyEH3O8u6IOBaR3CUFBFB4oHyyLpyVCnjPYmEST
 RDq+AqfYQcsVSsYLq+KN/OJWYeLjTb027A5xJSUW3a2l6LLuGDQP+ix5AiHmhQxE
 Wf6AhtfsO55rKj/C5iZ2SiT+11J9cN+GgpfS7xmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=QTXbEk
 4q4UOQroBUrJ4ZzsONK7EPoIhWGAV0EG8a9WA=; b=H/2UrbxIUxryByE9sJmYx4
 /+tpIGXBpc5qcy9oPI5gEVmaNDa5HQeseNewRzdqUB7qMifnBAME1UI7sBgE4QIx
 u2CodlvtpbBLKENK5aH+SSaKcNTriq6u/2Sx8ukiMmXUKPAdjQ9pkaf2UiERFYmU
 oQ4aIfpdwObRNWJ5NgIYcPzW2eODg2taKkf7e+AR9F0HXiigQ3xJRIjVDSai6cIt
 tEsjPAb0HfDWYhlE+eDz08Nc3lABoW1yUpla+nIJ7dyNoAerJlOdP0RxuAbKxL+K
 xmxSsEqp800j8+UU7U5t7b9SdgoNoF2Y05yufSi2/drSOfNzYSB8lcQSITmkA6vw
 ==
X-ME-Sender: <xms:sr15WatNyk71N6Ir-l4F5osbE8M7ejwYn_WFEAqWkOu_Yqer9TNiQw>
X-Sasl-enc: yqnXo9EIRzPvjS1h/5WnBzFo19k0j5x+dHrxpx7XRgfI 1501150641
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E64D87E2DE;
 Thu, 27 Jul 2017 06:17:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 0/4] Witherspoon WDTRST1 enablement
Date: Thu, 27 Jul 2017 19:46:43 +0930
Message-Id: <20170727101647.26960-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 10:17:25 -0000

Hello,

v3 corrects some glaring flaws in v2 that I'm going to blame on hacking too
late at night. Critically:

* Use the right bit patterns to select push-pull vs open-drain, active-high vs
  active low.
* Fix some wording in the bindings.
* Specify the external signal pulse as active-high in the devicetree.

Matt(s): Please test and report back. I'll send the patches upstream if they're
fit-for-purpose.

Cheers,

Andrew

Andrew Jeffery (4):
  ARM: aspeed: Request WDTRST1 pinctrl function
  dt-bindings: watchdog: aspeed: External reset signal properties
  watchdog: aspeed: Support configuration of external signal properties
  ARM: dts: aspeed: Witherspoon WDT1 external signal is push-pull

 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 10 +++++-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  5 +++
 drivers/watchdog/aspeed_wdt.c                      | 42 ++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.11.0
