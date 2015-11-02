Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 77ED61A03C3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:11:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469911646711.0936302369121;
 Mon, 2 Nov 2015 05:11:51 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add ipmi fru write to dbus
Date: Mon,  2 Nov 2015 07:11:48 -0600
Message-Id: <1446469909-23102-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Mon, 02 Nov 2015 13:11:57 -0000

x

https://github.com/openbmc/openbmc/pull/65

Chris Austen (1):
  Add ipmi fru write to dbus

 .../conf/machine/include/openpower.inc             |  1 +
 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb  | 31 ++++++++++++++++++++++
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb

-- 
2.6.0
