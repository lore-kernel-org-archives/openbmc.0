Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48E761A0066
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 17:40:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454308826308714.6200162468131;
 Sun, 31 Jan 2016 22:40:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Add ipmi cold-reset command,
 which call a dbus method.
Date: Mon,  1 Feb 2016 00:40:24 -0600
Message-Id: <1454308825-13334-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 01 Feb 2016 06:40:31 -0000

1. A method dbus_cold_reset() to talk with the dbus method 'place_holder';
2. Also get service name by object mapper which is object_mapper_get_connection();
3. Register the ipmi command;
4. Add related .o to the Makefile.

https://github.com/openbmc/phosphor-host-ipmid/pull/56

William (1):
  Add ipmi coldReset command, which call a dbus method, belongs to
    NETFUN_APP.     1. A method dbus_warm_reset() to talk with the dbus
    method 'warmRest';     2. Also get service name by
    ipmid_get_sd_bus_connection() instead of
    object_mapper_get_connection();     3. Register the ipmi command;   
     4. Add related .o to the Makefile;     5. Add wildcard function.

 Makefile        |   1 +
 globalhandler.C | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 globalhandler.h |  12 ++++
 3 files changed, 184 insertions(+)
 create mode 100644 globalhandler.C
 create mode 100644 globalhandler.h

-- 
2.6.4
