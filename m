Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV9T215nwzDqjl
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 01:30:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466004638000415.2610919521343;
 Wed, 15 Jun 2016 08:30:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] Add shared library versioning for
 host-ipmid-fru
Date: Wed, 15 Jun 2016 10:30:34 -0500
Message-Id: <20160615153036.30759-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 15:30:47 -0000

OE packaging works best with libraries with proper versioning.  This patchest picks up a change in host-ipmid-fru that enables versioning.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/326)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/326

Brad Bishop (2):
  Whitespace fixes for host-ipmid-fru recipe
  Bump host-ipmid version

 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb   | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

-- 
2.8.4
