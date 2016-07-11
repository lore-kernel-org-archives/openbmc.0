Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rp9LY3Y5ZzDqpR
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 02:20:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468254032934786.1180053612402;
 Mon, 11 Jul 2016 09:20:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] classes-systemd: bug fix and best practices.
Date: Mon, 11 Jul 2016 11:20:30 -0500
Message-Id: <20160711162032.25452-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 16:20:38 -0000

A couple minor fixes to the systemd wrapper class.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/463)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/463

Brad Bishop (2):
  classes-systemd: Fix FILES_${PN} path bug
  classes-systemd: Use PN rather than BPN

 meta-phosphor/classes/obmc-phosphor-systemd.bbclass | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.9.0
