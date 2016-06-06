Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpW5y29zDq6B
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186237284696.7473092283768;
 Sun, 5 Jun 2016 21:10:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openpower-inventory-upload] Change upload triggering mechanism
Date: Sun,  5 Jun 2016 23:10:35 -0500
Message-Id: <20160606041036.18631-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:10:44 -0000

This reverts most of dbc81d6.  The previous triggering mechanism
did not prevent a user from powering the system on while the PNOR
is updated and vise versa.  The new mechanism just does the upload
prior to stating the host.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openpower-inventory-upload/4)
<!-- Reviewable:end -->


https://github.com/openbmc/openpower-inventory-upload/pull/4

Brad Bishop (1):
  Change upload triggering mechanism

 inventory_upload.py | 96 ++++++++++++++++++-----------------------------------
 1 file changed, 33 insertions(+), 63 deletions(-)

-- 
2.8.3
