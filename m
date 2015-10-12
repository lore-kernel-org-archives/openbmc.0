Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5637C1A067C
 for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2015 11:33:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444610031679278.4588525721812;
 Sun, 11 Oct 2015 17:33:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Moved to sdbus and more
Date: Sun, 11 Oct 2015 19:33:48 -0500
Message-Id: <1444610029-11956-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 00:33:56 -0000

Fixed sdbus memory leak.
Added commands to allow a Palmetto to IPL further.  Created shared libraries on a per netfunction basis.  Not sure if that is the best approach since swapping of functions for other ones is not likely on an explicit NetFN basis.

A lot of TODO's added to fill in when different dbus objects become available.  I marked them with a "TODO" to help draw attention.   

https://github.com/openbmc/phosphor-host-ipmid/pull/3

Chris Austen (1):
  Moved from gdbus to sdbus.  Fixed sdbus memory leak.  Added commands
    to get a Palmetto to IPL further

 Makefile         |  29 ++++-
 apphandler.C     | 151 ++++++++++++++++++++++++-
 apphandler.h     |   6 +
 ipmid-api.h      |   3 +-
 ipmid.C          | 334 ++++++++++++++++++++++++++++++++++++-------------------
 ipmid.H          |   2 +-
 oemhandler.C     | 105 +++++++++++++++++
 oemhandler.h     |  12 ++
 sensorhandler.C  | 225 +++++++++++++++++++++++++++++++++++++
 sensorhandler.h  |  13 +++
 storagehandler.C | 222 ++++++++++++++++++++++++++++++++++++
 storagehandler.h |  16 +++
 12 files changed, 993 insertions(+), 125 deletions(-)
 create mode 100644 oemhandler.C
 create mode 100644 oemhandler.h
 create mode 100644 sensorhandler.C
 create mode 100644 sensorhandler.h
 create mode 100644 storagehandler.C
 create mode 100644 storagehandler.h

-- 
2.6.0
