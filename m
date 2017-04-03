Return-Path: <raltherr@google.com>
Received: from mail-yb0-x22e.google.com (mail-yb0-x22e.google.com
 [IPv6:2607:f8b0:4002:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxj4Q2N3bzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 05:35:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Oi7X1/pv"; 
 dkim-atps=neutral
Received: by mail-yb0-x22e.google.com with SMTP id l201so31832097ybf.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SUKVGkggENMMPCD0hrfFYDJUbBLL2ZZ2Vgrg8hWlwQU=;
 b=Oi7X1/pvqybFlvBGIaWW3ZXKfhnpcUV8ZjGIN82t4ugC8Nq9XGwQVLbWbuyjy8o/Ih
 QBYKkL909auWJfopKaaw70wZSBwnzAaga9RTiXD2J5iKftdh1EbucLUCWUP8ViPW06kb
 EknRE/TBxkDEGQphu6vm/ZV5VcnoWaRckGno3B2YQT/7ZpMPEMTWDbKo6ewu7htxn1W4
 6SWFkhfNIvjqMYz9Emrjfh6f3olGkZbPS34m0vejE/o7r8Dd8lU+8E/6UNchg+FbuBoW
 n7w7pzNVXQHzj6sPegiZ9sXBzliRmxz5QycvZ0razaHMiJwyoCcdv5vKZSRbxsPhoKvY
 Dzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SUKVGkggENMMPCD0hrfFYDJUbBLL2ZZ2Vgrg8hWlwQU=;
 b=UUM5REUeV8G9LuTZr+EIGZmxcRZ8p6qINDe5mJEoW6BIxEP1rkXYMLGgpSDGQW7LHz
 PAyVMkZZwAgvV0DMmRTMCbyLJ/Olh4OgS6JqOg0mNZvhLVShdzCJWQZOXMGr2p2xPKTG
 ySx4D/25aWxNVU2/vekVqoZajVgLSAda36NjT08V5gDx8VdImzcIKEze+CdELujo04Gb
 kJ8xvNLgmwrzGuUsAT31EyNaSAPRv34wSA+QiOG8ywLJXINXYD94GZEuqd04Ggdfi/uG
 HCvmqYmKBqbSPiPsvDGQeyvYIfUAD2/8KYttoexuTXJsvw6KxFe15xxNZ5CtK6CeUnpO
 d4zw==
X-Gm-Message-State: AFeK/H3qUayxa91eGkElTy1RXxUUlorrvM+4os/1LPukTbZzPw6MBvMyxwXJ/VyQd7QjqF5mDayN2WHD1QuBF/Qc
X-Received: by 10.37.126.199 with SMTP id z190mr11870663ybc.143.1491248115511; 
 Mon, 03 Apr 2017 12:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.209.200 with HTTP; Mon, 3 Apr 2017 12:35:14 -0700 (PDT)
In-Reply-To: <E41D83B2B2E8CB42AC13E92B4C3FABD3B602B7@TS-GGN-MBX002.ibtechnology.com>
References: <E41D83B2B2E8CB42AC13E92B4C3FABD3B6026B@TS-GGN-MBX002.ibtechnology.com>
 <CAPLgG=k4aLLywcRe_Ds-jhjbt4kcfM8FBb5whHBXvWga029deg@mail.gmail.com>
 <E41D83B2B2E8CB42AC13E92B4C3FABD3B602B7@TS-GGN-MBX002.ibtechnology.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 3 Apr 2017 12:35:14 -0700
Message-ID: <CAPLgG=kRa9JwPWL_RFRoO0p0C0oTKF5+L7mjWS_OqgeUi=Hd1Q@mail.gmail.com>
Subject: Re: OpenBMC and DHCP server
To: Karthik BalaGuru T <karthik.t@incedoinc.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114e5a4232f37c054c48426e
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
X-List-Received-Date: Mon, 03 Apr 2017 19:35:19 -0000

--001a114e5a4232f37c054c48426e
Content-Type: text/plain; charset=UTF-8

OpenBMC is based on Yocto.  Both are designed to allow you to generate
customized images based on your needs.

On Mon, Apr 3, 2017 at 12:05 PM, Karthik BalaGuru T <karthik.t@incedoinc.com
> wrote:

> Thanks Rick.
>
>
>
> Thanks for confirming that it can run a DHCP server and that the default
> configurations do not have DHCP server.
>
>
>
> Yeah, just wanted to know whether the linux distribution has been stripped
> and customized version w.r.t BMC.
>
> It is for the blade chassis configuration.
>
>
>
> Regards,
>
> Karthik Balaguru
>
>
>
> *From:* Rick Altherr [mailto:raltherr@google.com]
> *Sent:* Monday, April 03, 2017 10:29 AM
> *To:* Karthik BalaGuru T
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: OpenBMC and DHCP server
>
>
>
> OpenBMC is a linux distribution and as such can run a DHCP server.  The
> default configurations provided do not do so, nor is there a defined IPMI
> or REST interface for doing so.  Are you planning to use AST1250 behind
> AST2520 in a blade chassis configuration?
>
>
>
> Rick
>
>
>
> On Mon, Apr 3, 2017 at 10:10 AM, Karthik BalaGuru T <
> karthik.t@incedoinc.com> wrote:
>
> Hi,
>
> I am analyzing few parts of OpenBMC for an architecture.
> Kindly let me know whether OpenBMC of AST1250 and AST2520 allow setting of
> DHCP server so that it can serve IP addresses to the connected clients.
>
> Thanks in advance,
> Karthik Balaguru
> Disclaimer :
> This email communication may contain privileged and confidential
> information and is intended for the use of the addressee only. If you are
> not an intended recipient you are requested not to reproduce, copy
> disseminate or in any manner distribute this email communication as the
> same is strictly prohibited. If you have received this email in error,
> please notify the sender immediately by return e-mail and delete the
> communication sent in error. Email communications cannot be guaranteed to
> be secure & error free and Incedo Inc. is not liable for any errors in the
> email communication or for the proper, timely and complete transmission
> thereof.
>
>
>
> Disclaimer :
> This email communication may contain privileged and confidential
> information and is intended for the use of the addressee only. If you are
> not an intended recipient you are requested not to reproduce, copy
> disseminate or in any manner distribute this email communication as the
> same is strictly prohibited. If you have received this email in error,
> please notify the sender immediately by return e-mail and delete the
> communication sent in error. Email communications cannot be guaranteed to
> be secure & error free and Incedo Inc. is not liable for any errors in
> the email communication or for the proper, timely and complete transmission
> thereof.
>

--001a114e5a4232f37c054c48426e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OpenBMC is based on Yocto.=C2=A0 Both are designed to allo=
w you to generate customized images based on your needs.</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 3, 2017 at 12:05 P=
M, Karthik BalaGuru  T <span dir=3D"ltr">&lt;<a href=3D"mailto:karthik.t@in=
cedoinc.com" target=3D"_blank">karthik.t@incedoinc.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-1724430824804092994WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Thanks Rick.<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Thanks for confirming tha=
t it can run a DHCP server and that the default configurations do not have =
DHCP server.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Yeah, just wanted to know=
 whether the linux distribution has been stripped and customized version w.=
r.t BMC.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">It is for the blade chass=
is configuration.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Karthik Balaguru<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Rick Alt=
herr [mailto:<a href=3D"mailto:raltherr@google.com" target=3D"_blank">ralth=
err@google.com</a>]
<br>
<b>Sent:</b> Monday, April 03, 2017 10:29 AM<br>
<b>To:</b> Karthik BalaGuru T<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: OpenBMC and DHCP server<u></u><u></u></span></p><div><d=
iv class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">OpenBMC is a linux distribution and as such can run =
a DHCP server.=C2=A0 The default configurations provided do not do so, nor =
is there a defined IPMI or REST interface for doing so.=C2=A0 Are you plann=
ing to use AST1250 behind AST2520 in a blade
 chassis configuration?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Rick<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Apr 3, 2017 at 10:10 AM, Karthik BalaGuru T =
&lt;<a href=3D"mailto:karthik.t@incedoinc.com" target=3D"_blank">karthik.t@=
incedoinc.com</a>&gt; wrote:<u></u><u></u></p>
<p class=3D"MsoNormal">Hi,<br>
<br>
I am analyzing few parts of OpenBMC for an architecture.<br>
Kindly let me know whether OpenBMC of AST1250 and AST2520 allow setting of =
DHCP server so that it can serve IP addresses to the connected clients.<br>
<br>
Thanks in advance,<br>
Karthik Balaguru<br>
Disclaimer :<br>
This email communication may contain privileged and confidential informatio=
n and is intended for the use of the addressee only. If you are not an inte=
nded recipient you are requested not to reproduce, copy disseminate or in a=
ny manner distribute this email
 communication as the same is strictly prohibited. If you have received thi=
s email in error, please notify the sender immediately by return e-mail and=
 delete the communication sent in error. Email communications cannot be gua=
ranteed to be secure &amp; error free
 and Incedo Inc. is not liable for any errors in the email communication or=
 for the proper, timely and complete transmission thereof.<u></u><u></u></p=
>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div><div><div class=3D"h5">
<p class=3D"MsoNormal" style=3D"MARGIN:0cm 0cm 0pt"><span lang=3D"EN-US" st=
yle=3D"FONT-SIZE:10pt;BACKGROUND:white;COLOR:black;FONT-FAMILY:&#39;Segoe U=
I&#39;,&#39;sans-serif&#39;"><span style=3D"font-family:Tahoma">Disclaimer =
:<span class=3D"m_-1724430824804092994apple-converted-space">=C2=A0</span><=
/span></span><span lang=3D"EN-US" style=3D"FONT-SIZE:10pt;COLOR:black;FONT-=
FAMILY:&#39;Segoe UI&#39;,&#39;sans-serif&#39;"><br><span style=3D"BACKGROU=
ND:white"><span style=3D"font-family:Tahoma">This email communication may c=
ontain privileged and confidential information and is intended for the use =
of the addressee only. If you are not an intended recipient you are request=
ed not to reproduce, copy disseminate or in any manner distribute this emai=
l communication as the same is strictly prohibited. If you have received th=
is email in error, please notify the sender immediately by return e-mail an=
d delete the communication sent in error. Email communications cannot be gu=
aranteed to be secure &amp; error free and <span style=3D"text-decoration:u=
nderline">Incedo Inc.</span>=C2=A0is not liable for any errors in the email=
 communication or for the proper, timely and complete transmission thereof.=
</span></span></span></p></div></div></div>

</blockquote></div><br></div>

--001a114e5a4232f37c054c48426e--
