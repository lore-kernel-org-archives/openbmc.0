Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 91FF91A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 23:01:01 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456488057903922.3792801687412;
 Fri, 26 Feb 2016 04:00:57 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2] skeleton: fixed hard-coding of master OCC hwmon
 sysfs path for PowerCap object
Date: Fri, 26 Feb 2016 06:00:56 -0600
Message-Id: <1456488057-11363-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 26 Feb 2016 12:01:02 -0000

Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/hwmon3/'.
This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work when
master OCC is initilized as hwmon device other than 'hwmon3'.

'usr_powercap' attribute should be searched when OCC is active.
When skeleton creates 'PowerCap' objects, OCC may not be active.
So do the search each time setting power cap. Raise an exception when
there is no 'user_powercap' attribute.

This would fix the issue: https://github.com/openbmc/skeleton/issues/42

Also raise an exception when setting power cap fails. The exception
will be returned to REST API caller. This would fix the issue:
https://github.com/openbmc/skeleton/issues/43

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/skeleton/pull/50

Yi Li (1):
  skeleton: fixed hard-coding of master OCC hwmon sysfs path for
    PowerCap object

 bin/Sensors.py         | 22 ++++++++++++++++++----
 bin/sensor_manager2.py |  3 ---
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.7.1
