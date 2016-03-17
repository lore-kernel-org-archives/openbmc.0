Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qQbZk3qGSzDqWl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 15:53:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=TYZQV8Vb; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 3E40230006C
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 21:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id; s=aj.id.au; bh=HaYY0GJmGyW3PehGODbcBEU
 qoqU=; b=TYZQV8VbCG0+MECu/keu88vZNlhGbq24xAeP7fNP4w2nYrGCSqjLv5f
 dM+Btn/NU02J4uatK/185dySZofSwOlGpSIQBG+jWiV13tJvJlaYd84MVhlqmw84
 Z35QVLHK5VMWDjAYHZm/FvJjwnU3CqTOstxNxdapEGtSDqPJ4/ZY=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id D43F4300064
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 21:53:00 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH] Add palmetto target to runqemu
Date: Thu, 17 Mar 2016 15:22:47 +1030
Message-Id: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Thu, 17 Mar 2016 04:53:03 -0000

Hi all,

The patches modelling a bare-bones AST2400 in QEMU have been merged into
master for the upcoming 2.6 release. Attached is a half-hearted attempt at
integrating the necessary bits into openbmc so we can `bitbake
obmc-phosphor-image` then `runqemu palmetto` to boot the BMC kernel and some
representation of the userspace.

I'm not sure if the hacks I've made to runqemu{,-internal} are the right
approach or even something we'd want to carry going forward. Similarly, a
wholesale switch to qemu_git.bb might be a bit extreme - any thoughts there? I
must admit I haven't tried applying the AST2400 patches to 2.4, maybe that's a
better approach? Regardless, depending on 2.6 when it gets released is
prefereble, but that's probably a month or so away.

I'll split the patches up in the future, just wanted to get this on the list
for some feedback.

Cheers,

Andrew

Andrew Jeffery (1):
  RFC: Add palmetto target to runqemu

 yocto-poky/meta/recipes-devtools/qemu/qemu.inc     | 17 -----------------
 .../meta/recipes-devtools/qemu/qemu_2.4.0.bb       | 22 ----------------------
 yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb  | 21 +++++++++++++++++++++
 yocto-poky/scripts/runqemu                         |  9 ++++++---
 yocto-poky/scripts/runqemu-internal                | 12 ++++++++++++
 5 files changed, 39 insertions(+), 42 deletions(-)
 delete mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb
 create mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb

-- 
2.5.0
