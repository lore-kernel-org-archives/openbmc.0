Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 700891A03C6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:42:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445398948942638.5748317065492;
 Tue, 20 Oct 2015 20:42:28 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-hwmon] Initial read-daemon for hwmon entries
Date: Tue, 20 Oct 2015 22:42:22 -0500
Message-Id: <1445398943-1310-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:42:33 -0000

Discoveres hwmon entries for fans, input voltage, and temperature
sensors.  Polls entries on a 1s interval and displays a message to
stdout if one of the entries have changed.

https://github.com/openbmc/phosphor-hwmon/pull/8

Patrick Williams (1):
  Initial read-daemon for hwmon entries

 Makefile      | 60 +++++++++++++++++++++++++++++++++++++++++++++
 README.md     |  3 +++
 argument.C    | 57 ++++++++++++++++++++++++++++++++++++++++++
 argument.H    | 28 +++++++++++++++++++++
 directory.C   | 38 ++++++++++++++++++++++++++++
 directory.H   | 20 +++++++++++++++
 hwmon.H       | 23 +++++++++++++++++
 readd.C       | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorcache.H | 27 ++++++++++++++++++++
 sensorset.C   | 26 ++++++++++++++++++++
 sensorset.H   | 31 +++++++++++++++++++++++
 sysfs.H       | 31 +++++++++++++++++++++++
 12 files changed, 423 insertions(+)
 create mode 100644 Makefile
 create mode 100644 README.md
 create mode 100644 argument.C
 create mode 100644 argument.H
 create mode 100644 directory.C
 create mode 100644 directory.H
 create mode 100644 hwmon.H
 create mode 100644 readd.C
 create mode 100644 sensorcache.H
 create mode 100644 sensorset.C
 create mode 100644 sensorset.H
 create mode 100644 sysfs.H

-- 
2.6.0
