Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0V6S3FZ6zDq5k
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 06:30:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462393835581245.23545073595324;
 Wed, 4 May 2016 13:30:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add version_id support in to openbmc
Date: Wed,  4 May 2016 15:30:33 -0500
Message-Id: <1462393834-27292-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 May 2016 20:30:41 -0000

Adding https://github.com/openbmc/phosphor-host-ipmid/commit/176c96534484213dfb19d2ef5f70306b145a4fcf
to all the ipmi -I dbus mc info command to reflect what is seen via REST

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/254)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/254

Chris Austen (1):
  Add version_id support in to openbmc

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.1
