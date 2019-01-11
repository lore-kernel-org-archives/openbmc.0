Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ujqkcdFW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZVb9Qfn1"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bTb52jSMzDqws
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:57:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 980161630;
 Thu, 10 Jan 2019 22:57:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=0Ajo5q5MowbbriqcYt2AdMNDnh
 FPIGMppogmo5fYLO4=; b=ujqkcdFWvnDSZY7ckFBN4+bL/BgCtxZR24bk6Dq+wt
 d3DqSRe677vJqC8AF5w5Q0uUQgCmJmj4RzNdycAK9hQu2h64oPLEwY0njdRxq9kp
 W9/pLXVJLQCxgnCZfZ9CH0B//jL9htRdHV5g74z6xKvK57xceqVJcSvSzMekR71G
 HxY4cqUmJRPrbMndbkjNYFZSS/d746QvJUdzsG49IKt13VYyvv6LANkQyWh48dtn
 DJS212P5yDN/mFL09V0n9dmZwgecuW6wCKnKlNqrCDEU7yZ3cFs/lZQoFEWxyhcc
 QTEQHzGxmzd1tzMyvL/I91r0VzjRyemrq9z3Efog7hVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0Ajo5q5MowbbriqcY
 t2AdMNDnhFPIGMppogmo5fYLO4=; b=ZVb9Qfn1OgcXdd1gzZPgK6OEGFdjt72fy
 aq5Keqp/p3wL/S4beBDqU9vo2+kkQP1/gEdNBHeQgPoJq8mLq2pd0o0XEwV0JR43
 LlkpImGYbonHniLcU/up65iWBE6PTh+nZQS6jumtJ52dz7XyM2zBQ7JwVhdO9Pco
 3Kp4/eJ3EydNNdxtVEK2LJcgNcF3FfCiRFpPwJG4Ttu+Ia5rdTnbERNorM4FounI
 7uDrH+eXNDMQBt1fQS9+NWt3KwRTiXeYHeVvEfYcfrGCMJasJ2ZN+tNyHs9Z76k3
 qxBXDGQsRst0c/BPwQHYxZ7WOF8R3T1KpKp9rb0iM34EpZMDEc+AA==
X-ME-Sender: <xms:HBQ4XL5YTpv6nN73JXd2JxBCoRWxS0d-YnaFzKE1rH65-j9GHEmeow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnug
 hrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgr
 ihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrkedurddukedrvdeknecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:HBQ4XBFzh0t-t3Z9H3JNbrCqUwCzI84CnOKT6bYRK9AAojRi9EvTfA>
 <xmx:HBQ4XESNk9M0COepdtQqqktXqFvN9nY9PokziijWH97v4W3ESEAzng>
 <xmx:HBQ4XKu7NMNMt1_t3l_zr6M2aaidNBdXzhf-2zPkOxfspWlRKHji0g>
 <xmx:HhQ4XA9y8EYZHaLRUywjCYF4PEtvMghLD87Tle9zj0GicEcFvmg2Tg>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DA6410106;
 Thu, 10 Jan 2019 22:57:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC qemu legoater/aspeed-3.1 0/4] Handle short timer periods
Date: Fri, 11 Jan 2019 14:26:34 +1030
Message-Id: <20190111035638.19725-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2019 03:57:22 -0000

Hello,

We've had an issue for a while, since the introduction of 4451d3f59f2a
("clocksource/drivers/fttmr010: Fix set_next_event handler") in Linux, where
our qemu instances have a "sticky" behaviour. The VM becomes unresponsive at
unexpected times for unpredicable but often long periods of time.

This series, along with the associated patch to Linux's fttmr010 driver[0],
aims to resolve it.

[0] http://patchwork.ozlabs.org/patch/1023363/

The series an RFC series because it doesn't fix all the cases, just
demonstrates a potential way forward. The approach is to provide back-pressure
- to test if the reload value is set to a value that's smaller than some
experimentally determined value (in this case, 20us), and if so, configure a
period of at least 20us. The MAX() of the requested and minimum values is then
set in the reload register rather than the requested value, which can then be
read back by Linux. The fttmr010 driver, upon observing the greater value,
starts pushing back on the clock event subsystem, which then iteratively
determines a minimum acceptible event period before proceeding with the boot
process.

The implementation does not take care of the match register cases, but at the
moment they are unused by Linux on Aspeed SoCs. The match register case is not
taken care of because I'm not sure if this implementation is what we want to
use going forward, or whether we want to do something that's completely hidden
in the qemu model. However taking advantage of Linux's existing support for
determining minimum timer periods seemed like easy solution.

The stickiness turns out to be a consequence of Linux configuring a very short
timer period (1us, mostly due to the timerio_rng driver), which causes qemu to
spend a large chunk of its timeslice handling the host timer interrupt rather
than executing guest code.

Please critique!

Andrew

Andrew Jeffery (4):
  timer: aspeed: Fire interrupt on failure to meet deadline
  timer: aspeed: Status register contains reload for stopped timer
  timer: aspeed: Fix match calculations
  timer: aspeed: Provide back-pressure information for short periods

 hw/misc/aspeed_scu.c            |  6 ++++++
 hw/timer/aspeed_timer.c         | 37 ++++++++++++++++++++++++++-------
 include/hw/timer/aspeed_timer.h |  1 +
 3 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.19.1
