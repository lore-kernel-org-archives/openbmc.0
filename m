Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s5YVF1s97zDqTy
 for <openbmc@lists.ozlabs.org>; Sat,  6 Aug 2016 03:20:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 147041763401783.05503678114076;
 Fri, 5 Aug 2016 10:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation] remove tox version dependency
Date: Fri,  5 Aug 2016 12:20:32 -0500
Message-Id: <20160805172033.2471-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2016 17:20:37 -0000

Install the latest tox version that supports the latest tox syntax.
Addresses https://github.com/openbmc/openbmc-test-automation/issues/73

https://github.com/openbmc/openbmc-test-automation/pull/74

Jay Azurin (1):
  remove tox version dependency

 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.0
