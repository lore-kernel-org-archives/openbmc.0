Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2E4FD1A1A14
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:50:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450407025704992.2902053014199;
 Thu, 17 Dec 2015 18:50:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add get/set ipmid command support with
 correct DBUS property handling.
Date: Thu, 17 Dec 2015 20:50:23 -0600
Message-Id: <1450407024-32509-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 02:50:30 -0000

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
6) Use sprinf/sscanf for int/string conversion.
    a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.

https://github.com/openbmc/phosphor-host-ipmid/pull/55

shgoupf (1):
  Add get/set ipmid command support with correct DBUS property handling.

 chassishandler.C | 302 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |  17 ++++
 2 files changed, 315 insertions(+), 4 deletions(-)

-- 
2.6.3
