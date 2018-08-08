Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::236; helo=mail-oi0-x236.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O9FLmW5+"; 
 dkim-atps=neutral
Received: from mail-oi0-x236.google.com (mail-oi0-x236.google.com
 [IPv6:2607:f8b0:4003:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lg0B1b1yzDqj4
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 15:28:26 +1000 (AEST)
Received: by mail-oi0-x236.google.com with SMTP id d189-v6so1694167oib.6
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 22:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hBLCuHPl0Rzu7nAY56iEovjz6UUy5AQhTTHfJzCje/I=;
 b=O9FLmW5+PSOlKx/S/mrxca16tzIp2l7cQ5V5Eq/jXMVLlfVyE3FjkjKDbQ8pIxRg2a
 PtxeKj217gj9cXjaxsp7DEZ+Dh/WMM3+wrqZjlHq8VJvR+1ItzWOKkCxqKeI9Hw7vaaz
 w/uTecWmjY0X2iuNx1QjiivkI7atC601p39lXdo33N8qet5sPR9lzqviA4EkUbV7RWAE
 ji5APJ4jLiJSwOxiOckcSQsKCLaDRO8nPtpwfkVOcey1PJOg3eLEzuP0f6qM4wPaGInF
 45nvVxsYLdyVT8PLWjv9Pld6mqu6O3brjfwRNuKklTmPfmxFT+T0/643EAvEMFFidSVh
 magA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hBLCuHPl0Rzu7nAY56iEovjz6UUy5AQhTTHfJzCje/I=;
 b=qJe/Dkg48CFslQj50Q87Fg0G2I7jAkUyD7UWnb01GW+vJUCNjLHt5dhGRumL5EBarl
 Kp698u2Qt4NOwWe6DTZ46gvGHrcG3tAYbOPngK8KaNaV6EUHhY40M+YXKe1EdQvU6abC
 NOYh8EDjY3eyzgRJ13y0INmns3IwenjHVE75FEq23eRNuKDh2v9eKGGTVdgfMetBxqQ3
 0sf9BbkEMa5M7coEHwA2zEPwc1Eposfh4W8ntgFmq+cIMRKT2I+iNDhwAztCNtGgJtg2
 JFCNXW6agXEp0RjK4AlU56yaY9SRflHppkLKd972ASD1iTUnfb/OxHT3iGN8wztqOsov
 s62g==
X-Gm-Message-State: AOUpUlGaMdMsa6vYg+Tn3LeRTgLHXHqM60vRaM9Q7voY7U79XLhASdP+
 W5oI/8KDYrDs/HA/+5RJkJRVY8joHOTb+HC9qTI=
X-Google-Smtp-Source: AA+uWPymUShfD6xTt5xDTZVCgsTWDz++lEROLOgKTIG3RtcYYj6nSW6CqjeubK4Cg/sKAriC9BsEV7GCrTlE7gVuevo=
X-Received: by 2002:aca:3787:: with SMTP id
 e129-v6mr1559388oia.39.1533706103931; 
 Tue, 07 Aug 2018 22:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 22:28:23 -0700 (PDT)
In-Reply-To: <b3ceb4c3-00d1-f3b1-1859-19d47fce2e5a@intel.com>
References: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
 <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
 <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
 <b3ceb4c3-00d1-f3b1-1859-19d47fce2e5a@intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 8 Aug 2018 10:58:23 +0530
Message-ID: <CAE33tLGnCkM6dfHhTgrro2U25a_W2nxLT1wVBvv0FcpUXpHf+A@mail.gmail.com>
Subject: Re: Temperature Sensor and its Reading not Showing Up.
To: Ed Tanous <ed.tanous@intel.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000083c60a0572e5c7cd"
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
X-List-Received-Date: Wed, 08 Aug 2018 05:28:26 -0000

--00000000000083c60a0572e5c7cd
Content-Type: text/plain; charset="UTF-8"

Ed,

We are using Aspeed AST-2500 BMC planted on an evaluation board. We are
using zaius configuration for building the system.

On Tue, Aug 7, 2018 at 9:52 PM, Ed Tanous <ed.tanous@intel.com> wrote:

> Akash
>
> What platform are you using?  AST2500evb?  If it's not one of the standard
> ones, is it something we can look at?
>
> There are a couple different ways to add sensors to dbus.  Which way you
> use depends on what platform you're on.
>
> -Ed
>

--00000000000083c60a0572e5c7cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ed,</div><div><br></div><div>We are using Aspeed AST-=
2500 BMC planted on an evaluation board. We are using zaius configuration f=
or building the system.<br></div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Tue, Aug 7, 2018 at 9:52 PM, Ed Tanous <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.ta=
nous@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Akas=
h<br>
<br>
What platform are you using?=C2=A0 AST2500evb?=C2=A0 If it&#39;s not one of=
 the standard ones, is it something we can look at?<br>
<br>
There are a couple different ways to add sensors to dbus.=C2=A0 Which way y=
ou use depends on what platform you&#39;re on.<span class=3D"HOEnZb"><font =
color=3D"#888888"><br>
<br>
-Ed<br>
</font></span></blockquote></div><br></div>

--00000000000083c60a0572e5c7cd--
