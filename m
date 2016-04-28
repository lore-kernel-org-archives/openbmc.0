Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwPJz6cg6zDq62
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 14:40:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461818430508167.6492440850285;
 Wed, 27 Apr 2016 21:40:30 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update pflash version
Date: Wed, 27 Apr 2016 23:40:28 -0500
Message-Id: <1461818429-17191-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Thu, 28 Apr 2016 04:40:36 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/247)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/247

Joel Stanley (1):
  meta-openpower: Bump pflash version to 5.2.1

 .../common/recipes-bsp/pflash/pflash.bb            |  5 +-
 .../0001-pflash-Allow-building-under-yocto.patch   | 98 ----------------------
 2 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch

-- 
2.8.1
