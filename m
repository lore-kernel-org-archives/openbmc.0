Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 1849 seconds by postgrey-1.36 at bilbo;
 Mon, 12 Nov 2018 01:19:46 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tGHQ4XTjzF3S4
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 01:19:46 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wABDHN9p031814;
 Sun, 11 Nov 2018 15:17:24 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 2C4C462EDE; Sun, 11 Nov 2018 15:47:22 +0200 (IST)
From: tali.perry1@gmail.com
To: brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 raltherr@google.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 0/1] clk: npcm7xx: fix base address and of_clk_get_by_name
Date: Sun, 11 Nov 2018 15:47:11 +0200
Message-Id: <20181111134712.318321-1-tali.perry1@gmail.com>
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
X-List-Received-Date: Sun, 11 Nov 2018 14:19:47 -0000

From: Tali Perry <tali.perry1@gmail.com>

Nuvoton NPCM7XX Clock Controller
fix base address and of_clk_get_by_name error handling.
    Also update error messages to be more informative.
    
    In case clk_base allocation is erronoeous the return value is null.
    Also fix handling of of_clk_get_by_name returns an error. 
    Print a better error message pointing to the dt-binding documention.

This patch is re-submitted since it was already pushed to main 
(just the diff, without the full driver which is already in 
master branch.)


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

---

Tali Perry (1):
  clk: npcm7xx: get fixed clocks from DT

 drivers/clk/clk-npcm7xx.c | 99 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 24 deletions(-)

-- 
2.14.1
