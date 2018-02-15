Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhyD16HZ1zF0w5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 00:43:45 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w1FDOwwY003131;
 Thu, 15 Feb 2018 15:24:58 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 20088)
 id 5F9F85AA0F; Thu, 15 Feb 2018 15:43:07 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v2 0/1] clk: npcm: move fixed clocks to DT
Date: Thu, 15 Feb 2018 15:41:54 +0200
Message-Id: <1518702115-22990-1-git-send-email-tali.perry1@gmail.com>
X-Mailer: git-send-email 1.8.3.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 13:43:47 -0000

Fixed clocks defined at driver/clk/clk-npcm7xx.c moved to DT. 

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Tali Perry (1):
  npcm750: add fixed clocks (moved from drivers/clk/clk-npcm7xx.c)

 arch/arm/boot/dts/nuvoton-npcm750.dtsi | 1223 ++++++++++++++++++++++++++++++++
 1 file changed, 1223 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi

-- 
2.14.1
