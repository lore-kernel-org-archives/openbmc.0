Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A85011A0038
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 08:00:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455224448977174.3070320922959;
 Thu, 11 Feb 2016 13:00:48 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20phosphor-networkd=5D=20Validating=20user=20=26=20group=20names=20prior=20to=20system=20call=20and=20wait=28=29=20on=20proc=E2=80=A6?=
Date: Thu, 11 Feb 2016 15:00:46 -0600
Message-Id: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 11 Feb 2016 21:00:55 -0000

… spawned with pexpect.

https://github.com/openbmc/phosphor-networkd/pull/10

Hariharasubramanian R (1):
  Validating user & group names prior to system call and wait() on proc
    spawned with pexpect.

 userman.py | 106 ++++++++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 30 deletions(-)

-- 
2.7.1
