Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPwF85hkRzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 13:20:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145809482524149.146441085901074;
 Tue, 15 Mar 2016 19:20:25 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] use glibc 2.22 to work around assembler
 error
Date: Tue, 15 Mar 2016 21:20:23 -0500
Message-Id: <1458094824-30066-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Mar 2016 02:20:29 -0000

@shenki after our buildroot was seemingly re-worked from upstream master, initramfs builds have been failing[1] on openpower.xyz.

```
03:57:49 ../sysdeps/unix/sysv/linux/powerpc/powerpc64/setcontext.S: Assembler messages:
03:57:49 ../sysdeps/unix/sysv/linux/powerpc/powerpc64/setcontext.S:367: Error: junk at end of line: `1,0'
```

They work fine if I build with glibc 2.22 instead of 2.21 however, so this PR adds this specification to the openpower config we're creating. Builds now succeeding[2].

[1] https://openpower.xyz/job/initramfs-build/9/console
[2] https://openpower.xyz/job/initramfs-build/12/

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc-build-scripts/8)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc-build-scripts/pull/8

Chris Smart (1):
  use glibc 2.22 to work around assembler error

 initramfs-build.sh | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.1
