Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2404E1A028C
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 19:00:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452672031152115.45621967103966;
 Wed, 13 Jan 2016 00:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Re submitting plugin support for Host
 Services
Date: Wed, 13 Jan 2016 02:00:29 -0600
Message-Id: <1452672030-18329-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Jan 2016 08:00:35 -0000

I am left with with option now since I was getting into a lot of merge conflicts and the change was simple anyway here...

The same code was actually approved by Chris in the previous pull requests.

https://github.com/openbmc/phosphor-host-ipmid/pull/57

vishwa (1):
  Re submitting plugin support for Host Services

 Makefile        |  12 +++-
 host-services.c | 171 +++++++++++++++++++++++++++++++-------------------------
 ipmid-api.h     |   1 +
 ipmid.C         |  15 +++--
 4 files changed, 111 insertions(+), 88 deletions(-)

-- 
2.6.4
