Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r4S9MO79"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wfRF6TQ1zDr61
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 15:34:17 +1000 (AEST)
Received: by mail-qt0-x22c.google.com with SMTP id d3-v6so21758672qtp.11
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 22:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vLL179eqJg4aE9hxsitjG9eh3S8+b+/bdB5PDt8g2eA=;
 b=r4S9MO79/4pYwpApVBE8GetBrU4YCUUbe/n1mau6HdwbZhoILZ3bgxcS47nH1nFtio
 nNYNC58rZLd/F/wfnQ+G6GHlq19ExqPiIvFZm7p7+YZ5xQiD6seiaC7DEXqm87SbX7f2
 TIr1Mn7brasTyZ8ouxTaFrtp4A7gOnyMNuunwMyjuNe4BIUqU7iJegF+ydJGElNiPmGi
 y0JekKlxGp8ZA66HRW2f60hT6swdJmM0n8Co0dxW8HfSM8hZTlIchg8Dh6P4Sqzwb9XP
 ZXZ7NcFULpf0LiZvC9mJNWeFX7jlo7pXBWQy69TmE+LC/4IOUFRRhMXMOZL4muF9MsM+
 IZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vLL179eqJg4aE9hxsitjG9eh3S8+b+/bdB5PDt8g2eA=;
 b=LXk3LdhqOpLN17iiDESXByafn6qZE6SMsuDnWKqVoz925/PoCTC60gFcSFXV1nM/aQ
 jucEcgF4bs/VE7Y3xNf5y95wBjiFUvSZlu2EwaBbytjWqsESUWo3/VmI7vRb45naAnRI
 o7CFIutuUkEE+Uj+8rO/R4DWy8kyyNiuOZ1K8iFDae5yAVB0Ces3t4YzScgZkCDSmuXr
 qa/onvpql/I5vvPpMwjC+wGJ8nSnkNWHNEOcF337Jmo6Anrz3PEXXhlvASREt9gNJKLO
 bnIINOS+dyiUdJaJcNoRwcZlTEM8tpe+i4IcQBL3l8j7HN4OLMBkkkMQ6Y7LnjFzfpFf
 ovSQ==
X-Gm-Message-State: APt69E0u8In/U4kNH8t9BsoKhYcIDDUBqxt+d1WKgCddZx2VluYJ8f8P
 TFnIGPnG8fZgXrBYPc4rtjN5NIRlJYwsKk/IfR4=
X-Google-Smtp-Source: ADUXVKJT4tnv8EQfiUgtttr3IYXE/Fxr4d2gouNObKjBGkePn2j9nzaroH8saorV8NgT5Vi+xY+rhj2sUpTIS2GeLN0=
X-Received: by 2002:a0c:ae2f:: with SMTP id
 y44-v6mr1187358qvc.157.1527658454751; 
 Tue, 29 May 2018 22:34:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2d65:0:0:0:0:0 with HTTP; Tue, 29 May 2018 22:34:14
 -0700 (PDT)
In-Reply-To: <CAARXrt=5dFZwqeW4+sradJYwYaaFr4-rQbVP-MhQf=j6LQCQuA@mail.gmail.com>
References: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
 <CAARXrt=5dFZwqeW4+sradJYwYaaFr4-rQbVP-MhQf=j6LQCQuA@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 30 May 2018 13:34:14 +0800
Message-ID: <CAG9c7cDZpOFbuwXXDQKTJ0cVE54ihxH_tezcssngF+jpwnyMvg@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000889df5056d65b30f"
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
X-List-Received-Date: Wed, 30 May 2018 05:34:19 -0000

--000000000000889df5056d65b30f
Content-Type: text/plain; charset="UTF-8"

>
> It looks like your build is missing the `pyinventorymgr`
> A quick check:
> 1. It comes from obmc-mgr-inventory.bb;
> 2. This recipe is added by packagegroup-obmc-apps.bbappend in
> meta-openpower
> layer, with openpower distro feature:
>     RDEPENDS_${PN}-inventory_append_df-openpower = " obmc-mgr-inventory"
> Since you are missing this recipe, I guess your build is not openpower?


Thanks for your response.
Yes, my build is x86 not opeppower.

I tried to add the line into
*meta-common/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend.*
RDEPENDS_${PN}-inventory_append_df-openpower = " obmc-mgr-inventory"

But I still couldn't find the inventory in
the /usr/lib/python2.7/site-packages/obmc/

--000000000000889df5056d65b30f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">It looks like your build =
is missing the `pyinventorymgr`<br>A quick check:<br>1. It comes from<span>=
=C2=A0</span><a href=3D"http://obmc-mgr-inventory.bb/" target=3D"_blank" st=
yle=3D"color:rgb(17,85,204)">obmc-mgr-inventory.bb</a>;<br>2. This recipe i=
s added by packagegroup-obmc-apps.<wbr>bbappend in meta-openpower<br>layer,=
 with openpower distro feature:<br>=C2=A0 =C2=A0 RDEPENDS_${PN}-inventory_<=
wbr>append_df-openpower =3D &quot; obmc-mgr-inventory&quot;<br>Since you ar=
e missing this recipe, I guess your build is not openpower?</blockquote><di=
v><br></div><div>Thanks for your response.</div><div>Yes, my build is x86 n=
ot opeppower.</div><div><br></div><div>I tried to add the line into=C2=A0<i=
>meta-common/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend=
.</i></div><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">RDEPENDS_${PN}-inventory_</span><wbr style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">append_df-openpower =3D &quot; obmc-mgr-inventory&quot;</span>

<br></div><div><br></div><div>But I still couldn&#39;t find the inventory i=
n the=C2=A0/usr/lib/python2.7/site-packages/obmc/</div><div><br></div></div=
>

--000000000000889df5056d65b30f--
