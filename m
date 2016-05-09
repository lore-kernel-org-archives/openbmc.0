Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HDz5jN3zDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:30:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462786255560713.9439771710224;
 Mon, 9 May 2016 02:30:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 00/21] Add fan control algorithm
Date: Mon,  9 May 2016 04:30:33 -0500
Message-Id: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:00 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/59)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/59

Ken (8):
  add i2craw tool and hdd status function
  Heartbeat Led function
  fix info memory leak
  Setup FUNC_MODE[2:0]
  fix info memory leak
  Revert "Fill in the threshold settings for CPU and DIMM"
  Add fan control algorithm
  Fix skeleton Makefile

Ken Lai (2):
  Revert "Add I2C-6 lm75 outlet temperature sensor"
  Revert "Setup FUNC_MODE[2:0]"

johnhcwang (11):
  Fill in the threshold settings for CPU and DIMM
  Fill in the threshold settings for CPU and DIMM
  Add I2C-6 lm75 outlet temperature sensor
  Modify the hard-coded hwmon ID for PowerCap
  Fill in the threshold settings for CPU and DIMM
  Set lower threshold for ambient/CPU/DIMM sensors
  Fix memory leak
  Support FAN tach sensors
  Generate thermaltrip event
  Keep original design to generate thermaltrip event
  Support FAN LED feature
