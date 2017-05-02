Return-Path: <venture@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHZKr2vdWzDq9m
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 07:33:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="twpnCKCd"; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id e64so3039581pfd.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bl2hF36iRKqsw9icYCQLOyWxDHI6kwBHzpsILPabS+c=;
 b=twpnCKCdlzReGtO2b2ShCFq9cgtY9qKXSV+NJ2znIEuUJdq9qPqEBcZoYt/cU+hilQ
 a8LbEieuj57O8/ZtZdD90xb1LEhwZ7U6G92WhYg/waF4E1Na541/uz7wvM1biyXZ5sF/
 DBb0FWWZsFiuJjbke4XwVcfcjMc/k6IH9gf3YxzMDeKFSCSsiXc0byjmVzrS93k22gEL
 pIcmWfdSvzwyBN18eVpfv95LdtEZ6sidbFrT/v6Xt83TnpzNXXihRlUCYUVQoPMLPYuK
 EYWQQnCn8WDIRQRIQWYDVRtyP6Yg7p9xmbULUJtI+HIOEEzV5kaT8+MnXwnMf8G5XGvs
 HhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bl2hF36iRKqsw9icYCQLOyWxDHI6kwBHzpsILPabS+c=;
 b=TFOC8T776bvLz7y7SVIoD97ah/ntGoyhITbeDfF6CQ5DDgCVmu21wjPI/6o9wKMB8Z
 /DK6LwqsqXqVumVbsuGQh7P4rxDgN6DMVrHJcYvNvDPPUVQJ3w1ToQf0J6vS1TDxjtnY
 rGJ+AnJFivgFrVQPAm21w2CF/iw900FpuAzaeFwfscrv4rO+0PKX8ewquM9IxOR5RCq/
 DDjwZwMvqTP4frU8/Zkxn69r+XNaO1mdcI0h8E3IHDMfzxWYPe5o285cayEbWJiU8f37
 eoiPxxy/tcdPoCPwFQOpc3Y6kG/HX/mOtejCquvqkQACM37TZB0Hax9B7MofQcacZ9LD
 E1kg==
X-Gm-Message-State: AN3rC/6lN636Z6f78v9CLPQCvWhrYjBbjwIVPwFLgyPivQFN00G2ohlo
 ngLbeGQDSGnLay6FMF4A+Tso1j0v6c0gv4baBg==
X-Received: by 10.99.127.26 with SMTP id a26mr34925392pgd.196.1493760828321;
 Tue, 02 May 2017 14:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Tue, 2 May 2017 14:33:27 -0700 (PDT)
In-Reply-To: <4f971554-1f33-c7ab-c0b5-3105c3505083@linux.vnet.ibm.com>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
 <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
 <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
 <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
 <4f971554-1f33-c7ab-c0b5-3105c3505083@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 2 May 2017 14:33:27 -0700
Message-ID: <CAO=notyO9vNR-QcbUFMHhdw+EB64k0x-fM4ycwxF7G_Ck_xUiA@mail.gmail.com>
Subject: Re: OpenBMC Thermal Design
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=94eb2c1b4c348d94c7054e914b93
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
X-List-Received-Date: Tue, 02 May 2017 21:33:53 -0000

--94eb2c1b4c348d94c7054e914b93
Content-Type: text/plain; charset=UTF-8

Fantastic!  Thanks for elaborating.

>> Please elaborate on how the control program will execute it's
"pluggable" algorithm?
> Filling out the associated yaml file for the control application defines
how the algorithm will control the fan speeds based on the values, sensors
listed, delays, etc.. that will be supported as parameter inputs to the
algorithm.

What do you mean by "delays?"

Patrick

On Tue, May 2, 2017 at 2:21 PM, Matthew Barth <msbarth@linux.vnet.ibm.com>
wrote:

> On 05/02/17 2:33 PM, Patrick Venture wrote:
>
> Please elaborate on the format or layout of the control configuration file.
>
> This will be a yaml file containing the zone and fan definitions with the
> associated set of parameters that feed into the control algorithm.
> Currently this contains the zone number, the zone initial speed, and the
> list of fans(including their inventory path, sensor name, etc...).
>
> Please elaborate on the mechanism planned to import it into code?  Y'all
> often use python programs to make c++, will that be the case here?
>
> Correct, that will be the case here as well.
>
> Please elaborate on how the control program will execute it's "pluggable"
> algorithm?
>
> Filling out the associated yaml file for the control application defines
> how the algorithm will control the fan speeds based on the values, sensors
> listed, delays, etc.. that will be supported as parameter inputs to the
> algorithm.
>
> Please elaborate on how the fans will be controlled?  Will that be as a
> group per system or independently per zone?
>
> This will be configurable by the yaml file where the fan speeds are set on
> the zone, which a zone is a group of fans. These zones can be constructed
> as 1-to-many fans enabling individual fans being controlled or a group of
> fans being controlled similarly.
>
>   -- What is a zone?
>
> A grouping of fans
>
>
> Patrick
>
> On Tue, May 2, 2017 at 11:07 AM, Matthew Barth <msbarth@linux.vnet.ibm.com
> > wrote:
>
>> Patrick,
>>
>> As Patrick mentioned a few of us have been working on the fan control
>> infrastructure currently and wrote up a quick outline to share our thoughts
>> on the design layout. Let us know if there are areas you'd like to see more
>> detail.
>>
>> Matt
>>
>
>
>

--94eb2c1b4c348d94c7054e914b93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fantastic!=C2=A0 Thanks for elaborating.<div><table class=
=3D"gmail-Bs gmail-nH gmail-iY" cellpadding=3D"0" style=3D"width:1363px"><t=
body><tr><td class=3D"gmail-Bu"><br>&gt;&gt; Please elaborate on how the co=
ntrol program will execute it&#39;s &quot;pluggable&quot; algorithm?<br>&gt=
; Filling out the associated yaml file for the control application defines =
how the algorithm will control the fan speeds based on the values, sensors =
listed, delays, etc.. that will be supported as parameter inputs to the alg=
orithm.<br><br>What do you mean by &quot;delays?&quot;<br><br>Patrick</td><=
/tr></tbody></table></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, May 2, 2017 at 2:21 PM, Matthew Barth <span dir=3D=
"ltr">&lt;<a href=3D"mailto:msbarth@linux.vnet.ibm.com" target=3D"_blank">m=
sbarth@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"">
    On 05/02/17 2:33 PM, Patrick Venture wrote:<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Please elaborate on the format or layout of the
        control configuration file.</div>
    </blockquote></span>
    This will be a yaml file containing the zone and fan definitions
    with the associated set of parameters that feed into the control
    algorithm. Currently this contains the zone number, the zone initial
    speed, and the list of fans(including their inventory path, sensor
    name, etc...).<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>Please elaborate on the mechanism planned to import it into
          code?=C2=A0 Y&#39;all often use python programs to make c++, will=
 that
          be the case here?</div>
      </div>
    </blockquote></span>
    Correct, that will be the case here as well.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>Please elaborate on how the control program will execute
          it&#39;s &quot;pluggable&quot; algorithm?</div>
      </div>
    </blockquote></span>
    Filling out the associated yaml file for the control application
    defines how the algorithm will control the fan speeds based on the
    values, sensors listed, delays, etc.. that will be supported as
    parameter inputs to the algorithm.<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>Please elaborate on how the fans will be controlled?=C2=A0 Wil=
l
          that be as a group per system or independently per zone?</div>
      </div>
    </blockquote></span>
    This will be configurable by the yaml file where the fan speeds are
    set on the zone, which a zone is a group of fans. These zones can be
    constructed as 1-to-many fans enabling individual fans being
    controlled or a group of fans being controlled similarly.<span class=3D=
""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>=C2=A0 -- What is a zone?</div>
      </div>
    </blockquote></span>
    A grouping of fans<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Patrick</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Tue, May 2, 2017 at 11:07 AM,
          Matthew Barth <span dir=3D"ltr">&lt;<a href=3D"mailto:msbarth@lin=
ux.vnet.ibm.com" target=3D"_blank">msbarth@linux.vnet.ibm.com</a>&gt;</span=
>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Patrick,<br>
            <br>
            As Patrick mentioned a few of us have been working on the
            fan control infrastructure currently and wrote up a quick
            outline to share our thoughts on the design layout. Let us
            know if there are areas you&#39;d like to see more detail.<br>
            <br>
            Matt<br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </span></div>

</blockquote></div><br></div>

--94eb2c1b4c348d94c7054e914b93--
