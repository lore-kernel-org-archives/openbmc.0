Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sBuwz13w"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Qtx35ccPzDqRm
 for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2019 06:28:21 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id z17so3775300qts.13
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACpwvjlGJwLZUd8S+ES2ZqYwyC98/4+4JZJvlqcVi+Q=;
 b=sBuwz13wqYsZ0O4cITwxyqFGZ/tonHFs/MA+maZgxuIHeI7iSwD6YXLl7w3ugwL6RF
 ANyWpy/401FBkdVKyrAqAy0yY96m9LCD3PI17ffc4QqiIFyiDqPH6b/Zdgan+MhGIAnb
 didcZKy7roy7lQ2sh+IFz9UxnIGHHxjc2IYFg7VlXb3Q4AfE4oB9yLU1zFb52vORrLY/
 y03MsCMwHY5ZupyKa+Ktv2AGZbCV4jof7YsEft1t/CnqDUnTfx+PzNsOravnp7uQyJVK
 Bv94e8nARDmbu7ZRtMzXwimoHruaBs8yJUHmPGXoYew6DOVCO4jiXXOU8P0+RkOGWtg9
 SRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACpwvjlGJwLZUd8S+ES2ZqYwyC98/4+4JZJvlqcVi+Q=;
 b=OiUBpemacpPwgIdsZifKR/keKmeSZao9J3IpnYHcniu5MRNYCw3fuxP9/G4lVTPzWZ
 shpyxuRljVBbYne82fiBCbhYzI0klJnV2S1ln8FGkEsGEzS0Pm7XvFDjG9twDybD9fQ8
 Bzy+HLyaA3PCBxMSkxB9uYZCjSiAk2oEeWRrlAkeitqOFlcys1GdJjY1z8mGV6PO6eJO
 YAZeWhBfCZCzJkQTeiTFgKDDo1r4NCbMOThoADDPLDBaKJz5h4aM4cQJs56vP6bTMrPM
 KHMlt6qfcOiypR+KkmiKOhXNgRoHH1TehqQy3vTw3O4tKkxO86+FATF4jyHdrLQ2C8Yh
 cSkA==
X-Gm-Message-State: APjAAAUSWDU8QwNNZAHEDk88pCLx2DJF6q0KFZziqA6J1qpZBtD+m+vJ
 unFtX+JQ3fRA48VsRCcPzOkYQVbwIyiF6Rl0/G3eYA==
X-Google-Smtp-Source: APXvYqyjhLrv1YFwwmb2y+e9NB8YBpbY3hzO/uIPBYAycMF5Ub6pM+YUs5AFfEn/G0iqDeUH4GJt2W4rqJPVLuLeSrU=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr9353306qte.196.1553282897208; 
 Fri, 22 Mar 2019 12:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <1FBBF5C1-6714-416E-88FE-0A2C5DD9E828@fb.com>
In-Reply-To: <1FBBF5C1-6714-416E-88FE-0A2C5DD9E828@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 22 Mar 2019 12:28:05 -0700
Message-ID: <CAJoAoZn3x6ZH8LQ7etckFV_A_=ooLnVzuc2yShk_z_LwsyMceQ@mail.gmail.com>
Subject: Re: [Potential Spoof] Re: IPMID crashing
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005370400584b3db21"
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
X-List-Received-Date: Fri, 22 Mar 2019 19:28:25 -0000

--0000000000005370400584b3db21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This kind of thing would be easiest to debug with stacktracing. Which makes
me wonder, how hard would it be to add that? What are the consequences of
doing so? I suppose it comes down to whether we want to ship with symbols..=
?

On Thu, Mar 21, 2019, 3:34 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Vernon,
> It is getting corrupted while using libipmid. I see now following message=
s
>
> double free or corruption (!prev)
> Aborted
>
>
> Regards
> -Vijay
>
> =EF=BB=BFOn 3/21/19, 2:34 PM, "openbmc on behalf of Vijay Khemka"
> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of
> vijaykhemka@fb.com> wrote:
>
>     I searched for this output string and found in libc-2.28.so and
> libc.a. I have no idea, what is it doing. I have executed it manually fro=
m
> command line and can see all oem functions it registers.
>
>     On 3/21/19, 12:47 PM, "Vernon Mauery" <vernon.mauery@linux.intel.com>
> wrote:
>
>         On 21-Mar-2019 07:38 PM, Vijay Khemka wrote:
>         >Anyone is seeing ipmid crashing. I have checkedout openbmc today
> and seeing ipmid is crashing with following message
>         >
>         >realloc(): invalid next size
>
>         What was it doing? What IPMI command was running when it crashed?
> What
>         provider libraries do you have it loading?
>
>         --Vernon
>
>
>
>
>

--0000000000005370400584b3db21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This kind of thing would be easiest to debug with stacktr=
acing. Which makes me wonder, how hard would it be to add that? What are th=
e consequences of doing so? I suppose it comes down to whether we want to s=
hip with symbols..?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Mar 21, 2019, 3:34 PM Vijay Khemka &lt;<a href=
=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Vernon,<br>
It is getting corrupted while using libipmid. I see now following messages<=
br>
<br>
double free or corruption (!prev)<br>
Aborted<br>
<br>
<br>
Regards<br>
-Vijay<br>
<br>
=EF=BB=BFOn 3/21/19, 2:34 PM, &quot;openbmc on behalf of Vijay Khemka&quot;=
 &lt;openbmc-bounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank" rel=3D"noreferrer">fb.com@lists.ozlabs.org</a> on beha=
lf of <a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank" rel=3D"norefe=
rrer">vijaykhemka@fb.com</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 I searched for this output string and found in <a href=3D"htt=
p://libc-2.28.so" rel=3D"noreferrer noreferrer" target=3D"_blank">libc-2.28=
.so</a> and libc.a. I have no idea, what is it doing. I have executed it ma=
nually from command line and can see all oem functions it registers.<br>
<br>
=C2=A0 =C2=A0 On 3/21/19, 12:47 PM, &quot;Vernon Mauery&quot; &lt;<a href=
=3D"mailto:vernon.mauery@linux.intel.com" target=3D"_blank" rel=3D"noreferr=
er">vernon.mauery@linux.intel.com</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On 21-Mar-2019 07:38 PM, Vijay Khemka wrote:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;Anyone is seeing ipmid crashing. I have che=
ckedout openbmc today and seeing ipmid is crashing with following message<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;realloc(): invalid next size<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 What was it doing? What IPMI command was runnin=
g when it crashed? What <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 provider libraries do you have it loading?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --Vernon<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005370400584b3db21--
