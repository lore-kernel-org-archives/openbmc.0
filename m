Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnrwp0Z7czDqwj
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:00:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146820963632587.32967285809184;
 Sun, 10 Jul 2016 21:00:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add skeleton-rev class
Date: Sun, 10 Jul 2016 23:00:34 -0500
Message-Id: <20160711040035.4154-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:00:42 -0000

Reduce the number of files to be updated after a
skeleton update from two to one.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/458)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/458

Brad Bishop (1):
  Add skeleton-rev class

 .../meta-firestone/recipes-phosphor/workbook/firestone-config.bb    | 3 ---
 .../meta-garrison/recipes-phosphor/workbook/garrison-config.bb      | 3 ---
 .../meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb      | 3 ---
 .../recipes-phosphor/workbook/witherspoon-config.bb                 | 3 ---
 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb    | 3 ---
 meta-phosphor/classes/config-in-skeleton.bbclass                    | 6 +++++-
 meta-phosphor/classes/skeleton-rev.bbclass                          | 2 ++
 meta-phosphor/classes/skeleton.bbclass                              | 4 ++--
 8 files changed, 9 insertions(+), 18 deletions(-)
 create mode 100644 meta-phosphor/classes/skeleton-rev.bbclass

-- 
2.9.0
