Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 11DF21A006D
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2016 18:10:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454224235550778.5485417663601;
 Sat, 30 Jan 2016 23:10:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Add dbus objects for OCC CAPS sensors
Date: Sun, 31 Jan 2016 01:10:33 -0600
Message-Id: <1454224234-9353-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 31 Jan 2016 07:10:40 -0000

BMC can poll OCC for CAPS sensors. These sensors provide information
on system PowerCap. One of the sensors named 'Current System Power Reading' can
be used for reading current system power consumption.
This patch add dbus interface for the OCC CAPS sensors.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/skeleton/pull/34

Yi Li (1):
  skeleton: Add dbus objects for OCC CAPS sensors

 bin/Barreleye.py |  8 ++++++++
 bin/Palmetto.py  | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
2.6.4
