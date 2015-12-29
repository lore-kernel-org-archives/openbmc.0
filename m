Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2646D1A0156
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2015 20:20:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1451380836583353.99400215826654;
 Tue, 29 Dec 2015 01:20:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Re-enable host watchdog
Date: Tue, 29 Dec 2015 03:20:34 -0600
Message-Id: <1451380835-18728-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Tue, 29 Dec 2015 09:20:43 -0000

This fix is for workitem: 143559. The code is commented out due to a bug.
That bug has been fixed already. I tested on Palmetto and Barreleye, by
repeatly calling "obmcutil poweron / obmcutil poweroff" with a script.
Journalctrl shows no "Watchdog Err" message. So re-enable the host wdt.

https://github.com/openbmc/skeleton/pull/24

Yi Li (1):
  Re-enable host watchdog

 bin/chassis_control.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.4
