Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qcFgx1LJwzDq5j
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 09:01:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459548055957611.2321491252751;
 Fri, 1 Apr 2016 15:00:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd 0/2] Make settings_file.py more git-diff
 friendly.
Date: Fri,  1 Apr 2016 17:00:52 -0500
Message-Id: <1459548054-10473-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Apr 2016 22:01:01 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-settingsd/7)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-settingsd/pull/7

Patrick Williams (2):
  parser: pprint settings_file.py
  settings_file.py: update with pprint'd output.

 settings_file.py   | 18 +++++++++++++++++-
 settings_parser.py |  5 +++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.7.1
