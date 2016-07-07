Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlnyp09W8zDr3T
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 05:40:17 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467920412976269.06889051265034;
 Thu, 7 Jul 2016 12:40:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v3] dbus-interfaces: Add
 org.openbmc.control.BmcFlash.update method
Date: Thu,  7 Jul 2016 14:40:11 -0500
Message-Id: <20160707194012.2022-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Jul 2016 19:40:18 -0000

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
