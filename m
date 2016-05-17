Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8KWF5JNMzDqBK
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:30:49 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463495437206627.677639554063;
 Tue, 17 May 2016 07:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add pflash to SDK
Date: Tue, 17 May 2016 09:30:35 -0500
Message-Id: <1463495436-27711-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 14:30:50 -0000

Make use of the skiboot external/shared support for dynamic so/bin.
This allows us to completely remove pflash from skeleton.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/276)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/276

Brad Bishop (1):
  Add pflash to SDK

 .../common/recipes-bsp/pflash/pflash.bb            |   8 +-
 .../pflash/pflash/0001-pflash-Build-solib.patch    | 119 +++++++++++++++++++++
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   7 +-
 3 files changed, 127 insertions(+), 7 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch

-- 
2.8.2
