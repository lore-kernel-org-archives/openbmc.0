Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 179D11A065B
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 04:48:14 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444758489972181.34867934830368;
 Tue, 13 Oct 2015 10:48:09 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/8] Moved to sdbus and more
Date: Tue, 13 Oct 2015 12:47:59 -0500
Message-Id: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 17:48:15 -0000

Fixed sdbus memory leak.
Added commands to allow a Palmetto to IPL further.  Created shared libraries on a per netfunction basis.  Not sure if that is the best approach since swapping of functions for other ones is not likely on an explicit NetFN basis.

A lot of TODO's added to fill in when different dbus objects become available.  I marked them with a "TODO" to help draw attention.   

https://github.com/openbmc/phosphor-host-ipmid/pull/3

Chris Austen (8):
  Convert to SDBus
  Set response bit returning from the ipmi call
  Reset the lib path string per .so
  Reduced MAX_IPMI_BUFFER to support ast2400 FIFO
  Add more ipmi commands for app function
  Add sensor ipmi commands
  Add storage ipmi commands
  Add support for the the dcmi package

 Makefile         |  18 +--
 apphandler.C     | 137 +++++++++++++++++++++--
 apphandler.h     |   6 +
 dcmihandler.C    |  40 +++++++
 dcmihandler.h    |  12 ++
 ipmid-api.h      |   1 +
 ipmid.C          | 330 ++++++++++++++++++++++++++++++++++++-------------------
 ipmid.H          |   6 +-
 sensorhandler.C  | 213 +++++++++++++++++++++++++++++++++++
 sensorhandler.h  |  13 +++
 storagehandler.C | 200 +++++++++++++++++++++++++++++++++
 storagehandler.h |  16 +++
 12 files changed, 860 insertions(+), 132 deletions(-)
 create mode 100644 dcmihandler.C
 create mode 100644 dcmihandler.h
 create mode 100644 sensorhandler.C
 create mode 100644 sensorhandler.h
 create mode 100644 storagehandler.C
 create mode 100644 storagehandler.h

-- 
2.6.0
