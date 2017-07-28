Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvK34nGWzDrS3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DvOypI1J"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D9Cw3740"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4ABC820BAA;
 Fri, 28 Jul 2017 12:23:00 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=HJ3sb+WAGk91xDqbC1tAyz8WJcfIit
 fR9WNkWvM9O5A=; b=DvOypI1JnzT5tDFhzWBDrIuflwt6Ix9uOKujjmhjiTS8E6
 1CmSp5O/UO1WqhHy3FpxUjRTpuBLbMxQ16fPqX6MigvHeSUh9U/f+p0CL3TrNir/
 LpY+8BJ36h8bTw5WRPooIJZbsz+9IVOD81gB33PZa2ManXjS1NGpgIVCEYpGqK5q
 jg18Bb3qvPgteHD4mVoBoZJwdQnVLrd2JLrp1GIMiT2QGQHxyENIoRcdWEyYUogL
 7t0YpoJMHd0g4QZeysZu0k2iA/WUKMam2YLyE7dlfxX29HCtNYiQ/VrRJvVWeUOr
 vHaOtefHlu4TuKzecF3YksPyfB+pJAzi/BpEBo0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=HJ3sb+
 WAGk91xDqbC1tAyz8WJcfIitfR9WNkWvM9O5A=; b=D9Cw3740809j94L9a7damq
 l8VOM9ruhWqt2vYUyNwDz9/5h1XrIkvOmEwZGHld0hldSI6GSQ1jONP5fwWmPJ50
 A/B2gO7JTkojdueNK5r33n8A50mqEd27qHa59a7wmzlBbAH1qjFUCR+yP7ekc7Jw
 HMXN7LwOIAKBDIADwMH2hC1jDbt3u+CwkTtNYEs8JiHfCbrm33/BTcDh9pNNCC9Y
 Xh3t123pKvwAi8KHO1v1J+m6BNxQ8cneVUa0ogZiYVegYi5h+pzJfbqrYlK7ExJ1
 GJlL6gli9ZjYuhv0we4xC5bNRrOao7ZtPT31eYDiyHsO3o0jFMOk/6PvaZTJf/UA
 ==
X-ME-Sender: <xms:5GR7Wfyhym4PpY2oKFnuIG12LdBVmj1dhRF7LVuYXQBc1CKnlGjKwA>
X-Sasl-enc: OmqRfyrhNWn8Mck5Ej0MJtYnqbgnrS7P927UPg8i/d4r 1501258979
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEA427E17C;
 Fri, 28 Jul 2017 12:22:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/6] Hardware work-arounds for max31785
Date: Sat, 29 Jul 2017 01:52:43 +0930
Message-Id: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:06 -0000

Hello,

Two issues have reared up regarding the recently applied MAX31785 driver:

The first issue, regarding unexpected NACKs from the device, was discovered in
earlier testing but its impact wasn't clear and its cause was not nailed down
at the time. The thought was it could be solved in slow-time, but this turned
out not to be the case. A work-around is presented in the last patch.

The second issue stems from a difference in hardware behaviour between
Witherspoon hardware levels. Integration testing machines do not have the
"installed" bit programmed into the max31785 chip out of the box, whilst it
appears that functional testing level machines do. The consequence is the
driver emitted some warnings and exposed none of the fans to userspace on ITC
level machines. A new devicetree property is added to make the driver configure
the installed bits in the max31785 chip during initialisation.

Please review.

Andrew

Andrew Jeffery (6):
  dt-bindings: max31785: Add mark-fan-installed property
  ARM: dts: aspeed: Configure Firestone to mark its fans as installed
  ARM: dts: aspeed: Configure Romulus to mark its fans as installed
  ARM: dts: aspeed: Configure Witherspoon to mark its fans as installed
  max31785: Support mark-fan-installed devicetree property
  pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   |   2 +
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |   6 ++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |   6 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |   4 +
 drivers/hwmon/pmbus/max31785.c                     | 116 +++++++++++++++++++--
 5 files changed, 123 insertions(+), 11 deletions(-)

-- 
2.11.0
