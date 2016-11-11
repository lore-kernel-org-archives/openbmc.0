Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRNT5hkNzDvnN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F9aW2IEE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HpMGeanS"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E75AA20D1A;
 Thu, 10 Nov 2016 23:13:10 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Rmy
 4Uqf7ue3Ml6ij4ZXNMRGiOgk=; b=F9aW2IEET5JcgQZDbFf5drLL/7EONXXi/fA
 G7S43Gy+bXrtgj4EvwVC9t08L93D/Ydy4ZnwCUKUCJVM2DdOIR28vXQrO8HrtEyw
 jX0s93UiFuhfw7zzetOq/qcU7NV3q+kIQAn+LtlSRGs4cAUUMgiozwzO99gh4Fbq
 vHomV+jA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=Rmy4Uqf7ue3Ml6ij4ZXNMRGiOgk=; b=HpMGe
 anSjglJ0pbzVRaFFmlow1/bP5AwyffV8AIu6yPr1Df95Ow+rbczasM//lDQuM96e
 uIVzJW54AzaJjyed11VyQZMg27MezbF/5IhSJO/VFcf4GgAzQsD5JC3Fr8SCJDYE
 EXESlBoVzxgy7DqW//nlNirkWKBd7Clcl/n1E4=
X-ME-Sender: <xms:VkUlWLDuKnqMmS_gvK7Gl5wUhBFnmrBB_K0E906JyE7U7kWFrkEKow>
X-Sasl-enc: A4XbYPL21lEuNjRhM+MJxjWdy1rkqPf82d63InVhv01f 1478837590
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 578987F079;
 Thu, 10 Nov 2016 23:13:08 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
Date: Fri, 11 Nov 2016 14:42:07 +1030
Message-Id: <cover.1478835488.git.andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:15 -0000

Hi Eddie,

> This patchset provides a new OCC hwmon driver. There are a number
> of issues with the existing driver. Firstly, i2c access was embedded
> throughout the driver. Secondly, there is no way to easily differentiate
> versions of the OCC.
> 
> This patchset addresses the first issue by abstracting the bus transfer
> protocol into a modular structure. In this way, any low level transfer
> method may be easily implemented.
> 
> The second issue is addressed by separating the "version specific" code
> for the OCC and the common hwmon code. This task is not yet complete, but
> the general structure is in place. Ultimately, different OCC versions
> could be probed up using the device tree.

I agree with all of this. However, I thought some of the layering could still
be improved, so rather than provide a review through prose I figured it might
be better for both of us if I mangled the patches directly. 

I've attacked two things. The first is I found the series hard to review due to
the way the patches were split, as the patches went from trivial to huge (and
complex) in a fairly short step:

> 
> Edward A. James (5):
>   Revert "hwmon: Add Power8 OCC hwmon driver"
>   drivers: Add hwmon occ driver framework
>   drivers: hwmon OCC scom bus operations
>   drivers: Add hwmon OCC version specific functions
>   drivers: OCC hwmon driver and sysfs

So I have reworked them into what is now 8 patches (see below) and tried to
tell a bit more of a story with them (hopefully I succeeded!) Second, I tried
my hand at reworking the layering as mentioned above, such that hardware
interaction is split from sysfs, and that the SCOM transport and sensor
configuration is decoupled from the data parsing. You largely had all of these
in-place already, I just cut and pasted code around a bit.

Please review the patches and provide feedback! I'd like to hear arguments for
or against both of our approaches. Note though that I've only tested that these
patches compile, I absolutely have not done any further testing.

Joel: Any chance you could chime in with an architectural review?

When the dust has settled on the bigger issues we can start to look at the
finer details of the APIs (there are some bugs, oddities and complexities that
I would like to address before they are applied to openbmc/linux).

Cheers,

Andrew

Andrew Jeffery (8):
  hwmon: Add core On-Chip Controller support for POWER CPUs
  hwmon: occ: Add sysfs interface
  hwmon: occ: Add I2C SCOM transport implementation
  hwmon: occ: Add callbacks for parsing P8 OCC datastructures
  hwmon: occ: Add hwmon implementation for the P8 OCC
  arm: aspeed: dt: Fix OCC compatible strings
  hwmon: occ: Add callbacks for parsing P9 OCC datastructures
  wip: hwmon: occ: Add sketch of the hwmon implementation for the P9 OCC

Edward A. James (1):
  Revert "hwmon: Add Power8 OCC hwmon driver"

 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |   13 -
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |    4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |    4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |    4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
 drivers/hwmon/Kconfig                              |   13 +-
 drivers/hwmon/Makefile                             |    2 +-
 drivers/hwmon/occ/Kconfig                          |   38 +
 drivers/hwmon/occ/Makefile                         |    3 +
 drivers/hwmon/occ/occ.c                            |  494 ++++++++
 drivers/hwmon/occ/occ.h                            |   79 ++
 drivers/hwmon/occ/occ_p8.c                         |  219 ++++
 drivers/hwmon/occ/occ_p8.h                         |   30 +
 drivers/hwmon/occ/occ_p8_i2c.c                     |  133 +++
 drivers/hwmon/occ/occ_p9.c                         |  261 ++++
 drivers/hwmon/occ/occ_p9.h                         |   30 +
 drivers/hwmon/occ/occ_p9_fsi.c                     |   93 ++
 drivers/hwmon/occ/occ_scom_i2c.c                   |   68 ++
 drivers/hwmon/occ/occ_scom_i2c.h                   |   20 +
 drivers/hwmon/occ/occ_sysfs.c                      |  498 ++++++++
 drivers/hwmon/occ/occ_sysfs.h                      |   51 +
 drivers/hwmon/occ/scom.h                           |   50 +
 drivers/hwmon/power8_occ_i2c.c                     | 1254 --------------------
 23 files changed, 2076 insertions(+), 1287 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h
 create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h
 create mode 100644 drivers/hwmon/occ/scom.h
 delete mode 100644 drivers/hwmon/power8_occ_i2c.c

-- 
2.9.3
