Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E7DAB1A0024
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218031420653.0163268806202;
 Tue, 15 Dec 2015 14:20:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] add aspeed spi nor driver
Date: Tue, 15 Dec 2015 16:20:27 -0600
Message-Id: <1450218030-11874-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:35 -0000

This is the initial driver along with palmetto support.

Future work includes memcopy access, speed settings, and parse all flash parameters.


https://github.com/openbmc/linux/pull/31

Milton D. Miller II (3):
  mtd/spi-nor: Add SPI memory controllers for ASPEED AST2400
  aspeed: add spi nor to aspeed_defconfig
  openbmc: add spi-nor to palmetto

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  68 +++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  53 ++
 arch/arm/configs/aspeed_defconfig                  |   2 +
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/aspeed-smc.c                   | 539 +++++++++++++++++++++
 6 files changed, 670 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c

-- 
2.6.3
