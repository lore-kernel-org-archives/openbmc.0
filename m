Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdryp5b5LzDqZ1
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Z02VLjdV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i0Jzd8Gx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C294215AC;
 Fri, 25 Aug 2017 02:36:00 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=JOJnD+MM4G6EnCiY7Es5Ug+Aj6u1cX
 z4/s4svWWdWzs=; b=Z02VLjdVIdL1ReLUAL2DyiUKsQPpPhkSFBfR/aM92lW5D3
 G+keFm9VGJPCBXWsJNau+HmYcqEG9p2yyBYv4DTJwNw8Ts4byvNFDCPqW4HJP6lV
 6HGv8tHdIJBej8/4ke3n7Pfj+YBsbXLRfCIUrfJDJvNCZu1P739C9hwh19khK1l4
 6nlAN8OtzgZCOpHwOl5cptKsYN4Jefyc0yT4fPyRG3XWYm5GxCmN/9aftvGAOq2y
 ZLnymv/QDMjDsVqRWIt+K5g+rdOtVnwef201Qk0kvDVFyOX2vTMHDrXNsUHxfTSN
 B8CHUMwEZfrb+0IQcexgaTTg4Q50UBmjex/qxdBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JOJnD+
 MM4G6EnCiY7Es5Ug+Aj6u1cXz4/s4svWWdWzs=; b=i0Jzd8GxrJkSprNiMkggPl
 QJv6lJHRbCDfhwDVgtq0yPMFLkoh+MeEs7cnGPnyrxWX8cRri57AkZQiB8h3xPTt
 4BW+gI9gtjbbii+3rY4C1pNq8niXP+Up/H7LYN/snl0zDMu+qCpIaedxZsoZYVAU
 zAChNswxbU1Td3BstNKWYguNbC/ZEadxCEdgcFQVaJSlR27PxR1kGEyyOqCNDYxt
 uVStcLYWLvcvtwQ6P+UXEOGcoP1xMJTAY41iv9pHSOk0/F9hSIBXtWTATvBeMvLY
 KZ7thQ0BkoCeXCZ6BLPngxwZNMs28/NrSgcMnFQ2uqNcL6I8stNy4t4aOKrujCcw
 ==
X-ME-Sender: <xms:UMWfWQesIKVHaUamrPjtDzb2f5kMjSa0htx-y9eArKaapU2XE69hzQ>
X-Sasl-enc: byZjz0YmsI4Qp4kAPfkgMPohyUf7EYZxce3I/jjpLBTa 1503642959
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3CC287F9A8;
 Fri, 25 Aug 2017 02:35:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] leds: gpio: Allow retaining state on shutdown
Date: Fri, 25 Aug 2017 16:05:01 +0930
Message-Id: <20170825063503.31577-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:36:03 -0000

Hello,

LEDs controlled by BMCs are sometimes required to retain their state across BMC
resets. BMC resets may occur whilst the host is alive, thus the chassis and
host system remain powered up. In these two patches I define an new devicetree
property to describe the behaviour for GPIO LEDs and add support to the
leds-gpio driver.

Please review!

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: leds: gpio: Add optional retain-state-shutdown property
  leds: gpio: Allow LED to retain state at shutdown

 Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
 drivers/leds/leds-gpio.c                             | 7 ++++++-
 include/linux/leds.h                                 | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.11.0
