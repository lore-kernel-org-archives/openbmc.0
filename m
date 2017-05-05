Return-Path: <raltherr@google.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKKBg4rwWzDq5W
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 03:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aA+XcXr1"; 
 dkim-atps=neutral
Received: by mail-wm0-x229.google.com with SMTP id m123so12976667wma.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=V1lP28cdAcp4GPUzNB4GERgLqinLJeBsFzbER1UBW+s=;
 b=aA+XcXr1qgfl15Y6s7y4oKD2IoLYvo2kyTgljI1d25dANaODNzcyu1rdgUIxke/LmI
 1g7Z1b30EXsQEmavVh0/nCM5ubDs2BFCzCBeXeo+TJImd2GFJZORW6zN+P5I+CQYL0Ev
 lcOylQy6eDvNwNcWDc1A7LxXtRS65iLWee5a6qeXc9DrITOZ6nSkV8zIo0CLMm3g3qDb
 FHakNpc/3U3B+XGkJv9oErj5wqYzZeXrXzJqoodmWcPyzTKw4wmL8hZ5ppk03+HZoQjn
 t2pe6AL7YMMxgUm/KFb+0gV4wO7Y1hYrz45B6CrbTna4rct9CJ1+k6ISTMt6nQf9P1gk
 Qc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=V1lP28cdAcp4GPUzNB4GERgLqinLJeBsFzbER1UBW+s=;
 b=MMrFydaIfs79ZgcW5TmiIOOx4yVBcj+ByTS/5TOX60MRyE1f2FNP16rxMlGCdASUxw
 dwOA2x0OcY68w0xZtOQKaN+R18rh8t6X29PFYYARQT58EoQ3OstQIXKTXH2OaSN+Trvd
 CdPtGFsDcg1S7aTqngY0kUio3+RbWXNQyCpb8LenJVNyRqIzDS3udxDqE3rENVs+MoR/
 b5BjAxN2ZQZBVMFR1YX6vC3y4Fg3rjWcdWQD/dMvIqboaqy5P43zWQqr5sF33jCzNwqa
 kTT7f3bqXzsr8LgFLnAMOJq79CFBp6HM6mAySzZDYY+mEOjoji83uyBobh8k/WxMpTql
 5PlQ==
X-Gm-Message-State: AODbwcDJbxkr/9HNysf7mIQ+mln4HwnN1dUazc8yYVOSuSO9iJ9STuJn
 EBvx1ZV4XMYm9u0uBlg+YXSp55rL6Qi9Lb0=
X-Received: by 10.28.214.211 with SMTP id n202mr6426181wmg.142.1494006520434; 
 Fri, 05 May 2017 10:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.46.130 with HTTP; Fri, 5 May 2017 10:48:39 -0700 (PDT)
In-Reply-To: <20170505174341.GE25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 5 May 2017 10:48:39 -0700
Message-ID: <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
Subject: Re: phosphor-hwmon bottleneck potential
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11469f78f1dfc1054eca7fba
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 May 2017 17:48:44 -0000

--001a11469f78f1dfc1054eca7fba
Content-Type: text/plain; charset=UTF-8

I can't comment on the driver implementation choices.  They have been
reviewed and accepted by upstream.  I'm not sure what version of the driver
you are looking at.

On Fri, May 5, 2017 at 10:43 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Rick,
>
> On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:
> > I've chatted with Patrick V. separately about the driver.  AST2400/2500
> fan
> > tach hardware measures only one fan at a time.  I think we can adjust the
> > driver settings to reduce the measurement time but it will scale with #
> of
> > tachs being read.
>
> I never looked at this driver before but it looks like it is doing an
> 'msleep' in the hwmon read path after resetting a counter register and
> then counting rotations?  Two comments:
>
> 1. As it stands, it doesn't appear that this driver is actually
> multi-reader safe (either thread or process).  There is no locking or
> queueing to prevent one reader from resetting the result register while
> another is performing the msleep loop.  Multi-threading might "go
> faster" but it will give entirely wrong results by my reading.
>
> 2. It seems bad to do a long-running msleep in the hwmon read path to
> begin with.  Should this driver be restructured to have a kthread read
> the channels in the background on a polling interval instead of
> initiating by userspace action?
>
> --
> Patrick Williams
>

--001a11469f78f1dfc1054eca7fba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t comment on the driver implementation choices.=
=C2=A0 They have been reviewed and accepted by upstream.=C2=A0 I&#39;m not =
sure what version of the driver you are looking at.</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Fri, May 5, 2017 at 10:43 AM, Pa=
trick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" t=
arget=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Rick,<br>
<span class=3D""><br>
On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:<br>
&gt; I&#39;ve chatted with Patrick V. separately about the driver.=C2=A0 AS=
T2400/2500 fan<br>
&gt; tach hardware measures only one fan at a time.=C2=A0 I think we can ad=
just the<br>
&gt; driver settings to reduce the measurement time but it will scale with =
# of<br>
&gt; tachs being read.<br>
<br>
</span>I never looked at this driver before but it looks like it is doing a=
n<br>
&#39;msleep&#39; in the hwmon read path after resetting a counter register =
and<br>
then counting rotations?=C2=A0 Two comments:<br>
<br>
1. As it stands, it doesn&#39;t appear that this driver is actually<br>
multi-reader safe (either thread or process).=C2=A0 There is no locking or<=
br>
queueing to prevent one reader from resetting the result register while<br>
another is performing the msleep loop.=C2=A0 Multi-threading might &quot;go=
<br>
faster&quot; but it will give entirely wrong results by my reading.<br>
<br>
2. It seems bad to do a long-running msleep in the hwmon read path to<br>
begin with.=C2=A0 Should this driver be restructured to have a kthread read=
<br>
the channels in the background on a polling interval instead of<br>
initiating by userspace action?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--001a11469f78f1dfc1054eca7fba--
