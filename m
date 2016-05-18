Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r911M2wXQzDqCH
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 03:10:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463591441352733.3754618443095;
 Wed, 18 May 2016 10:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Support for restricted mode for IPMI
 commands
Date: Wed, 18 May 2016 12:10:39 -0500
Message-Id: <1463591440-32553-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Wed, 18 May 2016 17:10:48 -0000

Only IPMI whitelisted commands are supported in restricted mode.Following commands are restricted in restricted mode.

1) Warm Reset  (Netfn: APP, Cmd: 0x02)
2) Set LAN Parameters  (Netfn: STORAGE, Cmd: 0x01)
4)Set ACPI Power State - Currently No Op
5) Wilcard Commands(APP, CHASSIS, SENSOR, STORAGE, TRANSPORT) - Currently No Op

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/81)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/81

tomjose (1):
  Support for restricted mode for IPMI commands

 apphandler.C       | 23 +++++++++--------
 chassishandler.C   | 10 ++++----
 dcmihandler.C      |  4 +--
 globalhandler.C    |  4 +--
 groupext.C         |  2 +-
 ipmid-api.h        | 13 ++++++++--
 ipmid.C            | 73 ++++++++++++++++++++++++++++++++++++++++++++++++------
 sensorhandler.C    |  8 +++---
 storagehandler.C   | 13 +++++-----
 transporthandler.C |  9 +++----
 10 files changed, 114 insertions(+), 45 deletions(-)

-- 
2.8.2
