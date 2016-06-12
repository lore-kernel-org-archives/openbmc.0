Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSMcd534fzDqWm
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 03:01:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465750857493886.2480803702867;
 Sun, 12 Jun 2016 10:00:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v4] Add support for checkstop gpio
Date: Sun, 12 Jun 2016 12:00:55 -0500
Message-Id: <20160612170056.30091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 12 Jun 2016 17:01:06 -0000

Add checkstop gpio, and trigger a host reboot when an interrupt
is detected and the system state is host booted.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/96)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/96

Adriana Kobylak (1):
  Add support for checkstop gpio

 Makefile                     |   4 +-
 bin/Barreleye.py             |   7 +
 bin/Palmetto.py              |   7 +
 interfaces/openbmc_intf.c    | 875 +++++++++++++++++++++++++++++++++++++++++--
 interfaces/openbmc_intf.h    | 124 +++++-
 objects/host_checkstop_obj.c | 204 ++++++++++
 xml/openbmc_intf.xml         |   2 +
 7 files changed, 1188 insertions(+), 35 deletions(-)
 create mode 100644 objects/host_checkstop_obj.c

-- 
2.8.3
