Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk50B2VD5zDqCG
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:50:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460368214698960.247704307783;
 Mon, 11 Apr 2016 02:50:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Using new getFRUOjbect() API to fix 'not
 found in lookup' error message
Date: Mon, 11 Apr 2016 04:50:12 -0500
Message-Id: <1460368213-20074-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 09:50:19 -0000

The ipmi-fru-parser calls the dbus method
SystemManager::getObjectFromId('FRU_STR', fru_area_name) for each fru areas
to get the dbus object path of fru area, even if the fru area does not exist.
Also ipmi_validate_fru_area() may be invoked multipul times before
full fru data is parsed. This will generate duplicated error
messages from SystemManager:, e.g:
"ERROR SystemManager: dbus.String(u'INTERNAL_13') not found in lookup".
In this case, "INTERNAL" area does not exists for FRU

For FRUs mananged by BMC (eeprom), ipmi-fru-parser sets the
'present' and 'fault' status of a fru area.
ipmi-fru-parser needs to know whether a fru should be present, based on
whether getObjectFromId() returns valid dbus object path.
So it is expected that getObjectFromId() may be called with
a 'fru_area_name' not defined in Skeleton's ID_LOOKUP table.

In another pull request for skeleton, a new method:
getFRUObject('fru_area_name') is added specially for ipmi-fru-parser.
See PR: https://github.com/openbmc/skeleton/pull/60.

This new method does not report any error message when 'fru_area_name'
not defined in skeleton.

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/14)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/14

Yi Li (1):
  Using new getFRUOjbect() API to fix 'not found in lookup' error
    message

 writefrudata.C | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.7.1
