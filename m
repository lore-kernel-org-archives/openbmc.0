Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rG0rr3glFzDqX1
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 06:20:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464294035665190.80822040255168;
 Thu, 26 May 2016 13:20:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Pin host-ipmi-hw-example to a specific Git SRCREV
Date: Thu, 26 May 2016 15:20:33 -0500
Message-Id: <20160526202034.7196-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Thu, 26 May 2016 20:20:45 -0000

AUTOREV assumes you can reach the remote repository to lookup the most
recent commit.  When setting up a hermetic build, that will fail even
though a local mirror tarball exists.  Pinning the recipe to a specific
revision skips the lookup and just checks out the specified commit from
the local mirror tarball.

Change-Id: I05cfa67dfcd321ff28a93453df5ce1c82666e6c1
Signed-off-by: Rick Altherr <raltherr@google.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/308)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/308

Rick Altherr (1):
  Pin host-ipmi-hw-example to a specific Git SRCREV

 .../common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.3
