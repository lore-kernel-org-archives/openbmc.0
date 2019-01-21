Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kE5Mqe7D"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43k2nm144tzDqST
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 07:14:19 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id b23so17342650ios.10
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVe2fJMoGFrcJA3z9VLysnkB5pFTXl0Wnx5S7jnVMdI=;
 b=kE5Mqe7Day9ynVeypox3a1OjOkM61aN0GlkPT1VFcZuCkavfbKPkLKItiw4lDIcuo/
 uPiwM9ScB0G7gyLVCKs1mXbi0u5ePifoNGmca4P/hHO//tzAEzygK2KLfgcMa9HhAYnC
 voMxmmz2Vjo9Xv9vreSAbiorAAQlg/bh7y3Bc08kV2rUeAKDuqnS4di5yksWK1PAICZi
 EgWvz5UfUwgF6PPQe8TJrJc1Z5W4KSGMfO6FR2ynxC7Y2x13turFfLVaP6LQdiYhrWDV
 8hPN3GtuJOIFiGlW4sgS0XYxEz55ewWle6I1NfwptHwD9Fsw4gSXRKVCiPhgFH1bLLFN
 z/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVe2fJMoGFrcJA3z9VLysnkB5pFTXl0Wnx5S7jnVMdI=;
 b=YmiXoEo0MnKYuIUG8ZpDPvfnkg3PS1BQ6Sx7GZ4QfmjcsIpQha9FOywtO9edVOCVlZ
 DF3xjEcXUXvJRKWC0uc48eZQFIfQB2l24UIYtxkh74eG7nojyn/9wYq0MUUUqvPSRQrj
 ImZ6GXy8AJsfAHA+/d73b6b5GoDe22Y36kt7XUphUuYYz3Ldd8Kbj9Z9VSd91972htOv
 T+huzBZVCdFINO8mnzbi3TP7MRICLQgShPYjmDzzotM8BJvITBsuds4UokZEyRf4OXoc
 AR9L+rI6kA9VV8h1OQtQoZDnNAyfrVWXmxBjRyfjiLYbP4UFPw8PU9WSL2/Cvuaw19Rp
 5BSA==
X-Gm-Message-State: AJcUukfFpLOgBJjtdLWsPeEnEDVX7oQhGaPxpzWYOPTnceqJyx8IRgrX
 O7kwQQe53vrQ7SAvidPAkZzfIOmbeNzhUwzghkg=
X-Google-Smtp-Source: ALg8bN7QxuOccDKbNoaymZGsMhPN0+Mg0tUt3EAeby/nWH7hh83h/mekMx+5liRYGpOdffDLRXdm64umFATjO4KUnck=
X-Received: by 2002:a5d:9650:: with SMTP id d16mr17741132ios.289.1548101657474; 
 Mon, 21 Jan 2019 12:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
 <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
 <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
 <CAL_JsqLn3wCpAWDTQFsrvuPJqWurTDNcu=j988PpHWtuW4Po6w@mail.gmail.com>
In-Reply-To: <CAL_JsqLn3wCpAWDTQFsrvuPJqWurTDNcu=j988PpHWtuW4Po6w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 21 Jan 2019 22:20:35 +0200
Message-ID: <CAP6Zq1g=h2qqtOwFNi_u152nggVWVUXR-=59wKUyUCaPjgx21w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
To: Rob Herring <robh+dt@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Jonathan Cameron <jic23@kernel.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Mark Rutland <mark.rutland@arm.com>, 
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000005ebd68057ffd818e"
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
X-List-Received-Date: Mon, 21 Jan 2019 20:14:21 -0000

--0000000000005ebd68057ffd818e
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for the clarification,

I will remove the rst node and Required Node in the NPCM7xx BMC explanation
from the DT binding.

On Mon, 21 Jan 2019 at 18:12, Rob Herring <robh+dt@kernel.org> wrote:

> On Sun, Jan 20, 2019 at 7:48 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Sat, 19 Jan 2019 at 02:12, Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > Hi Joel,
> > >
> > > Thanks for bringing this to my attention,
> > >
> > > I think I will leave it the same way it is now because I will like to
> develop the reset driver and to handle the NPCM7xx SOC resets.
> >
> > You could also do that.
> >
> > But I was suggesting you use a phandle, so you could then find the
> > node you want without searching the entire device tree for the node
> > with the correct compatible.
>
> That's not really any more efficient. You just search the entire tree
> for the matching phandle number instead. Well, that was true until we
> recently added the phandle cache.
>
> In any case, it you plan to move to the reset binding (which would be
> good), then it's better to have nothing in the DT and add something
> rather than change the DT binding.


>
Rob
>

Thanks,

Tomer

--0000000000005ebd68057ffd818e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">Hi Rob,<br></d=
iv><div><br></div>Thanks for the clarification,<div><br></div><div>I will r=
emove the rst node and=C2=A0Required Node in the NPCM7xx BMC=C2=A0explanati=
on from the DT binding.</div><div>=C2=A0<br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Mon, 21 Jan 2019 at 18:12, Rob Herring &lt;<a href=3D"mailt=
o:robh%2Bdt@kernel.org">robh+dt@kernel.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Sun, Jan 20, 2019 at 7:48 PM J=
oel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jm=
s.id.au</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 19 Jan 2019 at 02:12, Tomer Maimon &lt;<a href=3D"mailto:tmaim=
on77@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Joel,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for bringing this to my attention,<br>
&gt; &gt;<br>
&gt; &gt; I think I will leave it the same way it is now because I will lik=
e to develop the reset driver and to handle the NPCM7xx SOC resets.<br>
&gt;<br>
&gt; You could also do that.<br>
&gt;<br>
&gt; But I was suggesting you use a phandle, so you could then find the<br>
&gt; node you want without searching the entire device tree for the node<br=
>
&gt; with the correct compatible.<br>
<br>
That&#39;s not really any more efficient. You just search the entire tree<b=
r>
for the matching phandle number instead. Well, that was true until we<br>
recently added the phandle cache.<br>
<br>
In any case, it you plan to move to the reset binding (which would be<br>
good), then it&#39;s better to have nothing in the DT and add something<br>
rather than change the DT binding.</blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Rob<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>To=
mer=C2=A0</div></div></div></div>

--0000000000005ebd68057ffd818e--
