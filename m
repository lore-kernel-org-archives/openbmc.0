Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ5Dr4dXmzDrFw
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 18:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DWvcsnRr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BbVWPDu1"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A7A1B20699;
 Thu, 27 Jul 2017 04:46:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 04:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=UyDLk34FdF9p43m8PvleswvklrYrEh
 ncSvjc3gpJfX0=; b=DWvcsnRrEzffS/GQTUnDTJVuGJlmLpqIGDgyfr+95VU6cW
 lP8GKeeANKdCSvZsaK/NieFBx+0yBQ6YDRTjbKfJ0PUy1C0XY09OvBZrRK9rITUp
 TTU6QE77LjTYK2D9wIvLEyWj7zvnnmkFgMtq0ObymUPVL2wqVVSWe2ZXylJXLItg
 1i67tEXWna2uN1hqBvxOdq0b5xMKQucVEPIXTspN0AjVcX0aytx9o3+jMx08fcmw
 yIJylaLc5Wy+hfYdpHdOdj7tzUqfUrMRxtxjArwrGxejwqS1VpJpA0289Of7jFqh
 ZLQEeaav6IaN/DK1an66SysMuP9s66Akr6kMgtTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=UyDLk3
 4FdF9p43m8PvleswvklrYrEhncSvjc3gpJfX0=; b=BbVWPDu1/1Q9PnD2RsH0fo
 ZAvKONXp9iS6/HT2piuV+BpX050WYKV7jot5Oo3Rx04S9BdQ1BxqSatHvOqOBSfl
 hj9IW4oX31e5fuF7houwm2K2/0P2tBjBn1XSegvKKYZQ+vPqLW5t4jR1Ns90k4gc
 6w1XDIuAz1QNeRZuxcwgzGKL4u3ozMumX19bVuLxX7RTXbkiooKYw/Ray2uD7eQ8
 gVZsAAdB0TsBvtw31hp8AmKxyFYgsIOcfFOe6pj8XR/rURoEA8FV4k0h/mlupmbU
 b0N1JuUo1PJVrOJ47uJ3EbGmfQvV23pditBmSU7iuS3EhERSHKlxr5O+JYKsZ2tQ
 ==
X-ME-Sender: <xms:aKh5WYrpf0q16nDEvRf1D-Jduf-2XRtR5_prngPUofeYX7-HCagc-Q>
X-Sasl-enc: F8Pjkz5ELNolobhHdkVmUV5rBd3h8wpypYQd08v1yw/N 1501145191
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08148244DA;
 Thu, 27 Jul 2017 04:46:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Thu, 27 Jul 2017 18:15:51 +0930
Message-Id: <20170727084554.8794-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 08:46:39 -0000
X-List-Received-Date: Thu, 27 Jul 2017 08:46:39 -0000

Hello,

Previously I'd posted a second RFC series implementing fan control support in
PMBus core and adding a driver for the MAX31785 fan controller:

  https://www.spinics.net/lists/kernel/msg2558128.html

I think the core changes have settled enough to move the effort out of RFC-land.

This series is some modest refinements on the core based on previous feedback,
and polishes the driver implementation by defining and implementing devicetree
bindings for the controller.

The series has been tested on a number of IBM Witherspoon systems, which
contain the fan controller of interest.

Please review!

Andrew

Changes between RFC v2 to (non-RFC) v1

* Clean up issues identified in comments on the pmbus core changes 
* Define and implement bindings for the MAX31785
* Clean up issues identified in comments on the max31785 driver

Andrew Jeffery (3):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 117 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 670 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 222 ++++++-
 6 files changed, 1034 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
