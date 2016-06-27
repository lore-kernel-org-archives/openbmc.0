Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLY5Qf8zDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053455455448.71300422242723;
 Mon, 27 Jun 2016 11:50:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/9] More skeleton refactoring
Date: Mon, 27 Jun 2016 13:50:45 -0500
Message-Id: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:02 -0000

This patchset aims to get skeleton ready for distribution as multiple independent packages.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/115)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/115

Brad Bishop (9):
  Add install-headers target
  Add force link option to install target
  libopenbmc_intf include path update
  Move libopenbmc_intf codegen/xml
  Update and run libopenbmc_intf codegen
  Create a libopenbmc_intf symlink
  libopenbmc_intf rules simplification
  bin targets are rebuilt every time
  Conditionally use system provided libopenbmc_intf

 Makefile                                        |    12 +-
 bmcctl/control_bmc_obj.c                        |     4 +-
 flashbios/flash_bios_obj.c                      |     4 +-
 gdbus.mk                                        |     8 +-
 gdbus/interfaces/openbmc_intf.c                 | 32291 ---------------------
 gdbus/interfaces/openbmc_intf.h                 |  4200 ---
 hostcheckstop/host_checkstop_obj.c              |     6 +-
 hostwatchdog/host_watchdog_obj.c                |     4 +-
 libopenbmc_intf/Makefile                        |    43 +-
 {gdbus => libopenbmc_intf}/codegen              |     2 +-
 libopenbmc_intf/gpio.c                          |     2 +-
 libopenbmc_intf/openbmc_intf.c                  | 32292 +++++++++++++++++++++-
 libopenbmc_intf/openbmc_intf.h                  |  4201 ++-
 {gdbus/xml => libopenbmc_intf}/openbmc_intf.xml |     0
 op-flasher/flasher_obj.c                        |     4 +-
 op-hostctl/control_host_obj.c                   |     6 +-
 op-pwrctl/power_control_obj.c                   |     6 +-
 pciedetect/pcie_slot_present_obj.c              |     6 +-
 pwrbutton/button_power_obj.c                    |     6 +-
 rstbutton/button_reset_obj.c                    |     6 +-
 rules.mk                                        |    21 +-
 21 files changed, 36561 insertions(+), 36563 deletions(-)
 delete mode 100644 gdbus/interfaces/openbmc_intf.c
 delete mode 100644 gdbus/interfaces/openbmc_intf.h
 rename {gdbus => libopenbmc_intf}/codegen (54%)
 mode change 120000 => 100644 libopenbmc_intf/openbmc_intf.c
 mode change 120000 => 100644 libopenbmc_intf/openbmc_intf.h
 rename {gdbus/xml => libopenbmc_intf}/openbmc_intf.xml (100%)

-- 
2.9.0
