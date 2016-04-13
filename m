Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlbYT0NCYzDq5k
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 06:50:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460580647206657.9756120034066;
 Wed, 13 Apr 2016 13:50:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr 0/6] association support
Date: Wed, 13 Apr 2016 15:50:39 -0500
Message-Id: <1460580645-5232-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Wed, 13 Apr 2016 20:50:53 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-objmgr/8)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-objmgr/pull/8

Brad Bishop (6):
  Add gitignore
  Use pyobmc package
  Update license year from 2015 to 2016
  Add cache access and signal validation wrappers
  Minor refactoring
  Add support for associations

 .gitignore       |  87 +++++++++++
 OpenBMCMapper.py | 364 --------------------------------------------
 phosphor-mapper  | 457 +++++++++++++++++++++++++++++++++++++++++++++----------
 setup.py         |   3 +-
 4 files changed, 463 insertions(+), 448 deletions(-)
 create mode 100644 .gitignore
 delete mode 100644 OpenBMCMapper.py

-- 
2.7.1
