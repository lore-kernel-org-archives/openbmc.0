Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpwct3DX8zDqJn
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 07:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468360231941485.2127466982329;
 Tue, 12 Jul 2016 14:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Edward A . James" <eajames@us.ibm.com>
Subject: [PATCH openbmc] python-ipy package
Date: Tue, 12 Jul 2016 16:50:29 -0500
Message-Id: <20160712215030.30847-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Tue, 12 Jul 2016 21:50:39 -0000

add ipy package for ip addressing validation

Signed-off-by: Edward A. James <eajames@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/468)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/468

Wenzong Fan (1):
  python-ipy: update 0.81 -> 0.83

 .../recipes-devtools/python/python-ipy_0.83.bb     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-ipy_0.83.bb

-- 
2.9.0
