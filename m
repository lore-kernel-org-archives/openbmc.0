Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qYkzV1lnVzDq7D
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 06:50:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459194643520623.0975754225918;
 Mon, 28 Mar 2016 12:50:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Support for restricted mode for IPMI
 commands
Date: Mon, 28 Mar 2016 14:50:41 -0500
Message-Id: <1459194642-16791-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 28 Mar 2016 19:50:46 -0000

Only IPMI whitelisted commands are supported in restricted mode.Following commands are restricted in restricted mode.

1) Warm Reset  (Netfn: APP, Cmd: 0x02)
2) Set LAN Parameters  (Netfn: STORAGE, Cmd: 0x01)
4)Set ACPI Power State - Currently No Op
5) Wilcard Commands(APP, CHASSIS, SENSOR, STORAGE, TRANSPORT) - Currently No Op

https://github.com/openbmc/phosphor-host-ipmid/pull/81

tomjose (1):
  Support for restricted mode for IPMI commands

 apphandler.C       | 13 +++++++++++++
 chassishandler.C   |  8 ++++++++
 globalhandler.C    |  9 ++++++++-
 ipmid-api.h        |  1 +
 ipmid.C            | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 sensorhandler.C    |  6 ++++++
 storagehandler.C   |  7 +++++++
 transporthandler.C | 13 ++++++++++++-
 8 files changed, 104 insertions(+), 4 deletions(-)

-- 
2.7.1
