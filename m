Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DYbdE/Kk"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fklt1ScNzF0RH
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 01:48:09 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id k19-v6so2911871pfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4xf4X+4hizuJeK9xwKwtbOeVWjWaV7l1K3Le88TMhWc=;
 b=DYbdE/KkWnbvFBdc1ESksB5n7+VPX4XvemrYYmrqvxPtklajtnm9jOZcpnLKhCILOU
 9aCMU/J6Gjr4TRITe4VBprTBR6VBMFCuv7M9IqdFY1NvzoZtYE9r0v2DNyzjhijWk6TO
 +E3blVXTnWK71nqZ82uZyHN2qlABklc9itjYHiPmRnZ+JWY1gKZNKC/lvftzpTZrMIGf
 4Yf51N9V+X6A7+IcjMETcnNK2q1CdzcK4nttJUrF6+EuQWuhUaNvdYrmnoRjjxjYiU9G
 gK1PnwjLeORMEL+59sGY/4UYxkmv56KSWx8POk2fmW6lmP6iN+368+Lq3nFDbWeqxkcS
 bZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4xf4X+4hizuJeK9xwKwtbOeVWjWaV7l1K3Le88TMhWc=;
 b=PUvZ5Dcp5uxhvsaQO79lLX2IF5zT4cE9/aOWyxYA7zmV0qEAd2x+oiCaVpNv0lax2w
 yxDPllprD34Q2EROUaO24VKIJeMDVlBayiZan/4I5hv7RyulKFiYacorxloMXwYphvn0
 POJHJ7seJIjS0Yt4PhbHQYv8/2JLdoHs9TvZPCZUJ0UMJenspKzcO+CFyLlASpQS5Wea
 15+HUhSHVV0bO++rMntmAB6lRyKMNPaVKydTzbn+nmiVppCKcgvfLZJk6QgoBOTytSIP
 NDOXu4H2By+KuT9duohru2h7DmK1wO6UXoMeN4OHJJjVjpI4IzHnhaxFfnAokBoce51n
 aIGg==
X-Gm-Message-State: APzg51Arv6Fwgqczyfvxzu+c1Zn0D2kJhnJXNi1XoVpRC1PfB/wSLTGm
 HpZOrWVza3iLPP/YkPA4ePjvwLLbVjsi6yqfE/NyqD9z
X-Google-Smtp-Source: ANB0VdanSgfiH7lxkOkfXM98z+dmp88Rs/6rUuEjc54vX9RkKz+4zSVCkaTLAhnMTCq44XZDB0jWuQJpNSyfcEI3x+0=
X-Received: by 2002:a63:6c04:: with SMTP id
 h4-v6mr20264418pgc.290.1537372086453; 
 Wed, 19 Sep 2018 08:48:06 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 08:47:54 -0700
Message-ID: <CAO=notzdS19X69xpgSUkT5uZhKm0Wv623aThWtsnhRX2NpWJ9A@mail.gmail.com>
Subject: Repository Growth
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Wed, 19 Sep 2018 15:48:11 -0000

With the growth of number of repositories, it might be overwhelming to
someone who wants to set things up.

I'd like to write up a directory that groups the repositories by
purpose.  I wasn't sure if this made sense, so I wanted early feedback
before I started.  The maintenance of it would be horrible for one
person, but if someone wants their repository to have details and so
on they can add it.

I think it's important or useful to know what's out there and how
things work together or don't, and what options there are for
developers.

Thoughts?

Patrick
