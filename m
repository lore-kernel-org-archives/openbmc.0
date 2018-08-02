Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NoRbwGUu"; 
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41grgR4rQ6zF14j
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 10:30:43 +1000 (AEST)
Received: by mail-qt0-x236.google.com with SMTP id f18-v6so466296qtp.10
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 17:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Qv9i0mfWUNr0UNmmC5OJpvrAJhcAHByyRFey+Xh34uw=;
 b=NoRbwGUugLzeqQU9ieGA36gkNxHPOLLyhmJksSBfIN5UOWSo18+M1sz4bTcUK2WMpv
 te+Y6M3E7gpzQCR+26YZb9HFGgH+acGqpQ42UY3CS3RTH5agZdII4YwQ6MutUw2guho6
 j/HqYrEMZYeWv9jM9tYbWfjambKlN6L8Mqz3iF7BpbACIVOkhX4jZNFoIbEfTs09BLct
 xRo+FTVkYwkgTt33YA/QSimSy2gSav++W60EessSi62PmKolW3bsPpd++xPQFKJ28ZJy
 ws5spZI2wCpfcaB1y0IxeTQ0WWz8Uz87sUqT/Bg7CBSbHt3xRZuhzyJKS7Rq34ZBcsxD
 ogzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Qv9i0mfWUNr0UNmmC5OJpvrAJhcAHByyRFey+Xh34uw=;
 b=iX6kyOh5beXCbxkRII1YIYLNGoeBV03iFtHxXH/zaSQgzp0vwAxdyaa1QSBgkIrRxQ
 u/2ZQoe6E0sukhGT5pblQWvM6LMMKK8zdALUI3cTapwjsiNkp1LXfnHvU7O+yijyjxvC
 vP79EzfYuPEN40CVyhe0O/q/9i5Vwg5LDABmjiaE2207zbsTsW+6TlJyrJRfiJI4op4f
 rSZ7/BCRsru0Jb4RmL2H/1jq0O1frwACrqtp14M0ya5PNKvh1+v3qZpe7nROe5CbZy30
 FbQGXAo8Txhm9NxQRXsNCUI1RPzseT0uyyZqbx/h54fmO6Hx9EbL5iQqLJDzEQ+pHKVA
 LchA==
X-Gm-Message-State: AOUpUlED7nMDlSCZFUjvOB8o/r85Zk44Fjn284dnRUUakIzgEr1w9J26
 fTKzqRIQ87ZN0tVLTrf0g02WB0nrultFY5swxL4=
X-Google-Smtp-Source: AAOMgpcjohDhFHchZ35fc5fjbFOMYgbR1yKJnfH3UU/aXWexLGNa6r5Uxl0SOmP6six1GxsJIi67dWNtTplm/OG7kZE=
X-Received: by 2002:a0c:d112:: with SMTP id
 a18-v6mr578809qvh.200.1533169840457; 
 Wed, 01 Aug 2018 17:30:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Wed, 1 Aug 2018 17:30:39 -0700 (PDT)
In-Reply-To: <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Thu, 2 Aug 2018 08:30:39 +0800
Message-ID: <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
Subject: Re: UART Route setting
To: Oskar Senft <osk@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b88dc2057268eb34"
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
X-List-Received-Date: Thu, 02 Aug 2018 00:30:45 -0000

--000000000000b88dc2057268eb34
Content-Type: text/plain; charset="UTF-8"

Hi Oskar,

Thanks your response.

In my machine design, the host uses AST2500 UART2 to implement console
redirection.
To make openbmc host consle/ipmi SOL workable, I use the 'local-tty =
ttyS2' setting and manually change the UART route (UART2<->UART3).

I found  VUART be used for host console after I checked some openpower
machines. Thus, they didn't meet this problem.

I also tried to look for any related discussion but got nothing.
To avoid any loss, I sent a mail to ask if any approach to change the UART
route under openbmc framework.

Currently, I add a hard code (modify HICRA regiser) in u-boot as the
workaround.

The suggestions you provided are good if the dynamic UART  route changing
is needed.

I may write a driver to handle the default UART route. It can be
enabled/disabled and get the the default UART route setting from machine dts,
and then modify the HICRA register.

Thanks.
Henbin.

2018-08-02 0:16 GMT+08:00 Oskar Senft <osk@google.com>:

> Hi Henbin
>
> It's funny that you ask, since I had just started to look into the same
> problem.
>
> I'd like to change the UART routing on an AST2500 when a client connects
> to the obmc-console-server. The use case is to dynamically connect the
> host's UART to a UART owned by the BMC.
>
> I was thinking of writing a kernel driver that would expose the config
> options from the HICRA register on AST2500 as /sys files. Each file
> represents the target UART1..5 and IO1..5. The file value represents the
> source UART1..5 and IO1..5. Not all combinations are supported by the
> Aspeed, so I'd add the necessary checks and error reporting into the code.
>
> An alternative would be to just use /dev/mem to do that, but my
> understanding is that default support for that is going away or has gone
> away.
>
> Oskar.
>
>
> ---------- Forwarded message ----------
>> From: Henbin Chang <henbinchang@gmail.com>
>> Date: Wed, Aug 1, 2018 at 12:11 AM
>> Subject: UART Route setting
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>
>>
>> Hi,
>>
>> Could anyone know how to modify UART Route setting through dts, driver
>> or other mechanism?
>>
>> Or I have to find a point to modify it e.g. board_init() in the u-boot.
>>
>> Thanks.
>>
>

--000000000000b88dc2057268eb34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oskar,<div><br></div><div>Thanks your response.</div><d=
iv><br></div><div>In my machine design, the host uses AST2500 UART2 to impl=
ement console redirection.</div><div>To make openbmc host consle/ipmi SOL w=
orkable, I use the &#39;local-tty =3D ttyS2&#39; setting and manually chang=
e the UART route (UART2&lt;-&gt;UART3).</div><div><br></div><div>I found=C2=
=A0 VUART be used for host console after I checked some openpower machines.=
 Thus, they didn&#39;t meet this problem.</div><div><br></div><div>I also t=
ried to look for any related discussion but got nothing.</div><div>To avoid=
 any loss, I sent a mail to ask if any approach to change the UART route un=
der openbmc framework.</div><div><br></div><div>Currently, I add a hard cod=
e (modify HICRA regiser) in u-boot as the workaround.</div><div><br></div><=
div>The suggestions you provided are good if the dynamic UART=C2=A0 route c=
hanging is needed.</div><div><br></div><div>I may write a driver to handle =
the default UART route. It can be enabled/disabled and get the the default =
UART route setting from<span style=3D"font-size:small;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">=C2=A0machine dts</span>, and then modify the HICR=
A register.</div><div><br></div><div>Thanks.</div><div>Henbin.</div><div><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">2018-08-02 0:=
16 GMT+08:00 Oskar Senft <span dir=3D"ltr">&lt;<a href=3D"mailto:osk@google=
.com" target=3D"_blank">osk@google.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Hi Henbin<div><br></div><div>It&#39;s funny =
that you ask, since I had just started to look into the same problem.</div>=
<div><br></div><div>I&#39;d like to change the UART routing on an AST2500 w=
hen a client connects to the obmc-console-server. The use case is to dynami=
cally connect the host&#39;s UART to a UART owned by the BMC.</div><div><br=
></div><div><span style=3D"font-size:small;background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial;float:none;di=
splay:inline">I was thinking of writing a kernel driver that would expose t=
he config options from the HICRA register on AST2500 as /sys files. Each fi=
le represents the target UART1..5 and IO1..5. The file value represents the=
 source UART1..5 and IO1..5. Not all combinations are supported by the Aspe=
ed, so I&#39;d add the necessary checks and error reporting into the code.<=
/span></div><div><br></div><div>An alternative would be to just use /dev/me=
m to do that, but my understanding is that default support for that is goin=
g away or has gone away.</div><span class=3D"HOEnZb"><font color=3D"#888888=
"><div><br></div><div>Oskar.</div></font></span><div><div class=3D"h5"><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">---------- Forwarded message ----------<b=
r>
From: Henbin Chang &lt;<a href=3D"mailto:henbinchang@gmail.com" target=3D"_=
blank">henbinchang@gmail.com</a>&gt;<br>
Date: Wed, Aug 1, 2018 at 12:11 AM<br>
Subject: UART Route setting<br>
To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<br>
<br>
Hi,<br>
<br>
Could anyone know how to modify UART Route setting through dts, driver<br>
or other mechanism?<br>
<br>
Or I have to find a point to modify it e.g. board_init() in the u-boot.<br>
<br>
Thanks.<br>
</blockquote></div></div></div></div></div>
</blockquote></div><br></div></div>

--000000000000b88dc2057268eb34--
