Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 89A801A01D6
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 06:30:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456860639654974.6682254531297;
 Tue, 1 Mar 2016 11:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Read/Write Boot Count Sensor as int
Date: Tue,  1 Mar 2016 13:30:37 -0600
Message-Id: <1456860638-26968-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 19:30:47 -0000

Change the dbus request to read/write the boot count sensor from byte to int.
Passing a type of byte causes the dbus interfaces to fail with ENXIO (no such device or address).

https://github.com/openbmc/phosphor-host-ipmid/pull/70

Adriana Kobylak (1):
  Read/Write Boot Count Sensor as int

 ipmid.C         |  4 ++--
 sensorhandler.C | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.1
