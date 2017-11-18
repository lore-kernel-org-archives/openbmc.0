Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qRRziEmB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o1LlL2VV"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yf0lB1lMPzDrRk
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 14:26:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B5D6B20D2C;
 Fri, 17 Nov 2017 22:26:41 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 17 Nov 2017 22:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RjYEkQuUnpqkciwkJbDEWCLJZgD/J01BswAXdWj05
 7Y=; b=qRRziEmBUt/a3he8z6HUGlF9I2PkZU/JEwv03jhhQ/9fJJG9XxXTbcF+I
 xS9RB4TMreNTdEMpm5MvHjp7e7TG3GZr5mAklvL/3bYWx5XrOXXUaPKY6LzSnu3n
 rmHu+zM/z5yvWFWybMsD3EPyY8tDskNPze5/7iu1eH+1vJvKCprZvdk58DvSTdoD
 OGBko77+eCMFXCsRdd/1bBKA4ZLifg14FS2sWFhMKUy3MmsP07rcE1y/Q7xl7BL/
 HMZAk+t56BCee12KPZni1cwFcBUitR/ElffKDOzbxOlHGP6EYXdOLUHS0ZcwjtN8
 vjhXpApUQ94WYlWu72q8JeHbkaMoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RjYEkQuUnpqkciwkJ
 bDEWCLJZgD/J01BswAXdWj057Y=; b=o1LlL2VVN9mcGWdWbsXgb6i4W5Ry2FQlJ
 g0BBy2YbieFppiYqnekVlJXKTd7eXhjm8Lvt3SW5Z2E/ale9hj9g58gh7X2PDste
 pT+FviK3E56CCJeZb3TmdoX50FNuuNQrZEg6qLGxkSGMiOXD5JGumY9YAvPq4Iah
 yvG4bqG97g0lWbJqn7ckQeYX2NE/lGqjlMSH10r26wev08tQ7Nyu9VxlAivoFfUq
 Bb5V2QQ+hY/kB+XlANiodHlv7FJSkrYu8jRplIJHi4LhmM4f0Oj9kzxjUkTogrYn
 Ohd8lTiH+QsQLArcu7cUynGodQfgyyuz17JsVvo0ucNsYC6arAxBg==
X-ME-Sender: <xms:cagPWiMeytjxC9CqDeb_4dTnCThfPQ6VY5FJxk5X4hjtU4kMRT-AQw>
Received: from dave.aj.id.au (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 814AD24739;
 Fri, 17 Nov 2017 22:26:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Sat, 18 Nov 2017 13:56:02 +1030
Message-Id: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Sat, 18 Nov 2017 03:26:48 -0000
X-List-Received-Date: Sat, 18 Nov 2017 03:26:48 -0000

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the fifth spin of the series. v4 can be found here:

    https://lkml.org/lkml/2017/11/3/15

The changes over v4 include a rework of the fan control support to provide a
more intuitive behaviour for fanX_target, pwmX. They now always read the value
last set (in v4 they returned 0 if they were not the active control mode, and
in even earlier spins they returned an error), which also allows implementation
of sane behaviour for pwmX_enable when switching control modes.

The default implementation for the PWM virtual registers is removed from pmbus
core in light of having no consumers (the max31785 driver implements them
itself), though whilst I was unsure about the generality of the scaling in
replies on v4, after some more thought I have reason to believe it should hold
in general. Regardless, it's gone for the moment, and I've added some
commentary about the scaling in the max31785 implementation.

Please review!

Andrew

Andrew Jeffery (4):
  pmbus (core): Add fan control support
  pmbus (max31785): Add fan control
  pmbus (core): Add virtual page config bit
  pmbus (max31785): Add dual tachometer support

 Documentation/hwmon/max31785     |  15 +-
 drivers/hwmon/pmbus/max31785.c   | 285 +++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |  41 ++++-
 drivers/hwmon/pmbus/pmbus_core.c | 250 +++++++++++++++++++++++++---
 4 files changed, 566 insertions(+), 25 deletions(-)

base-commit: ded0eb83449e8fcba22fd2736826336e101ffbcb
-- 
git-series 0.9.1
