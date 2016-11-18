Return-Path: <clg@kaod.org>
X-Greylist: delayed 111306 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:26:12 AEDT
Received: from 15.mo7.mail-out.ovh.net (15.mo7.mail-out.ovh.net [87.98.180.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fX62sxzDvb1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:12 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 391411E365
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:09 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 030B148009B;
 Fri, 18 Nov 2016 15:26:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 24/38] aspeed/smc: use flash model option
Date: Fri, 18 Nov 2016 15:22:04 +0100
Message-Id: <1479478938-13267-25-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1117174184252443394
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:13 -0000

so that we can change the flash model from the command line.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3e1781f30f55..0108512b070d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -135,6 +135,8 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
         DriveInfo *dinfo = drive_get_next(IF_MTD);
         qemu_irq cs_line;
 
+        flashtype = dinfo && dinfo->model ? dinfo->model : flashtype;
+
         /*
          * FIXME: check that we are not using a flash module exceeding
          * the controller segment size
-- 
2.7.4
