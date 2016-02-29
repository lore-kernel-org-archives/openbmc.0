Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D50091A0035
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:44:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456746028385146.830424037557;
 Mon, 29 Feb 2016 03:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Fix memory leak in good paths in ipmid
Date: Mon, 29 Feb 2016 05:40:26 -0600
Message-Id: <1456746027-24921-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 29 Feb 2016 11:44:17 -0000

There are still leaks to be fixed in bad path.. this is a good path only.

https://github.com/openbmc/phosphor-host-ipmid/pull/69

vishwa (1):
  Fix memory leak in ipmid

 apphandler.C       | 147 ++++++++++++++++++-----------------------
 host-services.c    |   1 +
 ipmid.C            |  33 +++++++---
 sensorhandler.C    |   1 +
 storageaddsel.C    |   1 +
 transporthandler.C | 190 +++++++++++++++++++++++------------------------------
 6 files changed, 173 insertions(+), 200 deletions(-)

-- 
2.7.1
