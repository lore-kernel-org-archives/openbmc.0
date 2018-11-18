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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42yWf43fLTzF3B2
 for <openbmc@lists.ozlabs.org>; Sun, 18 Nov 2018 23:35:39 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wAIC581G005944;
 Sun, 18 Nov 2018 14:05:08 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 6A76762EDE; Sun, 18 Nov 2018 14:35:06 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] npcm: fix uninitialized 'val' warning in receive
 function 
Date: Sun, 18 Nov 2018 14:35:03 +0200
Message-Id: <20181118123504.83082-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 18 Nov 2018 12:35:41 -0000

Addressed comments from:.
 - kbuild test robot : drivers/spi/spi-npcm-pspi.c:226:17: warning:
  'val' may be used uninitialized in this function.
  
Fix uninitialized 'val' warning receive function.
Send function has been modify to be aligned with 
the receive function.

The NPCM PSPI driver tested on NPCM750 evaluation board.

Tomer Maimon (1):
  spi: npcm: fix uninitialized 'val' warning in receive function

 drivers/spi/spi-npcm-pspi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.14.1
