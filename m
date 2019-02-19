Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ju/gMbjJ"; 
 dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443rlZ3mfNzDqJ3
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 06:44:09 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id f196so422923qke.10
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ypyj571aXsIJhLLha/FBWlYGr6IoDBkmuod/81w6VCs=;
 b=Ju/gMbjJNv0PT6GgQVw1mO1kiyZv8K/UPyzXj4+Ru+WMzgfgf+3udR8WTE8e/JFq1T
 VV6oL/pOLaFNt6MBucmO7+sUKYeftcZaDxs+edbQBdfqWCs/IOCtvwMoDxyr1sM2gLjN
 e07i9LS9LhVs+EiLYe1vmhFS0fEKLHdXQJFjIrPIZM6CEpxuo2thOAQPtTeflfwps7yA
 Zg4cr4C4cWTzRapFDhDjCawl8ZZeVrvRwSGyt0NkZQLYeNeqD6F05FFmGFMTJNOTXFmz
 U/L8Mo148EeYAaEmfh6HYaYooRkwyon8Ftw2k1Gkwnh1pL1szEBOs6uJm3Zi1DjpZOpD
 I8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypyj571aXsIJhLLha/FBWlYGr6IoDBkmuod/81w6VCs=;
 b=udukSDqWOuJL2S3Zap/AfKY5sHhFAnmGJOd7BzSBuC8CHCgEBoX2l7aexn+k996J5G
 5luDCApdCBF6Lm27TShQMTWjQkUwgX7wjvNCheiLlCk3uOgolgtyeMVMSn3HYiBbI04m
 /MG6hv6qf6yBxX+L8jO9xUzdM19ACHZkm/ARrU77lM+d0gNsmwduk44FSc5w6D6AHfiB
 21ROB1HjigsOj8u627vJMwUG5kV1HuY1oYdo++7HMukN8vM85nQdb7Or7p6elSpJA7qi
 Z905iIXbS86iCCCNN2CkfmxTjdy7WUQXKbudVaAerqh+IIl65XUnUl+zXnAHQc9FuzS6
 dlCQ==
X-Gm-Message-State: AHQUAuZK4vIDyNqY3b5bmH/0w0hi8mQkjJBlImQoWmdX0z+O6tlB+oij
 4/v36tPjH4cF0NFSRs8BWIfVhQtkSy1f/oQH9LsiFA==
X-Google-Smtp-Source: AHgI3IYJdGx/9IesIwofFmdrqAJjuEIhuEcJCt+cMylfUF1vXx8gnNxbOuCmiCIGqTcj2HXDvm67OukMycaFfOJFov0=
X-Received: by 2002:a37:6307:: with SMTP id x7mr22449030qkb.92.1550605446639; 
 Tue, 19 Feb 2019 11:44:06 -0800 (PST)
MIME-Version: 1.0
References: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>
 <6E1BC227-2D18-43DA-94C1-2B726BC37B3D@fb.com>
 <ca9f5aa5-d0be-44bb-b726-2dec846c60a0@email.android.com>
In-Reply-To: <ca9f5aa5-d0be-44bb-b726-2dec846c60a0@email.android.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 19 Feb 2019 11:43:54 -0800
Message-ID: <CAJoAoZkirkJcpGVO-+NWjxWLvkTTw_Vy5HEiP4fKfyPj_sDJgQ@mail.gmail.com>
Subject: Re: Adding IPMI support to an existing implementation
To: Wim Vervoorn <wvervoorn@eltan.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d5e2650582447664"
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
X-List-Received-Date: Tue, 19 Feb 2019 19:44:12 -0000

--000000000000d5e2650582447664
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wim,

phosphor-ipmi-host contains the inband implementation; kcsbridged provides
the KCS interface bridge. Start by making sure those packages are included
in your build; inventory and eventlog implementations are included within
phosphor-ipmi-host.

Emily

On Fri, Feb 15, 2019 at 11:19 PM Wim Vervoorn <wvervoorn@eltan.com> wrote:

> At this point I'm not looking for additional OEM commands.
>
> My main goal is just to add all support request to enable inband ipmi wit=
h
> KCS interface.  The most important thing is that the system is capable to
> provide the inventory and eventlog information to the BMC during boot.
>
> The information I am looking for are items like. Which services need to b=
e
> included and what do I need to configure to make it work.
>
> Best regards,
>
> Wim Vervoorn
>
> Op 15 feb. 2019 9:31 p.m. schreef Vijay Khemka <vijaykhemka@fb.com>:
> Hi Wim,
> What are trying here, adding extra ipmi support for your oem commands?
> IPMI support is already there in phosphor-image. Please see if "ipmid"
> daemon is running. You can check package phosphor-ipmi-host which provide=
s
> support for ipmi daemon.
>
> Regards
> -Vijay
>
> =EF=BB=BFOn 2/15/19, 3:23 AM, "openbmc on behalf of Wim Vervoorn"
> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of
> wvervoorn@eltan.com> wrote:
>
>     Hello,
>
>     We have an existing AST2400 based implementation for OpenBMC 2.6.0 an=
d
> are trying to add IPMI support to it.
>
>     At this moment we don't have a good set of documentation on the ipmi
> implementation included in OpenBMC.
>
>     Can anyone point me to this documentation? Or is the only way to do
> this to go over the various packages?
>
>     Best regards,
>
>     Wim Vervoorn
>
>
>

--000000000000d5e2650582447664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wim,<div><br></div><div>phosphor-ipmi-host contains the in=
band implementation; kcsbridged provides the KCS interface bridge. Start by=
 making sure those packages are included in your build; inventory and event=
log implementations are included within phosphor-ipmi-host.</div><div><br><=
/div><div>Emily</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 15, 2019 at 11:19 PM Wim Vervoorn &lt;<a h=
ref=3D"mailto:wvervoorn@eltan.com">wvervoorn@eltan.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">





<div>
<div>
<div dir=3D"auto">At this point I&#39;m not looking for additional OEM comm=
ands.=C2=A0
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">My main goal is just to add all support request to enable=
 inband ipmi with KCS interface.=C2=A0 The most important thing is that the=
 system is capable to provide the inventory and eventlog information to the=
 BMC during boot.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The information I am looking for are items like. Which se=
rvices need to be included and what do I need to configure to make it work.=
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Best regards,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Wim Vervoorn</div>
</div>
<div class=3D"m_-7230588881901143632x_gmail_extra"><br>
<div class=3D"m_-7230588881901143632x_gmail_quote">Op 15 feb. 2019 9:31 p.m=
. schreef Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"=
_blank">vijaykhemka@fb.com</a>&gt;:<br type=3D"attribution">
</div>
</div>
</div></div><div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"m_-7230588881901143632PlainText">Hi Wim,<br>
What are trying here, adding extra ipmi support for your oem commands? IPMI=
 support is already there in phosphor-image. Please see if &quot;ipmid&quot=
; daemon is running. You can check package phosphor-ipmi-host which provide=
s support for ipmi daemon.<br>
<br>
Regards<br>
-Vijay<br>
<br>
=EF=BB=BFOn 2/15/19, 3:23 AM, &quot;openbmc on behalf of Wim Vervoorn&quot;=
 &lt;openbmc-bounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank">fb.com@lists.ozlabs.org</a> on behalf of <a href=3D"ma=
ilto:wvervoorn@eltan.com" target=3D"_blank">wvervoorn@eltan.com</a>&gt; wro=
te:<br>
<br>
=C2=A0=C2=A0=C2=A0 Hello,<br>
=C2=A0=C2=A0=C2=A0 <br>
=C2=A0=C2=A0=C2=A0 We have an existing AST2400 based implementation for Ope=
nBMC 2.6.0 and are trying to add IPMI support to it.<br>
=C2=A0=C2=A0=C2=A0 <br>
=C2=A0=C2=A0=C2=A0 At this moment we don&#39;t have a good set of documenta=
tion on the ipmi implementation included in OpenBMC.<br>
=C2=A0=C2=A0=C2=A0 <br>
=C2=A0=C2=A0=C2=A0 Can anyone point me to this documentation? Or is the onl=
y way to do this to go over the various packages?<br>
=C2=A0=C2=A0=C2=A0 <br>
=C2=A0=C2=A0=C2=A0 Best regards,<br>
=C2=A0=C2=A0=C2=A0 <br>
=C2=A0=C2=A0=C2=A0 Wim Vervoorn<br>
=C2=A0=C2=A0=C2=A0 <br>
<br>
</div>
</span></font>
</div></blockquote></div>

--000000000000d5e2650582447664--
