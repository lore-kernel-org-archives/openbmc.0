Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1617A1A0D21
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 00:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453210837539789.6090954823604;
 Tue, 19 Jan 2016 05:40:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20skeleton=5D=20skeleton=3A=20Rewrite=20setValue=28=29=20method=20for=20Dbus=20object=20/org/openbmc/sens=E2=80=A6?=
Date: Tue, 19 Jan 2016 07:40:35 -0600
Message-Id: <1453210836-15319-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Jan 2016 13:40:45 -0000

…ors/host/PowerCap

obmc uses dbus interface 'org.openbmc.SensorValue' of the object
'/org/openbmc/sensors/host/PowerCap' to set Host PowerCap.
Rewrite the setValue() method to set PowerCap via the
"/sys/class/hwmon/hwmonX/user_powercap" OCC-HWMON sysfs attribute.
BMC will sends a "Set User PowerCap" command to OCC.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/skeleton/pull/30

Yi Li (1):
  skeleton: Rewrite setValue() method for Dbus object
    /org/openbmc/sensors/host/PowerCap

 bin/Sensors.py         | 22 ++++++++++++++++++----
 bin/sensor_manager2.py |  7 ++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.6.4
