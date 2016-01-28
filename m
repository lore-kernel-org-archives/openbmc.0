Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 700B11A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 10:00:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145402203955642.313426181633645;
 Thu, 28 Jan 2016 15:00:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Add system_state dbus property
Date: Thu, 28 Jan 2016 17:00:37 -0600
Message-Id: <1454022038-17086-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 23:00:42 -0000

Add system_state property to keep track of the system
state across reboots.
Include the generated settings_file.py since some build
machines cannot have the yaml python module installed. This
file will be removed once the code is ported to C in the next rework.
Add the path where the settings will be stored in bmc:
/var/lib/obmc/
Address review comments from the initial commit.

https://github.com/openbmc/phosphor-settingsd/pull/2

Adriana Kobylak (1):
  Add system_state dbus property

 settings.yaml       |  4 +++
 settings_file.py    |  2 +-
 settings_manager.py | 77 ++++++++++++++++++++++++-----------------------------
 3 files changed, 40 insertions(+), 43 deletions(-)

-- 
2.6.4
