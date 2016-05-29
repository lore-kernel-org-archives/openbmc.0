Return-Path: <clg@kaod.org>
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Z5BY1zDqP9
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:38 +1000 (AEST)
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:35 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:33 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 344801B0805F
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:34 +0100 (BST)
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
 [9.149.37.252])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKWKe6685160
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:32 GMT
Received: from d06av11.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKWPg001569
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:32 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKWtm001566; Sun, 29 May 2016 15:20:32 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 7A642220164;
 Sun, 29 May 2016 23:20:31 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 06/12] ast2400: use contents of first SPI flash as a rom
Date: Sun, 29 May 2016 23:19:59 +0200
Message-Id: <1464556805-4340-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0041-0000-0000-00001BA9F479
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Sun, 29 May 2016 21:20:39 -0000

This provides support for U-Boot images which are loaded at 0x0.

A Palmetto BMC guest can now be simply booted with :

  $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
	-mtdblock ./flash-palmetto-20160512040959  \
	-mtdblock ./palmetto.pnor

The first block device uses the file "./flash-palmetto-20160512040959"
which will act as a SPI flash module for the BMC, handled by the
SMC/FMC controller. The second block device uses the file
"./palmetto.pnor" which is an OpenPower firmware image for a palmetto
OpenPower system. This one will be handled by the SMC/SPI controller.

The flash images can be grabbed here :

    https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

We could add a second BMC SPI flash by changing the 'num-cs' property
of the controller and emulate a golden image flash module.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 That might seem a little too hacky ? 

 hw/arm/palmetto-bmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index c4099987d354..50369c0331a6 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -17,6 +17,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/ast2400.h"
 #include "hw/boards.h"
+#include "hw/loader.h"
 
 static struct arm_boot_info palmetto_bmc_binfo = {
     .loader_start = AST2400_SDRAM_BASE,
@@ -53,6 +54,14 @@ static void palmetto_bmc_init(MachineState *machine)
     aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a");
     aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e");
 
+    /*
+     * Install first SMC/FMC flash content as a rom.
+     */
+    if (bmc->soc.smc.flashes[0]) {
+        rom_add_blob_fixed("aspeed.smc.0", bmc->soc.smc.flashes[0]->storage,
+                           bmc->soc.smc.flashes[0]->size, 0);
+    }
+
     palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
-- 
2.1.4
