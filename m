Return-Path: <jainmjo@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=jainmjo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sa0Wc+sh"; 
 dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QDtK3mb3zDqDC
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 04:53:45 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id u12so5336176oiv.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XPg64b9lRnX0tLlat0YkZGx0qx82ebzfV/kNwuxKxU=;
 b=Sa0Wc+shLqg3U/ejCZVPAERHM6UH54HJSKtma9yjYjZyTRRJIWcZK7T3nFJneRhApx
 m5xXsVXZKMVyo8vlgdOKXrXtZkmLSfyvFqB7oWFu8cWM50bX0CtALf/Ww+IQQ046+m6s
 aVK4i6PsYAFf5E8XuY/SUnS9cJqYlDMEihHwYO9ACYiMgaxui7bBAxh1X4vCI/WIm16p
 q7e15E7GPmOORCOrX3m/d+/Y1XledIEPCMA+ez4wNg4Nitve0/tZZRN9onntCoupzixI
 tJ0Brj4dhWPQr/BuXFy5fQVlbkMvpdQkZmibg3/i/DwCAHZLdwVMOrv6YdYWqrpkKaxi
 Cw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XPg64b9lRnX0tLlat0YkZGx0qx82ebzfV/kNwuxKxU=;
 b=bshGx6JOaFKXx845zfrnboniibH/S5DTmFtQwkUloiS7fvxLC5e2nUYoas3w5GfjJ5
 Y9wcRzh3zz7hVRx45dYYLEYB4ySZXik2l/wRqKrfzYueFgZG23b7ZBNwJeftb++Ry7fm
 SUeKzzMJ7TnNEWEDHstLE1IW6eQxunPvSczAKDM4azVIKQDTeGHZ1YSF9hcCy5baVCz9
 Nn1cKCGt6m+Fy9Ri0YiPYyDlrOd/saDN/yQHLSJ05m1AA9fNcpvIRPw9OhK5YYWZdLqv
 gxhrUtYWAWSXLc3Hh4tZvA2e/RGAn+LyavQcG1WpKXwR5VsUof1V1UCVumXHipxx/9gY
 bikw==
X-Gm-Message-State: APjAAAVqBqxC7dnaPJvx60NyF/c83CVJwoHMIyWROQGTra4+Iz3NzNbG
 1FKLXXYwMBo3y/J+r1VJ5zL+emq1CEvK9wjOwTE=
X-Google-Smtp-Source: APXvYqzoQ2zm0erscQmsrzu7pdrPInEk1FPlbGwNuyjmKDu8mvsSX+5aTccWkFlJTLlCe0gVwulvXHYLBbeZVJv99GA=
X-Received: by 2002:aca:d7c3:: with SMTP id o186mr410179oig.28.1553190821297; 
 Thu, 21 Mar 2019 10:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <CADc45smtLBVn9vSh3uEcMWEwcnUo+asYZR5pXgFKP+5xkuK7vw@mail.gmail.com>
 <4A255327-67C2-4F1F-A8C4-7795CE7F9C47@fb.com>
In-Reply-To: <4A255327-67C2-4F1F-A8C4-7795CE7F9C47@fb.com>
From: "jainmjo@gmail.com" <jainmjo@gmail.com>
Date: Thu, 21 Mar 2019 23:23:29 +0530
Message-ID: <CADc45skOCs1t77ahfcjcjxHF9PfLgK+4-3XTEt+aEHRCGjwzpQ@mail.gmail.com>
Subject: Re: OpenBMC Development Kit
To: Sai Dasari <sdasari@fb.com>
Cc: Openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002c020c05849e6bd8"
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
X-List-Received-Date: Thu, 21 Mar 2019 17:53:46 -0000

--0000000000002c020c05849e6bd8
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 21, 2019 at 10:50 PM Sai Dasari <sdasari@fb.com> wrote:

>
>
>
>
> *From: *openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org> on
> behalf of "jainmjo@gmail.com" <jainmjo@gmail.com>
> *Date: *Thursday, March 21, 2019 at 8:26 AM
> *To: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *OpenBMC Development Kit
>
>
>
> Hi all,
>
>
>
> My team at Flipkart is working on porting OpenBMC to our servers.
>
> Jain, Welcome Flipkart to OpenBMC community project.
>

Thank you!


>
> Do you recommend getting Portwell's Neptune Alpha OpenBMC dev kit to play
> around with OpenBMC and get familiarised with it before jumping to actual
> servers?
>
> Hope you have taken a look at
> https://github.com/openbmc/docs/tree/master/development. Would suggest to
> try OpenBMC SDK using QEMU followed by few EVBs from BMC SoC vendors @
> https://github.com/openbmc/openbmc/tree/master/meta-evb. Hope this helps!
>

Yes. I have already tried the SDK with QEMU. We use AST2500 based systems.
By "AST2500 EVB", do you mean the Portwell kit or something else?


>
> Thanks
>
> Jain
>
>
>

--0000000000002c020c05849e6bd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 21, 2019 at 10:50 PM Sai =
Dasari &lt;<a href=3D"mailto:sdasari@fb.com">sdasari@fb.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-8847922323357671049WordSection1">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+sdasari=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blan=
k">fb.com@lists.ozlabs.org</a>&gt; on behalf of &quot;<a href=3D"mailto:jai=
nmjo@gmail.com" target=3D"_blank">jainmjo@gmail.com</a>&quot; &lt;<a href=
=3D"mailto:jainmjo@gmail.com" target=3D"_blank">jainmjo@gmail.com</a>&gt;<b=
r>
<b>Date: </b>Thursday, March 21, 2019 at 8:26 AM<br>
<b>To: </b>Openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>OpenBMC Development Kit<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi all, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">My team at Flipkart is working on porting OpenBMC to=
 our servers.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jain, Welcome Flipkart to OpenBMC community project.=
</p></div></div></div></div></div></blockquote><div><br></div><div>Thank yo=
u!</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv lang=3D"EN-US"><div class=3D"gmail-m_-8847922323357671049WordSection1"><=
div><div><div><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Do you recommend getting Portwell&#39;s Neptune Alph=
a OpenBMC dev kit to play around with OpenBMC and get familiarised with it =
before jumping to actual servers?<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">Hope you have taken a look at <a href=3D"https://git=
hub.com/openbmc/docs/tree/master/development" target=3D"_blank">
https://github.com/openbmc/docs/tree/master/development</a>. Would suggest =
to try OpenBMC SDK using QEMU followed by few EVBs from BMC SoC vendors @
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-evb" target=
=3D"_blank">https://github.com/openbmc/openbmc/tree/master/meta-evb</a>. Ho=
pe this helps!</p></div></div></div></div></div></blockquote><div><br></div=
><div>Yes. I have already tried the SDK with QEMU. We use AST2500 based sys=
tems. By &quot;AST2500 EVB&quot;, do you mean the Portwell kit or something=
 else?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div lang=3D"EN-US"><div class=3D"gmail-m_-8847922323357671049WordSection=
1"><div><div><div><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jain<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000002c020c05849e6bd8--
