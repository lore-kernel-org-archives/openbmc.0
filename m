Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cPgoLtmN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f/FROIU3"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpPkP050mzDrYl
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 14:39:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 403BA20C2E;
 Fri,  8 Sep 2017 00:39:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 08 Sep 2017 00:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=XurISloHHBKEtVN9t2FNQkOwHyFacX
 0qGn86AEQ0HIY=; b=cPgoLtmNsymSu8V0KrXkB1KqyKTpLQTGozqTylxK57kyl5
 ePhKq21gw5HrO+BYDyS/vXgUhOgBvuVqq9FUh0HiSPcxhWi2XjGvyqplok9EIGqw
 i5TGs5Rn8Ydi1cYjU+oS4Wo+0v/FDmSJ1d5ljZpHOFmrZ10wYg4xFZTLZl5RwdGN
 lcSFxNR0jvgajPdXX+Ayz5GeveokD0Ou3AzsvQdDgw3u/vrPCY4XhylaS83AnmiQ
 barjwejfhk09zyaTQqTkuf09FAOYCIhQYAATM95X0aNX6+Bad0/MR1ROW4dCadb7
 3pTch2U+WHPFopfXQzjUamRRV4UH/fUKlU2Yk8HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XurISl
 oHHBKEtVN9t2FNQkOwHyFacX0qGn86AEQ0HIY=; b=f/FROIU3pgZX0Tt9+Cfpve
 z5cpug8pB53vhcjRQlPl8TNvyVxZmgCj4bbcsvASRcLzwmgx9rTceX/lnhGJL/R3
 NSdK3K4eXTGRZ4PkiLebcFigj6KLJrXcwxGJ6vCavBWyYbNVLuR+IICMhtPdjGVy
 l6GAhsMlds3KDu4vuNIiXqdzWd6iZltUv/ZCmVmWP65psE+xVvWfp3HTrOiPLZa9
 MgetyZZAexcwwfqL5pylH8maEcXnsycJbD9g1PgvTN/rObgoZMMjJCHWVATy6MWc
 KYWXkJlLgiY85G/0lv6NxoA4ZstbRr1E4MKwkYGmjEvBYSjWy7bFBLHKSv3o5s3w
 ==
X-ME-Sender: <xms:Gh-yWRa8iuvRQ8bkaPitRF6V7ajLBo4-wEp2xi5RQFk0qBwd95RVIA>
X-Sasl-enc: ZXipFXAmx48z5H5pREC+/6apuDIAKeob2ne2zVomVQnk 1504845593
Received: from keelia.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5F1C7E426;
 Fri,  8 Sep 2017 00:39:50 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Fri,  8 Sep 2017 14:39:16 +1000
Message-Id: <20170908043919.6924-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 08 Sep 2017 04:39:57 -0000
X-List-Received-Date: Fri, 08 Sep 2017 04:39:57 -0000

Hello,

These three patches lay the ground work for fan control in the pmbus core and
introduce a driver for the MAX31785 Intelligent Fan Controller that makes use
of the new control features.

Since v2[1] I've addressed Rob's comments on the bindings, integrating the thermal
support and cleaning up some warts. One of the warts was regarding the
maxim,tmp-fans property which was switched to use a list of fan phandles rather
than indexes. A corresponding change is made in the driver. I also did a
comparison with the Aspeed PWM/Tach bindings but I'm not convinced there's much
to take away from it other than those bindings are somewhat broken.

In v3 I've dropped patch 4 from v2, which was a bunch of work-arounds for bad
behaviour I observed in testing. At this stage the bad behaviour appears to be
a product of the larger hardware design, not necessarily a problem with the
Maxim chip. Guenter has performed some quick testing of a cut-down v2 driver
against the MAX31785 evaluation board and couldn't reproduce the results I was
seeing[2][3], which increases the likelyhood that it's not the Maxim chip and
the work-around patch is inappropriate.

Please review!

Andrew

[1] https://lkml.org/lkml/2017/8/2/88
[2] https://lkml.org/lkml/2017/9/7/669
[3] https://lkml.org/lkml/2017/9/5/53

Andrew Jeffery (3):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 158 +++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 673 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 224 ++++++-
 6 files changed, 1080 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0
