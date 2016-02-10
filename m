Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2C5B71A03B0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 08:40:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455140431361847.0263380710628;
 Wed, 10 Feb 2016 13:40:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
Date: Wed, 10 Feb 2016 15:40:29 -0600
Message-Id: <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 10 Feb 2016 21:40:36 -0000

Fix parsing of Get IP address.
Dbus method returns additional information such as family and
gateway, but this IPMI option just requires the IP to be returned.

https://github.com/openbmc/phosphor-host-ipmid/pull/64

Adriana Kobylak (1):
  IPMI Get IP Support

 transporthandler.C | 75 ++++++++++++++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

-- 
2.7.1
