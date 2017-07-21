Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDdcj3gxfzDqwK
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 03:51:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RlMsWjdf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sB2ZjtuL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0D4420816;
 Fri, 21 Jul 2017 13:51:46 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 21 Jul 2017 13:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=nypDFg7+fqq5pj3BtNFhYUgVbRdUkl
 VlbAI2rFKixZo=; b=RlMsWjdfMxmJZXA810GVAYKG1Z9X/VzuWkQPGSHVbqxs2+
 5uLP+43ny7Jw5UcDpAFAWvzKaKx4AHhf1ENA03y7AyKFh9xCzdguE+6yOyupQ25Z
 2MnNeiQUUUhOKK6N04PqhTyB5hKUiXk2rVlgdq0W6tWZ6Kj2B6yGANlozRP7bLAG
 ATeGE4RBso+ZGzPI1Kl/3Ivf5byVwe3cG67WQoNqIcbdeiEdCKbAYtayukT1H9FN
 N43KTeeXDMKJW8lOVbQL2rtWZbw2OC/IKzoF6LCTfsuE3GzE8nCAMukvW4Qr4w1z
 gRzb2hr7Lw/zq2Arlyai3+wMIAsnmHPOxKm4Suew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nypDFg
 7+fqq5pj3BtNFhYUgVbRdUklVlbAI2rFKixZo=; b=sB2ZjtuLFXkIfR/N38kCSE
 8eEnzwikXshytvJiaMH93ZBjaNAmlXWvbkgR57Z76IpYX87cc+oXNFOHK2iVnodm
 aKJHEVjteiMPQAoma7BxSQYS7FtGCC7X5bYRh0Lc2Y45NOcCsEAMD+BNxVkIyzPW
 Fykv5kPvrteFd0oNTwVofaUeQCQUVj8CGa1T/n1E2ap1t0KEdNp40eR4uiP5sRMO
 rGn6pjbaJrhKZUzkpcMjaJSf7qbxZ1vb9BVli5keiBKnQXP0qfJgOzLprZhae87M
 k2dbNQuAR1Bd4kYceeQU1KR/T2oOAbb9HVl5UiWmgm4KKNrp6Ney+VyoBilq5XLA
 ==
X-ME-Sender: <xms:Mj9yWb4vxbzzxxx5hRH_V4jCgfD-uf_BsVILmaTvkyLn9CV6MvfPjg>
X-Sasl-enc: HXJNtwslRhB6o4tc8xxARNmmasml9rGbmYf6L16hmvzp 1500659506
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33B377E1FC;
 Fri, 21 Jul 2017 13:51:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, bradleyb@fuzziesquirrel.com,
 mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/5] pmbus: Add MAX31785 driver
Date: Sat, 22 Jul 2017 03:21:26 +0930
Message-Id: <20170721175131.17840-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 21 Jul 2017 17:51:52 -0000
X-List-Received-Date: Fri, 21 Jul 2017 17:51:52 -0000
X-List-Received-Date: Fri, 21 Jul 2017 17:51:52 -0000

Hello,

This is a backport to dev-4.10 of the series I intend to send upstream,
which implements the MAX31785 driver using the PMBus subsystem.

I'd like to see it cook for a bit in the OpenBMC tree to get some confidence
in the implementation (after recent indiscretions).

Some caveats:

1. I've only updated the Witherspoon devicetree. Romulus and Firestone also need
   to be updated, but I'm not sure what configuration they require (it may not
   be too different to Witherspoon). If someone could provide feedback here I
   can send more patches.
2. There may be some userspace breakage around what fans are exposed: Only
   fans configured in the devicetree will have attributes in sysfs, and the
   first and second tach input attributes are always contiguous. That is, if
   only one fan is specified in the devicetree and it is configured as dual
   tach, then the input attributes will be fan1_input and fan2_input.

Anyway please review and test! I've given it a spin on a Witherspoon system and
it looks to be functional. I haven't done much testing with the OpenBMC
userspace to shore up the second issue mentioned above, so that needs further
investigation.

Cheers,

Andrew

Andrew Jeffery (5):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  ARM: aspeed: Update max31785 node in Witherspoon devicetree
  hwmon: pmbus: Add fan control support
  hwmon: Remove MAX31785 implementation
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 113 +++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  55 +-
 drivers/hwmon/Kconfig                              |  10 -
 drivers/hwmon/Makefile                             |   1 -
 drivers/hwmon/max31785.c                           | 893 ---------------------
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 655 +++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 222 ++++-
 10 files changed, 1068 insertions(+), 921 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 delete mode 100644 drivers/hwmon/max31785.c
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
