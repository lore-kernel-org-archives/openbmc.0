Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlv4F4V3hzDr4w
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 09:30:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467934216325422.3476148311112;
 Thu, 7 Jul 2016 16:30:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 0/2] Document updated bmc flash interface and procedure
Date: Thu,  7 Jul 2016 18:30:13 -0500
Message-Id: <20160707233015.9687-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Jul 2016 23:30:22 -0000

 Document BMC flash update enhancements

The BMC flash update process was enhanced to allow the images to be
written to flash while the system is operational allowing progress
to be mointored.

Update the documentation describing how to use the new interfaces.
Also add or update the description of the prior interface.

Fixes: openbmc/openbmc#293
Signed-off-by: Milton Miller <miltonm@us.ibm.com>

---
I did not have a chance to test the added commands.  
I based on @causten #26 and can rebase if necessary.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/31)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/31

Chris Austen (1):
  Update dbus-interfaces.md

Milton Miller (1):
  Document BMC flash update enhancements

 code-update.md     | 110 ++++++++++++++++++++++++++++++++++++++++++++++-------
 dbus-interfaces.md |  26 ++++++++-----
 2 files changed, 114 insertions(+), 22 deletions(-)

-- 
2.9.0
