Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4400C1A0942
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455981626142408.1163143956105;
 Sat, 20 Feb 2016 07:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 0/2] Rollingesels
Date: Sat, 20 Feb 2016 09:20:23 -0600
Message-Id: <1455981625-30456-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:31 -0000

https://github.com/openbmc/openpower-host-ipmi-oem/pull/8

Chris Austen (2):
  Reduce esel footprint in /tmp
  Convert tabs to spaces

 Makefile     |  11 +----
 oemhandler.C | 103 ++++++++++++++++++++-----------------------
 testit.C     | 141 -----------------------------------------------------------
 3 files changed, 50 insertions(+), 205 deletions(-)
 delete mode 100644 testit.C

-- 
2.7.1
