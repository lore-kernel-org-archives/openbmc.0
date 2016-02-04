Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A112E1A0221
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 07:50:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454619032843828.0450563943963;
 Thu, 4 Feb 2016 12:50:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr 0/2] bug fix and pep8 cleanup
Date: Thu,  4 Feb 2016 14:50:30 -0600
Message-Id: <1454619032-21755-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 04 Feb 2016 20:50:39 -0000

https://github.com/openbmc/phosphor-objmgr/pull/6

Brad Bishop (2):
  Discard existing interfaces
  Run phosphor-mapper through pep8

 OpenBMCMapper.py | 613 ++++++++++++++++++++++++++++---------------------------
 phosphor-mapper  | 337 +++++++++++++++---------------
 setup.cfg        |   2 +-
 3 files changed, 486 insertions(+), 466 deletions(-)

-- 
2.6.4
