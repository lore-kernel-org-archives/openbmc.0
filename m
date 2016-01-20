Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 226B51A1834
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 20:30:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453282211560474.18345803088846;
 Wed, 20 Jan 2016 01:30:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] dbus-interface-doc: Add PowerCap and OccStatus
 description
Date: Wed, 20 Jan 2016 03:30:09 -0600
Message-Id: <1453282210-6352-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 09:30:18 -0000

Add description for dbus objects '/org/openbmc/sensors/host/PowerCap'
and '/org/openbmc/sensors/host/OccStatus'.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/docs/pull/16

Yi Li (1):
  dbus-interface-doc: Add PowerCap and OccStatus description

 dbus-interfaces.md | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.6.4
