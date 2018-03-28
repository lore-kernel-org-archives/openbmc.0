Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="raf5/3w6"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40B7Dd5kpYzF28h
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 23:56:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 188875396C
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1522241786; x=
 1524056187; bh=Gx8X+07z3I1hXFuuv0xlsdy62/HmClnaziZnWjC9rQE=; b=r
 af5/3w6YOy4quJ5hTbXKZkSExI5/pEY1mN8wwpthgmjLIwTaUuIhLo8fhYSYF5wX
 8qp1we9WC4yHD7dC90lwxxmg985JYv80Eo4gCytIQFlngjZKJmGFfXszszmeTsTe
 jL+fb0L+15T/2j0F/DnPsVMpuPu9zzd3PeL+snGBqY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4j6VJLKLEAY for <openbmc@lists.ozlabs.org>;
 Wed, 28 Mar 2018 15:56:26 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 54F7153918
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 15:56:26 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 28
 Mar 2018 15:56:25 +0300
Subject: Re: Implement IPMI POH functionality
To: <openbmc@lists.ozlabs.org>
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
 <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
Date: Wed, 28 Mar 2018 15:56:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ygowws2zpKBTGfEysMZhIbIZKMqSIk2tW"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Wed, 28 Mar 2018 12:56:37 -0000

--Ygowws2zpKBTGfEysMZhIbIZKMqSIk2tW
Content-Type: multipart/mixed; boundary="eoFro5hhM3FVowtuFI57D8A1xo08Zi1nN";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <879fa484-b805-c398-3a99-7ecc07db170c@yadro.com>
Subject: Re: Implement IPMI POH functionality
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
 <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
In-Reply-To: <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>

--eoFro5hhM3FVowtuFI57D8A1xo08Zi1nN
Content-Type: multipart/alternative;
 boundary="------------CC1A79682E724CC90BA40DFA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CC1A79682E724CC90BA40DFA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

27.03.2018 04:41, Emily Shaffer wrote:
>
>
> On Mon, Mar 26, 2018 at 5:00 AM Ratan Gupta
> <ratagupt@linux.vnet.ibm.com <mailto:ratagupt@linux.vnet.ibm.com>> wrot=
e:
>
>     Hi,
>
>     I would be explaining a rough idea of how we plan to go about,
>     This is related to https://github.com/openbmc/openbmc/issues/2979
>
>     Please share your thoughts and feedback on this proposal.
>
>     =3D>we were planning to add the property in the chassis interface
>     =C2=A0 =C2=A0which tells that since how many hours chassis was powe=
red on.
>
>     =3D>This property gets updated by internal timer which wakes up aft=
er
>     =C2=A0 =C2=A0an hour and updates this property if chassis is powere=
d on.
>
>     =C2=A0 =C2=A0 1) Should we set the uptime to 0 if chassis state has=
 been
>     transitioned from
>     =C2=A0 =C2=A0 PowerOn-->PowerOff
>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or
>
>     =C2=A0 =C2=A0 2) Don't update this property for the chassis power o=
ff
>     duration and
>     update
>     =C2=A0 =C2=A0 this property when the chassis state changes to Power=
On.
>
>     =C2=A0 =C2=A0 What is community view on this?
>
>
> IMO, it depends on whether clients might be using this uptime to
> determine whether the host is on now; or maybe whether they might need
> to capture the latest uptime during some crash log that begins after
> the host goes down.=C2=A0 My gut feeling is that it's correct to set it=
 to
> zero when it powers off, and start incrementing it again starting when
> it powers on.=C2=A0 But I also suppose it's not feasible to use uptime =
to
> determine current host state, if the value is stored in hours, since
> it would be almost one full hour before the value could report the
> host as "on"....
>
> Is there a use case where someone might want to read the previous
> uptime, while the host is still down?
I believe, we must follow the IPMI specification, which clearly states
in section 1.7.28 that the POH counter is:

"to return a counter value proportional to the system operating (S0)
power-on hours"

It looks quite clear to me that this is similar to a car mileage meter.
That is, a means to identify when it's time to do some servicing and/or
track warranty.

The note in section 28.14 further backs my understanding and clarifies
the matter:

=3D=3D=3D=3D=3D=3D
Note that in a power-managed system, the definition of =E2=80=98powered u=
p=E2=80=99 can
be somewhat ambiguous. The definition
used here is that the power-on hours shall accumulate whenever the
system is in the operational (S0) state. An
implementation may elect to increment power-on hours in the S1 and S2
states as well.

=E2=80=98Clear=E2=80=99 or =E2=80=98Set=E2=80=99 commands are not specifi=
ed for this counter. This is
because the counter is most typically used for
warranty tracking or replacement purposes where changing or clearing the
counter would defeat the purpose.
=3D=3D=3D=3D=3D=3D

Hence, we need to elect whether or not we want to count S1 and S2 states
(whatever they are called for POWER), but there shall be no doubt that
the value is cumulative and must not be reset to zero.

P.S. I must say that I often see how the community is trying to reinvent
IPMI without reading the specifications. I believe it is a very wrong
approach, and I implore you all to first try to find the answer in the
IPMI specification, and only when the answer can not be found, turn to
other implementations like MegaRAC or anything.

Sincerely,
Alexander.

--------------CC1A79682E724CC90BA40DFA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    27.03.2018 04:41, Emily Shaffer wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=3DDg@mail.gm=
ail.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Du=
tf-8">
      <div dir=3D"ltr"><br>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Mon, Mar 26, 2018 at 5:00 AM Ratan Gupta
            &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com"
              moz-do-not-send=3D"true">ratagupt@linux.vnet.ibm.com</a>&gt=
;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
            <br>
            I would be explaining a rough idea of how we plan to go
            about,<br>
            This is related to <a
              href=3D"https://github.com/openbmc/openbmc/issues/2979"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">https://github.com/openbmc/openbmc/issues/2979</a><br>
            <br>
            Please share your thoughts and feedback on this proposal.<br>=

            <br>
            =3D&gt;we were planning to add the property in the chassis
            interface<br>
            =C2=A0 =C2=A0which tells that since how many hours chassis wa=
s powered
            on.<br>
            <br>
            =3D&gt;This property gets updated by internal timer which
            wakes up after<br>
            =C2=A0 =C2=A0an hour and updates this property if chassis is =
powered
            on.<br>
            <br>
            =C2=A0 =C2=A0 1) Should we set the uptime to 0 if chassis sta=
te has
            been<br>
            transitioned from<br>
            =C2=A0 =C2=A0 PowerOn--&gt;PowerOff<br>
            <br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or<br>
            <br>
            =C2=A0 =C2=A0 2) Don't update this property for the chassis p=
ower off
            duration and<br>
            update<br>
            =C2=A0 =C2=A0 this property when the chassis state changes to=
 PowerOn.<br>
            <br>
            =C2=A0 =C2=A0 What is community view on this?<br>
          </blockquote>
          <div><br>
          </div>
          <div>IMO, it depends on whether clients might be using this
            uptime to determine whether the host is on now; or maybe
            whether they might need to capture the latest uptime during
            some crash log that begins after the host goes down.=C2=A0 My=
 gut
            feeling is that it's correct to set it to zero when it
            powers off, and start incrementing it again starting when it
            powers on.=C2=A0 But I also suppose it's not feasible to use
            uptime to determine current host state, if the value is
            stored in hours, since it would be almost one full hour
            before the value could report the host as "on"....</div>
          <div><br>
          </div>
          <div>Is there a use case where someone might want to read the
            previous uptime, while the host is still down?</div>
        </div>
      </div>
    </blockquote>
    I believe, we must follow the IPMI specification, which clearly
    states in section 1.7.28 that the POH counter is:<br>
    <br>
    "to return a counter value proportional to the system operating (S0)
    power-on hours"<br>
    <br>
    It looks quite clear to me that this is similar to a car mileage
    meter. That is, a means to identify when it's time to do some
    servicing and/or track warranty.<br>
    <br>
    The note in section 28.14 further backs my understanding and
    clarifies the matter:<br>
    <br>
    =3D=3D=3D=3D=3D=3D<br>
    Note that in a power-managed system, the definition of =E2=80=98power=
ed up=E2=80=99
    can be somewhat ambiguous. The definition<br>
    used here is that the power-on hours shall accumulate whenever the
    system is in the operational (S0) state. An<br>
    implementation may elect to increment power-on hours in the S1 and
    S2 states as well.<br>
    <br>
    =E2=80=98Clear=E2=80=99 or =E2=80=98Set=E2=80=99 commands are not spe=
cified for this counter. This
    is because the counter is most typically used for<br>
    warranty tracking or replacement purposes where changing or clearing
    the counter would defeat the purpose.<br>
    =3D=3D=3D=3D=3D=3D<br>
    <br>
    Hence, we need to elect whether or not we want to count S1 and S2
    states (whatever they are called for POWER), but there shall be no
    doubt that the value is cumulative and must not be reset to zero.<br>=

    <br>
    P.S. I must say that I often see how the community is trying to
    reinvent IPMI without reading the specifications. I believe it is a
    very wrong approach, and I implore you all to first try to find the
    answer in the IPMI specification, and only when the answer can not
    be found, turn to other implementations like MegaRAC or anything.<br>=

    <br>
    Sincerely,<br>
    Alexander.<br>
  </body>
</html>

--------------CC1A79682E724CC90BA40DFA--

--eoFro5hhM3FVowtuFI57D8A1xo08Zi1nN--

--Ygowws2zpKBTGfEysMZhIbIZKMqSIk2tW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJau5DzAAoJEOiTWHtbdBeNoTcP/1n/shV3C2Z2adQBEGRd1wsf
AhJHX7SA+G2kx2imURUVXzSN465xoiiLgvXSbtML/zjXciXm5Q8EmuBOzsrecUNO
k21ncUNJ7M3tUEvlwvPsFpL0afU03R3TAlR81En7BYyJdnOvZ3362o1efI/Bzfl0
V0oZcM4NwHWMvrLUN58ggu3xL+aNYC8yXoeCkyESjqyPVaKXA7cknizbZQKQEYNz
lOgiDkTfXKRKBK3lx2WNNvEplLOuj5caSExAJQKly4PsaLMWHap08OnK7S9QcXX+
iSZ90A4d0XuYxfs/a5BVYFl3goLa5HOlGWnnfOBqGfU8yZDvVBgjvD90xb4pkAxP
HTxg/ZTmDcY0BeQWpNG4jQ0Pio4hqiYOjK/E98kyj6PY6A6VK/B4ImvhYkR9wXeV
kdofIQFIzcg7d4Pprsd4GBNQYfV9+kxxSl3wMIEigIpM0lwZlkxnCrG5/bqQlcfF
Nnp9MR274RpgxuEZn/HQ39lY/HHupZLcuYF0+vL1dbJRhtqs244EJZtSxbfMmivN
UrAOABoND+EGIOoC5/cAz6Qf3sY4xPL6juMT4vuSG+GPkSoQo/UhSN68inYplXKS
gLNFQNHh8lvTJBBdK75UskhZ1yiGN9dCRjYm4oaTY1Lat5LW+IxXmBLvv0Yw9AhZ
L8A7TGo58XpWQ8Elmqul
=c7Y4
-----END PGP SIGNATURE-----

--Ygowws2zpKBTGfEysMZhIbIZKMqSIk2tW--
