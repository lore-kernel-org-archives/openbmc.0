Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bOqRYWtr"; 
 dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gsN00HJjzF14j
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 11:02:23 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id g6-v6so424901wrp.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 18:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnZagI/L/wKJ30sU9aiYqi+k0jOcfzVWwnziHrvW+t4=;
 b=bOqRYWtryWHWmQ2kmYgFrbnKPTAQx49kR+Clml5Jqo2OArDjmMWrSA5XCDSSXlwFXt
 QfRXe5cDaFrvE0FLHVHSt1iQ1mk4Wru4e6QDpWbITZVAsOFMNccF5m46EliGu0YrWvEV
 VKksG2Gjgu4pOOJz/qWFu/JdxVjUwYNX+Ze7WRae8N02TllnMDJiUXurM7YcNu4TyJ/r
 uJ2TNRYQfmhYmflHHlnqvfUylkvOy33mlDfd4Qv/b+Sp7jM1VKbcAqulYTftjL1Q9U9X
 /iKHoSecj4ESu39cXL/r/OwGZCWYtqgUHKHw9CDD9RhNf4rKjWtOX7EeMvobh7Wek2ZF
 etRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnZagI/L/wKJ30sU9aiYqi+k0jOcfzVWwnziHrvW+t4=;
 b=N+CCiRReMd+uMtsw6ePpQzap0TRD8oXrJGEUTnksaqojRXKsRz2WjLvWcWywl0bnXX
 8loPT3aHEw/czS85ya+WkAoKD2ueG+Wpkn2DjrTyX9qhYb+JpY4PmERGqeojfTYL6ENm
 KVBFaBoFMDbszlUBZOp8sgtEDkXBf/AjWI0kZTY7TZqWWEhbEFo6On1sXhS+Is9bnuzU
 yxTzNIXqkoBBlwgmXsb/ADGsWxUhBk2qSZXVdZqn78xxpxTbaQInjQvKvEU0HMGmoqyX
 kBHAMZzGQZnEl81kvtkYxi2XH0OCqXcuV8ZVe5SDsM5R+lE9WiD7XeW7lrkAjWti799q
 xRyQ==
X-Gm-Message-State: AOUpUlE5928cqjvYkstFur2SeSATV53j11Td45EMLNuj8EAkW1QENKIB
 yUYblKHZVfVjVS+sIw2kyLb2J1uNlOM9F4GwWk9g8w==
X-Google-Smtp-Source: AAOMgpd++uwDo2rhskaRijsqke5lxlpQFBNc+cVlXmK8juunk80OfiwsiEvt+2MtnbFdqHb3GBZbn69qqyI0QLR3xPA=
X-Received: by 2002:a5d:55c8:: with SMTP id i8-v6mr378948wrw.38.1533171739534; 
 Wed, 01 Aug 2018 18:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
In-Reply-To: <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 1 Aug 2018 21:02:07 -0400
Message-ID: <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
Subject: Re: UART Route setting
To: Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000eacda40572695ce9"
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
X-List-Received-Date: Thu, 02 Aug 2018 01:02:25 -0000

--000000000000eacda40572695ce9
Content-Type: text/plain; charset="UTF-8"

Hi Henbin

I think we should be able to configure default settings for the routing
with the driver that I'm working on. I guess that could be done via DTS or
by just applying settings via /sys during boot.

What do you think?

For my use case, I'll need the setting to be changed back and forth during
runtime from the obmc-console-server.

Oskar.

On Wed, Aug 1, 2018, 8:30 PM Henbin Chang <henbinchang@gmail.com> wrote:

> Hi Oskar,
>
> Thanks your response.
>
> In my machine design, the host uses AST2500 UART2 to implement console
> redirection.
> To make openbmc host consle/ipmi SOL workable, I use the 'local-tty =
> ttyS2' setting and manually change the UART route (UART2<->UART3).
>
> I found  VUART be used for host console after I checked some openpower
> machines. Thus, they didn't meet this problem.
>
> I also tried to look for any related discussion but got nothing.
> To avoid any loss, I sent a mail to ask if any approach to change the UART
> route under openbmc framework.
>
> Currently, I add a hard code (modify HICRA regiser) in u-boot as the
> workaround.
>
> The suggestions you provided are good if the dynamic UART  route changing
> is needed.
>
> I may write a driver to handle the default UART route. It can be
> enabled/disabled and get the the default UART route setting from machine
> dts, and then modify the HICRA register.
>
> Thanks.
> Henbin.
>
> 2018-08-02 0:16 GMT+08:00 Oskar Senft <osk@google.com>:
>
>> Hi Henbin
>>
>> It's funny that you ask, since I had just started to look into the same
>> problem.
>>
>> I'd like to change the UART routing on an AST2500 when a client connects
>> to the obmc-console-server. The use case is to dynamically connect the
>> host's UART to a UART owned by the BMC.
>>
>> I was thinking of writing a kernel driver that would expose the config
>> options from the HICRA register on AST2500 as /sys files. Each file
>> represents the target UART1..5 and IO1..5. The file value represents the
>> source UART1..5 and IO1..5. Not all combinations are supported by the
>> Aspeed, so I'd add the necessary checks and error reporting into the code.
>>
>> An alternative would be to just use /dev/mem to do that, but my
>> understanding is that default support for that is going away or has gone
>> away.
>>
>> Oskar.
>>
>>
>> ---------- Forwarded message ----------
>>> From: Henbin Chang <henbinchang@gmail.com>
>>> Date: Wed, Aug 1, 2018 at 12:11 AM
>>> Subject: UART Route setting
>>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>>
>>>
>>> Hi,
>>>
>>> Could anyone know how to modify UART Route setting through dts, driver
>>> or other mechanism?
>>>
>>> Or I have to find a point to modify it e.g. board_init() in the u-boot.
>>>
>>> Thanks.
>>>
>>
>

--000000000000eacda40572695ce9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Henbin<div dir=3D"auto"><br></div><div dir=3D"auto">I =
think we should be able to configure default settings for the routing with =
the driver that I&#39;m working on. I guess that could be done via DTS or b=
y just applying settings via /sys during boot.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">What do you think?</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">For my use case, I&#39;ll need the setting to be changed =
back and forth during runtime from the obmc-console-server.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Oskar.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Wed, Aug 1, 2018, 8:30 PM Henbin Chang &lt;=
<a href=3D"mailto:henbinchang@gmail.com">henbinchang@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Oskar,<div><=
br></div><div>Thanks your response.</div><div><br></div><div>In my machine =
design, the host uses AST2500 UART2 to implement console redirection.</div>=
<div>To make openbmc host consle/ipmi SOL workable, I use the &#39;local-tt=
y =3D ttyS2&#39; setting and manually change the UART route (UART2&lt;-&gt;=
UART3).</div><div><br></div><div>I found=C2=A0 VUART be used for host conso=
le after I checked some openpower machines. Thus, they didn&#39;t meet this=
 problem.</div><div><br></div><div>I also tried to look for any related dis=
cussion but got nothing.</div><div>To avoid any loss, I sent a mail to ask =
if any approach to change the UART route under openbmc framework.</div><div=
><br></div><div>Currently, I add a hard code (modify HICRA regiser) in u-bo=
ot as the workaround.</div><div><br></div><div>The suggestions you provided=
 are good if the dynamic UART=C2=A0 route changing is needed.</div><div><br=
></div><div>I may write a driver to handle the default UART route. It can b=
e enabled/disabled and get the the default UART route setting from<span sty=
le=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">=C2=A0m=
achine dts</span>, and then modify the HICRA register.</div><div><br></div>=
<div>Thanks.</div><div>Henbin.</div><div><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote">2018-08-02 0:16 GMT+08:00 Oskar Senft <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:osk@google.com" target=3D"_blank" rel=3D"n=
oreferrer">osk@google.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr">Hi Henbin<div><br></div><div>It&#39;s funny that you ask,=
 since I had just started to look into the same problem.</div><div><br></di=
v><div>I&#39;d like to change the UART routing on an AST2500 when a client =
connects to the obmc-console-server. The use case is to dynamically connect=
 the host&#39;s UART to a UART owned by the BMC.</div><div><br></div><div><=
span style=3D"font-size:small;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>I was thinking of writing a kernel driver that would expose the config opt=
ions from the HICRA register on AST2500 as /sys files. Each file represents=
 the target UART1..5 and IO1..5. The file value represents the source UART1=
..5 and IO1..5. Not all combinations are supported by the Aspeed, so I&#39;=
d add the necessary checks and error reporting into the code.</span></div><=
div><br></div><div>An alternative would be to just use /dev/mem to do that,=
 but my understanding is that default support for that is going away or has=
 gone away.</div><span class=3D"m_-1881276571786407608HOEnZb"><font color=
=3D"#888888"><div><br></div><div>Oskar.</div></font></span><div><div class=
=3D"m_-1881276571786407608h5"><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">------=
---- Forwarded message ----------<br>
From: Henbin Chang &lt;<a href=3D"mailto:henbinchang@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">henbinchang@gmail.com</a>&gt;<br>
Date: Wed, Aug 1, 2018 at 12:11 AM<br>
Subject: UART Route setting<br>
To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a>&gt;<br>
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
</blockquote></div>

--000000000000eacda40572695ce9--
