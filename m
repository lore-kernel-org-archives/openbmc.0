Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BoWpSbGz"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447hTq5Kx8zDqLy
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 12:45:32 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id p25so13129383qtb.3
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 17:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7rGOz087ZYuDm9V3Xd47N7N6cMZ1ioW5g2b8D8tTRs=;
 b=BoWpSbGzNPXjQ0Hwd+mnm/6HBP7fHvHmwtBvEwmeX5qZQCYeb5M7mpdISp06mDwHfw
 ocE1rmcGu6ygpuHa6NYmJrIiRiElZ3iv/3UnoDjumCA82r2M4RQlgbjVroO02Sw5luJv
 ZnvLVUM49JccLD6qHVba/qUhJFz/Ds0bc8D1y4wTP4/sD9tfP4gsNqCu/6A0Td+WuiMP
 Kyk95FofmnV+63jymjTh9Ycw90mzUMFNgWFMEWJ8zaElO41S1HDa+Ri1yNytXdGRN/1c
 m6DIalhAr4eOMRD0ilh0+gpMUE31xEGiZW/q8DRVEtO/SwPI/JNofIqxfthutN1czXVc
 +/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7rGOz087ZYuDm9V3Xd47N7N6cMZ1ioW5g2b8D8tTRs=;
 b=CipnP/cE9U8TJU9pp2j/HkniVK4bqtsbt4HqB3Fp+eZfhT44775arnBdfwsEUIcYeU
 SSp1p3lEFXz06EUqI9qx+vQ27a46ejbY9uZqenJBWfOuGJFrAwL5MQr31QxNdw6LGmi4
 Tk/3ZS7FO3h/Vsa4lp59Ge58onAcGKiVzAok9XpM1wdX4nvsxYvLlPr5wQw+5v/d+Sqk
 QfwbRUrw+on+tZ29hB76LrhPnCc0DMAO87KFfpQMpHD/GQBM4QyCrJ0GMtR6R354J4kC
 9wJx97Z1x13Ssi4cgNnV0SiGebTyYnXBnBtu90emzcSPvt991yG+CaZzPYlQ++n5MrVh
 j/hw==
X-Gm-Message-State: AHQUAuZYXmJqqTwlMgjBxJ9sBdBkciGqzxYZw5JB5rAIh2rGykOGg1Ux
 vRL8FNj2x2aiSqOaKfRZnf9PlQ1/OSkkJw923v/+xA==
X-Google-Smtp-Source: AHgI3IZjVnXsVPG/wLJSE491Rv8g0Uhx97w4yMhSnp8Ipi5BmOQZQ4rvzfykOe2l2FDwKXQb997DTdr1Z2y0bsdr5hg=
X-Received: by 2002:ac8:38b3:: with SMTP id f48mr16593761qtc.125.1551145529151; 
 Mon, 25 Feb 2019 17:45:29 -0800 (PST)
MIME-Version: 1.0
References: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
In-Reply-To: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 25 Feb 2019 17:45:17 -0800
Message-ID: <CAJoAoZnKrtDtaH91hn7OPtaBnmQiGR1GP32D+PAqdwaRaHpmYQ@mail.gmail.com>
Subject: Re: Max IPMI buffer size
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000042f7440582c23621"
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
X-List-Received-Date: Tue, 26 Feb 2019 01:45:36 -0000

--00000000000042f7440582c23621
Content-Type: text/plain; charset="UTF-8"

Personally I'd like to see this implemented as something we can configure
at compile time, what do others think?

On Fri, Feb 22, 2019 at 4:07 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Team,
>
> I see definition of MAX_IPMI_BUFFER is 64 in phosphor-ipmi-host/ipmid.hpp.
> And there is a comment that BT FIFO in AST2400 can handle only 64 bytes. We
> are using AST2500 and for our IPMB OEM command, we need buffer max size to
> be 256. Please suggest how to about changes.
>
>
>
> Regards
>
> -Vijay
>

--00000000000042f7440582c23621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Personally I&#39;d like to see this implemented as somethi=
ng we can configure at compile time, what do others think?</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 22, 2=
019 at 4:07 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijay=
khemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-3989140904434726861WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Team,<u></u><u></u>=
</span></p>
<p class=3D"m_-3989140904434726861p1"><span style=3D"font-size:11.0pt">I se=
e definition of MAX_IPMI_BUFFER is 64 in
</span><span class=3D"m_-3989140904434726861s1">phosphor-ipmi-host/ipmid.hp=
p</span><span style=3D"font-size:11.0pt">. And there is a comment that BT F=
IFO in AST2400 can handle only 64 bytes. We are using AST2500 and for our I=
PMB OEM command, we need buffer max size to be 256. Please
 suggest how to about changes.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards<u></u><u></=
u></span></p></div></div><div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954=
F72"><div class=3D"m_-3989140904434726861WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Vijay<u></u><u></u=
></span></p>
</div></div></blockquote></div>

--00000000000042f7440582c23621--
