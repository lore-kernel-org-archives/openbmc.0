Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWQ2k0KyMzDqQs
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2016 02:00:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466179236460996.6813340912405;
 Fri, 17 Jun 2016 09:00:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] Remove rest-dbus from Barreleye
Date: Fri, 17 Jun 2016 11:00:33 -0500
Message-Id: <20160617160035.4873-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 16:00:47 -0000

Remove the rest-dbus development debug package from Barreleye now that Barreleye is going into production.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/379)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/379

Adriana Kobylak (2):
  Move rest-dbus to development package
  Remove rest-dbus from Barreleye image

 .../meta-rackspace/meta-barreleye/conf/local.conf.sample           | 4 ++++
 meta-phosphor/classes/obmc-phosphor-image.bbclass                  | 1 +
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb               | 7 ++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.8.4
