Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nesGr7QE"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rhqv1hJXzF1Rl
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 00:55:38 +1000 (AEST)
Received: by mail-it0-x22e.google.com with SMTP id 71-v6so7043036ith.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=YOhLfqmmFGKwObRsZjLT9RK/LP+9FfiRKUc0uLYg3IU=;
 b=nesGr7QE9qe+oci9uDIXtSQR1TbfEW1YEkbGvVOFgGeAwdINp4Qfnm7YHc8knuwdra
 izpIkCEMLWSMc9gFNP5kjQO1FhSBzvByFMbdrylDvrVmyVsd3YmHM6duPG3VQXq2ljEZ
 2UzrzRrh161Essqe6/9I79NakdXYVcTJvykpPyy1bxvvh8ZpNR06EOH2+mk1qYgjAcTg
 ub0MVf75toHxMWylo7a3r/MBubldMtFFFFmQa8fXGlmGFDZuB5pUe5pPXOknDNYzaIdy
 gZG0Ucv3jzAWKuOQQ6kkarJXoJquxp+ba2+tMA1LOuookaYOKNmYrks/oJWiXWeiKHM9
 JITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=YOhLfqmmFGKwObRsZjLT9RK/LP+9FfiRKUc0uLYg3IU=;
 b=P3L43r0eOdzRKMs0cPjUB/kt0fG+CtYFsROkstKfLsucfj3ZPvBsE+R0T3YWtavegu
 YMMIblnYmCujSd3yk5kQr6er6nbmaieN+AcRP67YL2AeolbCHpW51SRSJ/Lc7vcREoHu
 XnIoqjtu0LTB/fahB2iHLV1QoJYSpFRp8F1p8axKItArQTNwAXxLdsGTwU8k/s9sqwlE
 eRD3ge4EwSYodUXVZvm7FVlnPvB2KkTzCjS9emJA7ud3kzROKk2hSVi/yviN4ooxC0C5
 JKkL75FusvHaW9BE3jHbtEloZ0d2H0NALUsOf7VjRZH7AeYoftHfZOZJp95ppTRybhYb
 TBPg==
X-Gm-Message-State: ALQs6tAetsUiUHfWJrjVuV3RIGyiOO0pByvhc+K91L8cy+qdK09KVv+1
 Lk0Q2+nXQjRnNGESVYZkKKePynBdPKdMsYvVCFE=
X-Google-Smtp-Source: AIpwx496Rxcj1ceJTKzj6KUxD2xV9ipBhM1OBIrYILEyHg659lDozEeCJsM5I+ZWi8IreiKjyMQwonKH5b2mLsOaoW4=
X-Received: by 2002:a24:cf07:: with SMTP id y7-v6mr6715836itf.94.1524149735723; 
 Thu, 19 Apr 2018 07:55:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.192.229.15 with HTTP; Thu, 19 Apr 2018 07:55:35 -0700 (PDT)
In-Reply-To: <C13E036C-8CA0-45B1-8CD9-745137866CFC@fuzziesquirrel.com>
References: <D4564025-0417-4B95-A864-9EAB5544BCAD@fuzziesquirrel.com>
 <C13E036C-8CA0-45B1-8CD9-745137866CFC@fuzziesquirrel.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Thu, 19 Apr 2018 09:55:35 -0500
Message-ID: <CAG5Oiwg0zu=twou-3wu5uyrmk8qHipf5_13pW6N0_wBx982YEw@mail.gmail.com>
Subject: Re: Community call - vote for a new time
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000951a5e056a34c341"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 14:55:41 -0000

--000000000000951a5e056a34c341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've updated the OpenBMC meeting wiki page with the new time.

Kurt Taylor (krtaylor)

On Mon, Apr 16, 2018 at 2:34 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Apr 9, 2018, at 1:38 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
> >
> > The attendance at the Monday community call has been pretty low over th=
e
> > past couple months.  At the last one the group decided it was time to t=
ry
> > something new.
> >
> > I=E2=80=99ve put together a poll for possible meeting times.  Please go=
 vote for
> > your favorites.
> >
> > https://docs.google.com/forms/d/e/1FAIpQLScFr5VZV49bAG28DVLnSJpQ
> 9FzUlmEYEMgHsNo18HleaklAJQ/viewform
> >
> > thx -brad
>
> The survey results are in.  Thank you everyone that took the time to fill
> it out.
>
> Today will be the last community call at 9PM CST and starting next week
> 4/23 they
> will be at 10AM CST on Mondays.
>
> I know this isn=E2=80=99t ideal for everyone but this time worked the bes=
t for a
> pretty big
> majority of responders.  We=E2=80=99ll try this new time for a while and =
see how
> well it
> works (or doesn=E2=80=99t).
>
> thx - brad

--000000000000951a5e056a34c341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve updated the OpenBMC meeting wiki page with t=
he new time.<br><br></div>Kurt Taylor (krtaylor)<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Apr 16, 2018 at 2:34 PM, B=
rad Bishop <span dir=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.=
com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br=
>
&gt; On Apr 9, 2018, at 1:38 PM, Brad Bishop &lt;<a href=3D"mailto:bradleyb=
@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br>
&gt; <br>
&gt; The attendance at the Monday community call has been pretty low over t=
he<br>
&gt; past couple months.=C2=A0 At the last one the group decided it was tim=
e to try<br>
&gt; something new.<br>
&gt; <br>
&gt; I=E2=80=99ve put together a poll for possible meeting times.=C2=A0 Ple=
ase go vote for<br>
&gt; your favorites.<br>
&gt; <br>
&gt; <a href=3D"https://docs.google.com/forms/d/e/1FAIpQLScFr5VZV49bAG28DVL=
nSJpQ9FzUlmEYEMgHsNo18HleaklAJQ/viewform" rel=3D"noreferrer" target=3D"_bla=
nk">https://docs.google.com/forms/<wbr>d/e/<wbr>1FAIpQLScFr5VZV49bAG28DVLnS=
JpQ<wbr>9FzUlmEYEMgHsNo18HleaklAJQ/<wbr>viewform</a><br>
&gt; <br>
&gt; thx -brad<br>
<br>
</div></div>The survey results are in.=C2=A0 Thank you everyone that took t=
he time to fill it out.<br>
<br>
Today will be the last community call at 9PM CST and starting next week 4/2=
3 they<br>
will be at 10AM CST on Mondays.<br>
<br>
I know this isn=E2=80=99t ideal for everyone but this time worked the best =
for a pretty big<br>
majority of responders.=C2=A0 We=E2=80=99ll try this new time for a while a=
nd see how well it<br>
works (or doesn=E2=80=99t).<br>
<br>
thx - brad</blockquote></div><br></div>

--000000000000951a5e056a34c341--
