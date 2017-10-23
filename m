Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22f; helo=mail-ua0-x22f.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pwivMl/U"; 
 dkim-atps=neutral
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLSwH0s1kzDqjm
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 07:40:46 +1100 (AEDT)
Received: by mail-ua0-x22f.google.com with SMTP id i35so13892517uah.9
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lu7sQWhB45zL1MiPhoMkV3g5pWUaZ44jYXBQVFIvNVE=;
 b=pwivMl/UGVHyenO5DZ8+UhvuiG5ITvu7qN+ktr2bxEvYYw7jSVY1GXTNG3lq18R3qS
 +ij0/fk2hbBc6EzPSzxuhC/JZ/ZiROUMlYVnl6cuN43Kp4uTkFjpziDBfqfzJ6k3CT39
 6zuDkgD0fC4WIwLsjX5vfYjDtdByQEGm3xHNb3l6eosb17LsvCe5XiTBZ5q1uhsqxsF8
 GSA2lsB72vq+OivHIsU2tZJ1iR++vAgYb9kBAjIBFtnoyKzEXAOOwSbmkywSHmPui+RT
 tTVHziP7DMv9XEH5S/Ma/gZgYlEjQ3eKGG81ikmkAS+apyyo12tFLGt4J9m7PUE49TEx
 WKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lu7sQWhB45zL1MiPhoMkV3g5pWUaZ44jYXBQVFIvNVE=;
 b=pwg/fdb0eekuCfjoPQJPN9ttX1G1GbKO326RwvZBM0PCYQVcY3z7aUhXrxv2xtfGq0
 SqKne2HSMC/HInKnaVOMRkOkCNBlGQNteAIoKn6OhiDrnGdV27SvJ8OFSrPy/nh+gByf
 j7ccaF57AYwGsDn7Jvz7THdFtoYceG4CDx7e7AfbHu/ue3ido8r2ZALVYvFIxgNrBD7W
 7vVmOTtORCof3oHPRProltKVmwTTtT2VtMPNARtLds+O14B3xeFnudoYxyJ8fQ+Vko0j
 XH8MTPniabnTBB4LHqKFN5b9dW+nK5NbL/g09/eyeLuSmhdltjL0QAHvpFeSJlmzO5Ql
 Av6g==
X-Gm-Message-State: AMCzsaXWkiYTkB9A+r3kEBqTgvZet4jMMEhkOKf9VP4jehXh5sGBLDfc
 ZLL1tVljJN5ygrVNTDimaMS/ytQnbgAIQzsTUaAJldWy
X-Google-Smtp-Source: ABhQp+REB1H/wgpR7StIUReehOa/etl//QQuedxjUb7wYezkAy4Hi8AdG5waj3/CMe+kJGNlc5f3VbHIWz/LS1hoDfA=
X-Received: by 10.176.74.139 with SMTP id s11mr10696131uae.129.1508791243074; 
 Mon, 23 Oct 2017 13:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Mon, 23 Oct 2017 13:40:42 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAECE2A@ORSMSX105.amr.corp.intel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
 <7E9441B1E5EFFD4681F54958E82169932EAECC2A@ORSMSX105.amr.corp.intel.com>
 <CAPLgG=nsq1XiJZ_86nJHYAqOHFmM6i2_=XW+Ls-2iRQsXvu2VQ@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932EAECDD8@ORSMSX105.amr.corp.intel.com>
 <CAPLgG=nMCiosGck5=4oQ9yRCkhgsrQ_p7-fMg=75WPTy5UL-UA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932EAECE2A@ORSMSX105.amr.corp.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 23 Oct 2017 13:40:42 -0700
Message-ID: <CAPLgG==J-XRi8J+5iRNZdvRk5JZou_ToeVcSwh0UUG7HwxBvFw@mail.gmail.com>
Subject: Re: PECI API?
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: =?UTF-8?Q?David_M=C3=BCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 23 Oct 2017 20:40:48 -0000

On Mon, Oct 23, 2017 at 1:24 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>
>
>
>
> From: Rick Altherr [mailto:raltherr@google.com]
> Sent: Monday, October 23, 2017 12:48 PM
> To: Tanous, Ed <ed.tanous@intel.com>
> Cc: David M=C3=BCller (ELSOFT AG) <d.mueller@elsoft.ch>; OpenBMC
> <openbmc@lists.ozlabs.org>
> Subject: Re: PECI API?
>
>
>
>
>
>
>
> On Mon, Oct 23, 2017 at 12:39 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>
> =E2=80=9CRather than a PECI API, would it make any sense to define a an a=
bstract
> concept API, where one implementation of it has a PECI backend?=E2=80=9D
>
>
>
> I don=E2=80=99t think so, but that=E2=80=99s partially why I asked about =
use cases.  PECI
> can be thought of a lot like SMBus, with some fancy protocol level featur=
es
> that make it easier to implement.  It=E2=80=99s a generic interface that =
can be used
> for any number of things, including temperature readings from processors =
and
> memory.  Our intention was to implement it as a device driver (/dev/peci)=
,
> with (one or several) dbus daemons reading and pushing information to dbu=
s
> using the existing openbmc interfaces (sensor, threshold, logging ect).
> There was also talk of implementing it as a hwmon driver, but I think tha=
t
> discussion was deferred, given that the number of =E2=80=9Csensors=E2=80=
=9D needs to be
> determined at runtime, and that didn=E2=80=99t seem to fit in the hwmon m=
odel.  This
> work is ongoing, so I don=E2=80=99t have a timeframe on completion or its=
 level of
> robustness, but if there=E2=80=99s interest, I can probably push the WIP =
to a branch
> or a repo somewhere.
>
>
>
>
>
> hwmon has APIs for dynamically adding sensors at runtime.  For temps, vol=
ts,
> etc, I prefer an hwmon driver built atop a PECI subsystem.
>
>
>
> [Ed]  I was personally unaware that hwmon itself had that capability.  We
> had previously implemented a dynamically generated device tree overlay th=
at
> accomplished some of that for LM75 sensors.  I will point my developers a=
t
> it.
>
> =E2=80=9CIs there a kernel subsystem for PECI defined upstream?  I'm not =
aware of a
> PECI device driver for Aspeed upstream.=E2=80=9D
>
> I don=E2=80=99t believe there is one defined upstream, but I believe the =
first
> revision of the driver code we are using was derived from the Aspeed SDK.
>
>
>
> What happens when Nuvoton sends their driver?
>
>
>
> [Ed] =E2=80=A6.. we work to build a common interface that meets everyone=
=E2=80=99s needs,
> while abstracting the hardware interfaces into the kernel.  Part of the
> issue with PECI is there are some userspace constructs (retries, framing,
> timing, ect) that are a part of the PECI specification, but could be push=
ed
> to either hardware abstractions, or userspace code.  Where they get
> implemented (for platforms I=E2=80=99ve been a part of) has thusfar been =
a matter of
> preference on the part of the developer.  We likely should get together a
> group of interested parties and see if we can come up with an interface t=
hat
> works for everyone.  I have not yet worked with a Nuvoton platform, so I=
=E2=80=99m
> sure I have quite a bit to learn in that space.
>
>

I know Google is interested in seeing this abstraction get developed
soon.  Ideally this abstraction goes in to upstream as part of the
same patch series as an Aspeed driver.

>
> -Ed
>
>
>
>
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.=
org]
> On Behalf Of Brad Bishop
> Sent: Monday, October 23, 2017 12:17 PM
> To: "David M=C3=BCller (ELSOFT AG)" <d.mueller@elsoft.ch>
> Cc: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: Re: PECI API?
>
>
>
>
>
>> On Oct 21, 2017, at 4:57 AM, David M=C3=BCller (ELSOFT AG)
>> <d.mueller@elsoft.ch> wrote:
>
>>
>
>> Hello
>
>>
>
>> Is anyone working on an API definition for PECI?
>
>>
>
>>
>
>> Dave
>
>
>
> Full disclosure - the Wikipedia article is the extent of my background on
> PECI.
>
>
>
> Rather than a PECI API, would it make any sense to define a an abstract
> concept API, where one implementation of it has a PECI backend?
>
>
>
> My cursory glance at the Wikipedia article suggests PECI provides
> temperature readings (I=E2=80=99m sure it does much more) but the basic t=
hought
> process I=E2=80=99ve outlined would allow control applications or metric =
gathering
> applications, etc to be re-used irrespective of where the data is coming
> from.
>
>
>
> -brad
>
>
>
>
>
> From: Rick Altherr [mailto:raltherr@google.com]
> Sent: Monday, October 23, 2017 12:02 PM
> To: Tanous, Ed <ed.tanous@intel.com>
> Cc: David M=C3=BCller (ELSOFT AG) <d.mueller@elsoft.ch>; OpenBMC
> <openbmc@lists.ozlabs.org>
> Subject: Re: PECI API?
>
>
>
> Is there a kernel subsystem for PECI defined upstream?  I'm not aware of =
a
> PECI device driver for Aspeed upstream.
>
>
>
> On Mon, Oct 23, 2017 at 9:44 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
>
> We had looked at building one, and had one prototyped for a simple
> read/write interface, but we were on the fence about whether such a low
> level control (PECI read/write) should be put on dbus at all for security
> reasons, especially when the drivers read/write API isn't that difficult =
to
> use.
>
> What are you looking at doing with it?
>
> -Ed
>
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.=
org]
> On Behalf Of David M=C3=BCller (ELSOFT AG)
> Sent: Saturday, October 21, 2017 1:57 AM
> To: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: PECI API?
>
> Hello
>
> Is anyone working on an API definition for PECI?
>
>
> Dave
>
>
>
>
