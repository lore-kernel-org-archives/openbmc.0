Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 950101A01C9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 06:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447183224783191.94019112928538;
 Tue, 10 Nov 2015 11:20:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add support for IPMI Get Boot Options
 command
Date: Tue, 10 Nov 2015 14:20:23 -0500
Message-Id: <1447183224-2548-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Tue, 10 Nov 2015 19:20:30 -0000

Create new Chassis NetFn file and add basic support
for OPAL to call the IPMI Get Boot Options command.

https://github.com/openbmc/phosphor-host-ipmid/pull/35

Adriana Kobylak (1):
  Add support for IPMI Get Boot Options command

 Makefile         |  1 +
 chassishandler.C | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 chassishandler.h | 17 ++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 chassishandler.C
 create mode 100644 chassishandler.h

-- 
2.6.3
