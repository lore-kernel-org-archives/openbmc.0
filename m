Return-Path: <maxims@google.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq4Q26jHkzDq7c
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 11:42:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lkVMvE2G"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id b140so8225558iof.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=t9VpfU46iRrd2RpEwP5HFPiFe43IEh8vnhDCJV1WMXo=;
 b=lkVMvE2GnZhOKEm9wWM0cxYXqHajjQaJcVhgdxQbuTl/Po+Gc9f/lzxzVaC2wOIQKR
 lk+lTIG/RY/86HXKb1XHk1IcnhhF1K9kdTWQdBvL4nqDQ8CBR9guuJgDZxE1Lw6mvJ10
 eeFJgeu4XuFOIQhcffmXfDXC+zOjDQRdmUf+BffONPWKwlv9qF909dHaBVHRYc5JbqUP
 7yMOTwL53o8Y1F1vSMqdx+S8UCRR94AnGAwvVZlzylzsvvR/FByz3kRduGZ9lyLSLjJa
 x3lcQqSAKdUhsnaP0/D1wyOyiAA1P+qZbgfXVGYPGaqouBnXIAX8IMjjbAM+FVwQtkyX
 Bsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=t9VpfU46iRrd2RpEwP5HFPiFe43IEh8vnhDCJV1WMXo=;
 b=F16uExBmwmkNCYSzxpGAAehx944fRxLUDl4QpGc2K3KRwQhxD/EsjxqsyKZGa9ne5Y
 VLiQuvD+dyDKAnK954Bo/XCOTrn+j0kObe12ZXVKWmYX/7R6nIw8aVTzRehPywgONd/n
 1Vd9QbcIQn8NiFe99LtHaMZLTJq4Crrca0m0rILNZ2txRYjI/sOcxCBAoPBZX+ysqzXr
 goQ/86mwX3y1EhaR7w0eVCZ3iH2qQ8xFtBN/txnrmM3tTIw/zGSe/jpzAGmSjDi7UwMp
 OGxe0XR7YhNqWwrnpyxSNVWk5xfWOWPmHqsR6yHRkK0EZa+efLFMk7rbCe+oyIP2pGwS
 JgmQ==
X-Gm-Message-State: AFeK/H3bpPGh5xfJAMdriH1R8UXsNxqNRaGw8+z6bkxi5+kP8HDM5l3c/jZmm3qg0X3EHd02CW9VFArdNYl7wPRS
X-Received: by 10.107.200.139 with SMTP id y133mr6148403iof.147.1490316152719; 
 Thu, 23 Mar 2017 17:42:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Thu, 23 Mar 2017 17:42:32 -0700 (PDT)
In-Reply-To: <CAPnjgZ2E0QdRPN+CJrCgfXWA0bkAZLeOLST2BeWDQkcGUM-C+Q@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-17-maxims@google.com>
 <CANr=Z=bMy9v0G-DAHB4LJZnHB1W3rqubY8-EK5Mn4W3dqQOk3g@mail.gmail.com>
 <CAFR_W8rqa+WeBkafcFu-hv1Oohvj4DfO4YSw5S0XXNpOAg8dKA@mail.gmail.com>
 <CAPnjgZ2E0QdRPN+CJrCgfXWA0bkAZLeOLST2BeWDQkcGUM-C+Q@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 23 Mar 2017 17:42:32 -0700
Message-ID: <CAFR_W8pJXYGHFyiAJJ-YnaFZgyO36XO9M-_BmNSMDcW_h=kouA@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 16/17] aspeed: Add AST2500/AST2400 compatible NIC
 Driver
To: Simon Glass <sjg@chromium.org>
Cc: Joe Hershberger <joe.hershberger@gmail.com>, u-boot <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0bfd54e335a4054b6f446e
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
X-List-Received-Date: Fri, 24 Mar 2017 00:42:35 -0000

--94eb2c0bfd54e335a4054b6f446e
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 6:06 AM, Simon Glass <sjg@chromium.org> wrote:

> Hi Maxim,
>
> On 21 March 2017 at 17:44, Maxim Sloyko <maxims@google.com> wrote:
> > Hi Joe,
> >
> > Please see responses inline, simply ACK'ed comments will be addressed
> > in the next version.
> >
> > On Tue, Mar 21, 2017 at 12:32 PM, Joe Hershberger
> > <joe.hershberger@gmail.com> wrote:
> >> On Thu, Mar 16, 2017 at 4:36 PM, Maxim Sloyko <maxims@google.com>
> wrote:
> >>> The device that Aspeed uses is basically Faraday FTGMAC100, but with
> >>> some differences here and there. Since I don't have access to a
> properly
> >>> implemented FTGMAC100 though, I can't really test it and so I don't
> >>> feel comfortable claiming compatibility, even though I reused a lot of
> >>> FTGMAC100 driver code.
> >>
> >> I think it would be better to attempt to integrate this driver with
> >> the FTGMAC driver and ask others on the list who have that HW to test
> >> your changes to ensure no regressions. I prefer we have fewer drivers
> >> to maintain.
> >
> > One concern: this driver also performs its clock configuration, which
> > I believe is very specific to the SoC, so to have that compatibility
> > clock configuration needs to be externalized somehow. I don't know
> > what is the best way to do it.
>
> Generally the clock is defined by a DT property in the node, so this
> should work out OK.
>

Well, this device on this SoC needs two different clocks configured, one
for all devices and one device specific. The device speed is also hardware
strapped, so it reads the unrelated register to figure out which rate to
enable. Not to mention, it's still unclear how it's going to be done in
Linux, so somewhere else in this review Tom actually suggested to go non-DT
way with this.

Anyway, I'm going to drop this driver from this series and work this out
separately, just to keep things moving, because it looks like it raises the
largest number of concerns.


>
> Regards,
> Simon
>



-- 
*M*axim *S*loyko

--94eb2c0bfd54e335a4054b6f446e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 6:06 AM, Simon Glass <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi Maxim,<br>
<span class=3D""><br>
On 21 March 2017 at 17:44, Maxim Sloyko &lt;<a href=3D"mailto:maxims@google=
.com">maxims@google.com</a>&gt; wrote:<br>
&gt; Hi Joe,<br>
&gt;<br>
&gt; Please see responses inline, simply ACK&#39;ed comments will be addres=
sed<br>
&gt; in the next version.<br>
&gt;<br>
&gt; On Tue, Mar 21, 2017 at 12:32 PM, Joe Hershberger<br>
&gt; &lt;<a href=3D"mailto:joe.hershberger@gmail.com">joe.hershberger@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt; On Thu, Mar 16, 2017 at 4:36 PM, Maxim Sloyko &lt;<a href=3D"mailt=
o:maxims@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt; The device that Aspeed uses is basically Faraday FTGMAC100, bu=
t with<br>
&gt;&gt;&gt; some differences here and there. Since I don&#39;t have access=
 to a properly<br>
&gt;&gt;&gt; implemented FTGMAC100 though, I can&#39;t really test it and s=
o I don&#39;t<br>
&gt;&gt;&gt; feel comfortable claiming compatibility, even though I reused =
a lot of<br>
&gt;&gt;&gt; FTGMAC100 driver code.<br>
&gt;&gt;<br>
&gt;&gt; I think it would be better to attempt to integrate this driver wit=
h<br>
&gt;&gt; the FTGMAC driver and ask others on the list who have that HW to t=
est<br>
&gt;&gt; your changes to ensure no regressions. I prefer we have fewer driv=
ers<br>
&gt;&gt; to maintain.<br>
&gt;<br>
&gt; One concern: this driver also performs its clock configuration, which<=
br>
&gt; I believe is very specific to the SoC, so to have that compatibility<b=
r>
&gt; clock configuration needs to be externalized somehow. I don&#39;t know=
<br>
&gt; what is the best way to do it.<br>
<br>
</span>Generally the clock is defined by a DT property in the node, so this=
<br>
should work out OK.<br></blockquote><div><br></div><div>Well, this device o=
n this SoC needs two different clocks configured, one for all devices and o=
ne device specific. The device speed is also hardware strapped, so it reads=
 the unrelated register to figure out which rate to enable. Not to mention,=
 it&#39;s still unclear how it&#39;s going to be done in Linux, so somewher=
e else in this review Tom actually suggested to go non-DT way with this.</d=
iv><div><br></div><div>Anyway, I&#39;m going to drop this driver from this =
series and work this out separately, just to keep things moving, because it=
 looks like it raises the largest number of concerns.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Simon<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--94eb2c0bfd54e335a4054b6f446e--
