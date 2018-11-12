Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CeEQSXdD"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tqcp4d5TzF3R0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 23:21:46 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id a77so1045700oii.5
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 04:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kS1YIpThWS3RiIfmrYnL7i8CZLk97FX1lBsczMaKuEA=;
 b=CeEQSXdD6MokPsd7wmOngA2429qk/NbL4JSf4hDrfCyBZglUKhpLIY1MDECX0UCBqu
 yP5EKqt/Un0gG4tKVS/fqs4qdiFRCdx8oon8GGCPydYLlgyhAgD1qZF0BQHkvVG0ykyD
 1vUklFISKtjz763Dzs2HYbpogUc2ZiWCL8nSFlMgfu/c0mU/nKZe0tyzcr+NfYy4t27X
 rwcfsWd0rsvzhb/rU7iRfjhvWZ0r9nkpjUeDRqk1GZ4CeVxIk70WP0KGikHL6y8HJGs0
 y3C9DbzCKihft+mAvKE9lQV1liUoc76c/WcAwLz+Td2WVv0uyBD4XPNnINUK9rTj9pPO
 lqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kS1YIpThWS3RiIfmrYnL7i8CZLk97FX1lBsczMaKuEA=;
 b=UtmOtpLIdwVvrFsPcrSWOMKH2scCn7rxleTjEHXVNQ0imlOtglLYLXOka5xP0dI6fq
 LgwcaetNqQZ8TUgamG0ANqjL1rqtEXM07b1/1ATV/CAo8OjPR+DhwsdbQztiGiLzRRys
 Zl9zNNzuceEbPxG2ERa0dASl30mqd8yQ/seOfVJ1CWAadz8JHbHO+QNq/y5HHChD92/O
 827mrAHbys6HvLTJ4bIyNgU13Lp0XfcitpLesFoi6D+mMTWfoMOowM2c1KrenIz3AU/p
 50fdwX4bziH+/yFUzJTPfIxJwVG7Zw6HZPa/kO24u35rAZ9uBdkfmx36po1C+msoHQo4
 hvxg==
X-Gm-Message-State: AGRZ1gLcpmn5TOoCDKRZ02AljqV7tlwuDJ+7IBI58Fnj/9ocAI2/wb7n
 iEwY+8uDtxhBxKQWlYCnu0/s1hasKAR8YWN5ZNU=
X-Google-Smtp-Source: AJdET5dAJ6PgCaC9u8EjEXlvMZ/SI//+lVRsem8Xu4IzQaoHzxS24ZZKUyz/L9/xEgL1yHYDapsw7eLSP6kGhwYHOmY=
X-Received: by 2002:aca:c650:: with SMTP id w77mr297387oif.122.1542025304223; 
 Mon, 12 Nov 2018 04:21:44 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
 <CAARXrtkZ8AsP7JBJ_caRfuo9bZNXT5cEbYJy8Xz_8bneP3HUzw@mail.gmail.com>
 <CAE33tLGjGmj5c_isgPmh6Xx_6S8E0X5B2b7pkJQ1tz2Ps-P+8w@mail.gmail.com>
In-Reply-To: <CAE33tLGjGmj5c_isgPmh6Xx_6S8E0X5B2b7pkJQ1tz2Ps-P+8w@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 12 Nov 2018 17:51:24 +0530
Message-ID: <CAE33tLFNadnXJEW4ZeSGJ-hM2=HA2s4eqMsXp2fzAJtU=KP0Ag@mail.gmail.com>
Subject: Re: Flashing Image using 'pflash' Tool
To: Yu Lei <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007e3421057a76be3f"
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
X-List-Received-Date: Mon, 12 Nov 2018 12:21:48 -0000

--0000000000007e3421057a76be3f
Content-Type: text/plain; charset="UTF-8"

Is there any other utility in OpenBMC Linux for writing a file to a
specified address in flash memory?

On Fri, Nov 9, 2018 at 2:26 PM AKASH G J <akashgj91@gmail.com> wrote:

> I tried the command *pflash -b -e -a 0x20100000 -f -p fitImage.bin*
>
> It is showing the following error.
>
>
>
>
>
> *WARNING: Erase at 0x20100000 for 0x00271e20 isn't erase block
> aligned           About to erase 0x20100000..0x20371e20
> !
> Erasing...
> [                                                  ] 0%mtd_erase: IOCTL to
> kerntFailed to blocklevel_smart_erase(): 3 *
>
> On Fri, Nov 9, 2018 at 9:22 AM Lei YU <mine260309@gmail.com> wrote:
>
>> On Thu, Nov 8, 2018 at 6:05 PM AKASH G J <akashgj91@gmail.com> wrote:
>> >
>> > I tried to flash kernel image fitImage.bin to the flash memory address
>> 0x20100000 using the following command.
>> >
>> > root@zaius:/var# pflash -a 0x20100000 -f -p fitImage.bin
>> >
>> > It exited with following error.
>> >
>> > About to program "fitImage.bin" at 0x20100000..0x20371e20 !
>> > Programming & Verifying...
>> > [                                                  ] 0%Flash write
>> error 3 for chunk at 0x20100000
>> >
>> > Please someone help to resolve the problem.
>>
>> 1. pflash defaults to operate on the PNOR chip. If you want to flash the
>> BMC
>>    chip, you need "-b" argument.
>> 2.To program a flash area, you need to erase before writing, so you need
>> "-e"
>>    argument.
>>
>> Putting together, you command should look like:
>> pflash -b -e -a 0x20100000 -f -p fitImage.bin
>>
>

--0000000000007e3421057a76be3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">


=09
	<span></span>
=09
=09


<p class=3D"gmail-western" style=3D"margin-bottom:0cm;line-height:115%;font=
-family:&quot;Arial&quot;,serif;font-size:11pt;direction:ltr;color:rgb(0,0,=
0);text-align:left">Is there any other utility in OpenBMC Linux for writing=
 a file to a specified address in flash memory?<br></p>

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 9, 2018 a=
t 2:26 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr"><div>I tried the command <i>pflash -b -e -a 0x2010000=
0 -f -p fitImage.bin</i></div><div><br></div>It is showing the following er=
ror.<div><br></div><div><i>WARNING: Erase at 0x20100000 for 0x00271e20 isn&=
#39;t erase block aligned=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br>About to erase 0x20100000..0x20371e20 !=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <b=
r>Erasing...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>[=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] 0%mtd_erase: IOCTL to=
 kernt<br>Failed to blocklevel_smart_erase(): 3 </i><br></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 9, 2018 at 9:22 =
AM Lei YU &lt;<a href=3D"mailto:mine260309@gmail.com" target=3D"_blank">min=
e260309@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Thu, Nov 8, 2018 at 6:05 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmai=
l.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I tried to flash kernel image fitImage.bin to the flash memory address=
 0x20100000 using the following command.<br>
&gt;<br>
&gt; root@zaius:/var# pflash -a 0x20100000 -f -p fitImage.bin<br>
&gt;<br>
&gt; It exited with following error.<br>
&gt;<br>
&gt; About to program &quot;fitImage.bin&quot; at 0x20100000..0x20371e20 !<=
br>
&gt; Programming &amp; Verifying...<br>
&gt; [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 0%Flash write error 3 for chunk at 0x2010=
0000<br>
&gt;<br>
&gt; Please someone help to resolve the problem.<br>
<br>
1. pflash defaults to operate on the PNOR chip. If you want to flash the BM=
C<br>
=C2=A0 =C2=A0chip, you need &quot;-b&quot; argument.<br>
2.To program a flash area, you need to erase before writing, so you need &q=
uot;-e&quot;<br>
=C2=A0 =C2=A0argument.<br>
<br>
Putting together, you command should look like:<br>
pflash -b -e -a 0x20100000 -f -p fitImage.bin<br>
</blockquote></div>
</blockquote></div>

--0000000000007e3421057a76be3f--
