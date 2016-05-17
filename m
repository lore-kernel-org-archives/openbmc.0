Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8KWJ0GZ6zDqBS
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:30:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463495443169103.79936526145809;
 Tue, 17 May 2016 07:30:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Re-enable out of tree device trees
Date: Tue, 17 May 2016 09:30:40 -0500
Message-Id: <1463495441-27767-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 14:30:52 -0000

This snippet was mistakenly removed with 8ef9fee.

Note that this isn't a matter of policy, it simply enables
the option to do it.  The in-tree device tree is still the default.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/275)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/275

Brad Bishop (1):
  Re-enable out of tree device trees

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.8.2
