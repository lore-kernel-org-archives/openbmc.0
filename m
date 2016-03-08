Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D49621A009D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 02:00:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457449243090718.7554870756991;
 Tue, 8 Mar 2016 07:00:43 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH phosphor-host-ipmid] DCMI GET_POWER_LEVEL bad return code
Date: Tue,  8 Mar 2016 09:00:41 -0600
Message-Id: <1457449242-7583-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Mar 2016 15:00:51 -0000

This function uses static data and should always
return a good return code.  This was causing OCC
not to start.

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/phosphor-host-ipmid/pull/73

Norman James (1):
  DCMI GET_POWER_LEVEL bad return code

 dcmihandler.C | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.1
