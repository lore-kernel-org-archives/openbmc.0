Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PmbuEiWp"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44mF8t2jCNzDqT5
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 11:08:44 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id p23so5551512iol.13
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 18:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ztbea/BlWNYSjNqMKKuH4gLJOvAcg4t//HjhE0wK2+o=;
 b=PmbuEiWpkK+iqyelzte/xjebYqsUeDBTy1cE9XCz2fQKbdWAvSGXvThwjxMs74BTh3
 jW9lCE1icrig9+F4QPrRtigNe0Y1csxCS0zQpvzCq5VR4qtHIz8KBn6KnuOB0vLBZfST
 bjrxAGYIwEIvAH/u2sAVy4ko7/fSzVXma5QVaLr27F+vsT+xdSY9MuGsS3cwh3M5e0dn
 /p+QEac61HqzRQD5gLGHQAHm3g39wWI+shAXuRr5PjMkhX4yiM2kZLbK8OVmJT4X8Cq2
 ggH8y3AJwyrPPTn4EeuxKghnUJrlfxRzzRO9HuMo3npyOuhzunpLnpRyNLjwqVCyWfJ8
 dNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ztbea/BlWNYSjNqMKKuH4gLJOvAcg4t//HjhE0wK2+o=;
 b=imuiND/nIMe5lM5zW29WkorIOKUSeZ5tN1HS+pIe4k2myTDkOkHytd6RophZV3xLsj
 CqBnXaf9rb0StFJefIjOMdmzsRlfETNH5H4cN5lrNox/beHDWN1wvGuSDJk6PG7NYcBy
 0BZ84oPh/0t2dbeBkwQesucjJDDKzfqcUuk4gClV0LQmAD1zjv29IGL4zpYKMMOUBPpM
 C7z0EUB5P+Pd/5KhvsbYTW+uho2/R1FQO+ExZrWlPxoxZIHZB7niBDI/m/CvWU3ecnwz
 UeiYLnwzUZ42sm/srwSNGR1yTCUr5MU0ioBdB7GTRUhB8CRHJgR7CVXK85tkaFkHSYRf
 /1Vw==
X-Gm-Message-State: APjAAAUg1MdV4VfKQSPu4IorqWPZiQPyDae5sJE5vfyZf92caQnwNe1P
 R2Us/PDq9q7EcqpjQmxH/oXhqz4/3nEQ59MoWxOnjA==
X-Google-Smtp-Source: APXvYqy34r9xkPZ+NtHrOGTjBSziCCTv6aQ5L1yzYC9JRwsh26/aJIe5S7VL1a81LYkoWkgNMVAF903biHMbystkKhk=
X-Received: by 2002:a5e:a804:: with SMTP id c4mr4722364ioa.15.1555722521371;
 Fri, 19 Apr 2019 18:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <CALLMt=pr8dtGZFvd17nt3qC7ebOvrkMQC8E+h==P4FSNkGDAtA@mail.gmail.com>
In-Reply-To: <CALLMt=pr8dtGZFvd17nt3qC7ebOvrkMQC8E+h==P4FSNkGDAtA@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 19 Apr 2019 18:08:15 -0700
Message-ID: <CAGMNF6XiuzC+_1wg0S4zHRCP3Qrto3zW=B2d8BNJf3-WxuS+4g@mail.gmail.com>
Subject: Re: BMC health metrics (again!)
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 20 Apr 2019 01:08:47 -0000

On Fri, Apr 12, 2019 at 6:02 AM Andrew Geissler <geissonator@gmail.com> wro=
te:
>
> On Tue, Apr 9, 2019 at 11:26 AM Kun Yi <kunyi@google.com> wrote:
> >
> > Hello there,
> >
> > This topic has been brought up several times on the mailing list and of=
fline, but in general seems we as a community didn't reach a consensus on w=
hat things would be the most valuable to monitor, and how to monitor them. =
While it seems a general purposed monitoring infrastructure for OpenBMC is =
a hard problem, I have some simple ideas that I hope can provide immediate =
and direct benefits.
>
> I like it, start simple and we can build from there.
>
> >
> > 1. Monitoring host IPMI link reliability (host side)
> >
> > The essentials I want are "IPMI commands sent" and "IPMI commands succe=
eded" counts over time. More metrics like response time would be helpful as=
 well. The issue to address here: when some IPMI sensor readings are flaky,=
 it would be really helpful to tell from IPMI command stats to determine wh=
ether it is a hardware issue, or IPMI issue. Moreover, it would be a very u=
seful regression test metric for rolling out new BMC software.
>
> Are you thinking this is mostly for out of band IPMI? Or in-band as
> well? I can't say I've looked into this much but are there known
> issues in this area? The only time I've run into IPMI issues are
> usually when communicating with the host firmware. We've hit a variety
> of race conditions and timeouts in that path.

Good question. Mostly for in-band IPMI, because we didn't have much
experience with OOB IPMI. :)

Compared to the other proposal this one needs to be fleshed out more
for a design proposal. I'm currently low on resources but will pick it
up soon after the next 1-2 weeks.

>
> >
> > Looking at the host IPMI side, there is some metrics exposed through /p=
roc/ipmi/0/si_stats if ipmi_si driver is used, but I haven't dug into wheth=
er it contains information mapping to the interrupts. Time to read the sour=
ce code I guess.
> >
> > Another idea would be to instrument caller libraries like the interface=
s in ipmitool, though I feel that approach is harder due to fragmentation o=
f IPMI libraries.
> >
> > 2. Read and expose core BMC performance metrics from procfs
> >
> > This is straightforward: have a smallish daemon (or bmc-state-manager) =
read,parse, and process procfs and put values on D-Bus. Core metrics I'm in=
terested in getting through this way: load average, memory, disk used/avail=
able, net stats... The values can then simply be exported as IPMI sensors o=
r Redfish resource properties.
>
> Yes, I would def be interested in being able to look at these things.
> I assume the sampling rate would be configurable? We could build this
> into our CI images and collect the information for each run. I'm not
> sure if we'd use this in production due to the additional resources it
> will consume but I could see it being very useful in lab/debug/CI
> areas.
>
> > A nice byproduct of this effort would be a procfs parsing library. Sinc=
e different platforms would probably have different monitoring requirements=
 and procfs output format has no standard, I'm thinking the user would just=
 provide a configuration file containing list of (procfs path, property reg=
ex, D-Bus property name), and the compile-time generated code to provide an=
 object for each property.
>
> Sounds flexible and reasonable to me.
>
> > All of this is merely thoughts and nothing concrete. With that said, it=
 would be really great if you could provide some feedback such as "I want t=
his, but I really need that feature", or let me know it's all implemented a=
lready :)
> >
> > If this seems valuable, after gathering more feedback of feature requir=
ements, I'm going to turn them into design docs and upload for review.
>
> Perfect
>
> > --
> > Regards,
> > Kun



--=20
Regards,
Kun
