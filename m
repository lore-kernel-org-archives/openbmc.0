Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7CCE61A0B4C
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 03:30:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456936234048836.3591492291936;
 Wed, 2 Mar 2016 08:30:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Integrating support for event log enhancements
Date: Wed,  2 Mar 2016 10:30:31 -0600
Message-Id: <1456936232-8813-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Mar 2016 16:30:40 -0000

You will now get all the debug data in the event logs.  This was different
then in the past as there was a fixed few bytes of meaningless information.

The feature also reduces the memory footprint of the event manager AND
removes eselxxx logs in /tmp

https://github.com/openbmc/openbmc/pull/195

Chris Austen (1):
  Integrating support for event log enhancements

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.1
