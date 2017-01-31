Return-Path: <raltherr@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCgmD11WWzDq99
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 09:24:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L1s+neSg"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id c7so4823296itd.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 14:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zNzpuBr2tVf45amlCdhv/TWjiEhGr0m+wW1vBhZW+DE=;
 b=L1s+neSgz9vDN9F8Fgel+zUQ0+BBVb6mN4a8/vB0MjHtCGxiQU2bzSwtEvdveNmUEd
 kRzvKRexEx8sDWLyiCXF5ESWfomhy8iaGcxeaPRtBMzMBA5MKqhQGS22nVlKxyeA1QpG
 jK4EYRNwlYDjbiLpB9rCvVKcGh8d/m94IDuntjfAgOX2RIc5/rtuqki6K5emE4kxAGsT
 cn/Ted4ogD0IKDYFEFdqGed7D/1vAEpMMyiZCcdn55eezlYL6CcOE+DjwPmVgNFt6gJu
 yzmvCbEOqZaxEwQxvWt6EtBvSLJXgVDmX4JwNjFKycE6vuRXf11GDUDWWlkCxo/Wk11l
 0hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zNzpuBr2tVf45amlCdhv/TWjiEhGr0m+wW1vBhZW+DE=;
 b=E+iIgLg1W2pqohFQ0CwEgrBxzBGZ5KJFm+Boa5z9UvRR398g+LPz2jYH1B1H1AhSrI
 3P8qTW6TIR3EDjNiKqwONS/4jx+EjUCyUQq6RKrZ6e2AOOF5DNvssviy2hpZp3SpRYXs
 xMFFSjCijWm00O9BHXRC3c2TU3MOnkrq9btlEQ0XoeS8sqOx0DEbcEJX6hQRN9jGN+Gr
 Z8OmX+SJoKtPmegxUQD3qzGS3jeqIZcroxCH/2OAOHSmwS2znxmvIAjBj2L/0xjUk0mE
 qt1Nq4+OAoKovmnCKf5QrbW38BZuaLqtGaqOSshtmvVerHtmKY0h1wDWSLI0ngS5c8Fl
 4NDQ==
X-Gm-Message-State: AIkVDXIYb+U6VIn9mTiFRGtF5BurLQ7w4Rdg51Fj+TiUKSio8oVvooLD1xdN430VrdkjRMQmBClfUkqvJ2iMm3VX
X-Received: by 10.36.64.70 with SMTP id n67mr20933312ita.21.1485901465717;
 Tue, 31 Jan 2017 14:24:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Tue, 31 Jan 2017 14:24:25 -0800 (PST)
In-Reply-To: <CAPH-5w4VX6HhGVGPXZp-xM17SWniKRUwvD_Wu0Vqf_KyHQnjLA@mail.gmail.com>
References: <20170127232307.110483-1-xow@google.com>
 <CAPLgG==oWWy8pTpLszLOECXK7pQMXW8uE_NgpFz7Awx51q5ohA@mail.gmail.com>
 <1485590413.2450.7.camel@aj.id.au>
 <CAPH-5w4VX6HhGVGPXZp-xM17SWniKRUwvD_Wu0Vqf_KyHQnjLA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 31 Jan 2017 14:24:25 -0800
Message-ID: <CAPLgG=k1pj2hm1Ykw5=8WaCsSoitmwDgb=y=tcXDryqG+q+7_g@mail.gmail.com>
Subject: Re: [PATCH linux v2] arm: aspeed: zaius: Disable LPC reset for UART1
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1135a57a0969e605476b656f
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
X-List-Received-Date: Tue, 31 Jan 2017 22:24:28 -0000

--001a1135a57a0969e605476b656f
Content-Type: text/plain; charset=UTF-8

OK.  I didn't get that from the commit message or comments as written.

On Tue, Jan 31, 2017 at 2:23 PM, Xo Wang via openbmc <
openbmc@lists.ozlabs.org> wrote:

> On Sat, Jan 28, 2017 at 12:00 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 2017-01-27 at 15:32 -0800, Rick Altherr wrote:
> >> I still don't follow.  Is this changing it to drop bytes until the
> >> host powers on?  Is this change making it so the device won't open?
> >
> > I understand it to be the other way around:
> >
> > In the existing configuration UART1 will drop bytes by being held in
> > reset until the host initialises the LPC bus (i.e. releases LPCRST#)
> > during boot.
> >
> > Xo's change reconfigures the SoC so that UART1 reset state doesn't
> > depend on LPCRST# (i.e. the host initialising the LPC bus), so it is
> > immediately useful in that it won't discard bytes.
> >
> > Xo?
>
> Yes, what Andrew said. It releases UART1 from being controlled by LPC
> reset, so that it's available regardless of the host being up.
>
> cheers
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a1135a57a0969e605476b656f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK.=C2=A0 I didn&#39;t get that from the commit message or=
 comments as written.</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Tue, Jan 31, 2017 at 2:23 PM, Xo Wang via openbmc <span dir=3D=
"ltr">&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">ope=
nbmc@lists.ozlabs.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Sat, Jan 28, 2017 at 12:00 AM, Andrew Jeffery &lt;<a=
 href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; On Fri, 2017-01-27 at 15:32 -0800, Rick Altherr wrote:<br>
&gt;&gt; I still don&#39;t follow.=C2=A0 Is this changing it to drop bytes =
until the<br>
&gt;&gt; host powers on?=C2=A0 Is this change making it so the device won&#=
39;t open?<br>
&gt;<br>
&gt; I understand it to be the other way around:<br>
&gt;<br>
&gt; In the existing configuration UART1 will drop bytes by being held in<b=
r>
&gt; reset until the host initialises the LPC bus (i.e. releases LPCRST#)<b=
r>
&gt; during boot.<br>
&gt;<br>
&gt; Xo&#39;s change reconfigures the SoC so that UART1 reset state doesn&#=
39;t<br>
&gt; depend on LPCRST# (i.e. the host initialising the LPC bus), so it is<b=
r>
&gt; immediately useful in that it won&#39;t discard bytes.<br>
&gt;<br>
&gt; Xo?<br>
<br>
</span>Yes, what Andrew said. It releases UART1 from being controlled by LP=
C<br>
reset, so that it&#39;s available regardless of the host being up.<br>
<br>
cheers<br>
<span class=3D"HOEnZb"><font color=3D"#888888">xo<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
_________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div>

--001a1135a57a0969e605476b656f--
