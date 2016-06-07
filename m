Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNsgx3TDrzDqFm
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 10:21:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465258900174149.89418692917093;
 Mon, 6 Jun 2016 17:21:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] Add FMC and phosphor flash layout to AST2500 EVB dts
Date: Mon,  6 Jun 2016 19:21:38 -0500
Message-Id: <20160607002139.28417-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Tue, 07 Jun 2016 00:21:50 -0000

with MTD kernel support, the boot now shows

[    2.740000] Creating 6 MTD partitions on "bmc":
[    2.900000] 0x000000000000-0x000000060000 : "u-boot"
[    2.900000] 0x000000060000-0x000000080000 : "u-boot-env"
[    2.900000] 0x000000080000-0x000000300000 : "kernel"
[    2.900000] 0x000000300000-0x0000004c0000 : "initramfs"
[    2.900000] 0x0000004c0000-0x000001c00000 : "rofs"
[    2.900000] 0x000001c00000-0x000002000000 : "rwfs"

https://github.com/openbmc/linux/pull/93

Xo Wang (1):
  ARM: dts: aspeed: Add FMC and phosphor flash layout to AST2500 EVB

 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.8.3
