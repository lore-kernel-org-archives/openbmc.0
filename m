Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYvdW5VbkzDqmB
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:21:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466529655193646.1920533757872;
 Tue, 21 Jun 2016 10:20:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/2] Remove dead code
Date: Tue, 21 Jun 2016 12:20:51 -0500
Message-Id: <20160621172053.23689-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:21:04 -0000

Remove a .o file and some unused applications.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/107)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/107

Brad Bishop (2):
  Remove built-in.o from repository
  Remove dead code

 Makefile                                 |   5 -
 bmcctl-barreleye/Makefile                |   3 -
 bmcctl-barreleye/control_bmc_barreleye.c | 247 -------------------------------
 bmcctl/control_bmc_obj.c                 | 110 --------------
 boardvpd/Makefile                        |   3 -
 boardvpd/board_vpd_obj.c                 |  59 --------
 fanctl/Makefile                          |   3 -
 fanctl/fan_generic_obj.c                 | 126 ----------------
 hwmon-barreleye/Makefile                 |   3 -
 hwmon-barreleye/hwmons_barreleye.c       | 212 --------------------------
 hwmon/Makefile                           |   3 -
 hwmon/hwmons_palmetto.c                  | 207 --------------------------
 op-flasher/pflash/ccan/built-in.o        | Bin 14873 -> 0 bytes
 13 files changed, 981 deletions(-)
 delete mode 100644 bmcctl-barreleye/Makefile
 delete mode 100644 bmcctl-barreleye/control_bmc_barreleye.c
 delete mode 100644 boardvpd/Makefile
 delete mode 100644 boardvpd/board_vpd_obj.c
 delete mode 100644 fanctl/Makefile
 delete mode 100644 fanctl/fan_generic_obj.c
 delete mode 100644 hwmon-barreleye/Makefile
 delete mode 100644 hwmon-barreleye/hwmons_barreleye.c
 delete mode 100644 hwmon/Makefile
 delete mode 100644 hwmon/hwmons_palmetto.c
 delete mode 100644 op-flasher/pflash/ccan/built-in.o

-- 
2.9.0
