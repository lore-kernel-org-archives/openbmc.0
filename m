Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41E611A0023
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 08:40:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452462033172488.53801624497385;
 Sun, 10 Jan 2016 13:40:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Create the settings dbus object.
Date: Sun, 10 Jan 2016 15:40:31 -0600
Message-Id: <1452462032-12848-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 10 Jan 2016 21:40:37 -0000

Host settings are specified in a yaml file.
Parser converts the yaml file into a dictionary.
The settings manager runs on the BMC and uses the dictionary to
create the dbus properties and save the values in the BMC so that
the values persist.

https://github.com/openbmc/phosphor-settingsd/pull/1

Adriana Kobylak (1):
  Create the settings dbus object.

 settings.yaml       | 14 ++++++++
 settings_file.py    |  2 ++
 settings_manager.py | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 settings_parser.py  | 20 ++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 settings.yaml
 create mode 100644 settings_file.py
 create mode 100755 settings_manager.py
 create mode 100755 settings_parser.py

-- 
2.6.4
