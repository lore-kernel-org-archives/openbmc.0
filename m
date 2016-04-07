Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgbdr6Rh4zDq6L
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 18:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460018437483365.63764759433525;
 Thu, 7 Apr 2016 01:40:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Support for restricted mode for IPMI
 commands
Date: Thu,  7 Apr 2016 03:40:35 -0500
Message-Id: <1460018436-21243-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Apr 2016 08:40:49 -0000

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

 apphandler.C       | 12 ++++++++++++
 chassishandler.C   |  7 ++++++-
 globalhandler.C    |  7 ++++++-
 ipmid-api.h        |  4 ++++
 ipmid.C            | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 sensorhandler.C    |  5 +++++
 storagehandler.C   |  5 +++++
 transporthandler.C | 13 +++++++++++--
 8 files changed, 100 insertions(+), 6 deletions(-)

-- 
2.7.1
