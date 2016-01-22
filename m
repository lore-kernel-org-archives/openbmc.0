Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44D391A0D03
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 20:40:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453455627434832.4355720009495;
 Fri, 22 Jan 2016 01:40:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v10] Add get/set ipmid command support
 with correct DBUS property handling.
Date: Fri, 22 Jan 2016 03:40:25 -0600
Message-Id: <1453455626-2778-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 09:40:33 -0000

1) Add support for IPMI get/set boot option command.
    a) boot options stored in dbus property.
    b) IPMI get boot option command get boot option from the dbus
    property.
    c) IPMI set boot option coomand set boot option to the dbus
    property.
2) Two methods to handle the dbus property set and get:
    a) dbus_set_property()
    b) dbus_get_property()
3) The property is stored as a 10 character strings which representsd 5-byte information.
4) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
5) Get service name via object mapper
    a) The connection name is got via objectmapper.
    b) The method used to get the connection name is object_mapper_get_connection().
    c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
6) Error code are properly handled.
7) Use sprinf/sscanf for int/string conversion.
    a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.
8) Fix issues addressed by the community.
    a) change malloc heap to stack local variable.
    b) Fix multi line comment style from "//" to "/**/".
    c) Add defines for return codes.
    d) Add more comments.

https://github.com/openbmc/phosphor-host-ipmid/pull/55

shgoupf (1):
  Add get/set boot option ipmid command support with correct DBUS
    property handling.

 chassishandler.C | 323 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 chassishandler.h |  18 ++++
 2 files changed, 333 insertions(+), 8 deletions(-)

-- 
2.6.4
