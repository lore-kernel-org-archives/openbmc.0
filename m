Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PtigJSqw"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bb1r6BSKzF3DW
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 04:02:07 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q184-v6so1174679qkd.3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gp+e4U+oOW4GN5CDESuGykcOZphgTRoKNVLftDsOiVI=;
 b=PtigJSqwagLFtmhcMXrGxh3mNlO8mI58yeEqAq3Dc3Pwnh2n/FtpBjbOge5hZN9ZKF
 bHUnxOUtiNPAUsRSI/zylLNnmtgRIvz9Ny+buJqAh1wgtyHDCmE0QIn/a10UQ+Y8W/2y
 /ynfqn1yB1I0uyuVfAAjMMz1CZ8B4R77aRtb0xCxshKhpQsh3kKvmWCnG6Ey5QrHShNw
 WOnGkTvN4l2mWfZS4d0tzwc3MEHJySaq933d/jDv1pjfREk51PrJq7vTW18v3bdRwcMq
 PBmB8kT0hYZ0D/frwKm57EhKFSUw6Q3EFu8q/UuMVXlI+obZAicwmUmDXzIS+IAo6zpv
 aWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gp+e4U+oOW4GN5CDESuGykcOZphgTRoKNVLftDsOiVI=;
 b=WK/gvW4KgET03w8i2wXh6Z8TveWLr3BwSf9AjHLkx97e719L+93JL2vsViDnB7DfaB
 RObozSDeLl/XSCMj1KLUH+xMKgNIj3F9yIVe0iDQbz3j+3F9LCbQF+e4JaLHUJlh7VbK
 bJmy2WB8bo2xWqNT1UrcPXHvUzTxZZx/GT4pF92KkP8m2mWucRwSVhNFXohFluCIwryD
 8eOd3jToTEvUd2LiQ5bMRvMQHrhlES+9/F0M5N/XOS9hizCdrs1L7ipoQJ1sMhoVU2qw
 ifdYXJMD1Wtvj/CdM6L4iLETLMEzlPsDDeHXUXxaF4FuXhhzYHVYGWRQaObtzTfjd5GL
 CzBw==
X-Gm-Message-State: ABuFfoi3IaKDErMIPpIsDwaKTDGYI8EzA6BzV/wV47u4a7uBvSyrSwYU
 xB0qO4EaFpg3vKm8INfpaEclzULDA3yEY6fK95Vv3w==
X-Google-Smtp-Source: ACcGV615SUz5hTsv32/pGAu2S+LMc5japJw4Vf0BDgUFVstBIdysAGsc+z4djrPlvqrZZroRt46k2Qdb8FByqTSziws=
X-Received: by 2002:a37:f50e:: with SMTP id
 l14-v6mr4851637qkk.224.1539882125060; 
 Thu, 18 Oct 2018 10:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR02MB5300381E6B487BF91CA6309DCAFF0@BN7PR02MB5300.namprd02.prod.outlook.com>
 <4B30C52B-D7FB-4997-B15F-7E206BEDCF1F@fb.com>
In-Reply-To: <4B30C52B-D7FB-4997-B15F-7E206BEDCF1F@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 18 Oct 2018 10:01:53 -0700
Message-ID: <CAJoAoZmyK6rcvLTOH4f1L+zhoAtnG2PO66i6m_PWPzWSC-8dsQ@mail.gmail.com>
Subject: Re: Is Raspberry Pi a supported platform for OpenBMC?
To: Sai Dasari <sdasari@fb.com>
Cc: Feng Xie <Feng_Xie2@jabil.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000105747057883bf68"
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
X-List-Received-Date: Thu, 18 Oct 2018 17:02:09 -0000

--000000000000105747057883bf68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 7:47 PM Sai Dasari <sdasari@fb.com> wrote:

>
>
> =EF=BB=BFOn 10/17/18, 12:55 PM, "openbmc on behalf of Feng Xie"
> <openbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org on behalf of
> Feng_Xie2@jabil.com> wrote:
>
>     Hi,
>
>           I found a thread of discussion on supporting Raspberry Pi as a
> development platform for OpenBMC in the email archive. Is this available?
> Thanks.
> https://lists.ozlabs.org/pipermail/openbmc/2017-September/009276.html
> might be the thread that you are looking that captures the effort of a
> community member trying to use Raspberry Pi as hardware for OpenBMC. I am
> curious about your motivation to use this device for OpenBMC as it is no
> where close to any of the standard BMC. Would you care to explain what yo=
u
> are trying to accomplish to better help you?
>
>
>     Feng
>
>
>
Hi Feng,

We've had this discussion come and go a few times but as Sai mentioned,
it's pretty different from the currently supported parts.

I think the motivation is that the RasPi is a very very cheap eval board
interested parties can use to noodle around with OpenBMC a little before
deciding whether to commit.

Please, someone correct me if I'm wrong - but I'd say that you're welcome
to do any work you need to get OpenBMC to start building and booting on
RasPi and we will be happy to see that work committed upstream.

Best luck!
Emily

--000000000000105747057883bf68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oc=
t 17, 2018 at 7:47 PM Sai Dasari &lt;<a href=3D"mailto:sdasari@fb.com">sdas=
ari@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
=EF=BB=BFOn 10/17/18, 12:55 PM, &quot;openbmc on behalf of Feng Xie&quot; &=
lt;openbmc-bounces+sdasari=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" tar=
get=3D"_blank">fb.com@lists.ozlabs.org</a> on behalf of <a href=3D"mailto:F=
eng_Xie2@jabil.com" target=3D"_blank">Feng_Xie2@jabil.com</a>&gt; wrote:<br=
>
<br>
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I found a thread of discussion on suppor=
ting Raspberry Pi as a development platform for OpenBMC in the email archiv=
e. Is this available? Thanks.<br>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2017-September/009276=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piperm=
ail/openbmc/2017-September/009276.html</a> might be the thread that you are=
 looking that captures the effort of a community member trying to use Raspb=
erry Pi as hardware for OpenBMC. I am curious about your motivation to use =
this device for OpenBMC as it is no where close to any of the standard BMC.=
 Would you care to explain what you are trying to accomplish to better help=
 you?<br>
<br>
<br>
=C2=A0 =C2=A0 Feng=C2=A0 <br>
<br>
<br></blockquote><div><br></div><div>Hi Feng,</div><div><br></div><div>We&#=
39;ve had this discussion come and go a few times but as Sai mentioned, it&=
#39;s pretty different from the currently supported parts.</div><div><br></=
div><div>I think the motivation is that the RasPi is a very very cheap eval=
 board interested parties can use to noodle around with OpenBMC a little be=
fore deciding whether to commit.</div><div><br></div><div>Please, someone c=
orrect me if I&#39;m wrong - but I&#39;d say that you&#39;re welcome to do =
any work you need to get OpenBMC to start building and booting on RasPi and=
 we will be happy to see that work committed upstream.</div><div><br></div>=
<div>Best luck!<br>Emily=C2=A0</div></div></div>

--000000000000105747057883bf68--
