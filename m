Return-Path: <raltherr@google.com>
Received: from mail-io0-x22c.google.com (mail-io0-x22c.google.com
 [IPv6:2607:f8b0:4001:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYvlh5kL7zDw2m
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 10:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cFqT0pm+"; 
 dkim-atps=neutral
Received: by mail-io0-x22c.google.com with SMTP id a124so740358394ioe.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 15:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=V+ie3FmugeDfevbUN5GmRkOlP6GLhPzh4RIWMhgC42Q=;
 b=cFqT0pm+lIFqSqu2o9QgJqwAgTG11WoPTvmrC/AdYXFYUpSuUCWIG0IYEtZgPa3kVC
 1+NyOwazsp3NiKJq+dKu8TX02JC0hUrNrEf318C4Py92vxBVVjBzlJpIKRlF1pZT+aqh
 gu5OZ8gNPkxLsCAMg2PJC8wLsnFAWRmqZ74yldPrVwQ6FoX8qlLDkjxNp91NEPl3hrKc
 QTYaa1H+hCr9TRlRp63ZAszDTr6sIFCm9SwU/JTiAPTC+kAh9x7SbB9YrsERhWDScW+D
 t/5nfMAadreUyKgyuATi2LnnfxU03R9Bt+t8abLcaOorVJOv1DKOJtC6/ZjEDfqW1zUT
 A+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=V+ie3FmugeDfevbUN5GmRkOlP6GLhPzh4RIWMhgC42Q=;
 b=iDTH3PCoXHhQi+mncJpINlbBgjw1qg8F7sKpGipKAvEmJhBCIRhPXcRY2Hs9GXaiLH
 /KWN4tpT/x9qwA5QqBSnc2Y2CALtwQU6JwDPETcJM4xMge1pfTG5L/4r5BunIgCNRAt4
 gKTDE1n2TkKsvXGfKO8GUUY3hUHP7fj8O9obNd7F6pVR8McSbjxj7/zz/wnxZfA/pt9h
 uto1v2Qzy3v5aLRBILAPaoOyB8ZZjBA1IRUfwPSKShxMHfJPA6IDeA2CrNS23j7VudXg
 EivzUiqJcmXXdX9zD7HCdXmm5/Ai52BC2ChuleeKzcgTS+ico2CUJs2hMt05d+Y2h3xz
 J1bw==
X-Gm-Message-State: AKaTC032yQCRy6lG1Jw7NEmd5ihfSdKDKjaNteKaUvhwFAVvLaCmuZ5g5uJMkfRRR5xwPkLWmh8BY806Y5Lp1A9a
X-Received: by 10.107.48.134 with SMTP id w128mr67241560iow.226.1481153214275; 
 Wed, 07 Dec 2016 15:26:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.154.197 with HTTP; Wed, 7 Dec 2016 15:26:53 -0800 (PST)
In-Reply-To: <CACPK8XcpR534r0nr06TQxr9hyM-_CY5SAFLO15-5yqO+zYsu1A@mail.gmail.com>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
 <1481133996-29973-4-git-send-email-raltherr@google.com>
 <5483e4dc-506b-c5b1-8e62-17408a9c1d9c@kaod.org>
 <CACPK8XcpR534r0nr06TQxr9hyM-_CY5SAFLO15-5yqO+zYsu1A@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 7 Dec 2016 15:26:53 -0800
Message-ID: <CAPLgG=mK40uKGdspJnxN8ohZn1XBv41TLknLYsO8JUH94+iZxw@mail.gmail.com>
Subject: Re: [PATCH u-boot][PATCH v4 3/3] Enable FIT image support and FDT
 loading for AST2400/AST2500
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114448d4324be5054319db3e
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
X-List-Received-Date: Wed, 07 Dec 2016 23:26:57 -0000

--001a114448d4324be5054319db3e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It turns on a few error messages when encountering situations not supported
with FIT images.  Binary size increase is small and it doesn't generate any
output during normal use.  I'm OK either way.  What do you recommend?

On Wed, Dec 7, 2016 at 3:22 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Thu, Dec 8, 2016 at 4:54 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>
> >> +CONFIG_EFI_LOADER=3Dn
> >> +CONFIG_FIT=3Dy
> >> +CONFIG_FIT_VERBOSE=3Dy
>
> Are we sure we want verbose to be enabled?
>
> Cheers,
>
> Joel
>

--001a114448d4324be5054319db3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It turns on a few error messages when encountering situati=
ons not supported with FIT images.=C2=A0 Binary size increase is small and =
it doesn&#39;t generate any output during normal use.=C2=A0 I&#39;m OK eith=
er way.=C2=A0 What do you recommend?</div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Wed, Dec 7, 2016 at 3:22 PM, Joel Stanley <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@j=
ms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
Dec 8, 2016 at 4:54 AM, C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kao=
d.org">clg@kaod.org</a>&gt; wrote:<br>
<br>
&gt;&gt; +CONFIG_EFI_LOADER=3Dn<br>
&gt;&gt; +CONFIG_FIT=3Dy<br>
&gt;&gt; +CONFIG_FIT_VERBOSE=3Dy<br>
<br>
Are we sure we want verbose to be enabled?<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a114448d4324be5054319db3e--
