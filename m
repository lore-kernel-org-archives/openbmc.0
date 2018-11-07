Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qnjD1G10zF3JW
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 00:45:03 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wA7DEauJ011299;
 Wed, 7 Nov 2018 15:14:36 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1DA6E630C9; Wed,  7 Nov 2018 15:44:35 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: linus.walleij@linaro.org, yuenn@google.com, venture@google.com,
 benjaminfair@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au, kunyi@google.com
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] pinctrl: nuvoton: modify NPCM7xx pin configuration 
Date: Wed,  7 Nov 2018 15:44:33 +0200
Message-Id: <20181107134434.354795-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Wed, 07 Nov 2018 13:45:05 -0000

This patch Modify GPIO direction setting in pin configuration function.

please refer patch:
Kun Yi https://patchwork.ozlabs.org/patch/985540/

Tomer Maimon (1):
  pinctrl: nuvoton: modify NPCM7xx pin configuration function

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

-- 
2.14.1
