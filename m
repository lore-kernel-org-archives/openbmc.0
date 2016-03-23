Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVFTG6NR9zDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 14:30:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458703854958969.9324832203131;
 Tue, 22 Mar 2016 20:30:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3 00/12] Add fan control algorithm
Date: Tue, 22 Mar 2016 22:30:41 -0500
Message-Id: <1458703853-32708-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 23 Mar 2016 03:30:59 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/59)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/59

Ken (7):
  add i2craw tool and hdd status function
  Heartbeat Led function
  fix info memory leak
  Setup FUNC_MODE[2:0]
  fix info memory leak
  Revert "Fill in the threshold settings for CPU and DIMM"
  Add fan control algorithm

johnhcwang (5):
  Fill in the threshold settings for CPU and DIMM
  Fill in the threshold settings for CPU and DIMM
  Add I2C-6 lm75 outlet temperature sensor
  Modify the hard-coded hwmon ID for PowerCap
  Fill in the threshold settings for CPU and DIMM
