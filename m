Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM1lz2gKCzDsPN
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 13:20:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="efET53Ri"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b+a4FG9K"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 388F720775;
 Mon, 31 Jul 2017 23:20:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 31 Jul 2017 23:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=BLUlDsJDLLz23TxdFaD9S9KrZM4aAY
 N6Av6uVb65r5k=; b=efET53RiOg2RxsuuMflN4OlqvIDm8vfI+mW1IN+sRUB7Kj
 N0uwHjV2Svbnb7mfNmlILC5ZXhNa+b9eBsJUZqPeGwpETrSuSQJ06xh5o8zXk1T1
 qVAL0jbv9kKOYfquxIR1/R0Juobey6Pawcglp1G8KYKLztlrUJ1nHzqaCN2Ts51+
 Y9/RL2C/RpKzsvA/ihxgrvqIa79wIMkfloMvzk0kNs8sWcgSln1XBTdHNi2+hDNq
 9pqsixAMddJ4cZsEw12Tggf3vMKxcZd7F5QwxqMf3KA44v2c7mObuLmGVDNcdGnc
 bssGJp/LT7kWzyzJa0NjEntQvbGZwLi+lTiFJAsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=BLUlDs
 JDLLz23TxdFaD9S9KrZM4aAYN6Av6uVb65r5k=; b=b+a4FG9KVvi1iyCCbgUUJw
 r+3WykH7207BP6j88l3nnacGIAO/LTOvz2gp6w1k0I8g+em/k5x56gD3bi12yDYQ
 trMXZDdXIbG1dWJAOz0/HMyRiFYjIi1SZPWKd6bZ5hpyt7xut1kR/O+6ELNU2XM0
 AS3j6hhUvAv5R4g44WPhXW/FD6J3yb8L5QfO38kXnwD25w/JKHkJVzsJ2lYmQx7H
 7YwSQV51mihFeC05YdyXtX7WgAbi+QhXrPRl++h8agffFqvb+x+MuuGn7HT1AtZV
 5t31LjNva5vP49Ck89y3lW1XuNTZHfW41JD9GBiYHQcgWa5ZDjjvCcoj5twySwQw
 ==
X-ME-Sender: <xms:a_N_WdHe74Wsjd5GjOlMIjFQ0-SXXCzPwRFb5Qa3iXqw3Xh36fCc3g>
X-Sasl-enc: ZNHkP7mPHBDUyjDxfJe3P/QbDOrhYADQwGOKtkoXTGbV 1501557610
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9B087E1D9;
 Mon, 31 Jul 2017 23:20:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 0/3] Hardware work-arounds for max31785
Date: Tue,  1 Aug 2017 12:49:29 +0930
Message-Id: <20170801031932.4328-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 01 Aug 2017 03:20:15 -0000

Hello,

I've reworked the initial series[1] to invert the meaning of the devicetree
property, and as such the devicetree patches have gone away. We now have a
device-level `use-stored-presence` property instead, which marks the device
state as canonical. In the abscense of the property, the driver should set the
installed bit for all fans described in the devicetree and clear the installed
bit for any which are not.

I've also addressed Joel's comments on the work-around for back-to-back writes,
removing the double-underscores from the helper functions.

Please review.

Andrew

[1] https://lists.ozlabs.org/pipermail/openbmc/2017-July/008438.html

Andrew Jeffery (3):
  dt-bindings: max31785: Add use-stored-presence property
  max31785: Support use-stored-presence devicetree property
  pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   |   6 ++
 drivers/hwmon/pmbus/max31785.c                     | 114 +++++++++++++++++++--
 2 files changed, 109 insertions(+), 11 deletions(-)

-- 
2.11.0
