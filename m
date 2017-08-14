Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVyjF5MbdzDqb3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:30:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="HU2j7fyt"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mRvvB/8i"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53A5D2E29;
 Sun, 13 Aug 2017 21:30:23 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 13 Aug 2017 21:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=q5DOwU
 +FrGSOZ8Ip0GZdVe6WsYHXAyqPxZ7XkykM7VU=; b=HU2j7fytk9sLWcg6mI03N5
 LH602WScY8XH8kNv2ZzszlrsN/lfUGqqZvBTimILrvuJNLhiOGictjL7mYM5MWnB
 AS5nqamT0GFJpEaBXfMmLCORypOJUkaRKa6vzsVtNqx0IaaCBCxs9Dj+12HD69nH
 H685bR7wZJBSo8JbJ7/4c3WGnA9oly2sHxm0zh98iaQoXQKeHTN0PsavZ1Y6ZM6w
 J/0zEE/MQoBUtIIrRX202uMs7+2wzf3nh8IXWhbmmHkZ2OSSiMjS9ycvLKp+DKQe
 tT8kZotcU/KqfN8h7FT9gzzwRsh0TU6L5GsjX6vXrCWA5Op6TB2uz1h0ziflYqrw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=q5DOwU
 +FrGSOZ8Ip0GZdVe6WsYHXAyqPxZ7XkykM7VU=; b=mRvvB/8ixn3ze/tQZ2oA54
 W4Hgom/8CTzNVsmagLoZ0InFUXVd2dOeU4rBnj4wbNe6IT3Se5oFD6FLRBuScGiE
 p9u8+x2JY3frvBA74ukkRtpi+/3J/4CtdeLsP63CqSFWMp2fRdVOke78YdyZG2FK
 fZI+hheuAkMyKzspKfypENZWqvpBf60A1ZUW9fdYGn/d5Trs+IuzNk6j6VazijFB
 +TjDjcyHPCw6Y0z0gz7sErb1RdZtneOt/i1arnt6Lp8itlX18+wRR9mg666gGN44
 c9x9m5YxK2qCq6O0FYmarKy2mwsCUpLsoehxTsOkQqZXz7ZTvFLOirVG/iZJTpjQ
 ==
X-ME-Sender: <xms:L_2QWShdRh8HIYmALx2JU8sPt2gth1ulZ5bs8-smJvi6Qcg_W4BcjA>
X-Sasl-enc: yOfvnmHD3I5vzhEdM7Mig9W2DJlTt56/gGeObbrjbI0t 1502674222
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DE367E317;
 Sun, 13 Aug 2017 21:30:20 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v2 0/3] NCSI VLAN Filtering Support
Date: Mon, 14 Aug 2017 11:29:49 +1000
Message-Id: <20170814012952.13740-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
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
X-List-Received-Date: Mon, 14 Aug 2017 01:30:26 -0000
X-List-Received-Date: Mon, 14 Aug 2017 01:30:26 -0000

This series (mainly patch 2) adds VLAN filtering to the NCSI implementation.
A fair amount of code already exists in the NCSI stack for VLAN filtering but
none of it is actually hooked up. This goes the final mile and fixes a few
bugs in the existing code found along the way (patch 1).

Patch 3 adds the appropriate flag and callbacks to the ftgmac100 driver to
enable filtering as it's a large consumer of NCSI (and what I've been
testing on).

Samuel Mendoza-Jonas (3):
  net/ncsi: Fix several packet definitions
  net/ncsi: Configure VLAN tag filter
  ftgmac100: Support NCSI VLAN filtering when available

 drivers/net/ethernet/faraday/ftgmac100.c |   5 +
 include/net/ncsi.h                       |   2 +
 net/ncsi/internal.h                      |  11 ++
 net/ncsi/ncsi-cmd.c                      |  10 +-
 net/ncsi/ncsi-manage.c                   | 295 ++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-pkt.h                      |   2 +-
 net/ncsi/ncsi-rsp.c                      |  12 +-
 7 files changed, 326 insertions(+), 11 deletions(-)

-- 
2.14.0
