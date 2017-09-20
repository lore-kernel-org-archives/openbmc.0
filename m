Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hZK6A83K"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ATJvvlm0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxpHk03hXzDqBd;
 Wed, 20 Sep 2017 15:30:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 43DB820DB8;
 Wed, 20 Sep 2017 01:30:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 20 Sep 2017 01:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=O/Vjju7FoI24aI2UOIf46HRtrWBow7
 mzS9yhP61+WNM=; b=hZK6A83KmxM7YfGrA1D5QdPyh7hT9Bpim44sIBqs+PRpJt
 ycRPQBEsbJHfj6nJkWmYHN7UnJqJjfcpqwR8e4AUBgK2dJacD3TOcKbjR9ZD6k2z
 zgjvhDjzIukxdx3Dw0M9KfgnvCMe8UZu0wd21h9Zjv0sp8UcJgTJiqEjgbEFLL5u
 5K9yhAFJuXFge5oEU4eRfdUJsZ1UOoJJoIWYzRCZW+07wUgWmb8ZHj5LyLj0zu70
 SeuPs39u+yoShaEho8YM/PeGhL3rvlEp/Y3ltmHyZdR6b2O7by+ijAEJDqCZZs+5
 n73PFdsBXepEuGUag3M3rXMjpKi9DRYIwfKd7jzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=O/Vjju
 7FoI24aI2UOIf46HRtrWBow7mzS9yhP61+WNM=; b=ATJvvlm0WrLdzOYbUKfc1b
 9NyGYY8jcfIHfoSDicOvBEsD8kBptqcAIRa4YsEwKDU2UTjWkxFY8yR0VD8/E+b5
 x/ZMgNCbQ4U9gYvlfK7PGUOSkf2qT54RJrMgtlWEEATkoJussbv2SE0xXqT3Jj6d
 PKnlbLneq4HC9LP+CkWn4dDF41rTjb07iTLfzlstACLAkRKBw1AOAB+aoOMnoPrz
 QfThll4pZE1PLyYzjwUhg2roRjqMSI4wyTcqK1PEJc1EizHta2SZT8d1YNX2Ckhd
 otq7kWEXT96T6ohcLJ6P7VhUmM4HXNaFbQEl/uMMyyt+cyciTi+zDShBSlc647bw
 ==
X-ME-Sender: <xms:Dv3BWcRrDw9_5wkXEPZuwTRuc8PLUpnOuiFbtJtV8D7D8Dzlh0-2Vg>
X-Sasl-enc: XtZ7W1DNaE/SG/SvaR95KzRo8J+vY1aVQcZEQy7aagWG 1505885453
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 783B47F9C1;
 Wed, 20 Sep 2017 01:30:50 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH v2 0/4] watchdog: aspeed: Retain enabled state and move to
 arch_initcall
Date: Wed, 20 Sep 2017 15:00:16 +0930
Message-Id: <20170920053020.6860-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Wed, 20 Sep 2017 05:30:59 -0000

Hello,

This series fixes some issues with the Aspeed watchdog, as outlined in the
v1[1] cover letter.

I've added a bit of an explanation as to why we call aspeed_wdt_start() in
probe() if the watchdog is already enabled, but the essence of it is to ensure
the watchdog is configured to the expectations of the kernel driver (rather
than however the bootloader configured it).

Please review!

Andrew

Since v1:

* Rework patch 1/4 to simply remove the writel() call to restore the original
  behaviour.
* Rework patch 4/4 to remove the Kconfig changes to retain the ability to build
  the watchdog as a module, and add the exit handler.

[1] https://lkml.org/lkml/2017/9/18/14

Andrew Jeffery (4):
  watchdog: aspeed: Retain watchdog enabled state
  watchdog: aspeed: Fix 'Apseed' typo in Kconfig
  watchdog: aspeed: Remove specific reference to AST2400 in Kconfig
  watchdog: aspeed: Move init to arch_initcall

 drivers/watchdog/Kconfig      |  4 ++--
 drivers/watchdog/aspeed_wdt.c | 21 ++++++++++++++++++---
 2 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.11.0
