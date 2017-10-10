Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::231; helo=mail-io0-x231.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E7hbk43W"; 
 dkim-atps=neutral
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yB0ZS3PBfzDr4W;
 Tue, 10 Oct 2017 12:55:59 +1100 (AEDT)
Received: by mail-io0-x231.google.com with SMTP id j17so7531118iod.5;
 Mon, 09 Oct 2017 18:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=91bxARHEdDAgsBYc58aHeFXJyqqus6aFjZTUuci+BoE=;
 b=E7hbk43WbwTWv3CpnulGVvEPZxrAJ8b6ntkEncqgxx3r6lsOugGwk4FfUIPziOBDHV
 Jz7rSsyyVXBYr58yzUt865eKEq/fekg2DAXGBbO4TM6gN6JCHHj/TA3FSy0pNG8ToPG1
 j9ZRxPqS/VLqn/uVeDH78Afr3WS06JnF7BRBnibXNuelMD0GDQ2+KAPRAAtSbP8waDfq
 Ei/nbVTN1D5E4EjGwyKLO6wBQtei+zKn5B+I5cAw8FKzEy5Q2udskTEO3ob9pziVyA7x
 R72NIzbKe/BH2zPG1FjQ+1yj8biFsu7s2rsLwwdtH44jfNGvTMZkbG1lRcpz3NCnZCuj
 m42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=91bxARHEdDAgsBYc58aHeFXJyqqus6aFjZTUuci+BoE=;
 b=Z2UiLndvtaQrAyoWSaEDRCc1ifIitn1jhbXhYTcr7D1sqzqFkZ7t9A/5z8XSaXay1S
 Edx3Pvd84tOmQ1ow0sRfCUS2Vti1rK9kdcGqmRVzRHefWjJCe/02AUEyPna6Uq1Yx4eO
 /ZeoiUCC0phYBPYkq2li9lDSMLFbD5kksG9Xu3bBGIhhaFKwp5ghZB8iwoNtv4xid+1X
 xWG+XSN8UnFyy4rNysgYtRlxIa+FrUzgyMafSmQUJoNcHYKTUq8oLqMcBTOvcK9G4lcr
 t7UjylRH7JA7ewEKXrn9MaOtDOF13zQ78JvP7wFnQEp5XaKLsisX9fFTrCQrNyCR46Zx
 IKlQ==
X-Gm-Message-State: AMCzsaXe2fMKlhkNWz/lYgZStjAeEtpZIzvVunLuVBZuvt5vWQ5iwQui
 5CZ6FP+WQs7TToOW61ebtIDtnBo6YnvF+x6O08E=
X-Google-Smtp-Source: AOwi7QC8bPsu7m4C/jdgOB42dl7QaFnwS6oyDxiecZNUyVr7xs3Oo7tea01cjp5IV90ucZcR+dPgZ1E9Dqdztaesdhc=
X-Received: by 10.107.147.86 with SMTP id v83mr12043110iod.82.1507600557666;
 Mon, 09 Oct 2017 18:55:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.9 with HTTP; Mon, 9 Oct 2017 18:55:56 -0700 (PDT)
In-Reply-To: <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 10 Oct 2017 09:55:56 +0800
Message-ID: <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Andrew Geissler <geissonator@gmail.com>
Cc: Chris Austen <austenc@us.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
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
X-List-Received-Date: Tue, 10 Oct 2017 01:56:01 -0000

Vote+1

I always wanted such a repo to put common/shared scripts together.

And even more, what about a repo that collects the common/shared code (C/C++)?

Quite a lot of repos are having the same/similar functions like
getting a service
via mapper call.
Is it better to collect such code, make sure they are well-tested,
and put them in a shared repo (e.g. in SDK)?

--
BRs,
Lei YU

On Tue, Oct 10, 2017 at 2:00 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> Brad, Patrick, and I were also tossing around a misc tools repo under
> the openbmc umbrella a few weeks back.
>
> I definitely vote for one!  I think the main concern was support, it
> would def be a "use at your own risk" and "patches preferred over bug
> reports" type repo.
>
> I know George also has a collection of tools he uses for REST
> operations as well.
>
> With https://github.com/geissonator/openbmc-events, I was looking to
> build a bunch of small tools, that had similar command line interfaces
> to interact with the different REST api's in openbmc.
>
> Andrew
>
> On Thu, Oct 5, 2017 at 10:54 PM, Chris Austen <austenc@us.ibm.com> wrote:
>>
>> https://github.com/causten/tools/tree/master/obmc I've also got those files.
>> things have evolved and I not kept the error logging or code update
>> refreshed to any of the new xyz paths. However, leds.py still can toggle the
>> LEDS on a system and obmcrequests.py (my library for bmc communication) can
>> work offline if the data has been captured.
>>
>> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
>> 10/05/2017 09:52:43 PM:
>>
>>> From: "Chris Austen" <austenc@us.ibm.com>
>>> To: Andrew Jeffery <andrew@aj.id.au>
>>> Cc: OpenBMC <openbmc@lists.ozlabs.org>
>>> Date: 10/05/2017 09:53 PM
>>> Subject: Re: OpenBMC helper scripts repositories
>>> Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>>>
>>> Mine too... https://github.com/causten/openbmc-tutorials
>>>
>>>
>>> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>>> wrote on 10/05/2017 08:55:40 PM:
>>>
>>> > From: Andrew Jeffery <andrew@aj.id.au>
>>> > To: OpenBMC <openbmc@lists.ozlabs.org>
>>> > Date: 10/05/2017 08:56 PM
>>> > Subject: OpenBMC helper scripts repositories
>>> > Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>>> >
>>
>>> > Hello,
>>> >
>>> > I've noticed that we've grown several helper script repositories, with
>>> > a mix of intents.
>>> >
>>> > So far we have:
>>> >
>>> > https://github.com/williamspatrick/openbmc-events
>>> >
>>> > and the seemingly more active fork:
>>> >
>>> > https://github.com/geissonator/openbmc-events
>>> >
>>> > Along with something Joel cooked up a while back:
>>> >
>>> > https://github.com/shenki/obmc-ctrl
>>> >
>>> > and some scripts that I've written:
>>> >
>>> > https://github.com/amboar/obmc-scripts/
>>> >
>>> > Is it worth consolidating these efforts? If we do I think the result
>>> > should be low friction wrt merging changes, and some hacking should
>>> > always be expected if you're going to use the repository. Consolidating
>>> > might help avoid duplicate effort.
>>> >
>>> > Cheers,
>>> >
>>> > Andrew[attachment "signature.asc" deleted by Chris Austen/Austin/IBM]
