Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="acrRPsK1"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44XyQB6c5QzDqLV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 03:26:10 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id 9so4811553pfj.13
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=k87HKFM8gE93ayNFcD2ur2K5L7xadw0cNBKFnCFairc=;
 b=acrRPsK1kyDNz5zmVx0SrrrAecuGNKy3ya09aq3t9TmZg5wwDVpicyoiEZVek15UKX
 XOqVuLV+O7Um4DeghOVTwcp5JmbRxe9LuDu1lUmm0OrT85X/GFcZQk11H7S0GoVp+Pvy
 kThM87Xpe0V7M4b4y0zSiZWvVK2gEb1xbrHOt3669ts/qvlgEsmkeKAeJW4uo967hY1v
 HExbJtmaX6tc5+QWheQueXxmlXNmwoUpmAXntjJxMDibIMpJ6x30xpRcpEgmTWEPl2TZ
 qgV2aMNkCyqKrwtRatYAUcdo9QYrB5SWCRSM1vHdzpjx58jh02ngieSsvn7zvjIPKXKS
 raKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=k87HKFM8gE93ayNFcD2ur2K5L7xadw0cNBKFnCFairc=;
 b=IXzDBsb/Ex+L2rPCWBZbjjJK4U3Vm7VAHBon3u1FgZlWFE02GoH6EyKfa/YXU2Xp02
 LYotinacQjDFRGQUfAfSF5C3kwL/msvK0G0EQJYFqjxg1KaEwRwv5iAbuEIYBiL/8q0D
 bnEw9FCK837v7qgnu9zYNPBo7kOmQ6m4YAV3CHHfbAFRGzsBbrmSK5AIJRwC2AJ7bt94
 J8Rx1CunM1Ok3EzXGgFM0/HfaDuE7ODi57EXzxxZoKq8qdbiBxmESSMSW7bFec2NvPmB
 iHymfHNWwbhn4u7l1KqG5iEJtpwjLVTErHqa+WFA8CoBQWc0D8ATR6e68B8YEo5fsDcK
 16Rw==
X-Gm-Message-State: APjAAAXudx9fgchkqmWS+R1addj12ShMd0Ujx76uU6vFsqw7wKcxnSs9
 Z0/KX3OiLZpOJqa5sXAVGMmad1hVy/2XCtHO+lgj7uci
X-Google-Smtp-Source: APXvYqy6BlwlJSKYMHpuCpk83Z4wUSRRMPvQVwL3RU36LZBLqeU12e1TSmLmrdpZ5R7QFC7NSJtN8cImYh0iwD0Rt5c=
X-Received: by 2002:a63:4e64:: with SMTP id o36mr60059616pgl.213.1554135965035; 
 Mon, 01 Apr 2019 09:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
 <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
 <006052f8-dce3-d523-6d7e-8bb610648deb@intel.com>
In-Reply-To: <006052f8-dce3-d523-6d7e-8bb610648deb@intel.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Mon, 1 Apr 2019 11:25:54 -0500
Message-ID: <CANT4NrKDC92KOmUcsdP6hWarJKuRP7VTZSwD-F32g+Loqe4VEA@mail.gmail.com>
Subject: Re: OpenBMC GUI navigation -- User vs Security
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000020f03705857a7ae8"
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
X-List-Received-Date: Mon, 01 Apr 2019 16:26:11 -0000

--00000000000020f03705857a7ae8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Typically in server management the notion of security is different than
> user management. Perhaps =E2=80=9CAuthentication=E2=80=9D or =E2=80=9CAcc=
ess Control=E2=80=9D or =E2=80=9CAccess
> Management=E2=80=9D can be a category for the items you list.


Ok, I like =E2=80=9CAccess Control=E2=80=9D. Do you agree?


On Fri, Mar 29, 2019 at 2:35 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 3/28/19 10:06 PM, Khetan, Sharad wrote:
> > Hi Susan,
> > Typically in server management the notion of security is different than
user management. Perhaps =E2=80=9CAuthentication=E2=80=9D or =E2=80=9CAcces=
s Control=E2=80=9D or =E2=80=9CAccess
Management=E2=80=9D can be a category for the items you list.
> > Thanks,
> > -Sharad
>
> +1  "User management" is a very different concept than "Security" and I
> would advocate using a different term on the top level menu.

--00000000000020f03705857a7ae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Typicall=
y in server management the notion of security is different than user manage=
ment. Perhaps =E2=80=9CAuthentication=E2=80=9D or =E2=80=9CAccess Control=
=E2=80=9D or =E2=80=9CAccess Management=E2=80=9D can be a category for the =
items you list.</blockquote><div><br></div><div>Ok, I like =E2=80=9CAccess =
Control=E2=80=9D. Do you=C2=A0agree?</div><div><br></div><br>On Fri, Mar 29=
, 2019 at 2:35 PM Ed Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com">ed.t=
anous@intel.com</a>&gt; wrote:<br>&gt;<br>&gt; On 3/28/19 10:06 PM, Khetan,=
 Sharad wrote:<br>&gt; &gt; Hi Susan,<br>&gt; &gt; Typically in server mana=
gement the notion of security is different than user management. Perhaps =
=E2=80=9CAuthentication=E2=80=9D or =E2=80=9CAccess Control=E2=80=9D or =E2=
=80=9CAccess Management=E2=80=9D can be a category for the items you list.<=
br>&gt; &gt; Thanks,<br>&gt; &gt; -Sharad<br>&gt;<br>&gt; +1 =C2=A0&quot;Us=
er management&quot; is a very different concept than &quot;Security&quot; a=
nd I<br>&gt; would advocate using a different term on the top level menu.</=
div>

--00000000000020f03705857a7ae8--
