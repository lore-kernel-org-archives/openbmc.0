Return-Path: <jainmjo@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=jainmjo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D7xaoUlG"; 
 dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QSyG0qxfzDqQh
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 13:57:57 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id w139so646881oie.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 19:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMeJ8sqLX+prCc7QY0+ZEbYtzIRFR1v7qukgdPg0MhM=;
 b=D7xaoUlGD2+0w337xkZ0E8nNRJnHp/UbWW9bh33uol3Tfzn0AZpRmB3bOd0u7VRMQG
 HBpIwfELjDQ6SXxdXThBlwTto0wwH8b1+rlmcyJK1OOnn4C4ucgudRnFgCRiQr5ii3ZA
 EaTCgirtVqNNqGmKFJsCXDobZikNh147UK+rJA+Tvq/XMWObcq3b2uihJDsyA7VEqepD
 4atGDRZ1dI6wxs8iFHplmI9V/KiVi9lm/eQjeg56RtSeTbFwXouWjAhwK5O48U/nif9x
 7ODnTV57/J4AsxG+la32GJPKjTIBOy9hTGNsa8Wu3a032fRSk4sdc/hruyp6IadMbnOu
 TZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMeJ8sqLX+prCc7QY0+ZEbYtzIRFR1v7qukgdPg0MhM=;
 b=raCgqPQWM9qZ7sLE5KqpDQ629OIMi1NH6ETa5HTSAtR1IYYvOxg39pi44DoLZj/dZQ
 ObJHoC3Z+X3LZbX8cS8YZD0SqVQ8lyP0iCd2Ou95iy0Y0C+jlpnxH1XigtWi2zeQKV8L
 CaQY/TfZivK8zjzyHwLcPyApGCWsL6MF4srZ17+KIDH8GRdI0JC9M2PV1UgNm2cnJrzK
 y1zYRe0vOzLn3LG5E1g3afR9SmfV0i/0FcBoc3eNA15VlizD5sr0k9tBh+4bptQeaPCd
 IcrlkFJOPolTGA/8gz7UfflADoJlddnr1yHa+0bT5/Aze0XAAB7g0QFsB5T9bncNjLz1
 TXPQ==
X-Gm-Message-State: APjAAAWUHDiIGjdV4X0BjpHEermniUk9tuQO23YckEz8Crm55w8gwvX2
 AXWNQEW1k5t0F8uL/Hh8la1JA85nWQgqNbksYLo=
X-Google-Smtp-Source: APXvYqxQddPH9lp3OSHafmqMbppByfG4ficqP4lxF1WwFL8yN9VXXz39GGY6r1QNCVR6myf/tUhD9H84m5E8WdExkc8=
X-Received: by 2002:aca:4142:: with SMTP id o63mr365892oia.58.1553223474438;
 Thu, 21 Mar 2019 19:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADc45smtLBVn9vSh3uEcMWEwcnUo+asYZR5pXgFKP+5xkuK7vw@mail.gmail.com>
 <4A255327-67C2-4F1F-A8C4-7795CE7F9C47@fb.com>
 <CADc45skOCs1t77ahfcjcjxHF9PfLgK+4-3XTEt+aEHRCGjwzpQ@mail.gmail.com>
 <F5052DB3-5AEC-4BF5-AA67-96036250B97A@fb.com>
In-Reply-To: <F5052DB3-5AEC-4BF5-AA67-96036250B97A@fb.com>
From: "jainmjo@gmail.com" <jainmjo@gmail.com>
Date: Fri, 22 Mar 2019 08:27:43 +0530
Message-ID: <CADc45skuKnmiO4AE+VF3NEbiyoN-nVYSGRuLQSsecc3Q0r29GQ@mail.gmail.com>
Subject: Re: OpenBMC Development Kit
To: Sai Dasari <sdasari@fb.com>
Cc: Openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007366020584a6050e"
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
X-List-Received-Date: Fri, 22 Mar 2019 02:57:59 -0000

--0000000000007366020584a6050e
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 22, 2019 at 1:52 AM Sai Dasari <sdasari@fb.com> wrote:

>
>
>
>
> *From: *"jainmjo@gmail.com" <jainmjo@gmail.com>
> *Date: *Thursday, March 21, 2019 at 10:54 AM
> *To: *Sai Dasari <sdasari@fb.com>
> *Cc: *Openbmc <openbmc@lists.ozlabs.org>
> *Subject: *Re: OpenBMC Development Kit
>
>
>
>
>
>
>
> On Thu, Mar 21, 2019 at 10:50 PM Sai Dasari <sdasari@fb.com> wrote:
>
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
>
>
> Thank you!
>
>
>
>
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
>
>
> Yes. I have already tried the SDK with QEMU. We use AST2500 based systems.
> By "AST2500 EVB", do you mean the Portwell kit or something else?
>
> I meant EVBs provided by BMC Vendors (e.g. Aspeed and Nuvoton) and I
> suggest to check with those vendor for getting access to these EVBs.
>
>
>
> Portwell Kit is designed based on AST2500 EVB and adds a COM-Express
> connector to connect host CPU processor. This will allow to test the
> communication path between hostCPU->BMC. Portwell kit will be useful in
> case you would like to test these host->BMC communication features. (e.g.
> UEFI->BMC, POST codes, error logging via SEL, ipmitool over KCS/LPC etc.).
> For getting access to this board you can contact portwell @
> http://portwell.com/solutions/openBMC.php.
>
>
>

Ok. Got it.

>
>
> Thanks
>
> Jain
>
>
>
>

--0000000000007366020584a6050e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2019 at 1:52 AM Sai D=
asari &lt;<a href=3D"mailto:sdasari@fb.com">sdasari@fb.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_761515499459827967WordSection1">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">&quot;<a href=3D"mail=
to:jainmjo@gmail.com" target=3D"_blank">jainmjo@gmail.com</a>&quot; &lt;<a =
href=3D"mailto:jainmjo@gmail.com" target=3D"_blank">jainmjo@gmail.com</a>&g=
t;<br>
<b>Date: </b>Thursday, March 21, 2019 at 10:54 AM<br>
<b>To: </b>Sai Dasari &lt;<a href=3D"mailto:sdasari@fb.com" target=3D"_blan=
k">sdasari@fb.com</a>&gt;<br>
<b>Cc: </b>Openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: OpenBMC Development Kit<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Mar 21, 2019 at 10:50 PM Sai Dasari &lt;<a h=
ref=3D"mailto:sdasari@fb.com" target=3D"_blank">sdasari@fb.com</a>&gt; wrot=
e:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+sdasari=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blan=
k">fb.com@lists.ozlabs.org</a>&gt; on behalf of &quot;<a href=3D"mailto:jai=
nmjo@gmail.com" target=3D"_blank">jainmjo@gmail.com</a>&quot;
 &lt;<a href=3D"mailto:jainmjo@gmail.com" target=3D"_blank">jainmjo@gmail.c=
om</a>&gt;<br>
<b>Date: </b>Thursday, March 21, 2019 at 8:26 AM<br>
<b>To: </b>Openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>OpenBMC Development Kit</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi all,
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">My team at Flipkart is working on porting OpenBMC to=
 our servers.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jain, Welcome Flipkart to OpenBMC community project.=
<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thank you!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">Do you recommend getting Portwell&#39;s Neptune Alph=
a OpenBMC dev kit to play around with OpenBMC and get familiarised with it =
before jumping to actual servers?<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">Hope you have taken a look at
<a href=3D"https://github.com/openbmc/docs/tree/master/development" target=
=3D"_blank">
https://github.com/openbmc/docs/tree/master/development</a>. Would suggest =
to try OpenBMC SDK using QEMU followed by few EVBs from BMC SoC vendors @
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-evb" target=
=3D"_blank">
https://github.com/openbmc/openbmc/tree/master/meta-evb</a>. Hope this help=
s!<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Yes. I have already tried the SDK with QEMU. We use =
AST2500 based systems. By &quot;AST2500 EVB&quot;, do you mean the Portwell=
 kit or something else?<u></u><u></u></p>
<p class=3D"MsoNormal">I meant EVBs provided by BMC Vendors (e.g. Aspeed an=
d Nuvoton) and I suggest to check with those vendor for getting access to t=
hese EVBs.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Portwell Kit is designed based on AST2500 EVB and ad=
ds a COM-Express connector to connect host CPU processor. This will allow t=
o test the communication path between hostCPU-&gt;BMC. Portwell kit will be=
 useful in case you would like to test
 these host-&gt;BMC communication features. (e.g. UEFI-&gt;BMC, POST codes,=
 error logging via SEL, ipmitool over KCS/LPC etc.). For getting access to =
this board you can contact portwell @
<a href=3D"http://portwell.com/solutions/openBMC.php" target=3D"_blank">htt=
p://portwell.com/solutions/openBMC.php</a>.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0</p></div></div></div></div></div></blo=
ckquote><div><br></div><div>Ok. Got it.=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_7615154=
99459827967WordSection1"><div><div><div><p class=3D"MsoNormal"><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jain<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000007366020584a6050e--
