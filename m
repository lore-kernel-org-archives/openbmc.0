Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVRv208FfzDqls
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 12:20:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466043639904784.1525445167636;
 Wed, 15 Jun 2016 19:20:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add build time dependencies to python for skeleton
Date: Wed, 15 Jun 2016 21:20:38 -0500
Message-Id: <20160616022039.22930-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 02:20:47 -0000

Skeleton now invokes python setuptools to install its python
applications in a top level makefile, so a build time dependency
on native-python is required.

It should be noted that skeleton invoking python from make is
an interim thing until its python applications get their own
repository.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/371)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/371

Brad Bishop (1):
  Add build time dependencies to python for skeleton

 meta-phosphor/classes/config-in-skeleton.bbclass           | 2 ++
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.8.4
