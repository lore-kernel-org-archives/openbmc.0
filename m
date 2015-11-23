Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E943A1A0FCF
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287209431925.8541898249672;
 Mon, 23 Nov 2015 06:00:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 0/9] Add Travis CI builds
Date: Mon, 23 Nov 2015 08:59:59 -0500
Message-Id: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 14:00:14 -0000

Builds upon the Makefile work done in https://github.com/openbmc/btbridge/pull/6. Please merge that first

https://github.com/openbmc/btbridge/pull/7

Joel Stanley (9):
  Sort headers
  Add missing include for ioctl
  Remove unused variables
  Fix printf format warnings
  method_send_sms_atn: Log the ioctl number
  bt_host_write: fix invalid check
  Makefile: fix linking and enable -Wall
  Makefile: Allow specifying kenrel header path
  travis: Add Travis CI support

 .build.sh   |  23 ++++++++++++++
 .travis.yml |   9 ++++++
 Makefile    |   8 +++--
 btbridged.c | 100 +++++++++++++++++++++++++++++-------------------------------
 4 files changed, 87 insertions(+), 53 deletions(-)
 create mode 100755 .build.sh
 create mode 100644 .travis.yml

-- 
2.6.3
