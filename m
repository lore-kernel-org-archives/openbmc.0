Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ME6p12Gf"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gyPp5WgczF3CD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 06:49:34 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id e14-v6so4800376oie.12
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 12:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zNqyUmjr+2qyouVK03WY8bmK1RRF6c2hXqAOYw0GJZI=;
 b=ME6p12Gf8aJOKjrC4XRkM/0FaI3I6X3NdB7jfyxI0g1Ehm7u5boh7jxQX/lySKRC4l
 4PlSLmoXeBCqYIIkw8ozrTJsjIi6fOREaawhbCwWLhW5ENa5MD5IntKsHcgQuixTg8qV
 Nkkplz1DTmmjosF+ICNMTN8qHZ6xWv2VWVrAg07H3/1znCeJLH5tG02zNao3QcWExWXy
 EtYT+kp6cWikIjQy+35EAGxnUpWUdK9oJca9choxbLc6w8ZBcpyP/+xJjh7bRs3yH2BJ
 gcYy1wkgP65pG52EZAOCnDh5jU6v+X1gv0Y5tGaeCOgQJrs8YCFYnO914P/VN05ri5mF
 A5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zNqyUmjr+2qyouVK03WY8bmK1RRF6c2hXqAOYw0GJZI=;
 b=MJ7soPKcF+r1eoXon70gkUNrGPh33GTaI62PMzwyTIZQDmhtAq/anE8tVDJrZKYC9P
 Cj+0oTREej2h0SyhPw1aCstm4hsLFkFnJ+SGYuWR26jGqySDl3xu0znOij1KVYrI8MLe
 CxpH8fcIDcXws5RFw2tbCZgUyDhimIe+RUI+qCbvdG4VZyfpiaQosatS5ybDtMm82Vth
 inqrEoI7SKBun9CM01moaxOYalDXWevRKJe8w9bJZ3DBV1heRHN+J67xHpZ0mJYP0mPt
 wpg3nQIDcUTxng+LNbVb0xEhgKbfEMhlFa176PVOlDQObyxT8NwzUGjtZBBzwc16A2ak
 hoxA==
X-Gm-Message-State: AGRZ1gKZp7GOQoAIlFtuodhaeDJlQH4zs1LLyF7pmdMEmc3Sub4frhWV
 JKkGS+p8ScFnuzZyqQu0BkUv27+H+AuaBcT7EC8oIg==
X-Google-Smtp-Source: AJdET5f04Tya3yRtJlmnUmpjLzIBSdM22GfkgOAnon5dIs4VxNTiVb74lV7h7gOmjMDEahvmw1g+6NPLOxlPQGdoNro=
X-Received: by 2002:aca:3c4:: with SMTP id 187-v6mr401994oid.47.1540496971781; 
 Thu, 25 Oct 2018 12:49:31 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 25 Oct 2018 14:49:20 -0500
Message-ID: <CALLMt=pqTesc1qD3wCsv6GTZVRgh2CM1_zF+PM3VVGiDyKf6Qg@mail.gmail.com>
Subject: jenkins.openbmc.org ?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 25 Oct 2018 19:49:36 -0000

I'd had on my list for a while to move us over to a jenkins instance
running on the same server as our gerrit server. The reasoning was:

1. OpenBMC has grown to the point where it deserves it's own jenkins
instance, and tying it to openpower.xyz doesn't really fit anymore.
2. The gerrit server (and the new jenkins server) are running within
Softlayer which has 24x7 support (openpower.xyz is running on donated
hardware from Rackspace, which is awesome, but support is mainly 2nd
hand via emails to contacts we have at Rackspace)
3. There have been a few instances where the openpower builds have
affected openbmc (and vice versa).

I went ahead and created a new jenkins instance at the above domain,
but haven't done anything with it. I've been kind of wishy-washy on
whether the extra work is really worth it. It's been quite nice having
Joel maintain our openpower.xyz server with all the security updates
and such :)

Thoughts from the community?

ps: gerrit.openbmc.org will also redirect to our gerrit in case anyone
was interested.

Andrew
