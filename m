Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MaKRGHQu"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jz150BZlzDqQb
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 04:23:52 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id x202so15116721oif.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 09:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LWme1KnkrfMxAk/fb7uxiDpS0jjgaBuNvUWosF0wWPc=;
 b=MaKRGHQuIXWnu/ME8lglgOy7kBG4XMqJ4ljQxqgJQWGt5SRy8znuVK7nBs81U9PnTD
 EFA+8NFOOpk8LZ4WBTA2+uz/63fMQq6C6ucKyiCfDOB/nJAaNkuiQdRy0nV5vbCy0Fgh
 L3/AY+LfIB0yZz5Y/2yUPch4nsmQofvRypCkeTma8xTJnwPTAdpAa2BIJqETyIRb1OTg
 f47p/bLH3JaQjyE9QKYlTpXKvBWntP0JRXWDVmVUqkxlCMWYZJXgJ/313XeCoFly+AEo
 5o6aebsy2adx/pZDtx444XXaI2X/ainP9wURMi6gx2CD6Eu2AwuhDbdKgMDH5qudCkFw
 dp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LWme1KnkrfMxAk/fb7uxiDpS0jjgaBuNvUWosF0wWPc=;
 b=r1FULiZDhSm+4n5PlWWtsUPgAFnFANczd76nEedM5F3cJbZEpFYetaLaQmgJuTFJKy
 79cIUU0w3ZoqjtX6MFtICdJx0ascavTXDlu/hYQhnrIlUNYTpBEpqWXKWTBhfOhGofDN
 INTaGUoLejUABwaXuL81RfnkW8olJam/IPnh96CVdpUQJUPA2E7QYmPg34AIX87bTd48
 tK2ozM7b5XYmngyeJrE9CnAUPqVNNo6A2vX3e3locA76EPUoyqwVa9cImp1YedUqhuD7
 xNe7XawwCgw4neSyvjjnlggr6NxZsS7eNGKk3HI3kQ7SHMoYVcZcVSa3X1NOfNQJQdgH
 aHqg==
X-Gm-Message-State: AJcUukdb5ECS033V84a/FNmXHWtjGlP9SqbPGkQG6D/j+VhhYvjGEwSI
 tGZvult6nAYYJ4TUPCAIYKiNnzyL1I2heX2NzhAerJT/
X-Google-Smtp-Source: ALg8bN49pbBEayLthcctAIkAfShm/bsOop6V32+suZsyGKaN4zNswFqJoxnNsjlGbrLqbj9Vvxu7O8t0hNVzYHHqGQQ=
X-Received: by 2002:aca:5587:: with SMTP id j129mr6349173oib.93.1548091430659; 
 Mon, 21 Jan 2019 09:23:50 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 21 Jan 2019 11:23:34 -0600
Message-ID: <CALLMt=rmk2=ranWssd=TEOZy=sH=RWzKjkSbAEn=V9tY7Ozk+Q@mail.gmail.com>
Subject: Thud branches required in certain repos?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@intel.com, 
 Matt Spinler <spinler@us.ibm.com>, William Kennington <wak@google.com>,
 dkodihal@linux.vnet.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2019 17:23:54 -0000

Recently we created a Thud branch (i.e. 2.6). Currently we've just branched
the openbmc/meta-* and openbmc/openbmc layers.

Pre repository CI (i.e. https://openpower.xyz/job/openbmc-repository-ci/) had
its scripts updated to support the new branch. Basically if a change comes in
from a branch, it will attempt to find and use that same branch from all of
the dependent repositories. If it can't find the branch, then it will just
use master from that build.

Dependent repositories are repositories that most repositories depend on and
are always built as a part of the per repository CI process:

  phosphor-objmgr
  sdbusplus
  sdeventplus
  gpioplus
  phosphor-logging
  phosphor-dbus-interfaces
  openpower-dbus-interfaces

In general, just using master from these dependent repositories will work. We
only run into issues if some sort of API or data type change occurs in master
that is not compatible with the branch.

To avoid weird errors in the future though, I'd like for the maintainers of the
above repos to create the corresponding branch in each of the above repos
whenever a new branch is created for the openbmc project.

Adding a branch is easy, just go to your project in gerrit and use the
"Create Branch" option. Be sure to put the "Initial Revision" commit at whatever
we were at when the Thud branch occurred and call it "thud".

Other ideas or thoughts?

Andrew
