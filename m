Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qhP724c7rzDq6Y
 for <openbmc@lists.ozlabs.org>; Sat,  9 Apr 2016 01:50:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460130614625439.79416534322013;
 Fri, 8 Apr 2016 08:50:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v3] Fix 'dbus.String not found in lookup'
 error message
Date: Fri,  8 Apr 2016 10:50:12 -0500
Message-Id: <1460130613-24475-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 08 Apr 2016 15:50:23 -0000

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

 writefrudata.C | 92 ++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 54 insertions(+), 38 deletions(-)

-- 
2.7.1
