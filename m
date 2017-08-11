Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTFCQ35l1zDr4K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 16:17:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="wsYHLH+N"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SAvAGT39"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63BA656E2;
 Fri, 11 Aug 2017 02:17:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Fri, 11 Aug 2017 02:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=im2lS+
 DEenvWqZt/9L3tyHgNV61fzaiLzkjYYSqIa/w=; b=wsYHLH+N0OgPB1+G4hHBlN
 jAIlhbux989mT7jxH1EsM5rXOp5cmxMnGZwUwzs700WzoZXlNwlTtfJ0wbLdAurk
 9Jv4hXQjSU0ygev7LZyu5objs4+U7kjEA5geWkEbPDxRNq85SJcvxKh5k0+1DVEe
 UI+vqHk3mYo4gWDT4cE0EM6dlHP0tdJ+FQfdW6FJnGznIX3BGeKyFBAEhTfGp4ae
 XMt7jipdAEVFfxj5oaHS9sZsoKifLX72XWc/dyhSSEHWQQTMHBkEUuOUy0jxw1cL
 hGnUjrssH/ELWGPLfHP7AB7lfVsI/NwvKtRart+bLC58uZpPV2pB/Yxs3SdD1DZA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=im2lS+
 DEenvWqZt/9L3tyHgNV61fzaiLzkjYYSqIa/w=; b=SAvAGT39SXfhJIDWJM7Agl
 YJ7HguYz+xhgDwhoZa7eEdw0TjYywmoWOcY0djlqCQl5/xM0xmY/yNmQ+ksUyKYI
 84JaoPv/LIRt3UJUMhhoucEUttNnB+ym7G2NGS0BSqm6O4jWkydCXWx65OBn5MU1
 vAtciaF3VS0BiMpDT/GkVFnOOJV7D6Udc5nk2w2eYnH+YcjSZaoQqlP+TiRpKLbN
 dXvXTGFBK/vO424LS55buzwO4rvi+LWg7tGTyg7o54zDZehUuAN1r23zcWRHNJPY
 g0OyxERszHx8iuV1M3Z9Yk1HlPT4L0XFYdAML/PTJGw9PHZXMi+vQBqDmhA4Op3Q
 ==
X-ME-Sender: <xms:30uNWe4LUt2SpJitc64rfOKeiszCJ--BgjUI2QFlOconho30l2FD1A>
X-Sasl-enc: 8yf/7n9zHmct4g9aPYUP5W21Y+gy6e2xJh/OzDbLh59W 1502432222
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B4A52471A;
 Fri, 11 Aug 2017 02:17:00 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH 0/3] NCSI VLAN Filtering Support
Date: Fri, 11 Aug 2017 16:16:45 +1000
Message-Id: <20170811061648.19661-1-sam@mendozajonas.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 06:17:07 -0000

This series (mainly patch 3) adds VLAN filtering to the NCSI implementation.
A fair amount of code already exists in the NCSI stack for VLAN filtering but
none of it is actually hooked up. This goes the final mile and fixes a few
bugs in the existing code found along the way (patch 2).

Patch 1 adds the appropriate flag to the ftgmac100 driver to enable filtering
as it's a large consumer of NCSI (and what I've been testing on).

Samuel Mendoza-Jonas (3):
  ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in features
  net/ncsi: Fix several packet definitions
  net/ncsi: Configure VLAN tag filter

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
