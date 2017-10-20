Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n+uBNJyU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rxdIruIM"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBN94sCGzDqBc;
 Fri, 20 Oct 2017 14:38:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B04320F98;
 Thu, 19 Oct 2017 23:38:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=iKTCFAPftcFnFNfAqAtsRB7MhIYY7QmBAegQVQW1c
 3s=; b=n+uBNJyUUkMs4EF1TKrIxRG9epoZQFtJfKQSN5zn6yPjjuqNyVobbpKR/
 y9e9Dfg4VUvjT+u8lHVkVasERFXtYELsrtwEJLrZycLg7KXht90ArelvVmCu2BRT
 RhhWQVxmnXPV1aCIiOaR5Te9F/XnfyUcFhU/aD5Zs1OSiNwN/L00Ss8299DOLyrr
 AmFNLufDatYlQ9+hk2JO3uqf1/qVclltaXoUT3WAWMCZaXB5mnLwDyNn5b+mtqIn
 IIbPa4vRd31td9hRCcPgr5jtSdYMrJpJLTFfKwd/8Bvyr2sctwqAktmS+wE6tSWZ
 pW0Jp8NBFYRFq7oeN0RzmgPr4L08A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iKTCFAPftcFnFNfAq
 AtsRB7MhIYY7QmBAegQVQW1c3s=; b=rxdIruIM6sd+QUUXVDp3+HDjpJFMkbyfs
 7IIG39blH/EnCLgJks8iqVDNlTGCnnNfTi1QnIpoSrlLB6DO0cxvIqCRyVghCfNM
 SA/v5DHVMvgBtti3ulQbGn/ue9miovMlvVuLEz4+B5JMkn74fh3RX+46/sOrzQ3+
 v1WN7GtOfXl2lTz2KXn6fdB53vHhkFUkV6nrffpcbOOPUki+XOjwFSScGsNP3dcT
 1y3uoGW/6tcCKTDBRqhzXElBXK+U5NIZOXOSsaTeAd+6gNuoRi6D8INRIHSQ+A40
 6OM8wV2pM40/a9ArnOaSW+SWziBVw4nwxEPOoMYN5TAVIAS2e/2XQ==
X-ME-Sender: <xms:tG_pWS3CHF1YLQiADm7FTy0zWgnR06DDpGXvJjVwmMDUbeU7k0pjWw>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03AEA247AD;
 Thu, 19 Oct 2017 23:38:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 0/5] gpio: Expose reset tolerance capability
Date: Fri, 20 Oct 2017 14:07:22 +1030
Message-Id: <20171020033727.21557-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 03:38:35 -0000

Hello,

This series exposes a "reset tolerant" property for GPIOs. For example, the
controller implemented in Aspeed BMCs provides such a feature to allow the BMC
to be reset whilst maintaining necessary state to keep host systems alive or
status LEDs in-tact.

I'm sending it as an RFC because I'm not sure using pinconf is the right way
to go about it, or that expanding the sysfs interface is a good idea, or that
the approach taken is right in the context of the existing suspend support.
pinconf just ended up being a convenient abstraction whilst supporting the
sysfs change, and didn't feel unreasonable to use for devicetree or the chardev
interface either. My concern with using pinconf is that the reset-tolerant
property is (currently) GPIO-centric, but maybe that's not a worry.

So the patches in the series support configuring the property via devicetree,
the chardev interface and the sysfs interface. The sysfs interface also exposes
the ability to configure the suspend tolerance, though there are some ordering
requirements with respect to setting the direction (the suspend tolerance will
only take if configured before setting the pin direction on the Arizona
controller).

Please review!

Cheers,

Andrew

Andrew Jeffery (5):
  gpio: gpiolib: Add core support for maintaining GPIO values on reset
  gpio: gpiolib: Add OF support for maintaining GPIO values on reset
  gpio: gpiolib: Add chardev support for maintaining GPIO values on
    reset
  gpio: gpiolib: Add sysfs support for maintaining GPIO values on reset
  gpio: aspeed: Add support for reset tolerance

 Documentation/gpio/sysfs.txt            |  9 ++++
 drivers/gpio/gpio-arizona.c             |  4 +-
 drivers/gpio/gpio-aspeed.c              | 39 ++++++++++++++-
 drivers/gpio/gpiolib-of.c               |  2 +
 drivers/gpio/gpiolib-sysfs.c            | 88 +++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.c                  | 74 +++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h                  |  1 +
 include/dt-bindings/gpio/gpio.h         |  4 ++
 include/linux/gpio/consumer.h           |  9 ++++
 include/linux/gpio/driver.h             |  5 +-
 include/linux/gpio/machine.h            |  2 +
 include/linux/of_gpio.h                 |  1 +
 include/linux/pinctrl/pinconf-generic.h |  2 +
 include/uapi/linux/gpio.h               | 11 +++--
 14 files changed, 234 insertions(+), 17 deletions(-)

-- 
2.11.0
