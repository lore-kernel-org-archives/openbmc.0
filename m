Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVhKC2m3nzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 21:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466077242388875.2153456090006;
 Thu, 16 Jun 2016 04:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4] Support for restricted mode for IPMI
 commands
Date: Thu, 16 Jun 2016 06:40:40 -0500
Message-Id: <20160616114041.11908-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Thu, 16 Jun 2016 11:40:48 -0000

Only IPMI whitelisted commands are supported in restricted mode.Following commands are restricted in restricted mode.

Blacklisted Commands:
==================

1) Warm Reset  (Netfn: APP, Cmd: 0x02)
2) Set LAN Parameters  (Netfn: STORAGE, Cmd: 0x01)
4)Set ACPI Power State - Currently No Op
5) Wilcard Commands(APP, CHASSIS, SENSOR, STORAGE, TRANSPORT) - Currently No Op

Whitelisted Commands:
==================
===================

[App] Get BT Capabilities (0x36)
[App] Reset Watchdog (0x22)
[App] Set watchdog (0x24)
[App] Get Device GUID
[App] Read Event Message Buffer
[App] Set BMC Global Enables
[App] Get Message Flags
[App] Get Channel Info

[Chassis] Get System Boot Options
[Chassis] Chassis Control
[Chassis] Set System Boot Options

[DCMI] Get Power Limit
[GRP] Group Extn Command

[Sensor/Event] Get Sensor Type (0x2F)
[Sensor/Event] Set Sensor Reading
[Sensor/Event] Get Sensor Reading

[Storage] Get SEL time
[Storage] Set SEL time
[Storage] Get SEL info (0x40)
[Storage] Reserve SEL
[Storage] Add SEL Entry

[Transport] Get LAN parameters

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/81)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/81

tomjose (1):
  Whitelist IPMI commands based on Restricted mode

 Makefile    |   3 +-
 ipmid-api.h |   1 +
 ipmid.C     | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 120 insertions(+), 2 deletions(-)

-- 
2.8.4
