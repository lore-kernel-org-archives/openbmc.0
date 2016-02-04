Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2B701A0243
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 07:50:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454619044887428.95182498630834;
 Thu, 4 Feb 2016 12:50:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Stop watchdog on power off
Date: Thu,  4 Feb 2016 14:50:43 -0600
Message-Id: <1454619044-21851-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Thu, 04 Feb 2016 20:50:47 -0000

Stop watchdog on a power off request so that it does not
expire if the system is powered off in the middle of a power on.
Clear any existing watchdog timers before honoring a start
watchdog request so that there is only one timer at a time.

https://github.com/openbmc/skeleton/pull/44

Adriana Kobylak (1):
  Stop watchdog on power off

 bin/chassis_control.py      |  2 ++
 objects/host_watchdog_obj.c | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.6.4
