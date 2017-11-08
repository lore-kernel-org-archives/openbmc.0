Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="JI/Ae8mm"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WStPsSVq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWnQX1lnmzDr5J
 for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2017 11:35:47 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0177520E75;
 Tue,  7 Nov 2017 19:35:44 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Tue, 07 Nov 2017 19:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XCWX/2v7L22oLJCPE
 U9yLpefLFWKLXjgRgfByJeVVFM=; b=JI/Ae8mmSxiDdxMctUsYeJj+nYHs/V2GC
 fGUuXYvDdMebd0Qb426RPOX/psYz4PCnoY3AStyyqBinniNKM1Ite1PyFMbSBGE0
 TxOkVkPs9GNUCUruiCnHDtfqsMMnSbutnwNB7CiHONKuAx2kNNakTA21bBF3ozER
 Ws88DhhsjVpRhSWEkJxNtX4bi/ngPwF9B0L2RLJJ3haJIQDRG9zkOmiwBUY+pOQI
 dgwo3R8c1B015ugCPSf2SIS8dH3EYPGJKZdt/rQBN1JGu3Mo6TWxXc1lhaaQKtSw
 5yqjtIB3z3JWzQRnqB35Du6FrTcxs8XfVObEbb5QOqfNV31oJ+t0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XCWX/2v7L22oLJCPE
 U9yLpefLFWKLXjgRgfByJeVVFM=; b=WStPsSVqAamJsEpMuFhGsNcKdlH0oJAEj
 QlHC7UZFQ78QI9wdOuIWz5ZicSrIYDziwC/1OoORDqy+DcKPTpZj+LowVAEJKth0
 xBYqBWwhU+XtWs7CKn5qWObYtdF8TiNwPmId2iRDZ1XcWkiSKhjz8BWX+tEcYZpU
 j40aXz/dsEUFK0y2jkulUVNS+esCyQKiO7BOJxou0d99hVzauy/V6RQq3D9nYmai
 aU0hmcny0Flk+f66srH5Hpx9rflS2bnuj5kQA8VXQE4hRhp+LQzaFIqbaeBydEhK
 +eXIMJ2jgZhPrEKMHTVFkDok2t2EEGl4awT6vnIgMkjzna610rl0w==
X-ME-Sender: <xms:X1ECWi3IKVJAr26oqnXBDbRo33HASPz4MJyO8giuK-QajMhUasmgBQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8F2724A8B;
 Tue,  7 Nov 2017 19:35:42 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 0/2] Improve NCSI driver logging
Date: Wed,  8 Nov 2017 11:35:31 +1100
Message-Id: <20171108003533.13248-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.3
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 00:35:49 -0000

The NCSI driver has next to no logging at all, with some of the only useful
logs actually coming from the ftgmac100 driver as link up/down messages.

Add a great deal more logging to the NCSI driver, tracking channel state and
selection, link events, and so on. Patch 1 has no functional changes, and
Patch 2 sends a Get-Parameters command during configuration to sanity check the
current channel.

A form of this will go upstream (the log levels probably need some tweaking),
but this iteration is being sent to OpenBMC to assist people currently
debugging a few network issues in the ftgmac100/NCSI/Broadcom area.

v2:
Adjusted log levels (many down to KERN_DEBUG). Patch 2 is the source of most
of the noise, and can probably be skipped - for upstream I'd intend to include
it with a way to manually request that information rather than retrieve it on
every configuration.

Samuel Mendoza-Jonas (2):
  net/ncsi: General state debugging
  net/ncsi: Query channel parameters during configuration

 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-aen.c    | 15 +++++++++++++-
 net/ncsi/ncsi-manage.c | 56 +++++++++++++++++++++++++++++++++++++++++++-------
 net/ncsi/ncsi-rsp.c    | 33 ++++++++++++++++++++++++++++-
 4 files changed, 96 insertions(+), 9 deletions(-)

-- 
2.14.3
