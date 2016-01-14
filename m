Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F342E1A0036
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 22:40:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14527716367631009.9172923989662;
 Thu, 14 Jan 2016 03:40:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 0/3] Add inventory fan5
Date: Thu, 14 Jan 2016 05:40:33 -0600
Message-Id: <1452771636-6161-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 11:40:41 -0000

https://github.com/openbmc/skeleton/pull/25

Ken (3):
  Add inventory fan5
  Initial fan LED status
  Remove reboot function in power button, reboot is in reset button.

 bin/Barreleye.py       | 1 +
 bin/chassis_control.py | 5 +----
 bin/startup_hacks.sh   | 7 +++++++
 3 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.6.4
