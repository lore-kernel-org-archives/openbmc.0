Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BEA401A003F
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 13:40:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453084836369985.8516389084197;
 Sun, 17 Jan 2016 18:40:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v5 0/5] Add inventory fan5
Date: Sun, 17 Jan 2016 20:40:30 -0600
Message-Id: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Mon, 18 Jan 2016 02:40:41 -0000

https://github.com/openbmc/skeleton/pull/25

Ken (5):
  Add inventory fan5
  Initial fan LED status
  Remove reboot function in power button, reboot is in reset button.
  Solve auto power on issue, confirm GPIO status before send the signal
  Reset button does not power on when dc off

 bin/Barreleye.py           |  1 +
 bin/chassis_control.py     |  7 ++-----
 bin/startup_hacks.sh       |  7 +++++++
 objects/button_power_obj.c | 37 ++++++++++++++++++++++++-------------
 4 files changed, 34 insertions(+), 18 deletions(-)
 mode change 100644 => 100755 objects/button_power_obj.c

-- 
2.6.4
