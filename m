Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="CUjdMzaP"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="heNJMLMT"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVd1b014mzDrJl
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 14:13:37 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A3A9F20B68;
 Sun,  5 Nov 2017 22:13:34 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 05 Nov 2017 22:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GIkM68uPJmvQb+Llu
 wrH16iSIgX9WgS/2+EGchOQpoo=; b=CUjdMzaPc2OBScEobIbV86Qpwd22nNh6G
 ilHYIS87237xqXNnTfXNaLOFA7vBUEo9p4AxdgergzmELr/5vaKCljbeb66pQ7rI
 BvIGNi36SGEtGoCF02ELVw1j7aG2h6zavVpxDW9OD/Cl+i1wwV7s+50PKOOIJxJM
 Akn3kxgh9HesdtCnDDoMk0DSt9LrD5Kr9F2MPgdwhhyAil+eT8dGdoBcHZ8x7qW4
 T9Lrqd2tV46iNZJZPKi6H9tuwC8PMj5Np8B/0au90gZk+rpmiQe91S0qEbVH1+fQ
 eu4XE3qXyV6v0ocm+Z8ZNrMDJ/2WC7kNFdJ9lCxzf956TPx6fpsEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GIkM68uPJmvQb+Llu
 wrH16iSIgX9WgS/2+EGchOQpoo=; b=heNJMLMTE/Gwf3DZWKnJrzibFQ8j9NDe1
 Pxv/wmrPdYD/KOCgRQL7ZYLYEAGw1kaWuqDvnT6pirfCQMzoPJF/owU34V8w+qq4
 7/4EfUbcha4JrL/cXQ0kRYEntwB+hALiEbjLv3sGNjFTvTiJyLt5H9feJ0QwXRAO
 oWqEEHCchPkqWWsCwYOAJ12TiLX2bUCEI9hyIh0QM4lo8NUMlvEFiswJ6nwItbIM
 qXOafeNfrTOa2M0NcyjRZ+Vq+15kDpwq5/f1FjEY2qN0c6mVJMCLyOHCq9UswDX1
 VUdkKR5/THA9ipaz0J9tq9UXqH+RdjJ5NR+dP66a2ICKnXB2gdm7Q==
X-ME-Sender: <xms:XtP_WTMpVjTmcZX7KRQZW71r3XssdMNiljzFLsTKDILFkG3eJ09dFg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 940FD7F8DD;
 Sun,  5 Nov 2017 22:13:33 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH 0/2] Improve NCSI driver logging
Date: Mon,  6 Nov 2017 14:13:21 +1100
Message-Id: <20171106031323.21519-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 03:13:41 -0000

The NCSI driver has next to no logging at all, with some of the only useful
logs actually coming from the ftgmac100 driver as link up/down messages.

Add a great deal more logging to the NCSI driver, tracking channel state and
selection, link events, and so on. Patch 1 has no functional changes, and
Patch 2 sends a Get-Parameters command during configuration to sanity check the
current channel.

A form of this will go upstream (the log levels probably need some tweaking),
but this iteration is being sent to OpenBMC to assist people currently
debugging a few network issues in the ftgmac100/NCSI/Broadcom area.

Samuel Mendoza-Jonas (2):
  net/ncsi: General state debugging
  net/ncsi: Query channel parameters during configuration

 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-aen.c    | 34 ++++++++++++++++++---
 net/ncsi/ncsi-manage.c | 83 +++++++++++++++++++++++++++++++++++++++++++-------
 net/ncsi/ncsi-rsp.c    | 31 ++++++++++++++++++-
 4 files changed, 133 insertions(+), 16 deletions(-)

-- 
2.14.3
