Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk46v00b2zDqBC
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:11:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460365854780473.82318990252304;
 Mon, 11 Apr 2016 02:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Add new API SystemManager::getFRUObject()
Date: Mon, 11 Apr 2016 04:10:52 -0500
Message-Id: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Mon, 11 Apr 2016 09:11:03 -0000

ipmi-fru-parser uses getObjectFromId('FRU_STR', fru_area_name) to
ask for the dbus object path of the 'fru_area_name'. The returned
value is also used to check the 'present' status of FRU. Sometimes
the 'fru_area_name' does not defined in Skeleton's ID_LOOKUP table.
system_manager will report a "ERROR: lookup not found" error message.

This patch added an API similiar with getObjectFromId().
It does not report error when the 'fru_area_name' is not defined.
It can be used by ipmi-fru-parser to replace getObjectFromId().

Also the orignal "ERROR" message is changed to "WARNING".

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/60)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/60

Yi Li (1):
  skeleton: Add new API SystemManager::getFRUObject()

 bin/system_manager.py | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

-- 
2.7.1
