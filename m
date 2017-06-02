Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfW4WkfzDqKl
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:22:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Rh+mQD1c"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kOxTPqtI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C68E020807;
 Fri,  2 Jun 2017 02:22:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=BDtLutkYrxtmtp4sdfiHUXjOM4p/kA
 rj3WxvIHk16U4=; b=Rh+mQD1cqkb9y3PLDi4s3iIzqnca1C6PHTGApcipC/nio7
 BYo2wBaVF5AC6OxrifGQdis3oTndpuUmU3GLixJYCYPtOPezYIdbONOQKb41DXva
 JrfVv6tajF5rVNvDgccEDZtAVLgSDGKD3LnMhej/63bU01WPgurH5neX7ADKF2rp
 WOf6pWU4CiEtO917lifrqY8A/+XgJDytkFQDlXscUc0dB7D/Y/NBMdlSfYFybtln
 vTYZHOBOVWCdT+DlSw8rNG1tWDtCqFR4FcdV4uVve9zDSNL0i/Dg/RjXatoEsiUU
 IZ7uIZFpZoew0T+4D4+LlKBdzVB2ns+c386K0hxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=BDtLut
 kYrxtmtp4sdfiHUXjOM4p/kArj3WxvIHk16U4=; b=kOxTPqtI3i4yDEpVRmuIgD
 6yXM1eQjYd8R/A5GLx8rXV/AXSWj/ONYKxZrG80IG6eMKuwNGGoKMGmufuAZZ+LA
 mX7yq2hWQxqmsr8821xM3xNzZbgUVwrjwEc9vas8QpDfIZpKuiOBQs1ZY25L0bel
 g5PYk5vifz2jvE8HpeKfpPoP2F7amsR6FD1Ak0l98X/FpGysWWDOpnrcv1MiK/gs
 CgIimAhtnbzkT3oVg6jo0OpajHPM5J3MHRvl7zBw8cyYiv72y9LmcNUfAystlKlI
 RplMpPkt6Sw02NmER7EDdGWiW4v5Z8aZaiO80/8yVMrfYJFwXwM3/gyJXZQ1cvfA
 ==
X-ME-Sender: <xms:PwQxWYl24qnFubWT7HnbzVgWBW8XVYaFssrUysyvmtAOzax1HnYmvg>
X-Sasl-enc: 6YknKGRlpB7CbuBxv0DAL+p4gFagXCQgFNFXIJllFVQA 1496384574
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1931724009;
 Fri,  2 Jun 2017 02:22:52 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 0/7] Add fast rotor reads to MAX31785
Date: Fri,  2 Jun 2017 15:52:00 +0930
Message-Id: <20170602062208.15999-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:01 -0000
X-List-Received-Date: Fri, 02 Jun 2017 06:23:01 -0000

Hello,

I've dodgied up this series with a patch to the i2c core to make the fast rotor
read documented in [1] work. Thus, it's an RFC series. Further, the fast rotor
values are zero on the machine I was testing against. Maybe I need to broaden
my horizons and test against more machines, but I figured I'd send the patches
to get some "internal" feedback.

Timothy's original patch is reworked against the new hwmon kernel APIs. The
rework made it easier to support both the 0x3030 and 0x3040 firmwares for the
approach I took, though maybe there is a better way with using the hwmon
attribute visibility modes. Further, it's still not a pmbus driver, so it's
probably not yet acceptible upstream despite the fact that upstream still
doesn't support fan control in the pmbus core.

Please review.

Cheers,

Andrew

[1] https://github.com/openbmc/openbmc/issues/652

Andrew Jeffery (5):
  arm: aspeed: Add MAX31785 to aspeed_g5_defconfig
  hwmon: max31785: Document implementation oddities
  hwmon: max31785: Adapt to new hwmon APIs
  i2c: Add bogus I2C_SMBUS_DWORD_DATA bus protocol/transaction type
  hwmon: max31785: Enable fast rotor measurement feature

Christopher Bostic (1):
  hwmon: max31785: Provide config of fault pin behavior

Timothy Pearson (1):
  hwmon: Add support for MAX31785 intelligent fan controller

 Documentation/hwmon/max31785         |  44 ++
 arch/arm/configs/aspeed_g5_defconfig |   1 +
 drivers/hwmon/Kconfig                |  10 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/max31785.c             | 852 +++++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core.c               |  30 ++
 include/linux/i2c.h                  |   2 +
 include/uapi/linux/i2c.h             |   2 +
 8 files changed, 942 insertions(+)
 create mode 100644 Documentation/hwmon/max31785
 create mode 100644 drivers/hwmon/max31785.c

-- 
2.11.0
