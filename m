Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7748D1A0324
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 20:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456998629563961.1638130196785;
 Thu, 3 Mar 2016 01:50:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v5] Fix memory leak in good paths in ipmid
Date: Thu,  3 Mar 2016 03:50:27 -0600
Message-Id: <1456998628-11987-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 09:50:35 -0000

There are still leaks to be fixed in bad path.. this is a good path only.

https://github.com/openbmc/phosphor-host-ipmid/pull/69

vishwa (1):
  memory leak found during multiple reboots. it was found that in many
    cases the     reply was not unref'ed

 apphandler.C       | 150 ++++++++++++++++++----------------------
 host-services.c    |   2 +-
 ipmid.C            |  44 ++++++------
 sensorhandler.C    |   2 +-
 storageaddsel.C    |   4 +-
 transporthandler.C | 199 +++++++++++++++++++++++------------------------------
 6 files changed, 177 insertions(+), 224 deletions(-)

-- 
2.7.1
