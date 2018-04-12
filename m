Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CFBSHV2U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UxsRkEX4"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M6Zd3CYTzF1RX
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 13:58:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CAA4D218C8;
 Wed, 11 Apr 2018 23:52:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Apr 2018 23:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=IoMzwy8YgPZvuRqwAYGlYNv9fIpKXvOBUwOosGkyM
 zg=; b=CFBSHV2UXUOx+OVVM52FZM9VWVHhRKZZp/wBRZ4ey6qylsdKrYJ93irbJ
 5XbNm3m9IXrzoFiGA6TD2X/rrUD1n0KCOp0kqoIfrh2ZCm5RY2R+P7WN43EdD1HH
 MQqePBNqLUJPLle9NDpTKFccydUh7uYoEOPCsOtDEiaDVQUPgK241EGNwRVV6ltw
 Yd3VM/8uC8PzX3R+Y1EuVnbWQsfjviB3pyF9PykRldveSBzJS0n5RX6Y2wJ4+zjD
 pN8fsLj6427Gubj3Pts9K1GGuKY5UwEl8qXIfruOknDbOlNpEMsnN0K9VZX7zSJ2
 jxi4Ox7Ymfym3imI9ICuSdbH8bcZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IoMzwy8YgPZvuRqwA
 YGlYNv9fIpKXvOBUwOosGkyMzg=; b=UxsRkEX4uDmuX3jsqjWspu4lzyc+6FMZk
 zheybMTKfI/hbLbQeHoPQjQOyWD9DoUN1oWps1uTxcZvhFnsJaXJ4gkQwvrZHoWO
 p8NWBnVX9+sUhdRF2t1rAL3A3cv1SKOueWWkVszqJbm76h81nuDPxmoIe0iPE+ts
 zT1+3DV1NNmPXS/7bIwm3DRGFAjOoYMp6JIqwIwyZNQqFDfHk60aFDNn9zeJB/e5
 0s3HisM6mJxThzscQq8SUMLv1EoGLFUGGXpZ5tB5Z/RWW7PMlrgHDdWNFV6m/YJf
 xe11kzzq+7eSn49SjB0RC81YH4kRN9lF/LJNFdgt2ceBfHW3jdsPg==
X-ME-Sender: <xms:-dfOWoizYMwawiRh12-kHu44l9e2IP4ZJq9aLDFhRIBdbMFLWS5H4g>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B9C91028E;
 Wed, 11 Apr 2018 23:52:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 benh@kernel.crashing.org
Subject: [RFC PATCH linux dev-4.13 0/3] Miscellaneous BMC interfaces
Date: Thu, 12 Apr 2018 13:21:42 +0930
Message-Id: <20180412035145.21488-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 12 Apr 2018 03:58:19 -0000

Hello,

The goal of this series is to expose BMC SoC-specific knobs and switches to
userspace. This potentially includes scratch registers - I've exposed the VGA
and SIO scratch registers for the AST2500 as an example.

This series is an RFC because I can think of a few things that could be
objectionable:

1. sysfs vs chardev (at least, for the scratch register access)
2. the name and compatible of the driver given that it's fairly generic
3. for the same reason, the location in the source tree
4. the devicetree bindings (which are as-yet undocumented)

Regarding 1, scratch register access might better be done via a chardev. As a
note for future reference, UIO is not appropriate in this circumstance as we
want to access addresses in the MMIO space that aren't necessarily sized or
aligned in terms of pages.

The implementation is based on the rough outline in benh's recent email to
lkml:

https://lkml.org/lkml/2018/4/10/222

Looking for comment on any of the above points.

Cheers,

Andrew

Andrew Jeffery (3):
  soc: aspeed: Miscellaneous control interfaces
  dts: aspeed-g5: Expose VGA scratch registers
  dts: aspeed-g5: Expose SuperIO scratch registers

 arch/arm/boot/dts/aspeed-g5.dtsi     | 136 +++++++++++++++++++++++++
 drivers/soc/Kconfig                  |   1 +
 drivers/soc/Makefile                 |   1 +
 drivers/soc/aspeed/Kconfig           |  11 +++
 drivers/soc/aspeed/Makefile          |   1 +
 drivers/soc/aspeed/aspeed-bmc-misc.c | 187 +++++++++++++++++++++++++++++++++++
 6 files changed, 337 insertions(+)
 create mode 100644 drivers/soc/aspeed/Kconfig
 create mode 100644 drivers/soc/aspeed/Makefile
 create mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c

-- 
2.14.1
