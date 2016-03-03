Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 58AA11A0313
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 18:00:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456988429189591.1949239113565;
 Wed, 2 Mar 2016 23:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts 0/2] Build debug kernel
Date: Thu,  3 Mar 2016 01:00:26 -0600
Message-Id: <1456988428-5863-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 07:00:32 -0000

@shenki this change is to the kernel build scripts which implement a debug sparse build and structs check. I have updated the openpower.xyz job to already use m branch and it works correctly, generating the new debug files which we archive.

It also fixes a few small things like bug in generating the proxy config, only adding the user and group if they don't already exist in the cached layer, and not always running apt-get update.

https://github.com/openbmc/openbmc-build-scripts/pull/6

Chris Smart (2):
  fix: proxy file was not created correctly     fix: don't create a user
    and group if already exist
  add: build a debug version of the kernel with sparse and check structs
        (need multiverse repo)

 build-setup.sh  |  9 ++++++---
 kernel-build.sh | 20 ++++++++++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.7.1
