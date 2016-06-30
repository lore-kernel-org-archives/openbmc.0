Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgXln5j4xzDqmg
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 07:31:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146732225792957.85395660241352;
 Thu, 30 Jun 2016 14:30:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v4 0/2] Disable watchdog timer if debug_mode is set
Date: Thu, 30 Jun 2016 16:30:54 -0500
Message-Id: <20160630213056.12725-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 21:31:02 -0000

https://github.com/openbmc/openbmc/issues/246

debug_mode is used when the host is not going to be started.
In this case, we do not want the watchdog timer to be started
because there is no one to keep it from resetting.

This code change prevents the watchdog from being started
during poweron.

Potential side affects could be if we do start the host
in this code path.  The watchdog is un-tested when it's
not started but software comes in and tries to reset it.
The code in control_host_obj.c currently enforces the
no-host-power-on when debug_mode is set.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/120)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/120

Andrew Geissler (2):
  Reformat pychassisctl/chassis_control.py with pep8 standards
  Disable watchdog timer if debug_mode is set

 pychassisctl/chassis_control.py | 408 +++++++++++++++++++++-------------------
 1 file changed, 216 insertions(+), 192 deletions(-)
 mode change 100644 => 100755 pychassisctl/chassis_control.py

-- 
2.9.0
