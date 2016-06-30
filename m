Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgCgH1RjyzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 18:40:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14672760556211006.158328027436;
 Thu, 30 Jun 2016 01:40:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add the missing binary into Palmetto config file
Date: Thu, 30 Jun 2016 03:40:53 -0500
Message-Id: <20160630084054.17216-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 08:40:59 -0000

Palmetto.py did not have discover_system_state.py and this patch is
to update that. discover_system_state.py is responsible for looking
at power restoration policy set by the user and then taking appropriate
actions when BMC comes back from any reboot / power cycle and reaches
BMC_READY state.  Actions could be :
1) Leave the system in power off state.
2) Power on the box.
3) Restore the last state which can be either #1 or #2 above.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/122)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/122

Vishwa (1):
  Add the missing binary into Palmetto config file

 configs/Palmetto.py | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.9.0
