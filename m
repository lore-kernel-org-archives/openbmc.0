Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 815AF1A0562
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145343462227099.4731683830546;
 Thu, 21 Jan 2016 19:50:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] [PATCH v3 0/3] Aspeed spi nor 3
Date: Thu, 21 Jan 2016 21:50:18 -0600
Message-Id: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jan 2016 03:50:26 -0000

Changes from aspeed-flash branch
Factor dts updates into a dtsi for the flash partitions

Changes from aspeed-spi-nor proposed commit:


Assign label property value to mtd->name before spi_nor_scan, update binding.
turn off DEBUG
removed conditional controller mutex locking (was plannd to eliminate redundant
	chip level locking on one chip controllers but decided not worthwhile)adjust first comment block
use bool and uchar8 vs 1, 3, and 5 bit fields in aspeed_smc_info
make info struct fields explict vs E macro with position data
just make structs, not a table we follow the info pointer
move structs to just before match table
check match data exists
removed unsed smc_controller_type for instance types, dt binding will choose.
add flash type enum instance to struct chip for later teardown of mixed types
todo set controller type to match device tree value


https://github.com/openbmc/linux/pull/43

Milton D. Miller II (3):
  mtd/spi-nor: Add SPI memory controllers for ASPEED AST2400
  aspeed: update bmc dts with attached flash
  aspeed: update defconfig

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  69 +++
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  35 ++
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi |  28 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  35 ++
 arch/arm/configs/aspeed_defconfig                  |   7 +
 drivers/mtd/spi-nor/Kconfig                        |   9 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/aspeed-smc.c                   | 547 +++++++++++++++++++++
 8 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
 create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c

-- 
2.6.4
