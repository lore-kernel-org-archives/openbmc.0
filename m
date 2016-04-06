Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgBKZ4MJQzDq65
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 02:40:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459960815288927.3188439683435;
 Wed, 6 Apr 2016 09:40:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Fix 'dbus.String not found in lookup' error
 message
Date: Wed,  6 Apr 2016 11:40:12 -0500
Message-Id: <1459960813-14691-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 06 Apr 2016 16:40:19 -0000

Previously the ipmi-fru-parser will call dbus method getObjectFromId()
for each fru areas to get the dbus object path of fru area,
even if the fru area does not exist.
Also ipmi_validate_fru_area() may be invoked multipul times before
full fru data is parsed. This will generate duplicated error
messages from SystemManager:, e.g:
"ERROR SystemManager: dbus.String(u'INTERNAL_13') not found in lookup".
In this case, "INTERNAL" area does not exists for FRU 13.

This patch tries to reduce the messages. For FRUs managed by
hostboot, ipmi-fru-parser only asks for dbus object path when
updating the fru data to BMC inventory.

For FRUs mananged by BMC (eeprom), ipmi-fru-parser also asks for dbus
object path when setting the fru's 'present' and 'fault' status.
ipmi-fru-parser needs to call getObjectFromId() to know whether a
fru should be present, in order to decide the 'present' and 'fault'
status. So this message will still be triggered when SystemManager
does not define object path for a fru area.

This patch also sets 'present' and 'fault' properly when there is error
processing a BMC managed FRU.

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/13)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/13

Yi Li (1):
  Fix 'dbus.String not found in lookup' error message

 writefrudata.C | 83 +++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 33 deletions(-)

-- 
2.7.1
