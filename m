Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRFhw1Q04zDqWX
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 17:30:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145828263453439.92933562026087;
 Thu, 17 Mar 2016 23:30:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH obmc-console 0/2] Add Travis CI building
Date: Fri, 18 Mar 2016 01:30:26 -0500
Message-Id: <1458282628-8978-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 06:30:40 -0000

No tests yet, just building with clang and gcc on the Ubuntu Trusty x86 host.

https://github.com/openbmc/obmc-console/pull/1

Joel Stanley (2):
  Add travis CI configuration
  console-server: fix initialiser

 .travis.yml      | 20 ++++++++++++++++++++
 console-server.c |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 .travis.yml

-- 
2.7.1
