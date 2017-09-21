Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22c; helo=mail-vk0-x22c.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P10Gi1Jf"; 
 dkim-atps=neutral
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyfgp52DbzDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 00:51:17 +1000 (AEST)
Received: by mail-vk0-x22c.google.com with SMTP id m140so3223945vka.10
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZBrJmgnT0DKdUtRgKegDtI3Ya5X0/lA47bnhEQsNrcQ=;
 b=P10Gi1Jf2psn8txxeJNXuQTpwzn4EiHOB6v7jC7fxh0m1R/Q/1j1JPH65dbMuVfnHL
 ALEqbmVH09qJ0GxwesYsXglcYs5pZ5KLL6nAznL0tKIA5YeG2ofcy5iwgn2INmdBAX05
 BOjcNg83xIWapTfRe8HR0m49wD6Sb8vOMadZAuXTr28x8atpjPcky5DLDcT5vBzUXhkL
 jEqDN3qGOoRV4qdqKywrEMuifn8vzss+TNMZbAh2EfmqkEhv1R+C5hBa+aUhS6ubRijy
 eqVULIv9uDrj6di5ZMqEJlzkujFPBoh4ZJqcmoNMdyZ2bzUJLtxHbOiwr/7VOV9t5Pmz
 fydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZBrJmgnT0DKdUtRgKegDtI3Ya5X0/lA47bnhEQsNrcQ=;
 b=T+iHDI0uArRbV2hmb4QyZhuh39wczzPMnHg3QDf0xB5U5DTYop0hs+jxPcBzs7l7Cg
 YKiCqQFiTwGe3NhjAxg9AFcYDhwC1HG5lVo/YfIZZzhearoKZP/ti8BN2JAeJjphodjg
 9NE2oKBYeJoKM8RW3IZon8xXKrsq9SrkIOm9daYBMs7mRTXgWG53A/RHEnZLoWpWK0jz
 qriOBZuzJNOxKx6NM/2fGUHCxy8YJi3cy2fav3xFm6HO3nD/vp3hUrHiEuxu4pas4wzI
 ifLpcR+wXFMVl30svKOst34E//wSXLycSGanJcGRt8yx8y7oV9UlV5/XQcgGYCB2odZU
 F/lw==
X-Gm-Message-State: AHPjjUgsa01YMFZz7ec5wGfVRFdyRlOgLGHLrGq9nWuPzpIg8QIMujvu
 cpYouVDjKsbOvARg6rVKev5wiRdTfWRe6soT9hD9qVZQ
X-Google-Smtp-Source: AOwi7QDQwb3IzqIO2Ai0M6UOKct5miiYqneHJUEqVuxgMKD6FUvLc4MyfS3OHfBYQwRMqrE93OkrWNpkelJkPe6KOYc=
X-Received: by 10.31.4.131 with SMTP id 125mr1938432vke.88.1506005474364; Thu,
 21 Sep 2017 07:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Thu, 21 Sep 2017 07:51:13 -0700 (PDT)
In-Reply-To: <57a959d5-bf47-a852-2a32-33418dde9329@yadro.com>
References: <57a959d5-bf47-a852-2a32-33418dde9329@yadro.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 21 Sep 2017 07:51:13 -0700
Message-ID: <CAPLgG=n7i3Tb7Epfhdbvkg7A1whi03j2pj8ZNi1D0Jab5tNjwg@mail.gmail.com>
Subject: Re: Arch Linux compile error
To: Anton Novikov <a.novikov@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11465e1454e7250559b43977"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 14:51:19 -0000

--001a11465e1454e7250559b43977
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like an error building the localedef package for the host system.  I
suspect you have a newer glibc installed than the localedef package in
OpenBMC's Yocto is expecting.  Check upstream Yocto to see if they have an
updated localedef recipe.  If so, we can cherry pick it.

Rick

On Thu, Sep 21, 2017 at 5:04 AM, Anton Novikov <a.novikov@yadro.com> wrote:

> | /usr/include/bits/types/__locale_t.h:28:8: note: originally defined her=
e
> |  struct __locale_struct
> |         ^~~~~~~~~~~~~~~
> | In file included from glibc/locale/locale.h:145:0,
> |                  from ../git/localedef/include/locale.h:1,
> |                  from glibc/locale/programs/localedef.h:24,
> |                  from glibc/locale/programs/ld-collate.c:29:
> | glibc/locale/xlocale.h:39:4: error: conflicting types for =E2=80=98__lo=
cale_t=E2=80=99
> |  } *__locale_t;
> |     ^~~~~~~~~~
> | In file included from /usr/include/bits/types/locale_t.h:22:0,
> |                  from /usr/include/stdlib.h:199,
> |                  from glibc/locale/programs/ld-collate.c:24:
> | /usr/include/bits/types/__locale_t.h:42:33: note: previous declaration
> of =E2=80=98__locale_t=E2=80=99 was here
> |  typedef struct __locale_struct *__locale_t;
> |                                  ^~~~~~~~~~
> | In file included from glibc/locale/locale.h:145:0,
> |                  from ../git/localedef/include/locale.h:1,
> |                  from glibc/locale/programs/localedef.h:24,
> |                  from glibc/locale/programs/ld-collate.c:29:
> | glibc/locale/xlocale.h:42:20: error: conflicting types for =E2=80=98loc=
ale_t=E2=80=99
> |  typedef __locale_t locale_t;
> |                     ^~~~~~~~
> | In file included from /usr/include/stdlib.h:199:0,
> |                  from glibc/locale/programs/ld-collate.c:24:
> | /usr/include/bits/types/locale_t.h:24:20: note: previous declaration of
> =E2=80=98locale_t=E2=80=99 was here
> |  typedef __locale_t locale_t;
> |                     ^~~~~~~~
> | glibc/locale/programs/charmap.c: In function =E2=80=98charmap_read=E2=
=80=99:
> | glibc/locale/programs/charmap.c:202:39: warning: passing argument 1 of
> =E2=80=98__xpg_basename=E2=80=99 discards =E2=80=98const=E2=80=99 qualifi=
er from pointer target type
> [-Wdiscarded-qualifiers]
> |      result->code_set_name =3D basename (filename);
> |                                        ^~~~~~~~
> | In file included from ../git/localedef/include/string.h:4:0,
> |                  from glibc/locale/programs/charmap.c:28:
> | /usr/include/libgen.h:34:14: note: expected =E2=80=98char *=E2=80=99 bu=
t argument is of
> type =E2=80=98const char *=E2=80=99
> |  extern char *__xpg_basename (char *__path) __THROW;
> |               ^~~~~~~~~~~~~~
> | make: *** [Makefile:66: charmap-dir.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | make: *** [Makefile:66: charmap.o] Error 1
> | make: *** [Makefile:66: ld-address.o] Error 1
> | make: *** [Makefile:66: ld-collate.o] Error 1
> | WARNING: /home/openbmc/openbmc/build/tmp/work/x86_64-linux/cross-loca
> ledef-native/2.24-r0/temp/run.do_compile.3987:1 exit 1 from 'exit 1'
> | ERROR: Function failed: do_compile (log file is located at
> /home/openbmc/openbmc/build/tmp/work/x86_64-linux/cross-loca
> ledef-native/2.24-r0/temp/log.do_compile.3987)
> ERROR: Task (/home/openbmc/openbmc/meta/recipes-core/glibc/cross-localed
> ef-native_2.24.bb:do_compile) failed with exit code '1'
>
>

--001a11465e1454e7250559b43977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like an error building the localedef package for the=
 host system.=C2=A0 I suspect you have a newer glibc installed than the loc=
aledef package in OpenBMC&#39;s Yocto is expecting.=C2=A0 Check upstream Yo=
cto to see if they have an updated localedef recipe.=C2=A0 If so, we can ch=
erry pick it.<div><br></div><div>Rick</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Thu, Sep 21, 2017 at 5:04 AM, Anton Novi=
kov <span dir=3D"ltr">&lt;<a href=3D"mailto:a.novikov@yadro.com" target=3D"=
_blank">a.novikov@yadro.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">| /usr/include/bits/types/__loca<wbr>le_t.h:28:8: note: originally=
 defined here<br>
|=C2=A0 struct __locale_struct<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~<br>
| In file included from glibc/locale/locale.h:145:0,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../git/localedef/include/local<wbr>e.h:=
1,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/localede<wbr>f.h:=
24,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/ld-colla<wbr>te.c=
:29:<br>
| glibc/locale/xlocale.h:39:4: error: conflicting types for =E2=80=98__loca=
le_t=E2=80=99<br>
|=C2=A0 } *__locale_t;<br>
|=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>
| In file included from /usr/include/bits/types/locale<wbr>_t.h:22:0,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /usr/include/stdlib.h:199,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/ld-colla<wbr>te.c=
:24:<br>
| /usr/include/bits/types/__loca<wbr>le_t.h:42:33: note: previous declarati=
on of =E2=80=98__locale_t=E2=80=99 was here<br>
|=C2=A0 typedef struct __locale_struct *__locale_t;<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>
| In file included from glibc/locale/locale.h:145:0,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../git/localedef/include/local<wbr>e.h:=
1,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/localede<wbr>f.h:=
24,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/ld-colla<wbr>te.c=
:29:<br>
| glibc/locale/xlocale.h:42:20: error: conflicting types for =E2=80=98local=
e_t=E2=80=99<br>
|=C2=A0 typedef __locale_t locale_t;<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>
| In file included from /usr/include/stdlib.h:199:0,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/ld-colla<wbr>te.c=
:24:<br>
| /usr/include/bits/types/locale<wbr>_t.h:24:20: note: previous declaration=
 of =E2=80=98locale_t=E2=80=99 was here<br>
|=C2=A0 typedef __locale_t locale_t;<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>
| glibc/locale/programs/charmap.<wbr>c: In function =E2=80=98charmap_read=
=E2=80=99:<br>
| glibc/locale/programs/charmap.<wbr>c:202:39: warning: passing argument 1 =
of =E2=80=98__xpg_basename=E2=80=99 discards =E2=80=98const=E2=80=99 qualif=
ier from pointer target type [-Wdiscarded-qualifiers]<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result-&gt;code_set_name =3D basename (file=
name);<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>
| In file included from ../git/localedef/include/strin<wbr>g.h:4:0,<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from glibc/locale/programs/charmap.<wbr>c:28=
:<br>
| /usr/include/libgen.h:34:14: note: expected =E2=80=98char *=E2=80=99 but =
argument is of type =E2=80=98const char *=E2=80=99<br>
|=C2=A0 extern char *__xpg_basename (char *__path) __THROW;<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~<br>
| make: *** [Makefile:66: charmap-dir.o] Error 1<br>
| make: *** Waiting for unfinished jobs....<br>
| make: *** [Makefile:66: charmap.o] Error 1<br>
| make: *** [Makefile:66: ld-address.o] Error 1<br>
| make: *** [Makefile:66: ld-collate.o] Error 1<br>
| WARNING: /home/openbmc/openbmc/build/tm<wbr>p/work/x86_64-linux/cross-loc=
a<wbr>ledef-native/2.24-r0/temp/run.<wbr>do_compile.3987:1 exit 1 from &#39=
;exit 1&#39;<br>
| ERROR: Function failed: do_compile (log file is located at /home/openbmc/=
openbmc/build/tm<wbr>p/work/x86_64-linux/cross-loca<wbr>ledef-native/2.24-r=
0/temp/log.<wbr>do_compile.3987)<br>
ERROR: Task (/home/openbmc/openbmc/meta/re<wbr>cipes-core/glibc/cross-local=
ed<wbr>ef-native_2.24.bb:do_compile) failed with exit code &#39;1&#39;<br>
<br>
</blockquote></div><br></div>

--001a11465e1454e7250559b43977--
