Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVxdP1nD6zDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:40:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466113232982811.5146272422678;
 Thu, 16 Jun 2016 14:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Remove rest-dbus from Barreleye
Date: Thu, 16 Jun 2016 16:40:29 -0500
Message-Id: <20160616214031.1461-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 21:40:42 -0000

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
