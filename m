Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rr7f0385MzDqyR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 07:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468530641264694.7900973640434;
 Thu, 14 Jul 2016 14:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Edward A . James" <eajames@us.ibm.com>
Subject: [PATCH phosphor-networkd] networking: ip address validation
Date: Thu, 14 Jul 2016 16:10:39 -0500
Message-Id: <20160714211040.12708-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jul 2016 21:10:49 -0000

issue # 202

Signed-off-by: Edward A. James <eajames@us.ibm.com>

https://github.com/openbmc/phosphor-networkd/pull/17

Edward A. James (1):
  networking: ip address validation

 netman.py | 69 +++++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 26 deletions(-)

-- 
2.9.0
