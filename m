Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nZZja9T3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Hh0ysdMe"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Fryv6mw1zF21Q
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B62221A42;
 Tue,  3 Apr 2018 10:27:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=fIZQY4YmZfOtOE9o6q8vgzVSAwe+lHeFB4XV1EUbP
 gI=; b=nZZja9T33max5k3mWXIkSbcKznu4M99pOgDCDX1Ik+auTiEoUAVv+ez6S
 Mficx8uOI34eDj//jNxxDuL3DoXYUNtnMYhEW3QJJQSRpM+yic94OOAd2M6aXQS6
 iJbOJrtf4zS2W05Wey97dTnTt2ErDljS42dkdv8GijgC7A2nozUXyrfDCgzMzSJP
 IuNbidH48sDUodVeq2rdMj66ziGEWg4/R56ZvSHuO2FAKZLvOC4KbvH5sEg/QxMe
 9cRacxDIKF9nvsKlpDOdyY4DrkFkhFBweIoYmaHIz/qTXFH2vUsQhEKx59ZXscGi
 xaBlV5nhOjeOC3sHpsNiy5TL3VKlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fIZQY4YmZfOtOE9o6
 q8vgzVSAwe+lHeFB4XV1EUbPgI=; b=Hh0ysdMeEm3/BSylN40zYn819yxVLSE8Q
 E9DSY37+HviDbxCBVC9OB1x1U9RfaRrs2VdHp5uVKZcJwiFJS2AYSSWZLpejB12C
 j/j+mSgLhmo4Rs+OpK0pVJwB16VKmeTGu9vLxON/Qn9VL63qEXxzASHH5wLhBt5k
 E3W28G1V61E/RBD+VaJNxS3rC9ZvIDz8y2RaDCNGdkHE/W6IBIKkE/UK/ijDGXum
 9Fi81ggKga4mykUjaHnpv/fjjEf6fEI9Ymdx2L1rd1jxymw/lyEJvCmx2KCCcuvy
 HO4pxKMT+EwdBpeXrzZkmJqfNFCvFd60dHHABg7PUbKktPN2fF3DQ==
X-ME-Sender: <xms:U4_DWoxuy-oQIhAEjoHCvtG-4RufgapA3gAyQ0erhz0MX9tUokDYVw>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7DCB10251;
 Tue,  3 Apr 2018 10:27:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 0/5] max31785: Add devicetree support and
 work-arounds for transfer failures
Date: Tue,  3 Apr 2018 23:56:50 +0930
Message-Id: <20180403142655.16681-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:27:38 -0000

Hello,

This is a clean-up and forward port of some patches that didn't entirely make
it into dev-4.10, but did make it into some release trees.

The devicetree support is required to work around manufacturing deficiencies
which leave the controllers unconfigured out of the factory for some POWER
systems.

The communication issues with the MAX31785 on some POWER systems remains
unresolved and the outlook is that they won't ever be root-caused.

The reworked patches have been lightly tested on a Witherspoon system and
appear to be functional.

Please review! If there's no significant feedback in the next few days I'll
include them in the dev-4.13 tree.

Andrew Jeffery (5):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  pmbus (max31785): Add support for devicetree configuration
  pmbus (core): One-shot retries for failure to set page
  pmbus (core): Use driver callbacks in pmbus_get_fan_rate()
  pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 158 +++++++
 drivers/hwmon/pmbus/max31785.c                     | 497 +++++++++++++++++++--
 drivers/hwmon/pmbus/pmbus_core.c                   |  20 +-
 3 files changed, 641 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

-- 
2.14.1
