Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7rRX5Nq8zDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 05:40:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463427652489594.0019209392544;
 Mon, 16 May 2016 12:40:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH pyphosphor] Fix bug injected during skeleton port
Date: Mon, 16 May 2016 14:40:50 -0500
Message-Id: <1463427651-11456-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Mon, 16 May 2016 19:40:57 -0000

This library method originally came from the skeleton project.
While running pep8 after porting it I injected a logic bug.

https://github.com/openbmc/pyphosphor/pull/2

Brad Bishop (1):
  Fix bug injected during skeleton port

 obmc/dbuslib/bindings.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.2
