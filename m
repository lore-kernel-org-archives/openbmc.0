Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 872011A0730
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:08 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293325603218.2829269403137;
 Mon, 19 Oct 2015 15:22:05 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Remove tftpy
Date: Mon, 19 Oct 2015 17:22:03 -0500
Message-Id: <1445293324-29236-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:10 -0000

Packaging seperately.
https://github.com/openbmc/openbmc/pull/22

https://github.com/openbmc/skeleton/pull/3

Brad Bishop (1):
  Remove tftpy

 bin/tftpy/COPYING              |  21 --
 bin/tftpy/README               | 115 --------
 bin/tftpy/TftpClient.py        | 103 --------
 bin/tftpy/TftpContexts.py      | 397 ----------------------------
 bin/tftpy/TftpPacketFactory.py |  41 ---
 bin/tftpy/TftpPacketTypes.py   | 445 -------------------------------
 bin/tftpy/TftpServer.py        | 232 ----------------
 bin/tftpy/TftpShared.py        |  59 -----
 bin/tftpy/TftpStates.py        | 582 -----------------------------------------
 bin/tftpy/__init__.py          |  25 --
 10 files changed, 2020 deletions(-)
 delete mode 100644 bin/tftpy/COPYING
 delete mode 100644 bin/tftpy/README
 delete mode 100644 bin/tftpy/TftpClient.py
 delete mode 100644 bin/tftpy/TftpContexts.py
 delete mode 100644 bin/tftpy/TftpPacketFactory.py
 delete mode 100644 bin/tftpy/TftpPacketTypes.py
 delete mode 100644 bin/tftpy/TftpServer.py
 delete mode 100644 bin/tftpy/TftpShared.py
 delete mode 100644 bin/tftpy/TftpStates.py
 delete mode 100644 bin/tftpy/__init__.py

-- 
2.6.0
