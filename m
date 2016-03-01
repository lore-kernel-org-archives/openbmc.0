Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2C6131A06BA
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 07:40:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456864845269743.7394255823978;
 Tue, 1 Mar 2016 12:40:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Replace HOST_POWERED_DOWN with HOST_POWERED_OFF
 state in Palmetto
Date: Tue,  1 Mar 2016 14:40:42 -0600
Message-Id: <1456864843-29388-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 20:40:48 -0000

The HOST_POWERED_DOWN has been deprecated and replaced with HOST_POWERED_OFF.
Update the Palmetto config file with the updated state define.

https://github.com/openbmc/skeleton/pull/52

Adriana Kobylak (1):
  Replace HOST_POWERED_DOWN with HOST_POWERED_OFF state in Palmetto

 bin/Palmetto.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.1
