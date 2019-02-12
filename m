Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RKbEtZhG"; 
 dkim-atps=neutral
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z3V66WKpzDqCD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 11:30:54 +1100 (AEDT)
Received: by mail-vk1-xa36.google.com with SMTP id y14so211454vkd.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 16:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kf2iErwdHJKP8wanRo6eiKJAwjtHLqiK09MSKsC8NHU=;
 b=RKbEtZhGcs2CrEkEDxnv+bxgtoUwCxxIGShFdTV4V/Pm2HFVlLoV3ZF8I9a8pH5B+a
 wKERolfUtMk0fcRM1ry9qjPmCUDT8KhPhEh33uDc2BDSUjXK5AtGALorBpT6FzJ+UJcE
 fICJ16pWi+NwG2PaY6TizoggCANvjEscI7bP0Oex5nL//ecCm1N6Z4qf8ZG40wwITYrz
 YmiU5NFke94nmGC3Scj3HXglTaqRzbcJ1lCfChOV9/K3SI0CI7P7+q4G59ZZX0sHzy46
 e8WhUfPn4CeZofMVWtjaRiG8y8O+QPxUAG/sWAzFOVVsRdS2ZdytsJqzEW2xQflfPER+
 1y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kf2iErwdHJKP8wanRo6eiKJAwjtHLqiK09MSKsC8NHU=;
 b=d/vWr+8Rv/3281pS0GiBzqGhNRoGrCdqZmRW4HlittH9T/TB1787uy+j6ebQHxnUfy
 ltYPIQu81gv4gBoVB/HZhBLa3oZN0ELH39ZvaL9rucdIrnYWWIa7Cg1VCvxVRG9hRO4+
 YEU5P7MyL2nTCs47BTRov/78GflFVa4UeXJ1u7MZYThpylr9/YSf1PrwjIrjdlaRr1TQ
 auwEdLCv+Cqlj+qYSCyQ44fNYw2vEN8zLhoCmc4H/cFluQJZjyf3cwRM5EzNr2+wqX/2
 tPz8jPXeP6PJBH3PjzfG9KWWuKoCZZfq0GmqmxrcMQpohxagc//dEMcO1yToG79vmlm8
 hlEg==
X-Gm-Message-State: AHQUAuZJmynf4uXlUsSfkr5CgkqmObFX45T8p7oKPizrSazg4YUKowkn
 vyX9oCXzGLEX+uQoPev5IVt1JzQwiKN8Z6epdyw2vg==
X-Google-Smtp-Source: AHgI3IbOnECTdXTJ7ZMqweJQxjqMh2WEwEnlR0uGxEdAJVVE9tAfO0GA7nhQlV2WIBGjoszqLfb17giKURsBTLflbTc=
X-Received: by 2002:a1f:e807:: with SMTP id f7mr426507vkh.16.1549931451349;
 Mon, 11 Feb 2019 16:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
In-Reply-To: <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 11 Feb 2019 16:30:12 -0800
Message-ID: <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
Subject: Re: Secure boot for BMC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009601e10581a7897f"
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
X-List-Received-Date: Tue, 12 Feb 2019 00:30:56 -0000

--0000000000009601e10581a7897f
Content-Type: text/plain; charset="UTF-8"

We are working on secure boot, but we have a requirement for a Google HW
root of trust so I'm not sure if that fits in with these discussions.
----------
Nancy


On Sun, Feb 10, 2019 at 8:57 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Wed, 6 Feb 2019, at 00:44, Brad Bishop wrote:
> > Hi everyone
> >
> > Does anyone have plans to provide a secure BMC boot implementation to
> > OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
> > all wants to collaborate on this before I submit a design template.
> >
> > thx - brad
>
> I'm interested in secureboot discussions.
>
> Andrew
>

--0000000000009601e10581a7897f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We are working on secure boot, but we have a requirement f=
or a Google HW root of trust so I&#39;m not sure if that fits in with these=
 discussions.<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sun, Feb 10, 2019 at 8:57 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@=
aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, 6 Feb 2019, at 00:44, Brad Bishop wrote:<b=
r>
&gt; Hi everyone<br>
&gt; <br>
&gt; Does anyone have plans to provide a secure BMC boot implementation to<=
br>
&gt; OpenBMC in the 2.7 or 2.8 timeframe?=C2=A0 Just trying to get a feel f=
or who<br>
&gt; all wants to collaborate on this before I submit a design template.<br=
>
&gt; <br>
&gt; thx - brad<br>
<br>
I&#39;m interested in secureboot discussions.<br>
<br>
Andrew<br>
</blockquote></div>

--0000000000009601e10581a7897f--
