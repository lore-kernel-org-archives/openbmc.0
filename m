Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDMDK2JV"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gdNZ6Z3mzDqSJ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 23:02:52 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id i21so7830209oib.11
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aqw8JTSGohYgAYsi4BxJIRJsue1HJz6utFQUoUM1Pcc=;
 b=jDMDK2JV6WdNDGGx5VICtB9NL5rYRwfh3Z7Yh1Pyc8sOacpK45D48hqotNPbcN29YO
 ECFGHAKEK4gQ3mhr7OOT5iN0KzOqZEUSBSHQ1UA/Hg8OYi0rW4n8LZMnbwITy2UisnX7
 XfzA78xaZKF6JWr9zeEqUTQuHOYzGogoIyJ74WvGGK9GUHPIViNcR5512y2EnxSsKk+9
 Nm2opjBJYIBngbmSwqHA+PudOpue9wV99zMrv2SIhagcNMV4wm0eKk49ULNChcvaY7bo
 ZhHYCP8uqIbwlpp/d19FAPyqZqUvrIN2mCUgAYAlsSpY5jIx3aBplE7Ucr6vZGNkOSg9
 A9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aqw8JTSGohYgAYsi4BxJIRJsue1HJz6utFQUoUM1Pcc=;
 b=cUg88Qq9PYWO2MtuMTl46TA/zT1VLbwD45ytGXpjYkFXyx+sw3ZkL7Mq3/lSp5G9Ow
 m84Xk7fNd5FUZ444SbyR1Yp+P6wQs2pcpa9C77cRjpfvo/OVsFVQHAo1+4bYQGxsdmAQ
 CsJMKaK4kRGhPZC/SOTASFTqx6aPcQWT/RJ17nZ8CYKvydUme0YUu/uU7MVHjPBNLH5V
 sukzdn1mC0//5jjgjyYyLHFsorTM9sYhBAf//8QceKKtEw7AkzDvaXtRF59exWR1uh3w
 cuBkAV/EIs0iHkZCM3bHm2v7ovtXn1b881rbZ9xatAtPAXKO1//sGxVZWF4K3WVcRfWU
 kknQ==
X-Gm-Message-State: APjAAAXtVp1OvJYx9+eISMtYEIhkjrT7MTqxAJ/fw2HVZcE3sdAT3XBt
 VqmHQzSfQuW2vX08YJ7rKnIcPzD1bGFsuI8MlFs=
X-Google-Smtp-Source: APXvYqyUCV+1UUCPAmotAeEchadcZbcwCiW7QdA4OLP+OvDTwl0umv6azJg2lFjkUqHeEb102iIT5JxU6j4wG1ZLByM=
X-Received: by 2002:aca:bcc1:: with SMTP id
 m184mr10096100oif.158.1555074170168; 
 Fri, 12 Apr 2019 06:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
In-Reply-To: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 12 Apr 2019 08:02:34 -0500
Message-ID: <CALLMt=pr8dtGZFvd17nt3qC7ebOvrkMQC8E+h==P4FSNkGDAtA@mail.gmail.com>
Subject: Re: BMC health metrics (again!)
To: Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Fri, 12 Apr 2019 13:02:55 -0000

On Tue, Apr 9, 2019 at 11:26 AM Kun Yi <kunyi@google.com> wrote:
>
> Hello there,
>
> This topic has been brought up several times on the mailing list and offl=
ine, but in general seems we as a community didn't reach a consensus on wha=
t things would be the most valuable to monitor, and how to monitor them. Wh=
ile it seems a general purposed monitoring infrastructure for OpenBMC is a =
hard problem, I have some simple ideas that I hope can provide immediate an=
d direct benefits.

I like it, start simple and we can build from there.

>
> 1. Monitoring host IPMI link reliability (host side)
>
> The essentials I want are "IPMI commands sent" and "IPMI commands succeed=
ed" counts over time. More metrics like response time would be helpful as w=
ell. The issue to address here: when some IPMI sensor readings are flaky, i=
t would be really helpful to tell from IPMI command stats to determine whet=
her it is a hardware issue, or IPMI issue. Moreover, it would be a very use=
ful regression test metric for rolling out new BMC software.

Are you thinking this is mostly for out of band IPMI? Or in-band as
well? I can't say I've looked into this much but are there known
issues in this area? The only time I've run into IPMI issues are
usually when communicating with the host firmware. We've hit a variety
of race conditions and timeouts in that path.

>
> Looking at the host IPMI side, there is some metrics exposed through /pro=
c/ipmi/0/si_stats if ipmi_si driver is used, but I haven't dug into whether=
 it contains information mapping to the interrupts. Time to read the source=
 code I guess.
>
> Another idea would be to instrument caller libraries like the interfaces =
in ipmitool, though I feel that approach is harder due to fragmentation of =
IPMI libraries.
>
> 2. Read and expose core BMC performance metrics from procfs
>
> This is straightforward: have a smallish daemon (or bmc-state-manager) re=
ad,parse, and process procfs and put values on D-Bus. Core metrics I'm inte=
rested in getting through this way: load average, memory, disk used/availab=
le, net stats... The values can then simply be exported as IPMI sensors or =
Redfish resource properties.

Yes, I would def be interested in being able to look at these things.
I assume the sampling rate would be configurable? We could build this
into our CI images and collect the information for each run. I'm not
sure if we'd use this in production due to the additional resources it
will consume but I could see it being very useful in lab/debug/CI
areas.

> A nice byproduct of this effort would be a procfs parsing library. Since =
different platforms would probably have different monitoring requirements a=
nd procfs output format has no standard, I'm thinking the user would just p=
rovide a configuration file containing list of (procfs path, property regex=
, D-Bus property name), and the compile-time generated code to provide an o=
bject for each property.

Sounds flexible and reasonable to me.

> All of this is merely thoughts and nothing concrete. With that said, it w=
ould be really great if you could provide some feedback such as "I want thi=
s, but I really need that feature", or let me know it's all implemented alr=
eady :)
>
> If this seems valuable, after gathering more feedback of feature requirem=
ents, I'm going to turn them into design docs and upload for review.

Perfect

> --
> Regards,
> Kun
