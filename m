Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qc1FT5PrWzDq5y
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 23:40:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459514441956751.737506441887;
 Fri, 1 Apr 2016 05:40:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20phosphor-networkd=5D=20Log=20management=20service=20to=20stream=20journals/syslogs=20to=20a=20remote=20syslog=20=E2=80=A6?=
Date: Fri,  1 Apr 2016 07:40:38 -0500
Message-Id: <1459514439-19493-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Apr 2016 12:40:46 -0000

…server.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-networkd/14)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-networkd/pull/14

Hariharasubramanian R (1):
  Log management service to stream journals/syslogs to a remote syslog
    server.

 logman.py | 266 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 266 insertions(+)
 create mode 100755 logman.py

-- 
2.7.1
