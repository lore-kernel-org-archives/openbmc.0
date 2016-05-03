Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzSQJ5502zDq6B
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 14:10:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462248643726306.06806332209464;
 Mon, 2 May 2016 21:10:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr] Add an accessor function for cache entries
Date: Mon,  2 May 2016 23:10:41 -0500
Message-Id: <1462248642-23400-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 03 May 2016 04:10:49 -0000

Determining the difference between a directory path element
and a path element that doesn't exist with pyphosphor is
awkward.  Create an accessor function to funnel this weirdness
in one spot.

Make sure objectmanagers adhere to match rules before adding them.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-objmgr/10)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-objmgr/pull/10

Brad Bishop (1):
  Add an accessor function for cache entries

 phosphor-mapper | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

-- 
2.8.1
