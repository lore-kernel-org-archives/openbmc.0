Return-Path: <raltherr@google.com>
Received: from mail-yw0-x22d.google.com (mail-yw0-x22d.google.com
 [IPv6:2607:f8b0:4002:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t587n0zwHzDvTT
 for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2016 03:18:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bqY/j0z0; 
 dkim-atps=neutral
Received: by mail-yw0-x22d.google.com with SMTP id w3so90835003ywg.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 09:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4VQhUdZnenM+j0XeCu8VlT1Nn62dfr/ysLdUtTiAv9U=;
 b=bqY/j0z0L4DgHXlr2jX+DKbHDpGnD93QoyBcidHqFCyp8qtsu0q8GMKpeljKpJLugU
 MseNxu+fAjBGJgsmvrvdo5aT+hdmgTVKgfF/8l6rPJ7qGWfVNdOB3oVPmDu9mAF1YeW2
 nigaifwu0VeHcZ9x9DaO2p4PkKDWY3m4D65Z+9YaljfflEoorkMpZrff6w4SXkd1b2uE
 kFDG8yoViIkoxhsjKeVNG2x/GdWD0kULr0hjGbGoozNae+2Zd84YOAke0S+KU0KYnhJs
 99sis0wewbs7V6Jv7EJPV1jF5qYx+8l1ZBcNg9pI57+5GWCLIEjQJvmsMmSuc5ASkTO1
 1EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4VQhUdZnenM+j0XeCu8VlT1Nn62dfr/ysLdUtTiAv9U=;
 b=RVjozJdLlas8IoRgtlWPDLHem1R5TiyACrH8FOSHfOeTsVFqJ6mK1PzusQp0THjRr5
 P0fqY26izTzlENWCpqnicfq2e5a44j1ToOVcGqMyZh8YIHZ+yq3YqZSMhTlxBz2n+S+1
 +za2qkCdI3VA8HeyoyUMkDrhFqKiGOa77IWl+Ax5VRfL+3v+BtMsYZlvOo5bRvNlMn0L
 HLwKMpSGs2cJ4GDgy8/78VHpUjZFQGWCtRhEOxQI39mNsnO7WQ/22wzQ0SGwEdW25Qiu
 ADGV3Qtzp2FFQBlwrIBMnN4KwwjBPB9gmU9NlABkDXB6yHG4sjBhj5qSDePfUQOZEMME
 Zk9g==
X-Gm-Message-State: ABUngvd45eaCGLf62AsOYxs0ezoXnBuP0iYfJU2n/li/Ioy8plxYkMPpZH9oIuBl4kbVpzD1jrlq2KzTebF6nBuP
X-Received: by 10.129.53.194 with SMTP id c185mr6845782ywa.205.1477671506200; 
 Fri, 28 Oct 2016 09:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Fri, 28 Oct 2016 09:18:25 -0700 (PDT)
In-Reply-To: <20161028125249.esdyeqbkpk6nedc2@asimov>
References: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
 <20161028125249.esdyeqbkpk6nedc2@asimov>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 28 Oct 2016 09:18:25 -0700
Message-ID: <CAPLgG==saSmH97BgDXmtgJy=dhY7vY184mRWVsFHW4Qyvyeshg@mail.gmail.com>
Subject: Re: Gerrit emails
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114214783a4e20053fef3514
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
X-List-Received-Date: Fri, 28 Oct 2016 16:18:29 -0000

--001a114214783a4e20053fef3514
Content-Type: text/plain; charset=UTF-8

I've always been a fan of postfix.  A send-only localhost config is
documented in
http://www.postfix.org/STANDARD_CONFIGURATION_README.html#null_client.

On Fri, Oct 28, 2016 at 5:52 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Oct 27, 2016 at 05:06:18PM +1030, Joel Stanley wrote:
> > Hi Patrick,
> >
> > I think you mentioned that Gerrit emails broke a while back. A few
> > people have asked about it recently, so I was wondering if you could
> > update us on how that is going?
> >
> > Do you need help?
>
> I haven't had a chance to work on it.  Plan to get it fixed next week.
>
> If you know a good / easy to install localhost SMTP agent you can point
> me at, that would be great.  I need to get that installed and update the
> TXT record on openbmc-project.xyz to enable the server to send emails
> again.
>
> The mail host I am using for my personal email is what I relayed the
> Gerrit emails into and they limit sending to 200 per day, so we end up
> getting rate limited pretty quick with how many people have subscribed
> to all changes.
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a114214783a4e20053fef3514
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve always been a fan of postfix.=C2=A0 A send-only l=
ocalhost config is documented in=C2=A0<a href=3D"http://www.postfix.org/STA=
NDARD_CONFIGURATION_README.html#null_client">http://www.postfix.org/STANDAR=
D_CONFIGURATION_README.html#null_client</a>.</div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Oct 28, 2016 at 5:52 AM, Patrick W=
illiams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=
=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">On Thu, Oct 27, 2016 at 05:06:18PM +1030, Joel =
Stanley wrote:<br>
&gt; Hi Patrick,<br>
&gt;<br>
&gt; I think you mentioned that Gerrit emails broke a while back. A few<br>
&gt; people have asked about it recently, so I was wondering if you could<b=
r>
&gt; update us on how that is going?<br>
&gt;<br>
&gt; Do you need help?<br>
<br>
</span>I haven&#39;t had a chance to work on it.=C2=A0 Plan to get it fixed=
 next week.<br>
<br>
If you know a good / easy to install localhost SMTP agent you can point<br>
me at, that would be great.=C2=A0 I need to get that installed and update t=
he<br>
TXT record on <a href=3D"http://openbmc-project.xyz" rel=3D"noreferrer" tar=
get=3D"_blank">openbmc-project.xyz</a> to enable the server to send emails<=
br>
again.<br>
<br>
The mail host I am using for my personal email is what I relayed the<br>
Gerrit emails into and they limit sending to 200 per day, so we end up<br>
getting rate limited pretty quick with how many people have subscribed<br>
to all changes.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span><br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a114214783a4e20053fef3514--
