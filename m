Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 79A971A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:02 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536799765522.4621456346423;
 Thu, 22 Oct 2015 10:59:59 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Added Dynamic lookup for sensor types
Date: Thu, 22 Oct 2015 12:59:57 -0500
Message-Id: <1445536798-14692-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:03 -0000

Fixed bug where ipmi sensor readings > offset 7 where not asserted
Added testcases for code
Kept sensors 35,37-3A hardcoded until dbus side decides if they
want to represent them.
reduced the amount of prints

https://github.com/openbmc/phosphor-host-ipmid/pull/19

Chris Austen (1):
  Added Dynamic lookup for sensor types

 ipmid.C         |  74 +++++++++++-------
 ipmisensor.C    |  89 ++++++++++++----------
 sensorhandler.C | 232 ++++++++++++++++++++++++--------------------------------
 sensorhandler.h |  13 +++-
 testit.C        | 174 +++++++++++++++---------------------------
 5 files changed, 269 insertions(+), 313 deletions(-)

-- 
2.6.0
