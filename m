Return-Path: <clg@kaod.org>
Received: from 15.mo7.mail-out.ovh.net (15.mo7.mail-out.ovh.net [87.98.180.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mG4HmWzDvns
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:10 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 44123207A1
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:17 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 10A1C4800A1;
 Fri, 18 Nov 2016 15:25:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 08/38] aspeed: change SoC revision of the palmetto-bmc
 machine
Date: Fri, 18 Nov 2016 15:21:48 +0100
Message-Id: <1479478938-13267-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1102537487962376962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:11 -0000

The palmetto BMC machine uses a AST2400 revision A1 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aea73f79d92c..5e35d4562de0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -82,7 +82,7 @@ enum {
 
 static const AspeedBoardConfig aspeed_boards[] = {
     [PALMETTO_BMC] = {
-        .soc_name  = "ast2400-a0",
+        .soc_name  = "ast2400-a1",
         .hw_strap1 = PALMETTO_BMC_HW_STRAP1,
         .fmc_model = "n25q256a",
         .spi_model = "mx25l25635e",
-- 
2.7.4
