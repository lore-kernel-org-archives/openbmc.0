Return-Path: <maxims@google.com>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com
 [IPv6:2a00:1450:400c:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7Bcl0w8jzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 07:17:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NfbQiLg/"; 
 dkim-atps=neutral
Received: by mail-wm0-x22c.google.com with SMTP id f67so6592718wmh.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aegmZ0tUxsRZ/ieTj9EXzv9LryInCzRLApwEgBtLNOE=;
 b=NfbQiLg/n9ScfKijbCYHa3rOaCDl//v/9QB4vyP6ABQtJbckGU63LcX55rPtqz2DA8
 zOrhptElLXa/EXteIFEzyaHehaqYt7M34bMydkLansU9HxdF7eHoASslScwQHCzd3y6U
 A+EYjmRX/H5b9EpMnIxbnDr4HLhuJWk1sWtWG2mqFs+sWfUevIdhmmpIAD9KYtSd0z1f
 S8QPaNrVbwaw+fjm+hd9qhPjaP91Y3vSsjwM6GWZA546s+SEZ+WBkGmMxydqmv4djTDN
 5OEw//yZVYOTazPHXG7qVkeueLAgwCaQj534d5X3F/z6rUCkEwH/YH894Z1BC3K3vCb1
 x2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aegmZ0tUxsRZ/ieTj9EXzv9LryInCzRLApwEgBtLNOE=;
 b=hCz4YGRhlXvYL9OqJ5SXMjX54I3cLh47YA1R/aqLK0XENVhhGcWZ2Ds8a9xvCJYRnM
 t/ekbzogeTMZ7MthxZl79gsVDqr9k1Qeuz7C8uVebu0ho8t3Rwj9zdKwVPgZB7crYlCC
 Nc/a8idKPql5KrzmyxT9MguppvQPdKfbg4FRMX18mHCnnZLrmFs1QLwm9CF1FBBpvHxa
 8pmm8LCCxUcpV64WqOO3RDGzm+CCzNSRlXG/QmwsWeBJqW9MkNx1nn2k+4/wPpVy5TwF
 kAK5RIZguZxy9rSn9QjYc1wfFudOo24FCQGgAFy076cYR4+TTIGkzPhFWeJmaslfvdcs
 U7Xg==
X-Gm-Message-State: AIVw110hvgiOZkcYrdwaeR1dSeyJlD+JFFtKlrjYaxfcvji02xv8zh7t
 0hS6+tlQdSRggRhiySU58oEBKmxaFyiL
X-Received: by 10.28.178.69 with SMTP id b66mr3663736wmf.99.1499894272752;
 Wed, 12 Jul 2017 14:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.134.19 with HTTP; Wed, 12 Jul 2017 14:17:51 -0700 (PDT)
In-Reply-To: <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
 <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 12 Jul 2017 14:17:51 -0700
Message-ID: <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
Subject: Re: Linux Kernel PMBus drivers
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1144211e548f4f0554255933"
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
X-List-Received-Date: Wed, 12 Jul 2017 21:18:00 -0000

--001a1144211e548f4f0554255933
Content-Type: text/plain; charset="UTF-8"

Hi Brad,

Thanks for the info. Do you know which kernel subtree should I be basing my
patches on?

On Wed, Jul 12, 2017 at 1:56 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Jul 12, 2017, at 1:32 PM, Maxim Sloyko <maxims@google.com> wrote:
> >
> > Hi Joel,
> >
> > I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius
> (Infineon and Intersil parts). Do you know which subtree/mailing list I
> should send these to or how can I figure this out?
> >
>
> linux-hwmon@vger.kernel.org
>
> > Thanks.
> >
> > --
> > Maxim Sloyko
>



-- 
*M*axim *S*loyko

--001a1144211e548f4f0554255933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad,<div><br></div><div>Thanks for the info. Do you kn=
ow which kernel subtree should I be basing my patches on?<br><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jul 12, 2017 at 1:56 PM=
, Brad Bishop <span dir=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirr=
el.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
&gt; On Jul 12, 2017, at 1:32 PM, Maxim Sloyko &lt;<a href=3D"mailto:maxims=
@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius (I=
nfineon and Intersil parts). Do you know which subtree/mailing list I shoul=
d send these to or how can I figure this out?<br>
&gt;<br>
<br>
</span><a href=3D"mailto:linux-hwmon@vger.kernel.org">linux-hwmon@vger.kern=
el.org</a><br>
<br>
&gt; Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; Maxim Sloyko<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b=
>M</b>axim <b>S</b>loyko</div></div>
</div></div></div>

--001a1144211e548f4f0554255933--
