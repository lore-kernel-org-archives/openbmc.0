Return-Path: <venture@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHWgt5j6CzDq9m
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 05:34:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OD6gusO/"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id q20so1824528pfg.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=L8t3uWzIZncgd1stktMkRlCXTHXdOUQjtt2Yv2BxIkY=;
 b=OD6gusO/uV6/8eYlgQsnldCDUliSsCG3w0LTMiFrwXnbspc96Hj4oPZDoeLAiXcXpY
 BZpjL6JvaiMSGALzgB/n1cckMvB4Dt1sQPmp+iQRublCptJJ0X5THMnoXg65cIIanW6M
 Lo+qktg9PcLBiNQca/wGD0USnqjz8Sgj/1pKKX9Ps8q+Q2Jny9k90a6TDSdQkdgklZok
 EXbi9Xwbs9xj8SrPg85pVTR0qbxgJx/S/gkI6FDut3l9A8wqtQxv42bJ572gNUyKVrf0
 nlg6IWSbw/AjXMWgsd2cFbALmCdUOgKITixeRkGZ9sVomSsMqo5l9Nx+MATmpdZ4G+wQ
 YJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=L8t3uWzIZncgd1stktMkRlCXTHXdOUQjtt2Yv2BxIkY=;
 b=KPDyPFKysDSwVpkCdHtRB/fvXy8XTgnu4ZNM2esIfTtAe8+lt+TPRCYnLRffmiuOhm
 vuqSw2T6mDmWzh/gJjoT+NSdpV3yvQmtd8mkI+29iRLBneWsgl8YQD2wcVcFIhaQWjKU
 OiT4f0kgoBjKr0VUCAj+Rg7kliiTz6FkNhWVh5RA30qllvW99OGY75LLfl4bPrKojygM
 t3W85f8D8nrmYn/E/jYGpZ7HLahU6xNQ/aFw+Al5ALl+uaayNmfDvwt6aJU6P7pacRdb
 M+g/2kdGUT9bqt3CqUjBgkg9hO/wCvTiXWJw0WmUHZCYhs8eWenteV7iXpUfAoGuxWKB
 tB0Q==
X-Gm-Message-State: AN3rC/4N7jueyYieRJbU5ukaaRVez8c9lR/W9EcnDi4NG0knkslA5Eq9
 AMrgfSz7oy9+is8jbYB8gS1DcBcTVHzR
X-Received: by 10.84.229.15 with SMTP id b15mr7512285plk.14.1493753656170;
 Tue, 02 May 2017 12:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Tue, 2 May 2017 12:33:55 -0700 (PDT)
In-Reply-To: <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
 <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
 <290c826d-da59-2bed-ecee-7aa1f778ab71@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 2 May 2017 12:33:55 -0700
Message-ID: <CAO=notw3p5KJNRsvcqs74Sw9D24JSLmgPhuERtNtyTQNd3Pung@mail.gmail.com>
Subject: Re: OpenBMC Thermal Design
To: Matthew Barth <msbarth@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=94eb2c0befec0f1a52054e8fa01d
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
X-List-Received-Date: Tue, 02 May 2017 19:34:19 -0000

--94eb2c0befec0f1a52054e8fa01d
Content-Type: text/plain; charset=UTF-8

Please elaborate on the format or layout of the control configuration file.
Please elaborate on the mechanism planned to import it into code?  Y'all
often use python programs to make c++, will that be the case here?
Please elaborate on how the control program will execute it's "pluggable"
algorithm?
Please elaborate on how the fans will be controlled?  Will that be as a
group per system or independently per zone?
  -- What is a zone?

Patrick

On Tue, May 2, 2017 at 11:07 AM, Matthew Barth <msbarth@linux.vnet.ibm.com>
wrote:

> Patrick,
>
> As Patrick mentioned a few of us have been working on the fan control
> infrastructure currently and wrote up a quick outline to share our thoughts
> on the design layout. Let us know if there are areas you'd like to see more
> detail.
>
> Matt
>

--94eb2c0befec0f1a52054e8fa01d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please elaborate on the format or layout of the control co=
nfiguration file.<div>Please elaborate on the mechanism planned to import i=
t into code?=C2=A0 Y&#39;all often use python programs to make c++, will th=
at be the case here?</div><div>Please elaborate on how the control program =
will execute it&#39;s &quot;pluggable&quot; algorithm?</div><div>Please ela=
borate on how the fans will be controlled?=C2=A0 Will that be as a group pe=
r system or independently per zone?</div><div>=C2=A0 -- What is a zone?</di=
v><div><br></div><div>Patrick</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Tue, May 2, 2017 at 11:07 AM, Matthew Barth <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:msbarth@linux.vnet.ibm.com" target=3D"_=
blank">msbarth@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Patrick,<br>
<br>
As Patrick mentioned a few of us have been working on the fan control infra=
structure currently and wrote up a quick outline to share our thoughts on t=
he design layout. Let us know if there are areas you&#39;d like to see more=
 detail.<br>
<br>
Matt<br>
</blockquote></div><br></div>

--94eb2c0befec0f1a52054e8fa01d--
