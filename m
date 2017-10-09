Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ECCOe3j5"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9p1V2lmVzDqyw;
 Tue, 10 Oct 2017 05:00:14 +1100 (AEDT)
Received: by mail-it0-x22c.google.com with SMTP id n195so13782748itg.2;
 Mon, 09 Oct 2017 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Qul3GXDe5RcS652ZeoIJLbvpoCs7uty4y3tLbLHvl3M=;
 b=ECCOe3j5jUL2UjqWWV7ftkXYu6qFm7Zwms7EUvZ+GnyAAOyKWmk5z99b0oXuW6FuqO
 MfsHrNIfnW+qovk4qHZI5d4DXZFL3pxGaoT1xTFSdw4vCWxreEYocb2YryXjdDpCyNbz
 uklS0RMw6rzzJq3mWUr98kAUbgXg761dnVkt3FF+7+nOX90n5OxvpZhRwpoBkddmwxtg
 PzY040SlQpuUkq6tcIWs/Oew0ATI/rowkSdx2ZzBAwRSup54tKC/zp0Pq7etkT6qF94X
 gkZVRFUv5VhQ5HuJWoAr0mrW9uKkug00Kdi61pnhYrX6jJS+SkLhYnHhKn2EXbbyz+tk
 CHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Qul3GXDe5RcS652ZeoIJLbvpoCs7uty4y3tLbLHvl3M=;
 b=cGbZvv+Io1hJLh/cH1rpwYktxgWtY3/hCWmmGiWUn3NVPWE0g5cY+T+Ji0fAZxYfIv
 Ls/EUw0zvXBxlgyTsElhfZNl0ZimbQU6LE6d+ifRezM2Ens2JTrpRXqIg0nqYmluxjis
 /6zpcQfpa60uuHG4VKBf3JF6JD2qNeD66pGkQrE4QAPI3QNFYe3hF5D165FqyRHJHgQS
 /XEOR8OVAmv8Q/8ozZSOq4aBdNfa8LS/wOR8Wylb4PrHNLWqzb7h4Ux66EbXiePOQREg
 w8o+yQbYMtpGbxCKMSty3faV5A7roOp+AnUP8QUCUdOtrNP31cPutCZXzCBmOkSWvhWj
 90aw==
X-Gm-Message-State: AMCzsaXF3K0ry/HWcTgyrfhF5UiN/ZhzYMq82oaoj96E1G5THkIkC0kK
 IgFvpvFDx6QIug0WhYfIWiGHzKD47ZkrFCAstXQ=
X-Google-Smtp-Source: AOwi7QAMaVgdx0IBojTOcccscQ3iKn7nqcLQgS7dRossNEjRXrgNoUOaQW2T7BDx+Pye1q0VrVSVREOd440ZU9Us098=
X-Received: by 10.36.111.194 with SMTP id x185mr13243119itb.54.1507572010276; 
 Mon, 09 Oct 2017 11:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.51.73 with HTTP; Mon, 9 Oct 2017 11:00:09 -0700 (PDT)
In-Reply-To: <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 9 Oct 2017 13:00:09 -0500
Message-ID: <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Chris Austen <austenc@us.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, 
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 18:00:15 -0000

Brad, Patrick, and I were also tossing around a misc tools repo under
the openbmc umbrella a few weeks back.

I definitely vote for one!  I think the main concern was support, it
would def be a "use at your own risk" and "patches preferred over bug
reports" type repo.

I know George also has a collection of tools he uses for REST
operations as well.

With https://github.com/geissonator/openbmc-events, I was looking to
build a bunch of small tools, that had similar command line interfaces
to interact with the different REST api's in openbmc.

Andrew

On Thu, Oct 5, 2017 at 10:54 PM, Chris Austen <austenc@us.ibm.com> wrote:
>
> https://github.com/causten/tools/tree/master/obmc I've also got those files.
> things have evolved and I not kept the error logging or code update
> refreshed to any of the new xyz paths. However, leds.py still can toggle the
> LEDS on a system and obmcrequests.py (my library for bmc communication) can
> work offline if the data has been captured.
>
> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
> 10/05/2017 09:52:43 PM:
>
>> From: "Chris Austen" <austenc@us.ibm.com>
>> To: Andrew Jeffery <andrew@aj.id.au>
>> Cc: OpenBMC <openbmc@lists.ozlabs.org>
>> Date: 10/05/2017 09:53 PM
>> Subject: Re: OpenBMC helper scripts repositories
>> Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>>
>> Mine too... https://github.com/causten/openbmc-tutorials
>>
>>
>> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>> wrote on 10/05/2017 08:55:40 PM:
>>
>> > From: Andrew Jeffery <andrew@aj.id.au>
>> > To: OpenBMC <openbmc@lists.ozlabs.org>
>> > Date: 10/05/2017 08:56 PM
>> > Subject: OpenBMC helper scripts repositories
>> > Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>> >
>
>> > Hello,
>> >
>> > I've noticed that we've grown several helper script repositories, with
>> > a mix of intents.
>> >
>> > So far we have:
>> >
>> > https://github.com/williamspatrick/openbmc-events
>> >
>> > and the seemingly more active fork:
>> >
>> > https://github.com/geissonator/openbmc-events
>> >
>> > Along with something Joel cooked up a while back:
>> >
>> > https://github.com/shenki/obmc-ctrl
>> >
>> > and some scripts that I've written:
>> >
>> > https://github.com/amboar/obmc-scripts/
>> >
>> > Is it worth consolidating these efforts? If we do I think the result
>> > should be low friction wrt merging changes, and some hacking should
>> > always be expected if you're going to use the repository. Consolidating
>> > might help avoid duplicate effort.
>> >
>> > Cheers,
>> >
>> > Andrew[attachment "signature.asc" deleted by Chris Austen/Austin/IBM]
