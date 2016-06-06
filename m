Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNmKJ55hkzDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 06:20:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14652444143910.15453255241709485;
 Mon, 6 Jun 2016 13:20:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH inarp 0/3] Invalid signed and unsigned comparison in
 netlink_recv.
Date: Mon,  6 Jun 2016 15:20:10 -0500
Message-Id: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 20:20:21 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/inarp/4)
<!-- Reviewable:end -->


https://github.com/openbmc/inarp/pull/4

Patrick Williams (3):
  Makefile: Do not override CC.
  Makefile: Append instead of overwrite CFLAGS.
  Avoid signed and unsigned comparison

 Makefile | 4 ++--
 inarp.c  | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.8.3
