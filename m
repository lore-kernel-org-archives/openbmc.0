Return-Path: <sam@mendozajonas.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xghRl0CR2zDq5m
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 16:18:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="W45dxc0I"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MZsm48RL"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id BEA3D20B5A;
 Mon, 28 Aug 2017 02:18:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 28 Aug 2017 02:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hAT0bY
 7mFLEJWjKXtP3plk4ej4Ox5uCNAjP7614Sa7o=; b=W45dxc0I+eLjd0ncyLofNn
 2cCFJ75gkQGyzDGWoWr0HTdSciFX6tHUrp+KetJbwyAwkASiwRomlUJUxajYccUF
 4CdtAzGX/4IIenNewAtIlzetS+YlgO4stMxnW+/58oRI5Wa3gbt/ZkW+P1nK92zi
 Jtxn0xMUY3sIi+yaveh+Ps1NAUyec6DbVK+8iFuLgfxM0VPnqCjaQnwXQRJ+rV/3
 gGGv3sYgmjCnPpEphAgsIK44D29owfaX8xLdJHSbn54hlOCOoR87AUQaj3q15kb7
 8ZwcE8Cq7/rWA3ZbbLnpR1VvkBqbxmY/PXhzfgAIF05Y0qUyhTiw0ujVieK/zghw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hAT0bY
 7mFLEJWjKXtP3plk4ej4Ox5uCNAjP7614Sa7o=; b=MZsm48RL4vSL2h9c/p2f+G
 MVrk0r0zKuGKXHV1LI/RAJBm8rVqW1p6bTnrY34MNNzL6aGiDbFQUGYJCt3CQTyS
 hr9B4XgRywi6tECqAA7r2gW6UdZvL/fXu9+TI+mcYErtqf2sS1PWoPaRWfRMjP0r
 IrZhSmeXqeMnigFdaQpBeeQFPMSCqL/A7Hd2BR89aimCnqxpw0Nebkg9O9np0+17
 aKwkSlReqL2qb/xpErq0PI+dyYNqh7Jiu7vui4ln+o404u1SCKeohA4kRhfiHh/+
 kwvBL1+ikR6scnj9PZ9mgW0iclsb+nvAHGLSmwAPr84Rw+armvOkbyumEfAGUs+A
 ==
X-ME-Sender: <xms:0LWjWTHup6RE3j1GypjWokGklqHuQ3m4Yzkqo12gW7_wbG8Zw-tm6w>
X-Sasl-enc: k4JlxF7xstoHKKAG4qfvl90DoqUxBBrUsjqKR/xHafIV 1503901136
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFDA97E271;
 Mon, 28 Aug 2017 02:18:53 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v3 0/3] NCSI VLAN Filtering Support
Date: Mon, 28 Aug 2017 16:18:40 +1000
Message-Id: <20170828061843.24349-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 28 Aug 2017 06:19:00 -0000
X-List-Received-Date: Mon, 28 Aug 2017 06:19:00 -0000

This series (mainly patch 2) adds VLAN filtering to the NCSI implementation.
A fair amount of code already exists in the NCSI stack for VLAN filtering but
none of it is actually hooked up. This goes the final mile and fixes a few
bugs in the existing code found along the way (patch 1).

Patch 3 adds the appropriate flag and callbacks to the ftgmac100 driver to
enable filtering as it's a large consumer of NCSI (and what I've been
testing on).

v3:	- Add comment describing change to ncsi_find_filter()
	- Catch NULL in clear_one_vid() from ncsi_get_filter()
	- Simplify state changes when kicking updated channel

Samuel Mendoza-Jonas (3):
  net/ncsi: Fix several packet definitions
  net/ncsi: Configure VLAN tag filter
  ftgmac100: Support NCSI VLAN filtering when available

 drivers/net/ethernet/faraday/ftgmac100.c |   5 +
 include/net/ncsi.h                       |   2 +
 net/ncsi/internal.h                      |  11 ++
 net/ncsi/ncsi-cmd.c                      |  10 +-
 net/ncsi/ncsi-manage.c                   | 308 ++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-pkt.h                      |   2 +-
 net/ncsi/ncsi-rsp.c                      |  12 +-
 7 files changed, 339 insertions(+), 11 deletions(-)

-- 
2.14.0
