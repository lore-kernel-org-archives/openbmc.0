Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsM024jqzDrK0
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r30fSxBP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b+JqXtXv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C5F820F24;
 Fri, 25 Aug 2017 02:53:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=EX26AcMe+H9ieqwpf4t/yqcSXqHB8MR/h+7XkHbVE
 Gw=; b=r30fSxBPKRgK89xxKBtd1df1xH6DmCQ8E7QC8F1wrgfsW4MjJc9Xz1aoo
 m9AExkkZfirI0S61sSZZM65+oJTbs2ft6rt4yugeyq/eV9B+WD1ACUSu5EdvTktT
 W2Yp6OUfkLVdtgY/aIuipwsNYRVNeoJhxIEN2x3NNf64feDqzwhawZdhyaCPuO46
 t+/ePvZOi/oW3Kz3DsyoMeZgtK98pMQH8xCae4Xobzp9r1lZjT03saaVf3pn/BPy
 GBbI43zHimnS/BZd053lJ2wj3YEl6PCoka5Db4RqyUiKoAxW/Bixi0FJ0bBW2ZKO
 ugDGV0SK4X1h3o0Ki0Q29Vg4oZc2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=EX26AcMe+H9ieqwpf4
 t/yqcSXqHB8MR/h+7XkHbVEGw=; b=b+JqXtXvXCJu4dl5FQibxoEPZ38zMYZj4w
 i/fE+dhz4RIgq21LDX5OGOo2HpQxHAjVVsIrlrB4kiFLjBWqyF/2ieZGWgaPpiY6
 xfRa/ZYjkOGK8yj3Ca8ybTPVlxWo+uztn0nh2M6pfpGLxjYcwaWF17t8qlU3/wWU
 BXKpd6D3rmruJj7VMuY7guBO5f2diaYn6pVlvTbgRxw39kf9fVZGo19eIIIc8tBs
 3YEIpfCRLeYvcjQvAbxWZZuaA4zYBAyeCB79/0KU1Uu2mYE5jWN2ZK3iVCRL6xWm
 uZ3sJ4OYuIOeBzsmVSURIrTST9HcdtMk28GCHBoCSPtyU/PX75zg==
X-ME-Sender: <xms:acmfWeiLbg68L2R0pVL4BJtAU92jYhtOu8MIWjihWRM1uFRDPSTYRA>
X-Sasl-enc: 1zNzxNC27vptd5Qizj3kHT7NdbGucj5RLCUeAw7zXdif 1503644008
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 43344240B1;
 Fri, 25 Aug 2017 02:53:25 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/5] Retain front LED state on Witherspoon
Date: Fri, 25 Aug 2017 16:22:39 +0930
Message-Id: <20170825065244.488-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:32 -0000

Hello,

This series fixes witherspoon to retain its front LED state across BMC resets.
It was noted in issue 2156[1] that the front LEDs came on solid during a BMC
boot. This appears to be the result of several bugs which are addressed in the
following patches.

The changes to leds-gpio have been sent upstream:

  https://lkml.org/lkml/2017/8/25/44

The pca955x patch depends on changes we appear to only have in the dev-4.10
tree (i.e. they haven't been applied upstream). There's some discussion at [2]
but I'm not aware of a follow-up patch from Cédric. Certainly applying my patch
to upstream lead to signifiant conflicts, so I haven't yet tried to send it on
its way.

Cédric: I know you're undecided on how I've approached the pca955x patch - I
figured we could argue about it on the list in case anyone else had helpful
insights to settle the dispute :)

The final two patches clean up the leds nodes in the Witherspoon devicetree and
add the new retain-state-shutdown property to the necessary LEDs. I do wonder
if we want to retain the state on the rear LEDs as well, but that requires more
features to be added to the Aspeed GPIO controller.

The patches have been tested on a Witherspoon system, albeit remotely. I can't
put eyes on the LEDs in question so it would be good for someone who has the
ability to do so. I used the test outlined by Vishwa at [3].

Please review!

Andrew

[1] https://github.com/openbmc/openbmc/issues/2156
[2] http://patchwork.ozlabs.org/patch/760006/
[3] https://github.com/openbmc/openbmc/issues/2156#issuecomment-324101828

Andrew Jeffery (5):
  dt-bindings: leds: gpio: Add optional retain-state-shutdown property
  leds: gpio: Allow LED to retain state at shutdown
  leds: pca955x: Don't invert requested value in
    pca955x_gpio_set_value()
  aspeed: witherspoon: Tidy and unify LED nodes
  aspeed: witherspoon: leds: Retain state across BMC resets

 .../devicetree/bindings/leds/leds-gpio.txt         |  3 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   | 32 ++++++++++++----------
 drivers/leds/leds-gpio.c                           |  7 ++++-
 drivers/leds/leds-pca955x.c                        |  7 +++--
 include/linux/leds.h                               |  3 ++
 5 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.11.0
