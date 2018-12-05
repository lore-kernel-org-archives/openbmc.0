Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4398Qp3PVFzDqyg
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 06:47:45 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wB5JHHE7013007;
 Wed, 5 Dec 2018 21:17:17 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id E89F362DA6; Wed,  5 Dec 2018 21:47:15 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 0/1] clk: npcm7xx: get fixed clocks from DT
Date: Wed,  5 Dec 2018 21:47:01 +0200
Message-Id: <20181205194702.257430-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181205194702.257430-1-tali.perry1@gmail.com>
References: <20181205194702.257430-1-tali.perry1@gmail.com>
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
X-List-Received-Date: Wed, 05 Dec 2018 19:47:47 -0000

Nuvoton NPCM7XX Clock Controller



The npcm7xx clock module includes 4 PLLs and then a tree of muxes and dividers. 
All muxes and dividers are preset before Linux boots. The presetting can change
according to the board. 
Linux drivers need to know what the frequencies are, but they cannot change it, 
so this whole driver is intended as read only mechanism for clocks. 

Before this change PLLs input clk value was defined inside the driver.
With this fix clock will be on the DT.


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

---

Tali Perry (1):
  clk: npcm: get fixed input clks from DT

 drivers/clk/clk-npcm7xx.c | 64 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 11 deletions(-)

-- 
2.14.1
