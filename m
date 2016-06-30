Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9D36hvMzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 16:50:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467269437342255.59849776909994;
 Wed, 29 Jun 2016 23:50:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: George Keishing <gkeishin@in.ibm.com>
Subject: [PATCH openbmc-test-automation] PreTag Blink Fast the Beep LED - Test
 case pre req check fix needed #58
Date: Thu, 30 Jun 2016 01:50:34 -0500
Message-Id: <20160630065034.12232-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630065034.12232-1-openbmc-patches@stwcx.xyz>
References: <20160630065034.12232-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 06:50:44 -0000

From: George Keishing <gkeishin@in.ibm.com>

---
 tests/test_led.robot | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/tests/test_led.robot b/tests/test_led.robot
index a512339..b5ea1f9 100644
--- a/tests/test_led.robot
+++ b/tests/test_led.robot
@@ -13,6 +13,44 @@ ${SAMPLING_FREQUENCY}  6
 
 *** Test Cases ***
 
+If Heartbeat LED exist then execute test
+   [Documentation]   If heartbeat LED exist then execute the test set.
+   ${resp} =   OpenBMC Get Request   /org/openbmc/control/led/heartbeat
+   Run keyword If  ${resp.status_code} == ${HTTP_OK}   Execute Heartbeat LEDs Test Cases
+
+If Identify LED exist then execute test
+   [Documentation]   If identify LED exist then execute the test set.
+   ${resp} =   OpenBMC Get Request   /org/openbmc/control/led/identify
+   Run keyword If  ${resp.status_code} == ${HTTP_OK}   Execute Identify LEDs Test Cases
+
+If Beep LED exist then execute test
+   [Documentation]   If beep LED exist then execute the test set.
+   ${resp} =   OpenBMC Get Request   /org/openbmc/control/led/beep
+   Run keyword If  ${resp.status_code} == ${HTTP_OK}  Execute Beep LEDs Test Cases
+
+*** Keywords ***
+
+Execute Heartbeat LEDs Test Cases
+   [Documentation]   Executing ON/OFF/Fast/Slow Heartbeat LED test cases.
+   Turn ON the Heartbeat LED
+   Turn OFF the Heartbeat LED
+   Blink Fast the Heartbeat LED
+   Blink Slow the Heartbeat LED
+
+Execute Identify LEDs Test Cases
+   [Documentation]   Executing ON/OFF/Fast/Slow Identify LED test cases.
+   Turn ON the Identify LED
+   Turn OFF the Identify LED
+   Blink Fast the Identify LED
+   Blink Slow the Identify LED
+
+Execute Beep LEDs Test Cases
+   [Documentation]   Executing ON/OFF/Fast/Slow Beep LED test cases.
+   Turn ON the Beep LED
+   Turn OFF the Beep LED
+   Blink Fast the Beep LED
+   Blink Slow the Beep LED
+
 Turn ON the Heartbeat LED
    [Documentation]   This testcase is to test the setOn functionality of the
    ...               Heartbeat LED. The LED state is read again to check if
@@ -152,8 +190,6 @@ Blink Slow the Beep LED
    \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
    should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
    
-*** Keywords ***
-
 Get LED State
    [arguments]    ${args}
    ${data} =   create dictionary   data=@{EMPTY}
-- 
2.9.0
