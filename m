Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8JPf2K8KzDqBM
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 23:40:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14634924489787.412476691882716;
 Tue, 17 May 2016 06:40:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Use pyphosphor rather than skeleton
 Openbmc.py
Date: Tue, 17 May 2016 08:40:46 -0500
Message-Id: <1463492447-25545-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 13:40:54 -0000

The Openbmc module in skeleton is going away so move to using the
bindings add ons in the pyphosphor package.

Signed-of-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-settingsd/10)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-settingsd/pull/10

Brad Bishop (1):
  Use pyphosphor rather than skeleton Openbmc.py

 settings_manager.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.8.2
