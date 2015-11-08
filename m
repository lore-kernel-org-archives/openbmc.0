Return-Path: <openbmc-patches@stwcx.xyz>
X-Greylist: delayed 906 seconds by postgrey-1.35 at bilbo;
 Sun, 08 Nov 2015 12:35:32 AEDT
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40CD41A068E
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 12:35:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446945623030898.639846112909;
 Sat, 7 Nov 2015 17:20:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Fix bugs from test runs
Date: Sat,  7 Nov 2015 20:20:21 -0500
Message-Id: <1446945622-27994-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Sun, 08 Nov 2015 01:35:32 -0000

POST and FW Boot progres where not getting set on DBUS
Memory and CPU faults now show up on DBUS
OS Boot Status was never sent

https://github.com/openbmc/phosphor-host-ipmid/pull/34

Chris Austen (1):
  Fix bugs from test runs

 ipmisensor.C    | 59 ++++++++++++++++++++++++++++++++++++++++++---------------
 sensorhandler.C | 25 +++++++++++++-----------
 2 files changed, 58 insertions(+), 26 deletions(-)

-- 
2.6.3
