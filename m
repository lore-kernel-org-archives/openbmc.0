Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B917B1A0019
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 12:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455585022510314.7401198673398;
 Mon, 15 Feb 2016 17:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20openbmc-build-scripts=5D=20initialise=20PROXY=20variable=20to=20avoid=20instance=20where=20no=20PROXY=20env=20exists=E2=80=A6?=
Date: Mon, 15 Feb 2016 19:10:20 -0600
Message-Id: <1455585021-11318-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 16 Feb 2016 01:10:25 -0000

… and set -e catches ubound variable

This should stop the build script from exiting when no proxy environment variables are set.

@shenki 

https://github.com/openbmc/openbmc-build-scripts/pull/4

Chris Smart (1):
  initialise PROXY variable to avoid instance where no PROXY env exists
    and set -e catches ubound variable

 build-setup.sh | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.1
