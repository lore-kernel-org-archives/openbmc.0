Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2/BzhDi"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn2lY5hPVzF0qN
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 16:21:45 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id c19so4924917qtm.7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 21:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X0qDSeIEXeKGaB3ej1Nsy51M7+BLu9/xX0XzXgUm36Q=;
 b=k2/BzhDicPdH9D6FoBy+jGaHJBaISos1gasVvmlqbmTPNfZYxU2qOcofvz4nzRVjNW
 6qWDAev+XhLtEqaIKjJ1d8eXW64og3ZLeBSH3J5ZoBIrzZeI97zMtEhzvCGKCDK16K22
 pFJxstCTbLNLzz5ycO5t5phnPf/W6LjOb421gmUJIV4sNqRmQKReZFYfO9JPKpi24dsK
 f2QwtPc4TPJs/IE7ov/amWdOKHjZCjouh2gLwNi6phEk/Zv8gkaReqUVoy3bv8T4CIIW
 PBXtX4aoOieugiBYhr6n7wLT8Pl5W6d5iTMPge63lV8Smz/9oMVDbLY8OHKbfvt9owoo
 SXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X0qDSeIEXeKGaB3ej1Nsy51M7+BLu9/xX0XzXgUm36Q=;
 b=jD2XfexsQv+f5kGXJheuYMu/BAc8mGKKN+sl5RF3FkAdZnLulehhgqbSCWB0sdgO4q
 j/UrF+STLcR86KV/sEaylbCSjOFto+mIOkdMIFJVDFUjy1vmMymvTgyx+X9PXL3SG31g
 TnLQF4QaQeRPboCdT7km9eK1cw4Xd9NapKu9tDcmgzZsaFFKb3qVqSbxpfJXPucKwXJ+
 98fGFeQBzjVfA/0BzwI1rju8VYP/fxCWjZriPiwM9lQQOS1+EITAeayCvMeZpz9HoQ+J
 oEwvX+ICF3XFUx06QJent7G10GccG7e5/gbyJCZBnkUvIM4eVBgA9RO8x0ZsjS/Cc8j6
 QgxQ==
X-Gm-Message-State: APf1xPBb/pTyqRT7Geie3LHrePz6HglW0slUO6NRNUFr5P7DCO5TVy/8
 MxcvoMae4jekG5eQDn4Z/APTX8NfAxFDYEmgerk=
X-Google-Smtp-Source: AH8x22516zGxht7WNfNKrI3bJnAvmMGFsqV+lkRRtsMUnpqS7EAlhcsx47kPzgJ4bDHNOwG9YtjBeEjvk+VzsiZl1rA=
X-Received: by 10.200.40.70 with SMTP id 6mr9593041qtr.285.1519276903204; Wed,
 21 Feb 2018 21:21:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 21 Feb 2018 21:21:22 -0800 (PST)
In-Reply-To: <1519192470.3569.1.camel@mendozajonas.com>
References: <20180215033057.1766-1-sam@mendozajonas.com>
 <CACPK8XfYRUa4rj-pNhGMq7K3OkXgSsdO+nDBsDKXpZtBZVEbVw@mail.gmail.com>
 <1519192470.3569.1.camel@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2018 15:51:22 +1030
X-Google-Sender-Auth: WN6XyO9BoMrUz31d70sItxg4hmo
Message-ID: <CACPK8XesK9Lhz+GMMnOAMcMkBAkW0DLw2KwzcFxxA=HwrHEM4g@mail.gmail.com>
Subject: Re: [RFC PATCH] net/ncsi: Add generic netlink family
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: sdasari@fb.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 05:21:46 -0000

On Wed, Feb 21, 2018 at 4:24 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> On Thu, 2018-02-15 at 14:50 +1030, Joel Stanley wrote:
>>
>> Would a netlink API mean we would have to write some userspace tools
>> to perform this configuration? Do you have any code for that?
>>
>
> And after some cleanups we have https://github.com/sammj/ncsi-netlink
>
> Pretty straightforward piece of python, but it does require python-libnl
> on the BMC which Yocto doesn't package by default.

Nice.

Where to from here? Do you want more testing on hardware?

Otherwise we should submit it upstream. We don't want to introduce any
dependencies on the userspace API until it is merged by Dave, so
getting the ball rolling is important.

Cheers,

Joel
