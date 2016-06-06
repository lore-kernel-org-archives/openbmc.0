Return-Path: <openbmc-patches@stwcx.xyz>
X-Greylist: delayed 602 seconds by postgrey-1.35 at bilbo;
 Tue, 07 Jun 2016 04:10:55 AEST
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNjRz2jmGzDq6B
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 04:10:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465236648700509.8218243815329;
 Mon, 6 Jun 2016 11:10:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd v2] Implement IPMI Network Settings Override
Date: Mon,  6 Jun 2016 13:10:46 -0500
Message-Id: <20160606181047.15838-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 18:10:56 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-settingsd/11)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-settingsd/pull/11

ratagupt (1):
  Implement IPMI Network Settings Override

 settings.yaml    | 7 +++++--
 settings_file.py | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.8.3
