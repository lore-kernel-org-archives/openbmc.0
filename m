Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CcVVCchT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UWe8c8DJ"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySqNZ0plVzDqvT
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 15:53:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3758C20F62;
 Fri,  3 Nov 2017 00:53:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 03 Nov 2017 00:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=E/4TqpBn+2ga+f58uE/uWRYu5n4LKuMbnSYQeImy4
 Uo=; b=CcVVCchTh6JjZW5YH3FA5dszpIuahXteg8cT6tsAH6NOtwiGYhBw/E83t
 Q9Db300DDkq+y8DXrJx3QNe8e/Gt5Tw6ZDlfUNionrTgKEklCBsYfBNXUdpqPMJv
 yzt8oqQwJ3QhWCZ6gLHW6n4RgI63jTDoCLRUsrTphq4hpgvXv1d5PG2Ds4I3qMT2
 qhEa9K89Iyr4cW12/zrtWpA8XjRedUAYoNim9hsllwKYSY2fRD1oJKX5N6VUbJkY
 dwXF4/KEuvSw5cINun2D09nhVAisM48iySPYsWfuvbLdsHVsH3isIXxCmDGBdC/p
 0lM+pklD0f6R9NKXNNyZSUhJRVTNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=E/4TqpBn+2ga+f58u
 E/uWRYu5n4LKuMbnSYQeImy4Uo=; b=UWe8c8DJybaiB8P37OWf58dTSlb2WGcxS
 I5tbiATKscfgU9OjIYWQfv5eyQi7OYW3xTYYYs69XrfLuWCXHFlfSXIgISrE2Cul
 6zduXgsHesVs9aBA7OI9zH5ShlAqbMfmTp6nV9bb8VjthDUm/s001Cqqsxdhnhwj
 K6PlNR3L1vXX9UkvVzH2pLkc2YmSpN6ccGyxigFC4oBB21z2PN30tA2hKSzrvkMI
 n7C+RTTwBnIozL3BZT9E+NBFjbNr148im/0szPgj48WfTbvg2gkS4bWc6uyRtCja
 Fr0yjYWO+WPjrAuSk79AX4T8Ivd/Hdw7Tjq5e+oiQO8aOAfmAMeNA==
X-ME-Sender: <xms:Wvb7WW2nzuPPo_IKbSa2q5751BCrpHgRxzZxVUbZ_OQyIrJtcw2jbA>
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB5AB24009;
 Fri,  3 Nov 2017 00:53:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/6] pmbus: Expand fan support and add MAX31785 driver
Date: Fri,  3 Nov 2017 15:53:00 +1100
Message-Id: <20171103045306.26448-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Nov 2017 04:53:51 -0000
X-List-Received-Date: Fri, 03 Nov 2017 04:53:51 -0000
X-List-Received-Date: Fri, 03 Nov 2017 04:53:51 -0000

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the fourth spin of the series, v3 can be found here[1].

I've been running aground with the described devicetree bindings in the
previous iterations, so in order to get *some* support upstream I've gutted the
documentation and removed the corresponding support from the driver. I'll save
posting that for a later date once Guenter and I have some input from Rob about
what direction to take with respect to describing PMBus devices.

As mentioned, adding full support for the features of the MAX31785 requires
modifications to the PMBus core, so I've split the addition of features into
separate patches, in the hope that some can be incrementally applied while we
iterate on the details of any suboptimal parts.

Please review!

Andrew

[1] https://lkml.org/lkml/2017/9/8/4

Andrew Jeffery (6):
  dt-bindings: pmbus: Add Maxim MAX31785 documentation
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  pmbus: core: Add fan control support
  pmbus: max31785: Add fan control
  pmbus: core: Add virtual page config bit
  pmbus: max31785: Add dual tachometer support

 .../devicetree/bindings/hwmon/max31785.txt         |  22 ++
 Documentation/hwmon/max31785                       |  57 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 375 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  31 ++
 drivers/hwmon/pmbus/pmbus_core.c                   | 236 +++++++++++--
 7 files changed, 713 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
 create mode 100644 Documentation/hwmon/max31785
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
