Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4655F1A0CC4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 16:50:10 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452750608115252.86796459254901;
 Wed, 13 Jan 2016 21:50:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 0/3] Tests
Date: Wed, 13 Jan 2016 23:50:04 -0600
Message-Id: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 05:50:12 -0000

Initial tests commit. Adding a framework to add more tests

https://github.com/openbmc/btbridge/pull/12

Cyril Bur (3):
  Initialise variable to avoid using it uninitialised
  Increase debugging output when receiving a response to message from
    dbus
  Initial set of test.

 .build.sh                       |   9 ++
 .org.openbmc.HostIpmi.conf.test |  20 ++++
 Makefile                        |   7 ++
 bt-host.c                       | 235 ++++++++++++++++++++++++++++++++++++++++
 btbridged.c                     |   4 +-
 ipmi-bouncer.c                  | 131 ++++++++++++++++++++++
 run_tests.sh                    |  15 +++
 7 files changed, 420 insertions(+), 1 deletion(-)
 create mode 100644 .org.openbmc.HostIpmi.conf.test
 create mode 100644 bt-host.c
 create mode 100644 ipmi-bouncer.c
 create mode 100755 run_tests.sh

-- 
2.6.4
