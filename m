Return-Path: <venture@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wk7th5mNgzDqSS
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 01:02:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O5WE1KJI"; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 9so18128530pfj.1
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DdvZ9n5+6BddOCz5XXdafyrd5P9e+0mgc8kjrtuaz9w=;
 b=O5WE1KJIL8n22f1vZJbkbILvnn2wB2FVUBXHuylTxAwzbnX/XXEo0ZNuWyoMIGoDjp
 1xFU8pFFL5ZmGFqW1ZrsqN55XM2jngX40gSoSa4lbEe8/4jeLWSPJ0LM222WwZLqLIVD
 2H4j4OSKPEfucnF3eoD++v9A6/OsOHkuvhgF6cdylPBvhjjc9MPpOV8OIcWNiQgyZDQP
 h8EKj6eztVPMFVBzoBzO3/EGJhPE7sIEmaHl1rzX8x/egPMY/u/1yyxhRLMs+QAYzZ0B
 UaWtXn1s3BmsD/cUUm6YEf8/GPG55m/h//V/KlDLgoVDzPhZDlVKnnuc8979+pSlvLRs
 7F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DdvZ9n5+6BddOCz5XXdafyrd5P9e+0mgc8kjrtuaz9w=;
 b=Khv5XgV7t8xFijtucw5/ZmZgiwqkHCWOgmo8BUkVcy/9yhKvA9CZW8CsBCnuKG6kn7
 HLqZ85fZ/WOvL6f91U495Qr89OhAWKOyf+8yKOUhJtS3U/5dVLIX12cOmQEX5gZuWH9g
 NXnSKSTvxgi8KJr2mLgcLcZ7tuK9DIdoL9ryv6i3FDNsDA/Jf/1g36SmUgnCN2aJoBD0
 QMdnVxzV62LHEDkGwg+IvrinY3RbojPdHT39kxkd6Dpjn3wZn0mt+y+NO45sxZtJgGXY
 hKIILalAMOuglEog8U0LIIiyuzGYC7bTqTeCFBzkgiAJ7osM578+ZYu13l4cL6DQm32g
 Uf7w==
X-Gm-Message-State: AODbwcDhilRfS72UKbd/l8yLEAZLg6yf0VVDTaWAZ69GDTbocJw8fG4+
 7HVyBGAJip2ggpVlZkUg8AdCu3RlVOf+3uU=
X-Received: by 10.98.34.8 with SMTP id i8mr24760247pfi.194.1496934122315; Thu,
 08 Jun 2017 08:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.160.108 with HTTP; Thu, 8 Jun 2017 08:01:41 -0700 (PDT)
In-Reply-To: <OFC991E0D3.6E4146E7-ON86258139.00503142-86258139.0051A0EA@notes.na.collabserv.com>
References: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
 <CACPK8XdMs6DQRk2DWAYwgtta3cGfpEm9mjZ7TqFCsADj4LW5oQ@mail.gmail.com>
 <OFC991E0D3.6E4146E7-ON86258139.00503142-86258139.0051A0EA@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 8 Jun 2017 08:01:41 -0700
Message-ID: <CAO=notx3sNJ9avo8H7bpMhuKsMx-fXd3+LT+B5d7QPojqPnxEQ@mail.gmail.com>
Subject: Re: New Platform Guide
To: Chris Austen <austenc@us.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 15:02:05 -0000

On Thu, Jun 8, 2017 at 7:51 AM, Chris Austen <austenc@us.ibm.com> wrote:
> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
> 06/08/2017 02:10:26 AM:
>
>> From: Joel Stanley <joel@jms.id.au>
>> To: Patrick Venture <venture@google.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Date: 06/08/2017 02:11 AM
>> Subject: Re: New Platform Guide
>> Sent by: "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
>>
>
>> Hi Patrick,
>>
>> On Thu, Jun 8, 2017 at 3:48 AM, Patrick Venture <venture@google.com>
>> wrote:
>> > Where is the new platform guide?
>> >
>> > In trying to get the quanta board running with everything; I've often
>> > run
>> > into stumbling blocks when trying to define what packages are required
>> > and
>> > what need to be replaced with custom versions -- for things like
>> > sensors.
>> >
>> > Often I've been more or less reduced to checking the journal logs to see
>> > if
>> > something is saying why it's not running (settings.py was crashing which
>> > meant ipmid wouldn't start as an example).  It took some source
>> > searching to
>> > figure out that x really depended on some object existing.  Often those
>> > were
>> > in the service file, but not every time.  And especially as OpenBMC is a
>> > moving target, this has been somewhat discouraging.  Especially when the
>> > "supported" platforms all stem from the skeleton which still has its
>> > fingers
>> > in many places.
>>
>> As an end-user of the userspace who does not grok the systemd part of
>> OpenBMC, I also find it hard to navigate. I look forward to
>> improvements in this area.
>>
>> >
>> > That said, there are a lot of dependencies between packages, and things
>> > that
>> > you receive that maybe you don't want or need or aren't
>> > configuredproperly.
>> > For example, I don't know why or what the led-manager is doing but it's
>> > on
>> > my system running.  I don't believe I configured it.
>> >
>> > If there is a guide, then I didn't see it and I apologize.
>> >
>> > If there isn't a guide -- I can start one; however, I won't really have
>> > to
>> > do it properly until some time in July.  My approach would be, create a
>> > new
>> > platform that mimics Zaius but under a different name and see what it
>> > takes
>> > to output a similar image and what is really required -- although
>> > difficult
>> > for me to test.  So maybe a new Quanta image from scratch and see what's
>> > running, and why and what things need to be configured.
>>
>> I would appreciate this too. Let me know if I can help out.
>>
>> Cheers,
>>
>> Joel
>>
>
> No better time then the present... Add/edit as you see fit.  Then we can at
> least assign some tasks out
>
> Goal for document:  Allow an experienced engineering team to port existing
> hardware to OpenBMC
> Topics:
> - Yocto Layering to support your board
> - Does your hardware have supported device drivers
> - How to deal with non hwmon supported devices

- What is the overall design of the package intercommunications?
(Effectively a dependency list -- but more explicit than the yocto
depends output)

- What services are expected or provided?
(Ties into the item below)

> - How to implement the default set of packages (thermal, inventory, ipmi, led, etc)
> - How to swapping a default package with a proprietary one
> - Adding packages
> - Testing against the OpenBMC verification suite
>
>

Patrick
