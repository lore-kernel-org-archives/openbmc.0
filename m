Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YIoHG0WN"; 
 dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fpz723tHzDqgx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 01:11:08 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id b3so5557747ede.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23PWxB2QSbIzkx0+5aaG0hAzcMVs7YLxdt6uqu4DuLg=;
 b=YIoHG0WNk7VAJEqT0vUpMvfjdjt/EZwhX5pMlTWt8vrrHPoGOr/t1FyboWs5Niz9Ev
 5ab8pQgclkGjAT6met0asumMw25jat0jsarI0otRFr7wAQowRZTZJHSqge6KWkqahTVt
 hmofbcQiNcnhlgUvgwy/gql2gN6Fn1Icg3tuGfSjsFkFw/y9MCrEvYaeVRVGUSOfrisy
 sAKTUFgFHXlP86Nf6KfnZwSYtsyAI88iwMA7WEObTWLc0ZyyR2Efl7y2dutRjJ2lGeDp
 b/GE2WxwfZI8IvJ5/FCbXIs3iNkA7YdRSY8UM2Wrm9dEBX/rwMX82AoEpVJb+3DwB2yQ
 lJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23PWxB2QSbIzkx0+5aaG0hAzcMVs7YLxdt6uqu4DuLg=;
 b=JZAI0DLQ4ectPUnYUZHIbYYVlETJtn9rh1Q6m7uxtOt04Ja8qauiICdXh+H6JdXimo
 sXIQquwnZRNNvURNSCEoJKwH5ZNZt9tqtXB7k5NXOPc9k+DzJHYTfM0k5OWBAb1ubHpZ
 qB92bD3qdhGsvYmY0fI2Gft3kqQbvpSkKYRifvx8A1sk89g+sQYrJIduvWXOlGL54NkE
 0fekMqi1CH8PJHb5hBtsWFoihoJxufkzquhC+P2DWbu1ObRSp7CqUFa7qzdt6vyDJ6IQ
 45d3RLVzJLhEzKfOYqH1lO8U+3ou65F1N2vuajNlm+wDg+IHR9DkmaBNnIz4zbNqx8eL
 lxoA==
X-Gm-Message-State: AJcUukemh7phQFdd4p6JXvtQlpazjvXOYZN/WITACHumQLdPdJ0AdQ0G
 IwHpxuo/qWbS/2mc1Gr+DzRld8aMbYw3aVhqGotu6A==
X-Google-Smtp-Source: ALg8bN6XE78G7fy/SBPcEmprE00tc4OUFdzav4zlb66NHbIJSog3e6jHEkeGn5W9ZwNDt0vIvUGUcfiwzs5J7AGKD9E=
X-Received: by 2002:a50:8e16:: with SMTP id 22mr7681739edw.269.1547647864864; 
 Wed, 16 Jan 2019 06:11:04 -0800 (PST)
MIME-Version: 1.0
References: <tencent_46EA11C87A97937C3140CAC7@qq.com>
In-Reply-To: <tencent_46EA11C87A97937C3140CAC7@qq.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 16 Jan 2019 09:10:53 -0500
Message-ID: <CABoTLcSEdfGHM+L_pFT9ZW11PZCcLPwV5SokOCf09-n3b7MJOg@mail.gmail.com>
Subject: Re: Why can't /dev/ipmi0 on host be created stably
To: xiuzhi <1450335857@qq.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000397f7a057f93d977"
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
X-List-Received-Date: Wed, 16 Jan 2019 14:11:16 -0000

--000000000000397f7a057f93d977
Content-Type: text/plain; charset="UTF-8"

Hi Xiuzhi

The following observation may or may not be related to your problem:

We're using AMI BIOS with OpenBMC using the IPMI BT mode. I found that in
certain cases the host and BMC can get "out of sync" wrt. what the BMC put
in the message queue and what the BIOS expects. The problem can be caused
by the BMC responding "slowly" to an IPMI request from the BIOS where the
BIOS times out before the BMC responds. The BMC then responds before the
BIOS issues the next request, which causes the BIOS to read the previous
response as the response for the latest request.

This has resulted in all sorts of weird behavior for us, incl. the BIOS not
"detecting" the BMC and therefore not exposing it in the SMBIOS tables,
which - in our case - is the configuration source for the Linux IPMI driver.

I hope this helps?

What BIOS are you using? Are you able to make changes to the BIOS code?

Oskar.

On Tue, Jan 15, 2019 at 9:33 PM xiuzhi <1450335857@qq.com> wrote:

> Hi All,
>    I am testing the bmc ipmi-kcs reliability.
>    The /dev/ipmi0 on host will not  be available  in several consecutive
> bmc reboot test.  The CA3 value is 0x04 which can be got by the command "mm
> -io ca3" on host bios shell when failing to create the ipmi0  .
> The CA3 value 0x04 means that SMS_ATN is set to 1, which meas:
> "Set to 1 when the BMC has one or more messages in the Receive Message
> Queue, or when a watchdog timer pre-timeout, or event message buffer full
> condition exists [2] . OEMs may also elect to set this flag is one of the
> OEM 1, 2,or 3 flags from the Get Message Flags command becomes set. R/O
> This bit is related to indicating when the BMC is the source of a system
> interrupt. Refer to sections 9.12, KCS Communication and Non-communication
> , 9.13, Physical Interrupt Line Sharing, and 9.14, Additional
> Specifications for the KCS interface for additional information on the use
> and requirements for the SMS_ATN bit."
>  see the Table 9-, KCS Interface Status Register Bits in section 9.7 of
> Intelligent Platform ManageBment Interface Specification .
>    What  causes this problem?
>  Best,
> Xiuzhi
>

--000000000000397f7a057f93d977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Xiuzhi<div><br></div><div>The following observatio=
n may or may not be related to your problem:</div><div><br></div><div>We&#3=
9;re using AMI BIOS with OpenBMC using the IPMI BT mode. I found that in ce=
rtain cases the host and BMC can get &quot;out of sync&quot; wrt. what the =
BMC put in the message queue and what the BIOS expects. The problem can be =
caused by the BMC responding &quot;slowly&quot; to an IPMI request from the=
 BIOS where the BIOS times out before the BMC responds. The BMC then respon=
ds before the BIOS issues the next request, which causes the BIOS to read t=
he previous response as the response for the latest request.</div><div><br>=
</div><div>This has resulted in all sorts of weird behavior for us, incl. t=
he BIOS not &quot;detecting&quot; the BMC and therefore not exposing it in =
the SMBIOS tables, which - in our case - is the configuration source for th=
e Linux IPMI driver.</div><div><br></div><div>I hope this helps?</div><div>=
<br></div><div>What BIOS are you using? Are you able to make changes to the=
 BIOS code?</div><div><br></div><div>Oskar.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Tue, Jan 15, 2019 at 9:33 PM xiuzhi &lt;<a h=
ref=3D"mailto:1450335857@qq.com">1450335857@qq.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi All,</div><div>=
=C2=A0 =C2=A0I am testing the bmc ipmi-kcs reliability.</div><div>=C2=A0 =
=C2=A0The /dev/ipmi0 on host will not=C2=A0 be available=C2=A0 in several c=
onsecutive bmc reboot test.=C2=A0 The CA3 value is 0x04 which can be got by=
 the command &quot;mm -io ca3&quot; on host bios shell when failing to crea=
te the ipmi0=C2=A0 .</div><div>The CA3 value 0x04 means that SMS_ATN is set=
 to 1, which meas:</div><div><div>&quot;Set to 1 when the BMC has one or mo=
re messages in the Receive Message Queue, or when a watchdog timer pre-time=
out, or event message buffer full condition exists [2] . OEMs may also elec=
t to set this flag is one of the OEM 1, 2,or 3 flags from the Get Message F=
lags command becomes set. R/O This bit is related to indicating when the BM=
C is the source of a system interrupt. Refer to sections 9.12, KCS Communic=
ation and Non-communication , 9.13, Physical Interrupt Line Sharing, and 9.=
14, Additional Specifications for the KCS interface for additional informat=
ion on the use and requirements for the SMS_ATN bit.&quot;</div></div><div>=
=C2=A0see the Table 9-, KCS Interface Status Register Bits in section 9.7 o=
f=C2=A0 Intelligent Platform ManageBment Interface Specification .</div><di=
v>=C2=A0 =C2=A0What=C2=A0 causes this problem?</div><div>=C2=A0Best,</div><=
div>Xiuzhi</div></blockquote></div>

--000000000000397f7a057f93d977--
