Return-Path: <clg@kaod.org>
Received: from 7.mo173.mail-out.ovh.net (7.mo173.mail-out.ovh.net
 [46.105.44.159])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSzx1173XzDqZf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:17:25 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id AACDFFF9C62
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:21 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 6272538006E;
 Mon, 13 Jun 2016 19:17:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 07/10] ast2400: use contents of first SPI flash as a
 rom
Date: Mon, 13 Jun 2016 19:16:33 +0200
Message-Id: <1465838196-31131-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16906794476304108290
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmd
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
X-List-Received-Date: Mon, 13 Jun 2016 17:17:25 -0000

This provides support for U-Boot images which are loaded at 0x0.

A Palmetto BMC guest can now be simply booted with :

  $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
	-mtdblock ./flash-palmetto-20160512040959  \
	-mtdblock ./palmetto.pnor

The first block device uses the file './flash-palmetto-20160512040959'
which will act as a SPI flash module for the BMC, handled by the
SMC/FMC controller. The second block device uses the file
'./palmetto.pnor' which is an OpenPower firmware image for a palmetto
OpenPower system. This one will be handled by the SMC/SPI controller.

The flash images can be grabbed here :

    https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

We could add a second BMC SPI flash by changing the 'num-cs' property
of the controller and emulate a golden image flash module.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 0aed97a7d9cf..75ad1c396659 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -50,6 +50,23 @@ static void palmetto_bmc_init(MachineState *machine)
     aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
     aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
 
+    /*
+     * Install first SMC/FMC flash content as a rom.
+     */
+    if (bmc->soc.smc.flashes[0]) {
+        MemoryRegion *flash0;
+        MemoryRegion *flash0alias = g_new(MemoryRegion, 1);
+
+        flash0 = sysbus_mmio_get_region(SYS_BUS_DEVICE(bmc->soc.smc.flashes[0]),
+                                        0);
+        memory_region_init_alias(flash0alias, OBJECT(bmc->soc.smc.flashes[0]),
+                                 "flash0alias",
+                                 flash0, 0, bmc->soc.smc.flashes[0]->size);
+
+        memory_region_add_subregion(get_system_memory(), 0, flash0alias);
+        palmetto_bmc_binfo.firmware_loaded = true;
+    }
+
     palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
-- 
2.1.4
