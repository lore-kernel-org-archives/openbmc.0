Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XePlg4qx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nfsKm9AC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSPV2q5wzF36D
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:32:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B623521ADC;
 Wed, 11 Jul 2018 01:32:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 11 Jul 2018 01:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=juoyEUbktk1QHozNKFOVp+U+jlVB1u0AAgXYFjnC0
 0E=; b=XePlg4qxZzCpKg9lag1kRre5Xuqo9pxAoR34JQzkn1ATkGl9W9+68IOiM
 farrdV2UBuS89cB4jKSZ700L6qBjYRnp2iSK8fNjo2PykDidhHdJlDIpl+xocqz/
 SOwZP0ke20gUS8fH1aNrLV8ewDqbvLDT1c0OiFX2LroxZDfioJsgYWlaoJs+OBck
 mQnEhQ3HwBerXWbLc10PLh3wLvViDefn/KXvMk+Q67nnxStvn8BuJh0aPe94KPdU
 EGU++TCoJ9xUN7tQ4qeXJQ5REESzG0514lfiiVmLWaGB3Jnb6Yxewkj93W+IJ+gI
 3WIXlzkswm/yqy4bweCHV0llyyZ2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=juoyEUbktk1QHozNK
 FOVp+U+jlVB1u0AAgXYFjnC00E=; b=nfsKm9ACwo2JAUifG7NhdteNuPVMyZVyb
 BFMVjF2YVC38Q2bJo8f+wJyMjca9PU9peO/3ADu+83jPGnVqXNCvQZBLooRYM9sR
 W1HC51Df+wbS3Av2GJkGtnQl0d29mI7B3S/VfpzcfldR6XT+J8wDzO1TbNWzX+K/
 FudYW9r1pvYPW19GlbO45hDK9A4wno85uLISBflwJ5c7Ig1nYJultnqfF9Y5pbhU
 Vw1JghcisTfpaCYNgJAvW8VvOOX11ArIK/mbtpChSKd66OfUdI3F4SwdJgYE8UBn
 0BK8fVU9ZAhLmvtCmHdVYBHYzpe/oR0UqDgY+B4LNkK401f1zCDDg==
X-ME-Proxy: <xmx:WpZFW9bp74kD8SSmlbDgFwq7vIBEcXmlhlx4l7Ip4tFCap4lfG_TTg>
 <xmx:WpZFW2OiUO7fhptZNa5K4MiuV1sSfNNWUhauu1gOcxE6GuXcrwvlEg>
 <xmx:WpZFW_Ezg44KASPaAqSw8BK23Asmrs9PibJ3LIJEgIfEpLA5pRC4YQ>
 <xmx:WpZFW-8sjUI5phCUqCM9z4gpwbICNZtQyis18KKrC2pGCesRABPs0Q>
 <xmx:WpZFW1atCl1Eix91FzeG2NZlwQss7opfheNbBIww5OPTlkdtBhmeUA>
 <xmx:W5ZFW5EHI04yM4yQWwP82V_34QKavS0qK77A6foMI4XmltJZoSspxw>
X-ME-Sender: <xms:WpZFWzsn2Sm4orr9O1mNMWZPp_XRc_SjKMxV0k_P4X-jiMheREenZg>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2E9AE44F1;
 Wed, 11 Jul 2018 01:32:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-kernel@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 joel@jms.id.au, gregkh@linuxfoundation.org, Eugene.Cho@dell.com,
 a.amelkin@yadro.com, stewart@linux.ibm.com, benh@kernel.crashing.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v2 0/4] sysfs interface to miscellaneous BMC controls and
 fields
Date: Wed, 11 Jul 2018 15:01:18 +0930
Message-Id: <20180711053122.30773-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:32:18 -0000
X-List-Received-Date: Wed, 11 Jul 2018 05:32:18 -0000
X-List-Received-Date: Wed, 11 Jul 2018 05:32:18 -0000

Hello,

This series is a second stab at exposing hardware controls on Baseboard
Management Controllers that are hard to fit into any a coherent abstraction.

The patches introduce new devicetree bindings and sysfs attributes, along with
a platform driver to expose devicetree nodes of the former as the latter.

Obviously not having an abstract interface to these knobs and switches is not
ideal, but the proposal does have some advantages over devmem:

1. Removal of read-modify-write races, as register update is atomic
2. Reduced foot-gun, as only the defined field is accessible
3. Improved discoverability as the fields are named

The intent is that the setup should be used as a second-last resort (over
devmem). I'm interested in feedback on:

a) Is this a acceptable improvement over devmem?
b) If a), is the devicetree the best way to describe the fields?
c) If b), is directly mapping them to a sysfs attr group managable longterm?

My concern with b) and c) is that there's not a clear restriction on what
fields can be exposed using the driver, so I've tried to compensate by
explicitly documenting the recognised fields in the bindings.

Looking for feedback on all fronts.

Cheers,

Andrew

Andrew Jeffery (4):
  dt-bindings: misc: Add bindings for misc. BMC control fields
  Documentation: ABI: Add sysfs-devices-platform-field to testing
  misc: Add bmc-misc-ctrl
  dts: aspeed-g5: Describe VGA, SIO scratch and DAC mux fields

 .../ABI/testing/sysfs-devices-platform-field  |  95 ++++
 .../bindings/misc/bmc-misc-ctrl.txt           | 252 ++++++++++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/aspeed-g5.dtsi              | 192 ++++++++
 drivers/misc/Kconfig                          |  11 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/bmc-misc-ctrl.c                  | 446 ++++++++++++++++++
 7 files changed, 1005 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-field
 create mode 100644 Documentation/devicetree/bindings/misc/bmc-misc-ctrl.txt
 create mode 100644 drivers/misc/bmc-misc-ctrl.c

-- 
2.17.1
