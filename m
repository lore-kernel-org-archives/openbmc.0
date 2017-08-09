Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS4xb5knszDqyp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="CiPcwO5M"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lmw25T0L"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id A387F9A8;
 Wed,  9 Aug 2017 04:55:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 09 Aug 2017 04:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Umr5cz
 YELzs17qq0I0juPwyYqjeMo0PANVIJs0oJdIU=; b=CiPcwO5Mg5kdQ9BN7+SjEM
 xh7pJ2pxUr6h0zO+xgEeXrH0py+dvW43K4yJlQmnaWCOAbTGJJpzTrpJIExBrc2R
 ju+ZsMAf0oiS2hSZ4Ny3KCyFnJTbASBaEA5Mz3HvYYt4ghjmOYJAYSZrM2/440F/
 q41YWUKOJiZTVcAVFqzafkRCAnSrGUoFEm8XDpt+g84nAG8YafE3SFfY72lpdBdC
 RCQXOnOaO+fe/R111/zljxc0l8EghnQVD0b1pv703e/rguRG+kTDcAWr5pKlUa1T
 g62nm84UIzH0WHrM93iI2vNM9JEWSUf76kGZdu1f9ud/055l3MJMgGJvTYPEue+w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Umr5cz
 YELzs17qq0I0juPwyYqjeMo0PANVIJs0oJdIU=; b=lmw25T0LGUgOzwy3hICpJi
 ik5o5wiYM+xkBt9+dtrwashbSvbETjYy51bM4b72KhUMz40zRJLjeRnC7Lx3G9nh
 LA4K8Tfb5oxOrjFYxWvN0kcDCmsShK7IMOHEU1QdCIznK8X6wqCXmtWHK+eozXbl
 QloO19xGDp17XwzhZ/infQ1wkjhg/jrL6Xb0PEAIh2r/VKRkEcC1uZ/pKotZw06u
 /gGG0DqokEAasuHLkJLYmZuXzPnPBRR1D+6ne1vogWBZSD6/u9ORJ2VpmvQmW86C
 9EXNruiWVWyUsNtleuqSYHVCYXJX1VoOuq7891gP5XZD8pX4223pOxzXJixsZaSQ
 ==
X-ME-Sender: <xms:882KWXDzWwMRlptDgS-2sjRrTKixJf_4f5ECpBrjYMQqfiTkjHx5ww>
X-Sasl-enc: catCJ7Ozbm4regRWGE4tgnRFZvpa/hypNMWve8HWTZM3 1502268914
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B8E82459C;
 Wed,  9 Aug 2017 04:55:13 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, Leonard Low <leolow@au1.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Subject: [RFC PATCH 0/3] NCSI VLAN Filtering Support
Date: Wed,  9 Aug 2017 18:54:40 +1000
Message-Id: <20170809085443.13148-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.13.3
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
X-List-Received-Date: Wed, 09 Aug 2017 09:01:09 -0000

This RFC series adds VLAN filtering support for NCSI-capable network devices.
This supports adding and removing VLAN tags up to the limit of the actual
NCSI channel. In it's present form the NCSI driver will default to the
"Accept specific VLAN-tagged traffic as well as non-tagged traffic" mode.

This is still a bit rough, but sending out to the OpenBMC list for some
eyeballing.

Samuel Mendoza-Jonas (3):
  ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in features
  net/ncsi: Fix several packet definitions
  net/ncsi: Configure VLAN tag filter

 drivers/net/ethernet/faraday/ftgmac100.c |   5 +
 include/net/ncsi.h                       |   2 +
 net/ncsi/internal.h                      |  11 ++
 net/ncsi/ncsi-cmd.c                      |  10 +-
 net/ncsi/ncsi-manage.c                   | 257 ++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-pkt.h                      |   2 +-
 net/ncsi/ncsi-rsp.c                      |  13 +-
 7 files changed, 290 insertions(+), 10 deletions(-)

-- 
2.13.3
