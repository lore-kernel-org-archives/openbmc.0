Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 58A491A0129
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 09:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14541078318351018.1724929603951;
 Fri, 29 Jan 2016 14:50:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Move settings to c code
Date: Fri, 29 Jan 2016 16:50:30 -0600
Message-Id: <1454107831-18878-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Jan 2016 22:50:37 -0000

This gets the boot_list and PowerCap settings exposed
on the dbus.

Examples of how to now interact...
$ curl -c cjar -b cjar -k https://x.x.x.x/org/openbmc/settings/host0
{
  "data": {
    "boot_mode_list": [
      "Default",
      "Network",
      "Disk",
      "Safe",
      "CDROM",
      "Setup"
    ],
    "current_boot_mode": "Default",
    "power_cap_default": 999,
    "power_cap_max": 1000,
    "power_cap_min": 1,
    "power_cap_now": 998
  },
  "message": "200 OK",
  "status": "ok"
}
View a single property
curl -c cjar -b cjar -k https://192.168.7.2/org/openbmc/settings/host0/attr/Current_boot_mode
Make the Network the current boot device
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [\"CDROM\"]}" https://x.x.x.x/org/openbmc/settings/host0/action/setBootMode
Set the powercap to 42
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [42]}" https://x.x.x.x/org/openbmc/settings/host0/action/setPowerCap

https://github.com/openbmc/phosphor-settingsd/pull/3

Chris Austen (1):
  Move settings to c code

 Makefile            |  22 ++++++
 settings_file.py    |   2 -
 settings_manager.c  | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 settings_manager.py |  87 ----------------------
 settings_parser.py  |  20 -----
 5 files changed, 228 insertions(+), 109 deletions(-)
 create mode 100644 Makefile
 delete mode 100644 settings_file.py
 create mode 100644 settings_manager.c
 delete mode 100755 settings_manager.py
 delete mode 100755 settings_parser.py

-- 
2.6.4
