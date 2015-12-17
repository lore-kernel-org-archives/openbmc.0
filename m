Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2648B1A106B
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 13:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14503188256198.803894856816214;
 Wed, 16 Dec 2015 18:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add get/set ipmid command support with
 correct DBUS property handling.
Date: Wed, 16 Dec 2015 20:20:24 -0600
Message-Id: <1450318825-24003-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Dec 2015 02:20:29 -0000

1) Two methods to handle the dbus property set and get:
    a) dbus_set_property()
    b) dbus_get_property()
2) The property is stored as a 10 character strings which representsd 5-byte information.
3) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
4) Get service name via object mapper
    a) The connection name is got via objectmapper.
    b) The method used to get the connection name is object_mapper_get_connection().
    c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
5) Error code are properly handled.

https://github.com/openbmc/phosphor-host-ipmid/pull/55

shgoupf (1):
  Add get/set ipmid command support with correct DBUS property handling.

 chassishandler.C | 332 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |  17 +++
 2 files changed, 345 insertions(+), 4 deletions(-)

-- 
2.6.3
