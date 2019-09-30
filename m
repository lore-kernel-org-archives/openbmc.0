Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.51.53; helo=5.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 5.mo178.mail-out.ovh.net (5.mo178.mail-out.ovh.net
 [46.105.51.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hdMr11zNzDqLs
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 20:06:12 +1000 (AEST)
Received: from player779.ha.ovh.net (unknown [10.108.54.36])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 4746C768FF
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 12:06:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id A300DA45D6BD;
 Mon, 30 Sep 2019 10:06:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] mtd: spi-nor: aspeed: fix support for multiple CS on the
 ast2600
Date: Mon, 30 Sep 2019 12:05:53 +0200
Message-Id: <20190930100556.26489-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15244403266667186946
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 30 Sep 2019 10:06:17 -0000

Hello,

The ast2600 driver does not set correctly the segment register values
when multiple CS are available. This blocks accesses to the CS0 and
Linux fails to boot. The series fixes this issue.

Tested on the IBM Tacoma board.

Thanks,

C.

Cédric Le Goater (3):
  mtd: spi-nor: aspeed: fix training of multiple CS on the AST2600
  mtd: spi-nor: aspeed: Disable zero size segments on the AST2600
  ARM: dts: aspeed: tacoma: Re-enable CS1

 drivers/mtd/spi-nor/aspeed-smc.c            | 17 +++++++++++------
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.21.0
