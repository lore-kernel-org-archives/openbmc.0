Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4n6D194gzDqDJ
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 06:00:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462996815616843.4898198948329;
 Wed, 11 May 2016 13:00:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] Take a stab at a proper DBUS API document.
Date: Wed, 11 May 2016 15:00:13 -0500
Message-Id: <1462996814-824-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 20:00:20 -0000

Changed the main structure to be interface based rather than
topic based.  Each interface should have a methods, signals
properties and namespace section with a table and option free
form examples or additional overview information.  If an interface
doesn't have any properties, methods or signals those sections
can be omitted.

The namespace section outlines where objects implementing certain
interfaces are expected to be found.

There are a number of things that still need to be filled out.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/25)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/25

Brad Bishop (1):
  Take a stab at a proper DBUS API document.

 dbus-interfaces.md | 793 ++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 660 insertions(+), 133 deletions(-)

-- 
2.8.1
