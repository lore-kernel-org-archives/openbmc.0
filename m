Return-Path: <maxims@google.com>
Received: from mail-yb0-x230.google.com (mail-yb0-x230.google.com
 [IPv6:2607:f8b0:4002:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sm39K4DRHzDvJS
 for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2016 06:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=WGM9ZSJd; 
 dkim-atps=neutral
Received: by mail-yb0-x230.google.com with SMTP id z8so32256065ybh.3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4KLDX/nWq8lNfkLSYTnLgehvRxp9vyZbxTimnTrvS1w=;
 b=WGM9ZSJd1CuG4QUVTJd2Xsv1tIpbBPFiHzKhdlkkJsD3FbqP4wKXIwxAyeaGfBcVfU
 wt29Bp1EpAHpDMPRlOgNfkE036T792UA1+f8GrfqQBZkhm00I3y7R+idjE+krb20lyo+
 SMAXFTXeI0MgJQ/LD8YLlEceiqXKwONgEbnJjQ9ZH228TXSzrdAfm4U6e/fy4vHtrnjN
 zYL7nN0mPrtp5nXylh1lAPh7iRpK46WqgczClotsGvgVtgV/Vndlu01yKfHqs3Yxk3EZ
 9Oi3pIhO/QdIRolllm5fUyjL9sIZWCdwc3c+U1zjS2kKl9/X+lDM8GU5wp0kKoBB+I7J
 gqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4KLDX/nWq8lNfkLSYTnLgehvRxp9vyZbxTimnTrvS1w=;
 b=W4xI/hHxDKSFMg6gxM0L8Joyrx6FQ9jZEk/GENd9c9TyPTVyXphjQjc9wFvZlLxNOT
 ZlBN/oADBCCIZ09Gb60tiWwBvwfubh6+XtXOdAD6VXCWMgB0kw/z1IlMfwGIbU0xaH2U
 7jvU5jvGB7nBuRaA76rrbX1TojEqPADOXjlyeLHFzJpG3Dfm55bcLwdgbgBveWQ44aba
 QuPkO2DEtOyRJP/0z3hURDW292cnDjRyxkV6OJpo9G2f6sSmqhpbgsGBza1nJco/a0RJ
 cVK+/bLKMGvJtDjOkr6uFpwbgitrT/I/XamV6Ck58HKXS31F2cFeREsrMQSRjdu4IQas
 F3rg==
X-Gm-Message-State: AA6/9RnP7S6i8oXX3q5d70aZfmM7yWY4366YRq37iZPd2FBhjCTCRH48IoIsmLGu+2X+vndl/9myAx/GAf7ZNjpD
X-Received: by 10.37.5.15 with SMTP id 15mr3686880ybf.158.1475267729059; Fri,
 30 Sep 2016 13:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Fri, 30 Sep 2016 13:35:28 -0700 (PDT)
In-Reply-To: <OFB05163AE.D69C2C6E-ON0025803E.00695D10-0025803E.00695D12@notes.na.collabserv.com>
References: <CAFR_W8oXug8fKap4Eh-3T7qxXXoemG07-CAFxzXhJwwRW4Cz+w@mail.gmail.com>
 <OFB05163AE.D69C2C6E-ON0025803E.00695D10-0025803E.00695D12@notes.na.collabserv.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 30 Sep 2016 13:35:28 -0700
Message-ID: <CAFR_W8oVhttX7Vo-56y-jw9h_G+-7+WbWP2YqOj4iB8LJ2TagQ@mail.gmail.com>
Subject: Re: U-Boot ethXaddr environment variables are not propagating to Linux
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11c010d8f2c68b053dbf88eb
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
X-List-Received-Date: Fri, 30 Sep 2016 20:35:34 -0000

--001a11c010d8f2c68b053dbf88eb
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 30, 2016 at 12:10 PM, Milton Miller II <miltonm@us.ibm.com>
wrote:

>
>
> -----"openbmc" <openbmc-bounces+miltonm=us.ibm.com@lists.ozlabs.org>
> wrote: -----
>
> >To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> >From: Maxim Sloyko
> >Sent by: "openbmc"
> >Date: 09/30/2016 01:09PM
> >Subject: U-Boot ethXaddr environment variables are not propagating to
> >Linux
> >
> >Hi all,
> >
> >This worked before, when I first tried it ~2 months ago on the eval
> >board: set ethaddr & eth1addr in U-Boot, boot Linux and it will use
> >the same MAC addresses. I tried it again yesterday and it does not
> >work any more.
>
> I think ethaddr made a difference.  Not sure eth1addr ever did, unless
> you have two direct interfaces on your board?


I'm using eval board. It does have two network ports, but I'm mostly
interested in the one that is "attached" to ethaddr.


>
>
> >
> >I tried it with openbmc/u-boot, to make sure my changes do not
> >interfere. I verified, by reading MAC08 MAC0C registers, that MAC
> >addresses are properly configured by U-Boot from env. However, when I
> >booted Linux, it still generated random MAC address, rather then
> >reusing whatever was passed up from U-Boot.
> >
> >Any ideas on what change might have affected this?
>
>
> You have likely hit the same issue as
> https://github.com/openbmc/u-boot/issues/13
> https://github.com/openbmc/openbmc/issues/578
>
> Basically u-boot was over optimized and does not write the mac unless it
> tries to use the network.
>

I verified by reading MAC registers MAC08 & MAC0C that for both macs the
addresses are properly configured.
I tried running dhcp and I saw dhcp requests on the network from the
correct MAC address.

Booting linux still results in it generating random MAC addresses.


>
> You could add a ping (static addressing) or dhcp request (dhcp address) in
> your bootcmd as a workaround, or address the bug more directly.
>
> Note: even with NCSI this should not require 2 seconds, only the 10ms
> sleep to wait for the clock stabilization.  The 2 second delay likely
> comes
> from the NCSI spec as the maximum time for packages to initialize.
>
> milton
>
>
>


-- 
*M*axim *S*loyko

--001a11c010d8f2c68b053dbf88eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 30, 2016 at 12:10 PM, Milton Miller II <span dir=3D"ltr">&l=
t;<a href=3D"mailto:miltonm@us.ibm.com" target=3D"_blank">miltonm@us.ibm.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><font face=3D"Def=
ault Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=3D"2"><br><br><fon=
t color=3D"#990099">-----&quot;openbmc&quot; &lt;<a href=3D"mailto:openbmc-=
bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org" target=3D"_blank">openbmc-bo=
unces+miltonm=3Dus.<wbr>ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</font=
><br><br>&gt;To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlab=
s.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>&gt;From: Maxi=
m Sloyko <br>&gt;Sent by: &quot;openbmc&quot; <br>&gt;Date: 09/30/2016 01:0=
9PM<br>&gt;Subject: U-Boot ethXaddr environment variables are not propagati=
ng to<br>&gt;Linux<span class=3D""><br>&gt;<br>&gt;Hi all,<br>&gt;<br>&gt;T=
his worked before, when I first tried it ~2 months ago on the eval<br>&gt;b=
oard: set ethaddr &amp; eth1addr in U-Boot, boot Linux and it will use<br>&=
gt;the same MAC addresses. I tried it again yesterday and it does not<br>&g=
t;work any more.<br><br></span>I think ethaddr made a difference.=C2=A0 Not=
 sure eth1addr ever did, unless <br>you have two direct interfaces on your =
board?</font></blockquote><div><br></div><div>I&#39;m using eval board. It =
does have two network ports, but I&#39;m mostly interested in the one that =
is &quot;attached&quot; to ethaddr.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans=
-serif" size=3D"2"><span class=3D""><br><br>&gt;<br>&gt;I tried it with ope=
nbmc/u-boot, to make sure my changes do not<br>&gt;interfere. I verified, b=
y reading MAC08 MAC0C registers, that MAC<br>&gt;addresses are properly con=
figured by U-Boot from env. However, when I<br>&gt;booted Linux, it still g=
enerated random MAC address, rather then<br>&gt;reusing whatever was passed=
 up from U-Boot.<br>&gt;<br>&gt;Any ideas on what change might have affecte=
d this?<br><br><br></span>You have likely hit the same issue as <br><a href=
=3D"https://github.com/openbmc/u-boot/issues/13" target=3D"_blank">https://=
github.com/openbmc/u-<wbr>boot/issues/13</a><br><a href=3D"https://github.c=
om/openbmc/openbmc/issues/578" target=3D"_blank">https://github.com/openbmc=
/<wbr>openbmc/issues/578</a><br><br>Basically u-boot was over optimized and=
 does not write the mac unless it <br>tries to use the network.<br></font><=
/blockquote><div><br></div><div>I verified by reading MAC registers MAC08 &=
amp; MAC0C that for both macs the addresses are properly configured.</div><=
div>I tried running dhcp and I saw dhcp requests on the network from the co=
rrect MAC address.</div><div><br></div><div>Booting linux still results in =
it generating random MAC addresses.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans=
-serif" size=3D"2"><br>You could add a ping (static addressing) or dhcp req=
uest (dhcp address) in <br>your bootcmd as a workaround, or address the bug=
 more directly.<br><br>Note: even with NCSI this should not require 2 secon=
ds, only the 10ms<br>sleep to wait for the clock stabilization.=C2=A0 The 2=
 second delay likely comes <br>from the NCSI spec as the maximum time for p=
ackages to initialize.<span class=3D"HOEnZb"><font color=3D"#888888"><br><b=
r>milton<br><br></font></span></font><br>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a11c010d8f2c68b053dbf88eb--
