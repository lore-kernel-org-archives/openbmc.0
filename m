Return-Path: <rlippert@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=rlippert@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vB9+rAoh"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4098gy05qxzF271
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 09:58:20 +1100 (AEDT)
Received: by mail-qt0-x234.google.com with SMTP id v11so21361774qtj.6
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PJQN7Wvv9bY7yb7gHin0gXnUql+OSKzVbACPYHbwrxI=;
 b=vB9+rAohboYos4XVoXvLavf8YNUEsGeRaF4X3iw49DppUECQa3N/4Qe6Ng8kXrJBmM
 9ydL6kQbHTgmuWqrIc3pCS2lCg+Jy0gfgDmkYjs0xdrrk4kcrUyqb8sLs3Y6GKdYH5EM
 65DNKLSznEJGrGt7Uw+d6ELH0iH5oIShJvDHoBmsoQw+vgFfHTB6+tpYONXSXetouGse
 HXG+qly/whV6ey+rr7xoe3GkCT4E11uPUW5lnEPn1iUdeQyZmohIQy9quIyabH4Y+LPs
 eaSCuNtYESvCthnh1OGK4OVgMsjybZSe9+CiY9W5zC3R0G3J3Xbw28LMo+r50HAdlfJl
 mQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PJQN7Wvv9bY7yb7gHin0gXnUql+OSKzVbACPYHbwrxI=;
 b=qTru70z9w17UzFpEClORSeYK1pO7mmUZi2JC/ctN0uctC4NJiqObMOkkGm0EJu1Q+A
 cgP+RbrZKd2lixOeCt8NTaUcXF3ua/4fbOrZagXxu9oHT84A/L2+9Lege2HGMaBIPEIJ
 ivstYkCYbmC9GXvmFBCEFpb+6wxaZSE/xnBIiq3F1GqBemOH5n3fpV69COFpaop6j1TG
 o6gVytf5xeaZkD1zHPdQtdPDsMZjvN5+2SDlDw4jjvaoQXq5sO8J2+Msq9m8RWt+G20z
 OhgvIV198WrXZJJqBFO4mw5ZBdmCkvomZrfX5C5x+k1RKoPyQT5UtO07ot02Z+xHov3S
 0+xg==
X-Gm-Message-State: AElRT7FQeSaYZE+cLtdzLRrfUEwoCFhYkLN7IwJ4277Iqj8MhvrJn0cf
 MmrVReEAJCPWE17xREhu8wNLZcXLg8yuJ4+PoC5Mzg==
X-Google-Smtp-Source: AG47ELs/VC9nwW/6Sb12kikJjodayydrpx6tfTUqe12SOd1qpATYzLOUh870V4+Ie5cD04ac+r+RlDbrQDQfg0u4x+o=
X-Received: by 10.200.43.49 with SMTP id 46mr45230897qtu.97.1522105098065;
 Mon, 26 Mar 2018 15:58:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.60.15 with HTTP; Mon, 26 Mar 2018 15:57:57 -0700 (PDT)
In-Reply-To: <87y3iwo4i4.fsf@linux.vnet.ibm.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
 <87efkyf1xw.fsf@linux.vnet.ibm.com>
 <CAFRv3ww59TrnRBWAKZu4LEc5V2iaSW03MEZQgQw6Yrymqt9Meg@mail.gmail.com>
 <87y3iwo4i4.fsf@linux.vnet.ibm.com>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 26 Mar 2018 15:57:57 -0700
Message-ID: <CAFRv3wxYm5D_o9XJ5z=FEq_aC39Y2VgV=+L5eTfAHfFrYRPxMg@mail.gmail.com>
Subject: Re: Exposing POST codes
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Venture <venture@google.com>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11c11594aee157056858b5ee"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 22:58:23 -0000

--001a11c11594aee157056858b5ee
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 11:48 PM, Stewart Smith <stewart@linux.vnet.ibm.com>
wrote:

> Rob Lippert <rlippert@google.com> writes:
> > I implemented port 80h POST codes for POWER9 hostboot a while back:
> > https://github.com/open-power/hostboot/blob/
> c93bef31ae6ce781f9e0a11bb9224b6728ff120f/src/usr/
> initservice/istepdispatcher/istepdispatcher.C#L2312
> >
> > On Zaius machines we are using that support with Patrick's snoop daemon
> and
> > a separate daemon that receives the code via dbus and outputs it over the
> > front 7seg debug display.
> > It has proven useful for getting early error/debug reports from
> technicians
> > at scale e.g. "5 machines stopped at code 35h, 2 at 72h" provides a quick
> > overview of what the problems are for me to debug further (since I have
> the
> > decoder ring, and the istep names would be useless to them anyways).
>
> Neat!
>
> Anything we should add to skiboot or petitboot environment for this? Or
> do we not fail in IPL enough to warrant it?
>

I've never seen a hang in skiboot/petitboot yet so haven't done the work
there to add POST codes yet...

If you look at the picture published at openpower conference you can see
the POST code display on the machines in a rack:
https://www.top500.org/news/openpower-gathers-momentum-with-major-deployments/

All the machines in that picture are at 0x9b which is end of hostboot aka
"good" :)
(except the one that seems to be soft off for some reason... oops)

-Rob

--001a11c11594aee157056858b5ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Mar 12, 2018 at 11:48 PM, Stewart Smith <span dir=3D"ltr">&lt;<a href=
=3D"mailto:stewart@linux.vnet.ibm.com" target=3D"_blank">stewart@linux.vnet=
.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">Rob Lippert &lt;<a href=3D"mailto:rlipper=
t@google.com">rlippert@google.com</a>&gt; writes:<br>
&gt; I implemented port 80h POST codes for POWER9 hostboot a while back:<br=
>
&gt; <a href=3D"https://github.com/open-power/hostboot/blob/c93bef31ae6ce78=
1f9e0a11bb9224b6728ff120f/src/usr/initservice/istepdispatcher/istepdispatch=
er.C#L2312" rel=3D"noreferrer" target=3D"_blank">https://github.com/open-po=
wer/<wbr>hostboot/blob/<wbr>c93bef31ae6ce781f9e0a11bb9224b<wbr>6728ff120f/s=
rc/usr/<wbr>initservice/istepdispatcher/<wbr>istepdispatcher.C#L2312</a><br=
>
&gt;<br>
&gt; On Zaius machines we are using that support with Patrick&#39;s snoop d=
aemon and<br>
&gt; a separate daemon that receives the code via dbus and outputs it over =
the<br>
&gt; front 7seg debug display.<br>
&gt; It has proven useful for getting early error/debug reports from techni=
cians<br>
&gt; at scale e.g. &quot;5 machines stopped at code 35h, 2 at 72h&quot; pro=
vides a quick<br>
&gt; overview of what the problems are for me to debug further (since I hav=
e the<br>
&gt; decoder ring, and the istep names would be useless to them anyways).<b=
r>
<br>
</span>Neat!<br>
<br>
Anything we should add to skiboot or petitboot environment for this? Or<br>
do we not fail in IPL enough to warrant it?<br></blockquote><div><br></div>=
<div>I&#39;ve never seen a hang in skiboot/petitboot yet so haven&#39;t don=
e the work there to add POST codes yet...</div><div><br></div><div>If you l=
ook at the picture published at openpower conference you can see the POST c=
ode display on the machines in a rack:</div><div><a href=3D"https://www.top=
500.org/news/openpower-gathers-momentum-with-major-deployments/">https://ww=
w.top500.org/news/openpower-gathers-momentum-with-major-deployments/</a><br=
></div><div><br></div><div>All the machines in that picture are at 0x9b whi=
ch is end of hostboot aka &quot;good&quot; :)</div><div>(except the one tha=
t seems to be soft off for some reason... oops)</div><div><br></div><div>-R=
ob</div></div></div></div>

--001a11c11594aee157056858b5ee--
