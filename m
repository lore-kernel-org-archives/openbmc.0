Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBQny1XLdzDrF8
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 13:37:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KXwgkJ5y"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cJ8ZeG71"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E5F4620A15;
 Mon, 17 Jul 2017 23:37:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 17 Jul 2017 23:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=nL3ek3SmLYv1rPWWua2fZuDQks0fqe
 ZSw3WdMYc2cRM=; b=KXwgkJ5yOwRlTKaVYLbmXhHoKXs4vhC0ug72CIkKal8G37
 7j2ooduTxuCh70WqAxCs8szpokhbOJTRPK5+HUEq+k7MO8OMe8NsEjJmliPbmM1a
 SINGd/AHDW4trRHg6Ey+k4DKWLS7hAhZp+sZAAbLs/zHrjWjdTo3l2ZuuRwSmb19
 HJDUmRxrYqI09uMCOOk/U1jh0mPRdX1UfA0r0KebjHWT/xGXcpsDjdCx6TqNAc/S
 7QdYpdXD3szyZF7OD8uXAYVvbsGe8FZ3JOVLd75TUeEudGEIyDTCPaw6Ip9or7wn
 BYmKrb4yQNKFWJVOmf16P0LSfChh+wtYFdYJGnYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nL3ek3
 SmLYv1rPWWua2fZuDQks0fqeZSw3WdMYc2cRM=; b=cJ8ZeG71XSFa2EQm9qTqxw
 fIBJyakvGpVnc6rYFieK7eb2SSgR0oXZpi5Y2hoeispeAHwOz83PrAw/EMVgPtDr
 NBCOoKz8PX/e+jKbIdTxSQ0PqKKOBOBYctvUErvmCT3IGw4X094U/Ght7awkvTb6
 u5/T29nhsAFdtIDxhP+QOHFcbs0+n/UPL+GApUMUa6zb/jrzdsWrDe/hV0yv89So
 QTA2ElPiTIW/keAFPdrTgR1twGoknBPupP0S4+6jcVkGQfO8mgXRPwLxxtGBrEPu
 rd5Q4Z9bt3/qEkt+UW7COOVGodJkjtmlMbCTtGg4Qi2YvkP9o7gy4FhjHZWFZ9hg
 ==
X-ME-Sender: <xms:Y4JtWX9nYPJEBOaPHHD34dSEIeCzmurGqi4XsrUEAny_cRQmyoX6og>
X-Sasl-enc: 5YGvy4GEzEsW0UFUR/Cs289pMyoZmWxTohP124DBeqr8 1500349027
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FB987E792;
 Mon, 17 Jul 2017 23:37:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH v2 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Tue, 18 Jul 2017 13:06:50 +0930
Message-Id: <20170718033653.10298-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 18 Jul 2017 03:37:12 -0000
X-List-Received-Date: Tue, 18 Jul 2017 03:37:12 -0000

Hello,

This is a follow-up to the first RFC series[1] and includes some significant
reworks based on Guenter's feedback.

[1] https://lkml.org/lkml/2017/7/10/338

v2 retains the goal of exposing the fan[1-*]_target, pwm[1-*] and
pwm[1-*]_enable attributes, and implementing support for the MAX31785, but does
so in terms of virtual registers. The virtual register approach cuts the size
of the patch to the core roughly in half, reuses the struct pmbus_sensor
infrastructure and retains the same level of functionality. The additional
callbacks are dropped, I've reverted the change to the way the DIRECT
coefficients were structured, and there are no-longer modifications to struct
pmbus_sensor. I feel that the change is starting to become palatable.

With respect to the MAX31785 driver, I've thought about the dual tachometer
problem and resolved it with use of the read/write callbacks and only a small
modification to the core. The MAX31785 driver needs to track which fan inputs
have dual tachometer fans, and thus needs a context struct. To enable use of a
context struct I've exposed a pmbus_get_info() function that returns the
pointer to struct pmbus_driver_info provided at pmbus_do_probe(). This allows
the read/write callbacks to hoist themselves out to the containing context
struct without exposing the internals of struct pmbus_data, or injecting
driver-specific details into members of struct pmbus_data. I'm interested in
feedback here.

I've sent this as an RFC again to get feedback on the new approaches, but also
because the MAX31785 implementation is not quite where I want it to be:
bindings need to be developed, and the driver needs support for individual
sensor dual-tach support, not just assume that all present fans support it.
I'll work on these issues in parallel to feedback on the patches.

Andrew Jeffery (3):
  hwmon: pmbus: Add fan control support
  pmbus: Add and expose pmbus_get_info()
  pmbus: Add MAX31785 driver

 drivers/hwmon/pmbus/Kconfig      |  10 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/max31785.c   | 372 +++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h      |  20 +++
 drivers/hwmon/pmbus/pmbus_core.c | 221 +++++++++++++++++++++--
 5 files changed, 607 insertions(+), 17 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
