Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9D104PZzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 16:50:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467269436245816.8072058025328;
 Wed, 29 Jun 2016 23:50:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation] PreTag Blink Fast the Beep LED - Test
 case pre req check fix needed #58
Date: Thu, 30 Jun 2016 01:50:33 -0500
Message-Id: <20160630065034.12232-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 06:50:41 -0000

The test cases are based out of LED's Identify, hearbeat and Blink. 
So if one of the LED's are not existing or failed to find the object, that set of the LED's are entirely failing. 

With this the LED's test cases are clubbed together as per the Identify, Blink and hearbeat LEDs.
So if the LED doesn't exit , it wont even run the reaming test cases of that LEDs.

This is also required for cleaner CI run as well..

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc-test-automation/29)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc-test-automation/pull/29

George Keishing (1):
  PreTag Blink Fast the Beep LED - Test case pre req check fix needed
    #58

 tests/test_led.robot | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

-- 
2.9.0
