Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD6383j8nzDqCC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Mf5gOs+X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Tg2KOVE8"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16D5820867;
 Thu, 27 Apr 2017 02:09:06 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=v/5fYJPezdGPsvIJfP6V2a3xoS+dzm
 RCS+ts1C1kPgA=; b=Mf5gOs+XQUm39rIzAWP1rsaNSJ39kwdamBUBofSiMEafEs
 AEIDDnCgHNBGxLWtJqrdYzap+Eq3eja2jB9MUpQIGQninNr6n9tFHlZPAKIgyzaQ
 Om8rGeNuk3OREq5Sc4VdP0dYSWFN+yR7hl98vUpBmcP9fgk8fsTk/tpEk49b6gyR
 25Ji1mk1mdDGvw0aLcJgqwcmWOX97N4pu0sGVMolZg/3zfc/PP1YA5+73/eBIAcC
 tOcpGzjnOHqu+0i8fS8amnyJ/A1Mw6mgZhsny3BqwOWkRdofkplxilU3tu+8IEvy
 oQimMtx9PctJKeg77SJi+ypaCWeav7cAfYeJt/gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=v/5fYJ
 PezdGPsvIJfP6V2a3xoS+dzmRCS+ts1C1kPgA=; b=Tg2KOVE8jlZ3+W65RnMNvy
 XmBnMXAaOImkGDxRn1r5mfSdvi47b0NPzziBoYO27fPajllL2Aq6DRXpm/leVQ3l
 TDu4iLFIgrmDIZIKTm68cfHkv2Rj9hpAQOqak5yyG9c1UAon6mdkBQIMRtRw3urE
 eU34/AEN8izwqfrZe75mJCfWCugg5f8Txq7v7ZP/MHjCZPTJbIkU45mCi9JOJEFe
 myMaY2dvsm27ygVL43s4M+ef/dKa34IpdiJmcwLxwV955Zc7cVOCem8kNA4+6/w8
 EOBIfYBqqrvzJBFg8VAvfEBdcmbOVqq9TnRq+Wyju5ZqGmdEKMlh84zmWvW05YaA
 ==
X-ME-Sender: <xms:AYsBWVyTiB0Pwy5FOmqvBIAcr8Vj8XBTZlrQJ6ToE2aRav1O9QuryQ>
X-Sasl-enc: uOxYoVQe/C5H4tu5ZfW4reMv+relyEhnIAtjMP6cIIVD 1493273345
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2409124216;
 Thu, 27 Apr 2017 02:09:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 00/10] Clean up mach-aspeed/aspeed.c
Date: Thu, 27 Apr 2017 15:38:13 +0930
Message-Id: <20170427060823.32226-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:09 -0000

Hi all,

Here's RFC-ish series for cleaning up the board file given functionality we now
have in the tree. The intent here is to:

1. Demonstrate what can be done with some of the driver support we have merged
2. Solicit feedback from system owners about the changes

Probably the most overtly breaking change is the patch for power button
debouncing in Barreleye, which switches to using gpio-keys.

Another likely controversial change is creating two devicetrees for Zaius to
isolate EVT1 requirements from the general Zaius configuration.

The rest of the changes hopefully shouldn't cause too much grief, but still
need some inspection.

The series depends on patches not included in it, however Joel is in the
process of putting together a tree on which the series can be applied. For
reference, the dependencies include:

GPIO debouncing: https://lists.ozlabs.org/pipermail/openbmc/2017-April/007219.html
Pinconf support: https://lists.ozlabs.org/pipermail/openbmc/2017-April/007213.html

Cheers,

Andrew

Andrew Jeffery (10):
  aspeed: barreleye: Remove unnecessary GPIO configuration
  aspeed: barreleye: Passthrough debounce isn't required
  aspeed: barreleye: Debounce BMC_PWBTN_IN_N through devicetree
  aspeed: garrison: Request RGMII and MDIO through devicetree
  aspeed: zaius: Disable GPIO bias via devicetree pinconf requests
  aspeed: zaius: Remove LPC-to-AHB bridge configuration
  aspeed: zaius: Remove manual CS decoding window configuration
  aspeed: witherspoon: Remove LPC-to-AHB bridge configuration
  aspeed: witherspoon: Remove manual CS decoding window configuration
  aspeed: romulus: Remove manual CS decoding window configuration

 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts  | 11 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts   |  5 ++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts | 20 +++++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts      | 10 ++++
 arch/arm/mach-aspeed/aspeed.c                   | 74 -------------------------
 6 files changed, 47 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts

-- 
2.9.3
