Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7w001RkCzDq68
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 08:20:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463437243762944.946183734205;
 Mon, 16 May 2016 15:20:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr] Avoid introspection during discovery
Date: Mon, 16 May 2016 17:20:41 -0500
Message-Id: <1463437242-18424-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 May 2016 22:20:48 -0000

Speed up discovery by calling GetManagedObjects on any ObjectManagers.
Fall back on introspection for parent elements or services that don't
implement one.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-objmgr/11)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-objmgr/pull/11

Brad Bishop (1):
  Avoid introspection during discovery

 phosphor-mapper | 90 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 13 deletions(-)

-- 
2.8.2
