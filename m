Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPqq54qfzzDq6V
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 10:01:05 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145808286236999.88487024695712;
 Tue, 15 Mar 2016 16:01:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 0/5] Only call aspeednic_init when preparing to use
 network
Date: Tue, 15 Mar 2016 18:00:56 -0500
Message-Id: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 23:01:06 -0000

The aspeednic driver was calling init from its initialization function and
calling halt later.  This left the DMA engine running and writing to
memory when Ethernet traffic arrived when control was handed off
to the operating system.

Remove this call to init and rely on the framework to call
write_hwaddr with the assigned MAC address.

In addition upstream discourages setting the random address in
drivers.  Later upstream created a config for this behavior and I
back-ported that patch.

In my testing, the random mac address is about 90% 1 value after a
u-boot reset command but after a kernel reboot it does not repeat.

The code uses rand with timer as the seed source; the network stack
then uses the mac as the seed for random delays.  We may prefer
to only configure u-boot setting a random mac only after a better
source of entropy, letting the kernel use its sources to set it when
we do not net-boot.

milton

<!-- Reviewable:start -->
---

v2: update README and README.ethaddr with backported CONFIG var name.

This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/u-boot/4)
<!-- Reviewable:end -->


https://github.com/openbmc/u-boot/pull/4

Joe Hershberger (1):
  net: Implement random ethaddr fallback in eth.c

Milton D. Miller II (4):
  net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
  net: aspeednic: Do not start hardware in initialize
  net: aspeednic: Remove extra spaces before assignments
  net: aspeednic: Do not fill in a random MAC address

 README                  |  3 ++-
 doc/README.enetaddr     |  2 ++
 drivers/net/aspeednic.c | 31 ++++++++++++++-----------------
 net/eth.c               | 13 ++++++++++++-
 4 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.7.1
