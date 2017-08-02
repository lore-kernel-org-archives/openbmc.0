Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMkxv6vzLzDsQb
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 17:16:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YedNLnoU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kkgQsyYk"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D43C5208AB;
 Wed,  2 Aug 2017 03:16:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 02 Aug 2017 03:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=4j5LJzrLy0pmckJ13KFF6wKqX/YOzk
 lwNmrEJsnq8FQ=; b=YedNLnoUX4WX7Q4uvR/pF8gFyGBiO0F97zHSXvxbFuidDo
 9s7xDEfofX5ZkY8SKbRFhuKPjnxE8t65UFaRWkluyoCC4Jup3lKhrRectJKGUd1z
 iRdW/64iYR6jyRcLK3Ra+qgs/wmWMvJd2/2LnTATwNQ2332xoH4dDHW115bYN/DY
 uW4WmpsTvGunWmGrHVEBXZAum9/DDU1f3qXt0OcTPQAMd0tHJnWOsQKD1V0RcIYY
 GPXsHkwcaKVtWotydta1hWcSIF2Fx06foDMfe4UI+Zy9EJoVZy6FdslKmGPFbubh
 nfi/mRUSuPim9l/RfXKzyLDkX3nMns0c6t81E0Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=4j5LJz
 rLy0pmckJ13KFF6wKqX/YOzklwNmrEJsnq8FQ=; b=kkgQsyYkKXPMZ8Sbwc3tZ9
 ACto8iHtNEB4P/o56+Aivdc5MY7GosBu5MNqMO0f0C/qR1hHNSJHd/42MDLl5Hwb
 ofBD/6xJ1TM8iJtsFCBwHwT85Urvph06HeXB/RhSd3XfrC7p0VCPV4AUImzaApFI
 lBCTDM4p5jfuWoBPsNLjulfeE1dE0t5zutpn/lqW7C+oW4XHKJcFHlkIyfssf4p8
 eVpWIdkGfAscoqaStHPI99qhlJbmzodxeG6xjt385Zp25Tv1wD60RMdn7sNUChty
 38B+xwcZu/4xiMRHKb908BNqo6Hg79b/IewLVoJCnTWMXkB3b/bbpIP7ISIBsRZQ
 ==
X-ME-Sender: <xms:QXyBWYz3P0JA4eEAqv5m6YviLkXJIOs7nsBh_8kq1rLRGad7j-embg>
X-Sasl-enc: 8dHT6U6wdAG0hbYIUPt3hITG9+EAehWAALVseWEWFEkq 1501658177
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44BC47E335;
 Wed,  2 Aug 2017 03:16:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Wed,  2 Aug 2017 16:45:37 +0930
Message-Id: <20170802071541.3121-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 02 Aug 2017 07:16:21 -0000
X-List-Received-Date: Wed, 02 Aug 2017 07:16:21 -0000
X-List-Received-Date: Wed, 02 Aug 2017 07:16:21 -0000

Hello,

v1[1] spent some time in the OpenBMC kernel tree and it shook out a few issues:

1. The machines I was testing against had pre-prammed the installed-bit in
   FAN_CONFIG_1_2
2. There appears to be a hardware issue with some back-to-back writes to the
   MAX31785

Point 1. is a policy issue so we should have the ability to specify behaviour
in the devicetree. As such the bindings documentation has been updated to suit.

Point 2, well, it's a little ugly. We're in contact with Maxim to better
understand the nature of the issue. Patch 4 introduces a work-around. I've kept
this separate from the introduction of the driver so it's implementation and
the demonstration of new pmbus core features isn't obscured. The work-around
has proved reliable so-far, across a number of machines.

[1] https://lkml.org/lkml/2017/7/27/116

Changes from v1 to v2:

* Add the use-stored-presence devicetree property describing the hardware as
  canonical in terms of fan presence.
* Small optimsation in pmbus_update_fans(): Don't write FAN_CONFIG_x_y unless
  the new value is different to the current value
* Update the MAX31785 driver to consume use-stored-presence from the devicetree
* Add the back-to-back write work-around

Changes between RFC v2 to (non-RFC) v1

* Clean up issues identified in comments on the pmbus core changes 
* Define and implement bindings for the MAX31785
* Clean up issues identified in comments on the max31785 driver

Andrew Jeffery (4):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 126 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 762 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 224 +++++-
 6 files changed, 1137 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
