Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vc+3Zl/t"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yJRc5wkhzDq7F
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 06:11:08 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id f18so10086862itb.5
 for <openbmc@lists.ozlabs.org>; Sun, 10 Feb 2019 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rubVLzuTovtjj1sNcgew2a8Z01KyKU8jk3HiVImyJtU=;
 b=Vc+3Zl/t78T5pAC1XkJns8PwfVHBm8JoaiZMxXbpf5hlBFSX6sUvmkB2qLOWRK7SYG
 m8p/0KJT1bVF1yVuWzNkIFnqBvDuMNdp7GfJQQQfeQvomZ84guT4fvD/0mywuzBJK6AH
 T/ZOQ3xKUGXwRK/qG9DHrKwYWfNediOpwdbqsBWMKqs/B+NOUohiKUhnVjwc1tAL/JE+
 6yq9Y/4Sw76wzvUnj8IL8z7LkoW0oVU+7fObx5pxUDbl2383F7oSW5IjqUum9aaR7Of3
 h5KxlZHGiYVJIlNhHpiiUAGypq9aE3yr7NcPPRhzLjlkJN9NgzcDZHGWEzydIdBWnawq
 9DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rubVLzuTovtjj1sNcgew2a8Z01KyKU8jk3HiVImyJtU=;
 b=dMgqEC/IvCxoLajgNEx2Qe/je14FtTqwEui2X/1iV/yxSnMDTE157d4OOW4nrFAxIr
 /QHM/o74/S/54DSG269lfaPFIhZlqTfl6lOEe0C0WXHSZsBE3NwsF7oHK8tJTEBmf4B9
 hmK5pOUGi7zVRDghFMvtVmcNa3uYbb0nnFM19qNo/AgN40y0A/ePCgUm31UfF7k3F3X2
 CWKYmwea11kZQdJgJnKe33LQrxBzHJwR0wg5gi8PGXKCAgIZekPWVR8kIcBgpJdKN6Ug
 f4w7IJSrZXwkhcIThKGpGEEbe5NncdRclQIqyABOKdIk/EI1NRBh7PaGucqequw/a7a4
 b54w==
X-Gm-Message-State: AHQUAubAEIwShQyF28JsZ30M6egW35I8d645s3B8wB7kamFGIh8vfuAl
 6etC4c/5Yx5bOnjKLs+atP0Hghf0vtHuAIo+qZ8=
X-Google-Smtp-Source: AHgI3IZ8clkset8HPJrNBcTlpvmNyuacrSkZ82xDQjUaeBfDiRfmtIRoGGHqpHO+gvInW/k0PU2LnE9jv4+PHWgiKZg=
X-Received: by 2002:a6b:ed0b:: with SMTP id n11mr20230107iog.90.1549825866113; 
 Sun, 10 Feb 2019 11:11:06 -0800 (PST)
MIME-Version: 1.0
References: <CAP6Zq1jAMHSrbEmnKcQcwAfmpgZJ0n3JUwxGSYVw6B==FJYRGQ@mail.gmail.com>
 <20190207170147.t72h7vpzstq5x3fc@thinkpad>
In-Reply-To: <20190207170147.t72h7vpzstq5x3fc@thinkpad>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 10 Feb 2019 21:17:51 +0200
Message-ID: <CAP6Zq1iXLRfWyv=QvwxEZ_ADUnv+2nKRhQoomFsbqoLbVghmfw@mail.gmail.com>
Subject: Re: OpenBMC GitHub invitation to Taiwan Nuvoton BMC team
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, kwliu@nuvoton.com,
 warp5tw@gmail.com, 
 timlee660101@gmail.com, yschu57@gmail.com, medadyoung@gmail.com
Content-Type: multipart/alternative; boundary="00000000000036a6ec05818ef473"
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
X-List-Received-Date: Sun, 10 Feb 2019 19:11:10 -0000

--00000000000036a6ec05818ef473
Content-Type: text/plain; charset="UTF-8"

Great!

Thanks a lot!

On Thu, 7 Feb 2019 at 19:01, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Tue, Feb 05, 2019 at 02:23:11AM +0200, Tomer Maimon wrote:
> >Hi Brad,
> >
> >
> >
> >Could you please send invites to the OpenBMC GitHub organization to our
> >team Taiwan Nuvoton BMC team.
> >
> >
> >
> >Joseph Liu: kwliu@nuvoton.com
> >
> >Tyrone: warp5tw@gmail.com
> >
> >Tim: timlee660101@gmail.com
> >
> >Stanley : yschu57@gmail.com
> >
> >Medad: medadyoung@gmail.com
>
> Done!
>
> Some had already registered to Gerrit with nuvoton.com addresses...so I
> sent invites to those addresses too.
>
> >They will like to upstream Poleg code to the OpenBMC github.
>
> Awesome!
>
> >Thanks a lot,
>
> No problem, and sorry it took so long.
>

--00000000000036a6ec05818ef473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great!<div><br><div>Thanks a lot!<br></div></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7=
 Feb 2019 at 19:01, Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirr=
el.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Tue, Feb 05, 2019 at 02:23:11AM +0200=
, Tomer Maimon wrote:<br>
&gt;Hi Brad,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;Could you please send invites to the OpenBMC GitHub organization to our=
<br>
&gt;team Taiwan Nuvoton BMC team.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;Joseph Liu: <a href=3D"mailto:kwliu@nuvoton.com" target=3D"_blank">kwli=
u@nuvoton.com</a><br>
&gt;<br>
&gt;Tyrone: <a href=3D"mailto:warp5tw@gmail.com" target=3D"_blank">warp5tw@=
gmail.com</a><br>
&gt;<br>
&gt;Tim: <a href=3D"mailto:timlee660101@gmail.com" target=3D"_blank">timlee=
660101@gmail.com</a><br>
&gt;<br>
&gt;Stanley : <a href=3D"mailto:yschu57@gmail.com" target=3D"_blank">yschu5=
7@gmail.com</a><br>
&gt;<br>
&gt;Medad: <a href=3D"mailto:medadyoung@gmail.com" target=3D"_blank">medady=
oung@gmail.com</a><br>
<br>
Done!<br>
<br>
Some had already registered to Gerrit with <a href=3D"http://nuvoton.com" r=
el=3D"noreferrer" target=3D"_blank">nuvoton.com</a> addresses...so I<br>
sent invites to those addresses too.<br>
<br>
&gt;They will like to upstream Poleg code to the OpenBMC github.<br>
<br>
Awesome!<br>
<br>
&gt;Thanks a lot,<br>
<br>
No problem, and sorry it took so long.<br>
</blockquote></div>

--00000000000036a6ec05818ef473--
