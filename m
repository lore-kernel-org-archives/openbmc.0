Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4Lx66L6fzDqCm
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:20:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462936852924684.9563404263993;
 Tue, 10 May 2016 20:20:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v10 00/22] Add fan control algorithm
Date: Tue, 10 May 2016 22:20:30 -0500
Message-Id: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:20:59 -0000
X-List-Received-Date: Wed, 11 May 2016 03:20:59 -0000
X-List-Received-Date: Wed, 11 May 2016 03:20:59 -0000



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

Ken Lai (3):
  Revert "Add I2C-6 lm75 outlet temperature sensor"
  Revert "Setup FUNC_MODE[2:0]"
  Fix Makefile issue

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
