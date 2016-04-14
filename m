Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qm54c1jxDzDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 02:01:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460649657465964.2458582878686;
 Thu, 14 Apr 2016 09:00:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/5] Remove custom org.openbmc.Object.ObjectMapper
 usage
Date: Thu, 14 Apr 2016 11:00:50 -0500
Message-Id: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 14 Apr 2016 16:01:04 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/61)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/61

Brad Bishop (5):
  Remove fan control support from Palmetto
  Add gitignore file
  Whitespace fixes for objects/*.c
  Fix compiler warnings for objects/*
  Remove custom org.openbmc.Object.ObjectMapper

 .gitignore                      |    6 +
 Makefile                        |   28 +-
 bin/Palmetto.py                 |    7 -
 bin/system_manager.py           |    4 +-
 includes/object_mapper.c        |   31 --
 includes/object_mapper.h        |   10 -
 includes/openbmc.h              |    2 +-
 objects/board_vpd_obj.c         |  119 ++---
 objects/button_power_obj.c      |  345 ++++++------
 objects/button_reset_obj.c      |  180 +++----
 objects/control_bmc_barreleye.c |  496 +++++++++--------
 objects/control_bmc_obj.c       |  445 ++++++++--------
 objects/control_host_obj.c      |  540 +++++++++----------
 objects/fan_generic_obj.c       |  263 +++++----
 objects/flash_bios_obj.c        |  838 ++++++++++++++---------------
 objects/flasher_obj.c           |  877 +++++++++++++++---------------
 objects/host_watchdog_obj.c     |  365 +++++++------
 objects/hwmons_barreleye.c      |  433 ++++++++-------
 objects/hwmons_palmetto.c       |  422 +++++++--------
 objects/led_controller.c        | 1124 ++++++++++++++++++++-------------------
 objects/pcie_slot_present_obj.c |  327 ++++++------
 objects/power_control_obj.c     |  633 +++++++++++-----------
 22 files changed, 3656 insertions(+), 3839 deletions(-)
 create mode 100644 .gitignore
 delete mode 100644 includes/object_mapper.c
 delete mode 100644 includes/object_mapper.h
 mode change 100755 => 100644 objects/button_reset_obj.c
 mode change 100755 => 100644 objects/control_host_obj.c
 mode change 100755 => 100644 objects/led_controller.c

-- 
2.7.1
