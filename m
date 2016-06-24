Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnwy4nhwzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:10:57 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795450716426.41882418466605;
 Fri, 24 Jun 2016 12:10:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr 0/2] More performance improvements
Date: Fri, 24 Jun 2016 14:10:47 -0500
Message-Id: <20160624191049.26382-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:10:59 -0000
X-List-Received-Date: Fri, 24 Jun 2016 19:10:59 -0000

Sort introspected children nodes to improve the chance of finding
ObjectManagers sooner rather than later (systemd does a recursive
listing of child nodes).

Remove unnecessary dbus calls when processing interfaces for
associations.  The existing code assumes that only object interfaces
are available to it but the new discovery mechanism uses
GetManagedObjects which includes the object properties.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-objmgr/13)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-objmgr/pull/13

Brad Bishop (2):
  Pep8 fixes
  More performance fixes

 phosphor-mapper | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

-- 
2.9.0
