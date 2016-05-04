Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r00834dk3zDqB3
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:00:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462323614013981.6965384549758;
 Tue, 3 May 2016 18:00:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v3 0/5] Tests
Date: Tue,  3 May 2016 20:00:08 -0500
Message-Id: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 01:00:20 -0000

Initial tests commit. Adding a framework to add more tests

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/btbridge/12)
<!-- Reviewable:end -->


https://github.com/openbmc/btbridge/pull/12

Cyril Bur (5):
  Initialise variable to avoid using it uninitialised
  Increase debugging output when receiving a response to message from
    dbus
  Add travis dir to keep all the Travis CI specific files together
  Initial set of test.
  Travis CI: Bump to Ubuntu 16.04

 .build.sh                             |  23 ----
 .travis.yml                           |   2 +-
 Makefile                              |   7 +
 bt-host.c                             | 235 ++++++++++++++++++++++++++++++++++
 btbridged.c                           |   4 +-
 ipmi-bouncer.c                        | 131 +++++++++++++++++++
 travis/build.sh                       |  32 +++++
 travis/org.openbmc.HostIpmi.conf.test |  20 +++
 travis/run_tests.sh                   |  15 +++
 9 files changed, 444 insertions(+), 25 deletions(-)
 delete mode 100755 .build.sh
 create mode 100644 bt-host.c
 create mode 100644 ipmi-bouncer.c
 create mode 100755 travis/build.sh
 create mode 100644 travis/org.openbmc.HostIpmi.conf.test
 create mode 100755 travis/run_tests.sh

-- 
2.8.1
