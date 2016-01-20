Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B7BFC1A0FCC
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 17:00:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453269640830884.4550932591286;
 Tue, 19 Jan 2016 22:00:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20skeleton=5D=20skeleton=3A=20Update=20setValue=28=29=20method=20dbus=20object=20=27/org/openbmc/sensors/=E2=80=A6?=
Date: Wed, 20 Jan 2016 00:00:39 -0600
Message-Id: <1453269640-25140-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 20 Jan 2016 06:00:47 -0000

…host/OccStatus'

In recent occ_i2c driver, a new hwmon sysfs attribte
'/sys/class/i2c-adapter/i2c-X/X-0050/online' has been used to
instantiate occ_i2c device. Update the 'OccStatus' dbus object
to use the new interface.
Do not use '/sys/class/i2c-adapter/i2c-X/new_device' anymore.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/skeleton/pull/31

Yi Li (1):
  skeleton: Update setValue() method dbus object
    '/org/openbmc/sensors/host/OccStatus'

 bin/Sensors.py         | 11 ++++-------
 bin/sensor_manager2.py |  6 +++++-
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.6.4
