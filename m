Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlDgl59VzzDr3H
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2016 07:40:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467841213815697.0962051396658;
 Wed, 6 Jul 2016 14:40:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2] dbus-interfaces: Add
 org.openbmc.control.BmcFlash.update method
Date: Wed,  6 Jul 2016 16:40:11 -0500
Message-Id: <20160706214012.20206-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 06 Jul 2016 21:40:20 -0000

I created the pull request for skeleton, now I am making sure the documentation reflects the change too.  Basically it allows someone to copy a bmc image on to the server to flash it.  This removes the requirement for a tftp server to be used

https://github.com/openbmc/skeleton/pull/87

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/26)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/26

Chris Austen (1):
  Update dbus-interfaces.md

 dbus-interfaces.md | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.9.0
