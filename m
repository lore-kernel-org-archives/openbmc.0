Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nyACTJGO"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41krn76ft7zDq6t
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 07:45:57 +1000 (AEST)
Received: by mail-it0-x229.google.com with SMTP id h20-v6so20294895itf.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+C/UsU/SxCqy27t8ESmjyvYSOjXS/2ODXWaG477slug=;
 b=nyACTJGO1Po6jRzZoAZ/wPj+Pkwr4eq/01FVOZxWnDgJUfLXEDUUJB5wUV/1X0XZlx
 KvDPWJXBadV7ZcS5ZkUK7v29CaFzH0aSia1978OSDpzl5QsUKmmS1y9ARqfKX+MPeqK8
 tTXbeTSYSPusXc6W+xNejvgxNWyyG2nqnRMfZ39iOktToNk4DVkhmP3GQRAOJ1y4aeyj
 kMvLATm6DPk42KHwjSkhWjSllBZJoVhsSuyQJFH5YdHGfrDdvQfS+ZWN9A/3B22T/xGr
 LJLqNLzMFWdV9sNzYQo+ZHmdA+dMzMmq1t5KAdqzEuV4AnVit6nWNTXNd+oM+VFeNRrP
 P15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+C/UsU/SxCqy27t8ESmjyvYSOjXS/2ODXWaG477slug=;
 b=JdbJwg7pH6pM1BbkuLWxBruQK5dHPmMLce6BuWrt3bbRgvu7boVdIcIOC4o5fV4AB2
 ienaMtPPBKkThG5pVMgMtNt8gWjUW2nfgX6Ys9mT7k+iV2xfm2Ble6HfZVHEPs5FjkiD
 jzICs0EEUk6w+/kpn8pGkAjLLdZqV4KGVktfG2ErapX9hrd1+XsCd/Wf844RMYxk+R8M
 Lcwevobg+vrZxTNFAVT2vbIJxCKjv8oAgn3xu5WoJpypg3QHEdVXLhJHqVD0rYKCXfTu
 RsBPMTWb76XscTF+MVjgizaK9HAc4u/PplJm8yIO/oqH7+MUHEeKKLJCIjf/lnk7PiZV
 WdLg==
X-Gm-Message-State: AOUpUlHFRd06cOGNg4CgH3gwX3bMx7kZcJPQpgcmsI4Vke3LKDomRCkQ
 MZBAoHRgRv6IXfxG+J/NYZwYLCbzM1MWoVarTJ0buQ==
X-Google-Smtp-Source: AAOMgpcRyuAduEU4RoASdBD5l0V7XDm+c1kKyd0+SlgGfyNiAZjXuPnvIIH7iEIoOpvluw1upAzrEB+QuXdH/43WlTg=
X-Received: by 2002:a24:800c:: with SMTP id
 g12-v6mr16679109itd.146.1533591955226; 
 Mon, 06 Aug 2018 14:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
 <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
 <CAO=noty1A+n+u8JsQyc0iDDze-D5aDMcweBQFvd3qONOg21Hxw@mail.gmail.com>
 <1533333813.4174910.1462882280.737C2773@webmail.messagingengine.com>
 <CAO=notw8Nb0LqqhYt29YYckNdzWC6AcaNtkxP3tq+jz=DzgaUQ@mail.gmail.com>
In-Reply-To: <CAO=notw8Nb0LqqhYt29YYckNdzWC6AcaNtkxP3tq+jz=DzgaUQ@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 6 Aug 2018 14:45:28 -0700
Message-ID: <CAGMNF6U5uT-utRdbV2Tgg=77AMvpAo73Z1oH97rkrfOH9gDrOA@mail.gmail.com>
Subject: Re: UART Route setting
To: Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Oskar Senft <osk@google.com>, henbinchang@gmail.com, Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="000000000000b943d30572cb336a"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 21:46:05 -0000

--000000000000b943d30572cb336a
Content-Type: text/plain; charset="UTF-8"

Thanks Patrick. I was aware of the driver but haven't thoroughly checked
the email thread. IMO it's a great idea and something I've hoped for. Will
post some comments in the thread for support.

On Mon, Aug 6, 2018 at 9:48 AM Patrick Venture <venture@google.com> wrote:

> +kunyi@
>
> PTAL - I know we're looking for a way to move the hacks forward
> properly, a driver or driver(s) is apparently already in the works,
> albeit with upstream resistance.
>
> Patrick
>
> On Fri, Aug 3, 2018 at 3:03 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> > On Sat, 4 Aug 2018, at 00:29, Patrick Venture wrote:
> >> On Wed, Aug 1, 2018 at 8:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >> > On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
> >> >> Interesting suggestion, that looks promising, thank you?
> >> >>
> >> >> What's the state of that driver? I.e. where do we expect it to land?
> >> >
> >> > If you think the bmc-misc-ctrl series is useful, please reply to the
> >> > upstream thread to outline all of your use-cases. There's a lot of
> push-
> >> > back on using the devicetree to describe these features, and I haven't
> >> > had a lot of feedback on the acceptability of the rest (driver itself,
> >> > userspace ABI).
> >> >
> >> > The more evidence we have of this being necessary/useful the better.
> >>
> >> I just skimmed that message, and we're looking for a mechanism to set
> >> in the kernel some bits in the hwstrapping and other hardware
> >> registers to do things like restrict P2A ranges, disable lpc2ahb
> >> stuff, etc.  Things we had hacked into the mach-aspeed.c (iirc), and I
> >> wasn't sure it made sense to write a half dozen small drivers to
> >> control these individual things -- would these kind of use cases fall
> >> under this misc driver?
> >
> > Yes, everything you listed there was a strong motivation for the series.
> >
> > Cheers
> >
> > Andrew
>


-- 
Regards,
Kun

--000000000000b943d30572cb336a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Patrick. I was aware of the driver but haven&#39;t =
thoroughly checked the email thread. IMO it&#39;s a great idea and somethin=
g I&#39;ve hoped for. Will post some comments in the thread for support.</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 6, 2018 at 9=
:48 AM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+kunyi@<br>
<br>
PTAL - I know we&#39;re looking for a way to move the hacks forward<br>
properly, a driver or driver(s) is apparently already in the works,<br>
albeit with upstream resistance.<br>
<br>
Patrick<br>
<br>
On Fri, Aug 3, 2018 at 3:03 PM, Andrew Jeffery &lt;<a href=3D"mailto:andrew=
@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Sat, 4 Aug 2018, at 00:29, Patrick Venture wrote:<br>
&gt;&gt; On Wed, Aug 1, 2018 at 8:33 PM, Andrew Jeffery &lt;<a href=3D"mail=
to:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt;&gt; &gt; On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:<br>
&gt;&gt; &gt;&gt; Interesting suggestion, that looks promising, thank you?<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; What&#39;s the state of that driver? I.e. where do we exp=
ect it to land?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If you think the bmc-misc-ctrl series is useful, please reply=
 to the<br>
&gt;&gt; &gt; upstream thread to outline all of your use-cases. There&#39;s=
 a lot of push-<br>
&gt;&gt; &gt; back on using the devicetree to describe these features, and =
I haven&#39;t<br>
&gt;&gt; &gt; had a lot of feedback on the acceptability of the rest (drive=
r itself,<br>
&gt;&gt; &gt; userspace ABI).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The more evidence we have of this being necessary/useful the =
better.<br>
&gt;&gt;<br>
&gt;&gt; I just skimmed that message, and we&#39;re looking for a mechanism=
 to set<br>
&gt;&gt; in the kernel some bits in the hwstrapping and other hardware<br>
&gt;&gt; registers to do things like restrict P2A ranges, disable lpc2ahb<b=
r>
&gt;&gt; stuff, etc.=C2=A0 Things we had hacked into the mach-aspeed.c (iir=
c), and I<br>
&gt;&gt; wasn&#39;t sure it made sense to write a half dozen small drivers =
to<br>
&gt;&gt; control these individual things -- would these kind of use cases f=
all<br>
&gt;&gt; under this misc driver?<br>
&gt;<br>
&gt; Yes, everything you listed there was a strong motivation for the serie=
s.<br>
&gt;<br>
&gt; Cheers<br>
&gt;<br>
&gt; Andrew<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--000000000000b943d30572cb336a--
