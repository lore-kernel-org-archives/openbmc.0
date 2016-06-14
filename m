Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTFXn6W7jzDqZn
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 13:30:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465875041705654.4992383072378;
 Mon, 13 Jun 2016 20:30:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20phosphor-host-ipmid=5D=20host-ipmid=3A=20remove=20leading=20and=20trailing=20space=20and=20tab=20when=20setting=20bo=E2=80=A6?=
Date: Mon, 13 Jun 2016 22:30:39 -0500
Message-Id: <20160614033040.9938-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 14 Jun 2016 03:30:50 -0000

…ot options

This patch fixes issue: https://github.com/openbmc/skeleton/issues/56

In ipmi get bootparam handler, remove leading and trailing space and tab
before querying for boot flags.

There are several places we can check the user-set boot options:
* rest server
* phosphor-settingsd
* host-ipmid

Here the boot option is checked in host-ipmid, since currently
the host-ipmid knows whether a boot option is valid or not.

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/92)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/92

Yi Li (1):
  host-ipmid: remove leading and trailing space and tab when setting
    boot options

 chassishandler.C | 66 ++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 19 deletions(-)

-- 
2.8.4
