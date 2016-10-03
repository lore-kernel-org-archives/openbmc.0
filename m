Return-Path: <maxims@google.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3snrrZ2wk1zDrL5
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 05:57:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=SJQe5vC1; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id 184so21966725yby.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AJp+/7+sF2ZSOm/ockQtJOwq3VNrmWOl5CnhlSHnf3I=;
 b=SJQe5vC1LX3qC9WMtQRlMUP28qDtt48zGiJnJ2/nPxHRHhP1JRJfaT/Ld8w+u0r8+J
 A3PLp1jmmezqiwAV3azeF0P2XjWLnsMJiUr0onqzDGSm/mJbE7prpwo2aLknw8Ha2ii0
 Cgk75/3EFGEqF5crR+GrfZ1VdANFWn77Sy7HzySfVdFahnAAdSL48/57UcM4DNeNwz3T
 u6QXumHMIS2ro/vYqPCXSx8Om5PQhhX33IhZlv8hIwC+Z6OZ4GkR3ui5sDRTo113T4/7
 E2uqLkcZjA/ChLUKd/vUXOYucYKl9g06V3iC3hIHR0QkCBGr2sCGDJIhd/N4zQ2s9kyF
 PIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AJp+/7+sF2ZSOm/ockQtJOwq3VNrmWOl5CnhlSHnf3I=;
 b=ISmRS9dO+SbvVgmRrQRyRW9vsceqeCeWLfvs1AZyHwqf6/u2TGVDpEccoOG9kAgFcB
 /VQMSAvcC3PfHENM76Ndi1v79IBBCHwv24KMz7XL0KrRMyZL9LhF3V1MGhsr6k4GjJzK
 BP91PK6KcupqVpVartwPNRkgxKQJycsB9Ame0o0gpImSXNquJuyUGdwuhQIn4zvgrU+3
 BYDxdtShtvSxgXmy2KMTAQkrHsuM0By47qTj1za4rakoR4umZBT55Eu2fFPEb9xl6dxf
 ON5lxPAiGa9osYWWVzVptm+4ZlvdB+poOPPa+vcmylY03LV14z1+AKUm+McO2BxcpwtZ
 mMog==
X-Gm-Message-State: AA6/9RlpK71Qa172lBBVoW6TMKbECVUnewabzuH+2sKZZ2ScCvKqh1d7ToE0r5l7dBnfF2HRLrPAGqE7af2EU9KU
X-Received: by 10.37.5.15 with SMTP id 15mr14383409ybf.158.1475521035553; Mon,
 03 Oct 2016 11:57:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Mon, 3 Oct 2016 11:57:15 -0700 (PDT)
In-Reply-To: <1475200147.24463.36.camel@aj.id.au>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-2-git-send-email-maxims@google.com>
 <CACPK8XfgUCEfcgmZ8P2wpMCRHn-jaVup_X5cpq93bYMkZy-jTw@mail.gmail.com>
 <CAFR_W8rc=2XkpUwPokx2_00wMnZfxq9VTHTOVrXgJ8r7DkJ=0w@mail.gmail.com>
 <1475200147.24463.36.camel@aj.id.au>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 3 Oct 2016 11:57:15 -0700
Message-ID: <CAFR_W8q-inp0RqP+uyigVkE88RyASSjtb1Qvc9E427W5-xfG_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed/g5: helper SCU functions for configuring
 aspeed I2C
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11c010d82f4914053dfa83a4
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
X-List-Received-Date: Mon, 03 Oct 2016 18:57:18 -0000

--001a11c010d82f4914053dfa83a4
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 29, 2016 at 6:49 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Thu, 2016-09-29 at 11:23 -0700, Maxim Sloyko wrote:
> > > > +       /* Enable I2C Controllers */
> > > > +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> > > > +
> > > > +       if (num < 3) {
> > >
> > > How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?
> > I don't know. My guess is we don't, as in, the pins are always
> > assigned these functions. In datasheet these bits in PIN CTRL8
> > register are marked as "new in ast2500" and there is no mention of
> > sda{1,2},scl{1,2} in ast2500 datasheet.
> > Also, this part is basically taken from aspeed's sdk, this is why I
> > assume they are always on.
>
> So to clarify, the AST2400 has (SCL1, SDA1) and (SCL2, SDA2) on fixed
> function pins: (K21, K22) and (J19, J18) respectively. I don't have the
> datasheets for earlier releases of the AST SoCs, so can't speak for
> them. The AST2500 has (SCL1, SDA1) and (SCL2, SDA2) on multi-function
> pins: (M18, M19) and (M20, P20) respectively.
>
> As an aside: In AST2500 case I2Cs 1 and 2 are only multiplexed with
> GPIO and are at a higher priority, so we don't need to flip any other
> bits to enable I2C.
>
> Maybe there should be some comments along these given the code looks
> odd at first glance?
>

Added comment.


>
> Cheers,
>
> Andrew
>
> Separately: This code makes me glad I took a data-driven approach for
> the Linux pinmux driver (not to say that result is beautiful either,
> but I don't want even begin to imagine the maze of conditionals
> protecting corner cases).




-- 
*M*axim *S*loyko

--001a11c010d82f4914053dfa83a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 29, 2016 at 6:49 PM, Andrew Jeffery <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, 2=
016-09-29 at 11:23 -0700, Maxim Sloyko wrote:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable I2C Controllers */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clrbits_le32(AST_SCU_BASE + AST_=
SCU_RESET, SCU_RESET_I2C);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num &lt; 3) {<br>
&gt; &gt;<br>
&gt; &gt; How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?=
<br>
&gt; I don&#39;t know. My guess is we don&#39;t, as in, the pins are always=
<br>
&gt; assigned these functions. In datasheet these bits in PIN CTRL8<br>
&gt; register are marked as &quot;new in ast2500&quot; and there is no ment=
ion of<br>
&gt; sda{1,2},scl{1,2} in ast2500 datasheet.<br>
&gt; Also, this part is basically taken from aspeed&#39;s sdk, this is why =
I<br>
&gt; assume they are always on.<br>
<br>
</span>So to clarify, the AST2400 has (SCL1, SDA1) and (SCL2, SDA2) on fixe=
d<br>
function pins: (K21, K22) and (J19, J18) respectively. I don&#39;t have the=
<br>
datasheets for earlier releases of the AST SoCs, so can&#39;t speak for<br>
them. The AST2500 has (SCL1, SDA1) and (SCL2, SDA2) on multi-function<br>
pins: (M18, M19) and (M20, P20) respectively.<br>
<br>
As an aside: In AST2500 case I2Cs 1 and 2 are only multiplexed with<br>
GPIO and are at a higher priority, so we don&#39;t need to flip any other<b=
r>
bits to enable I2C.<br>
<br>
Maybe there should be some comments along these given the code looks<br>
odd at first glance?<br></blockquote><div><br></div><div>Added comment.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Andrew<br>
<br>
Separately: This code makes me glad I took a data-driven approach for<br>
the Linux pinmux driver (not to say that result is beautiful either,<br>
but I don&#39;t want even begin to imagine the maze of conditionals<br>
protecting corner cases).</blockquote></div><br><br clear=3D"all"><div><br>=
</div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div><b>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a11c010d82f4914053dfa83a4--
