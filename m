Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 469 seconds by postgrey-1.36 at bilbo;
 Mon, 16 Jul 2018 20:19:18 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TfXQ0WhxzDr55
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 20:19:17 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w6G9eKgr003988;
 Mon, 16 Jul 2018 12:40:20 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 3FE00630C3; Mon, 16 Jul 2018 13:10:19 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: sboyd@kernel.org, brendanhiggins@google.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux@armlinux.org.uk, weiyongjunl@huawei.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 0/1] clk: npcm7xx: fix base address and of_clk_get_by_name
Date: Mon, 16 Jul 2018 13:10:06 +0300
Message-Id: <20180716101007.11721-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 10:19:19 -0000

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

 drivers/clk/clk-npcm7xx.c | 102 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 87 insertions(+), 15 deletions(-)

-- 
2.14.1
