Return-Path: <clg@kaod.org>
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSzxG1zRdzDqbg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:17:38 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 8C2F5FF9E6E
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:34 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 527C3380083;
 Mon, 13 Jun 2016 19:17:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 10/10] ast2400: use a mx25l25635f chip
Date: Mon, 13 Jun 2016 19:16:36 +0200
Message-Id: <1465838196-31131-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16910453654091827970
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 17:17:38 -0000

The pflash command on OpenBmc is used to update the flash and it
expects a mx25l25635f and not a mx25l25635e.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 75ad1c396659..75cd3bc439dd 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -48,7 +48,7 @@ static void palmetto_bmc_init(MachineState *machine)
                              &error_abort);
 
     aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
-    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
+    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635f", &error_abort);
 
     /*
      * Install first SMC/FMC flash content as a rom.
-- 
2.1.4
