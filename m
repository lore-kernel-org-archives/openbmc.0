Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rlS4lNBe"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449xnD0Q6WzDqTQ
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 04:51:43 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id p196so20205708iod.9
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uq2Jr5vzKb6pmw7NZuyXikOzm6qlX/bKIZLLee6fguE=;
 b=rlS4lNBelNX6IhXpaxkgaeNknEAXbS9+ZBQuvjqjPhHl7Mhd1i93/xI75EyyBh2CT7
 11gF/J25I4B3eYQeMUeoNrK0VBIjdwo8roCV4hm52JtVYuTNaLqeVU5BiSW0NRrMjDA2
 lP7qhqjq0wK6RgzRZaDkzxOlFMRWro1jWfVKTY/GFsH2fp5AavZYLkiJME+aFEYYSl2l
 4qKQPolqe0JAShWsCDMx/AE8LonH01ZqNFtscJLx4RFOh5hWWZdsmcxU2xA8mRqsxGHM
 AmVovQgXLtfHCO2QT2PFEF82cuWwxaZ6uT026uOZQEuiEg4BYBYB4MnngzMyxc0YjbtT
 u/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uq2Jr5vzKb6pmw7NZuyXikOzm6qlX/bKIZLLee6fguE=;
 b=bUj4kdCU2XqbQ5lC6+uAsNAnmmEf0PDr8Dbqk8yRZZ54D4v+x2HNaQxQh6cK4IrE3N
 LD66fX1nImdiBUF1zrv+aMKAEF1E6mrztL0Ql+q4di9CxPQL+u9PmYUI2tjOZf5tAglY
 3wRKUTpImzgqMQ9imptfe22okKajDf/f+uezYINZT0fR+I3bN9dB2Hg5qiFDvKU+u4kh
 4zEVMPgpHDW9DPD4q1DIjKmAZkl1i/QRIFtXM/nIUXKRkCAAjHz5i0wsxME6xVmuXqMx
 R8pbhQFn7snhWNRu4w9gifuSaZ0gK2ZOszjjW+ARdOK7VQ2vse4mdeKcuc0zCBGToGhO
 pSSg==
X-Gm-Message-State: APjAAAUTSMB2NMt8pafy8zOG3n3eeMS1IrwxvT79Cnp9sq5YU0p/cHZi
 dudBqABwmrRy1VIWFVXs45fcw04mi9J6KcR4YZo=
X-Google-Smtp-Source: APXvYqwu5QDGeFZuwqdBa+WXEuhQCZzHaYm3trKSDNA04IICxT+TgekHBo6Dub8WXVWgxflpTdjllDEqVuE+cPyRZdo=
X-Received: by 2002:a6b:b214:: with SMTP id b20mr3392202iof.130.1551462700126; 
 Fri, 01 Mar 2019 09:51:40 -0800 (PST)
MIME-Version: 1.0
References: <263d64e0656a31579fd990b6e862cf72@linux.vnet.ibm.com>
In-Reply-To: <263d64e0656a31579fd990b6e862cf72@linux.vnet.ibm.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Fri, 1 Mar 2019 20:51:28 +0300
Message-ID: <CAHsrh9JkjT49OZPwVMvQyHTpDjGhtxjuc37zZvX6GZnsjtAaQw@mail.gmail.com>
Subject: Re: where is existing OpenPOWER checkstop handling support?
To: zshelle <zshelle@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001f970505830c0f3e"
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
X-List-Received-Date: Fri, 01 Mar 2019 17:51:45 -0000

--0000000000001f970505830c0f3e
Content-Type: text/plain; charset="UTF-8"

For OpenPOWER, the checkstop signal comes through GPIO.

GPIO monitor: https://github.com/openbmc/phosphor-gpio-monitor
Recipe:
https://github.com/openbmc/openbmc/blob/master/meta-openpower/recipes-phosphor/host/checkstop-monitor.bb

--
Best regards,
Artem Senichev


On Fri, Mar 1, 2019 at 6:13 PM zshelle <zshelle@linux.vnet.ibm.com> wrote:

> I know for OpenPOWER systems, there is some support to detect a system
> checkstop, wait some defined amount of time, then reset the machine.
> Could anyone point me to this code?
>
>

--0000000000001f970505830c0f3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace">For OpenPOWER, the checkstop=
 signal comes through GPIO.</div><div class=3D"gmail_default" style=3D"font=
-family:monospace,monospace"><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">GPIO monitor: <a href=3D"https://githu=
b.com/openbmc/phosphor-gpio-monitor">https://github.com/openbmc/phosphor-gp=
io-monitor</a><br></div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace">Recipe: <a href=3D"https://github.com/openbmc/openbmc/b=
lob/master/meta-openpower/recipes-phosphor/host/checkstop-monitor.bb">https=
://github.com/openbmc/openbmc/blob/master/meta-openpower/recipes-phosphor/h=
ost/checkstop-monitor.bb</a></div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br clear=3D"all"></div><div><div dir=3D"ltr"=
 class=3D"gmail_signature">--<br>Best regards,<br>Artem Senichev</div></div=
><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Mar 1, 2019 at 6:13 PM zshelle &lt;<a href=3D"mail=
to:zshelle@linux.vnet.ibm.com">zshelle@linux.vnet.ibm.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">I know for OpenPOW=
ER systems, there is some support to detect a system <br>
checkstop, wait some defined amount of time, then reset the machine. <br>
Could anyone point me to this code?<br>
<br>
</blockquote></div>

--0000000000001f970505830c0f3e--
