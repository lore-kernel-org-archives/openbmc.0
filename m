Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qYlCf5VVlzDq7h
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 07:01:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459195275809143.6499776878576;
 Mon, 28 Mar 2016 13:01:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Add Restricted mode as a host setting
Date: Mon, 28 Mar 2016 15:01:13 -0500
Message-Id: <1459195274-17203-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Mar 2016 20:01:19 -0000

Restricted mode is a setting that is used in customer scenario, in which case only IPMI Whitelisted commands are allowed to execute.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-settingsd/6)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-settingsd/pull/6

tomjose (1):
  Add Restricted mode as a host setting

 settings.yaml       | 4 ++++
 settings_file.py    | 2 +-
 settings_manager.py | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.7.1
