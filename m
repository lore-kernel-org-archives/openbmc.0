Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMgcb71dJzDrH7;
 Wed,  2 Aug 2017 14:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aphetV5Q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kSyViqeP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95B092085C;
 Wed,  2 Aug 2017 00:46:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 02 Aug 2017 00:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=zs1E2OxGbZ9lW/+xqN5DRhdZM+7yKb
 JHxvhKHI4HaSI=; b=aphetV5QGDnWqp2rOyWMLBBIRnj5WDPPqpLG4hzG+v+5VF
 qHB/WVBzCFAHEr8tSuc68reh+14Q0GNGdN/daDK8+T8q9HdhnIxXQ1dlf/bO0mwF
 OtLSMIa/RhK2KaCBCUJup9hO8nhWp0B0CrY5bf5avv94buS2pq/FysWzuIQu/ly/
 9QaPo9XDzyNCGcwtc/WRjQ04VHv4Fj+MEGkDKrf+kF1BKB/q4Vuj49kPvdPqHqpM
 NG8UHQ4/oVunanp2z5oL1IKTHaK7RGcIbxaVy9Jpagazv01XNLP++EUaYoh2Url1
 D/pfSAZNifGtJ+FpmJ4d50BwTG+iAk7FD0IBg44w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zs1E2O
 xGbZ9lW/+xqN5DRhdZM+7yKbJHxvhKHI4HaSI=; b=kSyViqePYndM4sryj1+5nu
 NymEuykVYA64njDFiiH6KEaHdSBtbggsUooZrlCvwspaoOp7pFAXKTE0NF5z7AfC
 YWfYdYwlO2Ypfknsp/xUVmVY3/iRIsdDuon/aIMPuxB+Wny1yT36fMf7qEAZELbA
 hdgEmRf22UL/CPr6JxHimV9Q49/Sz5Nky4XdhQ0fZLk7vmjB9FWEU88YZ19dgcJS
 cvE+ZdkhH83yrszV8qBmENCwlJTU6ZCVPlN2/wjdQCc3XJG6plJ5e+mu7WEesj7J
 o+OzniaxB7Tkpkvnp0GG06Tq7l9BcV4TrwD6N4oLWjajwyahwqvrdoFqdIcd79QA
 ==
X-ME-Sender: <xms:DVmBWWZmTk7Ne98LtEG3hgKv4xBHUiP-mjaCoEIfJ2_TGp1TY6WF4Q>
X-Sasl-enc: phcWRiWi1QjWRffFSbW+bnoRqE7nU6m4YiC4+p0UiRAI 1501649164
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF997241D9;
 Wed,  2 Aug 2017 00:46:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] watchdog: aspeed: External reset signal properties
Date: Wed,  2 Aug 2017 14:15:27 +0930
Message-Id: <20170802044529.30032-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 02 Aug 2017 04:46:08 -0000

Hello,

This two-patch series builds on top of Chris Bostic's changes introducing the
aspeed,external-signal devicetree property (currently v5):

    https://lkml.org/lkml/2017/7/17/777

Additional characteristics such as pulse width, push-pull vs open-drain driving
and active high or low polarity can be configured. This short series defines
optional properties to do so, and adds support to the driver.

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: watchdog: aspeed: External reset signal properties
  watchdog: aspeed: Support configuration of external signal properties

 .../devicetree/bindings/watchdog/aspeed-wdt.txt    |  10 +-
 drivers/watchdog/aspeed_wdt.c                      | 105 ++++++++++++++++++++-
 2 files changed, 111 insertions(+), 4 deletions(-)

-- 
2.11.0
