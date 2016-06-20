Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rY8Zp6NnPzDq5d
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 22:01:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466424059893269.66994468926634;
 Mon, 20 Jun 2016 05:00:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update recipe and service file for phosphor-networkd
Date: Mon, 20 Jun 2016 07:00:57 -0500
Message-Id: <20160620120058.16763-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Mon, 20 Jun 2016 12:01:08 -0000

Commit c69c3d3 for phosphor-netword introduced DNS support.
This change will update the bitbake file to point to correct commit
and also creates the service file to start DNS updater.

Fixes openbmc/openbmc#134

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/394)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/394

vishwa (1):
  Update recipe and service file for phosphor-networkd

 meta-phosphor/common/recipes-phosphor/network/network.bb       |  6 +++++-
 .../network/network/network-update-dns.service                 | 10 ++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/network/network/network-update-dns.service

-- 
2.8.4
