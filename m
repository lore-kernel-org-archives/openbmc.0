Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgBY93w6szDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:50:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467273033763676.096502279016;
 Thu, 30 Jun 2016 00:50:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation] PreTag Test Automation Basic Code
 clean-up needed #9
Date: Thu, 30 Jun 2016 02:50:32 -0500
Message-Id: <20160630075033.15101-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 07:50:38 -0000

This as minor code syntax and unused code fix up.
1. tests/test_fan.robot : fixed by adding a dummy test case. We cant have an empty test case in the testcase directory

2. tests/security/test_ssl.robot   : Fixed

3. tests/test_association  : Fixed

4. tests/test_bootpolicy.robot :  Fixed

5. tests/test_eventlog.robot : Fixed

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc-test-automation/30)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc-test-automation/pull/30

George Keishing (1):
  PreTag Test Automation Basic Code clean-up needed #9

 tests/security/test_ssl.robot  | 2 --
 tests/test_association.robot   | 1 -
 tests/test_bootpolicy.robot    | 2 --
 tests/test_eventlog.robot      | 2 +-
 tests/test_fan.robot           | 4 ++++
 tests/test_power_restore.robot | 2 --
 6 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.9.0
