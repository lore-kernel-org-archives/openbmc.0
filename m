Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qB37QwzDrH2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:57:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MP5RzxQA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RjPXYnRV"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1ABC1207F8;
 Thu, 27 Jul 2017 05:57:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=zMhp/ZJ7Pt6R2ZIlOS9dvLBAnk2cvU
 7llXgCnIG1Y0w=; b=MP5RzxQA5u1K4/mkl3KTi2VOmBiTptD8s9gHNt5AoCjgGg
 jjZxDXAz8z5V9YHGhC0+579KuNfizjyj/NiOFXspe7uvU5dMER6BdPHbes9b/DI5
 K4t1/qPWEiJZdF3ykg/tzIq3Xi9YfPtfJf/vTazNUJ9Ft5yX4iS5aFNdG+1wie7X
 J+rHfrQ/CrQg1kG6EoOz+dfh0Xlc6f8tmrURz9LxMOghiX3C1ZfqArKCvh0s8GPI
 0o0bpfamVwQkwkqtOb0zoBUxc1CUzidx9qdrW+aOApMiYPNwJsq+e160B6GVIIFT
 yWrF2vsh/rFo1foy0AtwvF6+D+INH77Op2QJG++g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zMhp/Z
 J7Pt6R2ZIlOS9dvLBAnk2cvU7llXgCnIG1Y0w=; b=RjPXYnRVgPEecX0V9Xu5cm
 0qZ7YyG7dqEGSjyz1nwPG3PwoytT4Bh6b7VQVHsdSB7PypP3Pajt+DUetEzCj8n2
 qpXGflDi+h9B4R9wVBJGWuxcFJwGVkkD3CYpdL3iTTMWreUjOTxMt+rY9QJG8w2P
 zc7L+5KUou48EbZ2gfqNg7uoPIa6WZg4G/kbStmYC/aoR6fMDkRbWgkhV7Hcb90K
 ZoxJiWLESvJ/i0J0197j5qvMg9neGzUdnUTpTzOSlD4lgD1NOxEHe6t1VRDb7N4J
 IiJXbbnb5QEiD3YM/OabEvaXmHw1brN7dLqRuB5JUuEasUE0ynp//Wfci8ucNzZw
 ==
X-ME-Sender: <xms:JLl5WYLntk2U50xaecLDWv1M9K3Fcu9bs0Wi0ej4OWzl5fqpm-yrPA>
X-Sasl-enc: CCxSk1oPbvEZGkKeb5Sv+1BRW2Laymj7UovSF6xhjoRM 1501149475
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8467424287;
 Thu, 27 Jul 2017 05:57:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 mspinler@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 0/8] pmbus: Add MAX31785 driver
Date: Thu, 27 Jul 2017 19:27:09 +0930
Message-Id: <20170727095717.25479-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:57:59 -0000

Hello,

This follows up from my initial series and request for testing:

  https://lists.ozlabs.org/pipermail/openbmc/2017-July/008329.html

What's changed: I've sent the relevant patches upstream[1], and this series
represents a backport of that upstream work with integration into the OpenBMC
kernel tree. I have also tested with the OpenBMC userspace (particularly, the
interactions with phosphor-hwmon) and pushed a patch to fix the broken piece:

  https://gerrit.openbmc-project.xyz/#/c/5564/

Patches from Joel cover off some of the follow-up notes from v1, namely fixing
the devicetrees for Romulus and Firestone.

There's still an open issue around the causes of some communication issues to
the MAX31785, but it turns out the instability is not a regression and it seems
we don't hit it in practice. Further, the features exposed in the rewrite are
necessary to ensure correct behaviour of the fans: the hwmon-based driver did
not fully configure FAN_COMMAND_1_2, MFR_FAN_CONFIG or MFR_FAULT_RESPONSE as
the systems require. These commands are now all exposed to the devicetree for
configuration.

Please review!

Cheers,

Andrew

[1] https://lists.ozlabs.org/pipermail/openbmc/2017-July/008405.html

Andrew Jeffery (6):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  ARM: dts: aspeed: witherspoon: Update max31785 node
  hwmon: pmbus: Add fan control support
  hwmon: Remove MAX31785 implementation
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  ARM: dts: aspeed: Witherspoon has a MAX31785A fan controller

Joel Stanley (2):
  ARM: dts: aspeed: romulus: Update max31785 node
  ARM: dts: aspeed: firestone: Update max31785 node

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 117 +++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  84 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  80 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  59 +-
 drivers/hwmon/Kconfig                              |  10 -
 drivers/hwmon/Makefile                             |   1 -
 drivers/hwmon/max31785.c                           | 893 ---------------------
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 670 ++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 222 ++++-
 12 files changed, 1252 insertions(+), 924 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 delete mode 100644 drivers/hwmon/max31785.c
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
