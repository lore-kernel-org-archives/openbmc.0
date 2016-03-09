Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B245C1A004C
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:00:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457499625562398.0314506314976;
 Tue, 8 Mar 2016 21:00:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts v2 0/2] fix: disable Dockerfile always
 check for package updates
Date: Tue,  8 Mar 2016 23:00:22 -0600
Message-Id: <1457499624-3653-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Mar 2016 05:00:29 -0000

set a static datestamp so that apt-get/dnf aren't run each time a new
docker container is built. Increment it if you want to refresh the
package databases in order to install new software or if something
is out of date.

@shenki

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc-build-scripts/7)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc-build-scripts/pull/7

Chris Smart (2):
  fix: Dockerfile     set a static datestamp so that apt-get/dnf aren't
    run each time a new     docker container is built. Increment it if
    you want to refresh the     package databases in order to install
    new software or if something     is out of date.
  fix: Dockerfile     remove timestamp from apt-get/dnf calls altogether
    and     put on one line so that a new package pulls in new
    everything

 build-setup.sh           | 47 ++++++++++++++++++++++++++++++++++---------
 initramfs-build.sh       | 18 ++++++++++++-----
 kernel-build-setup.sh    | 29 ++++++++++++++++++++-------
 kernel-build.sh          | 25 +++++++++++++----------
 openpower-build-setup.sh | 52 ++++++++++++++++++++++++++++++++++++++----------
 5 files changed, 128 insertions(+), 43 deletions(-)

-- 
2.7.1
