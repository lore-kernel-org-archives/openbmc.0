Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 651951A0B6B
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2016 02:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453562427515402.7086100758821;
 Sat, 23 Jan 2016 07:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add ipmi cold-reset command,
 which call a dbus method.
Date: Sat, 23 Jan 2016 09:20:25 -0600
Message-Id: <1453562426-28694-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 23 Jan 2016 15:20:33 -0000

1. A method dbus_cold_reset() to talk with the dbus method 'place_holder';
2. Also get service name by object mapper which is object_mapper_get_connection();
3. Register the ipmi command;
4. Add related .o to the Makefile.

https://github.com/openbmc/phosphor-host-ipmid/pull/56

William (1):
  Add ipmi coldReset command, which call a dbus method, belongs to
    NETFUN_APP.     1. A method dbus_cold_reset() to talk with the dbus
    method 'place_holder';     2. Also get service name by
    ipmid_get_sd_bus_connection() instead of
    object_mapper_get_connection();     3. Register the ipmi command;   
     4. Add related .o to the Makefile;     5. Add wildcard fun.

 Makefile        |   2 +-
 globalhandler.C | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 globalhandler.h |  12 ++++
 3 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 globalhandler.C
 create mode 100644 globalhandler.h

-- 
2.6.4
