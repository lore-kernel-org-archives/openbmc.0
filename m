Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 632CE1A0B51
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 17:40:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456900829315582.3232342913202;
 Tue, 1 Mar 2016 22:40:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4] Fix memory leak in good paths in ipmid
Date: Wed,  2 Mar 2016 00:40:27 -0600
Message-Id: <1456900828-20255-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Mar 2016 06:40:35 -0000

There are still leaks to be fixed in bad path.. this is a good path only.

https://github.com/openbmc/phosphor-host-ipmid/pull/69

vishwa (1):
  memory leak found during multiple reboots. it was found that in many
    cases the     reply was not unref'ed

 apphandler.C       | 150 ++++++++++++++++++----------------------
 host-services.c    |   2 +-
 ipmid.C            |  53 +++++++-------
 sensorhandler.C    |   2 +-
 storageaddsel.C    |   4 +-
 transporthandler.C | 199 +++++++++++++++++++++++------------------------------
 6 files changed, 182 insertions(+), 228 deletions(-)

-- 
2.7.1
