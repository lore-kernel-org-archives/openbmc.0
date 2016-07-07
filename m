Return-Path: <raltherr@google.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlmT35rkbzDr1l
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 04:32:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=IvHrxwe9; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id i186so27745044iof.1
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2016 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=IHUbENcV2gVMv1Kcp1lLljDDc37fkyBni773wq08cNo=;
 b=IvHrxwe9znlj2FjuV6uMifK8l1SG/pZ3vhFWeNxQQBbD2PTL62M7UMjk+CJG+JJWSg
 K055g9lUX0YuymGhZmYBNKgvr+OIQcamf0zL3sHlUUZgpajm5zTMsmIBphBSbFhJ7rde
 N8L+G0Tot9FzpKsJqCBPIq255+Z2EvqN0m3m8L0mInoSu+CsrvlqSgzgpDdKtyRyLcgL
 2p5C0LqccybQxpr8A0XZfEJvo5m5TTeI44O7p7pzI/1+uzPjFtNLeNOaIrbHi/iU2kn1
 ypvOuwQcbqmgr2uBh615PIDiuKWkE+tVcQmpZTVPpCBaUHpaLBlqdheU0l493blj+9LB
 lmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=IHUbENcV2gVMv1Kcp1lLljDDc37fkyBni773wq08cNo=;
 b=kffx5ARpVz54v0YtahXQgad1XaRCmEDIsgluLS3qRryWFSWEqSnNpepJCktg75bTDO
 s4l8m0UdWLlzQmwLz3PZfoSkDtRp+rVJKrmMupl8wgHYzDQp/N2CNsdbZ+ATcFFXiK06
 71au5O02QwmzX4bVdW0IRBfCEMEYv3WatIuJGzNg8j8OzcJakiOn1B3ohxlpRw9+kXvA
 Xjr2oCD9W3nhdtQe3O5L4Jqi3LloBsVv6Koez+yCs9HnVwSvO/k1NjJNtTNyyKExsNkr
 udeL3X7/uHrX2vgEZMU/FWvEutKlpcq8lAnxWLwi5wD7tLAIBkhrSn7Ge+45Zi54JY62
 7tgw==
X-Gm-Message-State: ALyK8tJRz6FyuXiMOIuoW7aHoiZkyW4Y7DGswfODraeZmtUVnBRKnrbKfGCNSi4uhWuQS1D90YHNu6uWJ/WOukdk
X-Received: by 10.107.186.132 with SMTP id k126mr4992893iof.119.1467916372171; 
 Thu, 07 Jul 2016 11:32:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Thu, 7 Jul 2016 11:32:51 -0700 (PDT)
In-Reply-To: <20160707182339.GE20922@asimov.austin.ibm.com>
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
 <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
 <20160707182339.GE20922@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 7 Jul 2016 11:32:51 -0700
Message-ID: <CAPLgG=kbaOU3YEo44i33GFiOg6ciyxiyNoxe+bc-ckXdfzMTzw@mail.gmail.com>
Subject: Re: Issues with setting the timeofday
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Vishwanatha Subbanna <vishwanath@in.ibm.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c06ccc6eca78e05370fe9a5
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2016 18:32:56 -0000

--94eb2c06ccc6eca78e05370fe9a5
Content-Type: text/plain; charset=UTF-8

I'm unfamiliar with Barreleye.  Does the host use the BMC as an RTC?  Are
the commands in the first post being run on the host or on the BMC?

On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:
> > If ntpd or systemd-timesyncd is running, this makes perfect sense.  Linux
> > maintains current time in the kernel.  The hardware RTC is only used to
> > load an initial time at boot and is written during shutdown.  When an NTP
> > daemon is running and an NTP server is reachable, it will adjust the
> > kernel's current time to match NTP time.  I believe with timesyncd, it
> > simply steps time instead of slewing like ntpd does.
> >
> > What are you trying to accomplish?  There is likely a way to do it if you
> > can describe what you want to have happen.
>
> It looks like maybe this is related to Github issue openbmc/openbmc#310.
>
>     https://github.com/openbmc/openbmc/issues/310
>
> > On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <
> vishwanath@in.ibm.com>
> > wrote:
> >
> > > hey Joel,
> > >
> > > Here is what I am seeing on one the Barreleye box that is running
> > > "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set but
> > > reverts immediately. Syncing what's in hwclock does not have any effect
> > > too. Any thoughts ?
> > >
> > > root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> > > Sun Dec 25 12:34:56 UTC 2016
> > >
> > > root@barreleye:~# date
> > > Thu Jul 7 13:07:37 UTC 2016
> > >
> > > root@barreleye:~# hwclock -r
> > > Sun Dec 25 12:35:01 2016 0.000000 seconds
> > >
> > > root@barreleye:~# hwclock -s
> > >
> > > root@barreleye:~# date
> > > Thu Jul 7 13:07:52 UTC 2016
> > > root@barreleye:~#
> > >
> > > Thanks
> > >
> > >
> > >
> -------------------------------------------------------------------------------------
> > > Thanks and Regards,
> > > Vishwanath.
> > > Advisory Software Engineer,
> > > Power Firmware Development,
> > > Systems &Technology Lab,
> > > MG2-6F-255 , Manyata Embassy Business Park,
> > > Bangalore , KA , 560045
> > > Ph: +91-80-46678255
> > > E-mail: vishwanath@in.ibm.com
> > >
> > >
> ----------------------------------------------------------------------------------
> > >
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
> > >
> > >
>
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
>
> --
> Patrick Williams
>

--94eb2c06ccc6eca78e05370fe9a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m unfamiliar with Barreleye.=C2=A0 Does the host use=
 the BMC as an RTC?=C2=A0 Are the commands in the first post being run on t=
he host or on the BMC?</div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams <span dir=3D"l=
tr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwc=
x.xyz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:<br>
&gt; If ntpd or systemd-timesyncd is running, this makes perfect sense.=C2=
=A0 Linux<br>
&gt; maintains current time in the kernel.=C2=A0 The hardware RTC is only u=
sed to<br>
&gt; load an initial time at boot and is written during shutdown.=C2=A0 Whe=
n an NTP<br>
&gt; daemon is running and an NTP server is reachable, it will adjust the<b=
r>
&gt; kernel&#39;s current time to match NTP time.=C2=A0 I believe with time=
syncd, it<br>
&gt; simply steps time instead of slewing like ntpd does.<br>
&gt;<br>
&gt; What are you trying to accomplish?=C2=A0 There is likely a way to do i=
t if you<br>
&gt; can describe what you want to have happen.<br>
<br>
</span>It looks like maybe this is related to Github issue openbmc/openbmc#=
310.<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/openbmc/issues/310" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/issues=
/310</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna &lt;<a href=3D"ma=
ilto:vishwanath@in.ibm.com">vishwanath@in.ibm.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; hey Joel,<br>
&gt; &gt;<br>
&gt; &gt; Here is what I am seeing on one the Barreleye box that is running=
<br>
&gt; &gt; &quot;4.4.12-openbmc-20160606-1 : kernel&quot;. I can see that ti=
me gets set but<br>
&gt; &gt; reverts immediately. Syncing what&#39;s in hwclock does not have =
any effect<br>
&gt; &gt; too. Any thoughts ?<br>
&gt; &gt;<br>
&gt; &gt; root@barreleye:~# date -s &#39;2016-12-25 12:34:56&#39; ; hwclock=
 -w<br>
&gt; &gt; Sun Dec 25 12:34:56 UTC 2016<br>
&gt; &gt;<br>
&gt; &gt; root@barreleye:~# date<br>
&gt; &gt; Thu Jul 7 13:07:37 UTC 2016<br>
&gt; &gt;<br>
&gt; &gt; root@barreleye:~# hwclock -r<br>
&gt; &gt; Sun Dec 25 12:35:01 2016 0.000000 seconds<br>
&gt; &gt;<br>
&gt; &gt; root@barreleye:~# hwclock -s<br>
&gt; &gt;<br>
&gt; &gt; root@barreleye:~# date<br>
&gt; &gt; Thu Jul 7 13:07:52 UTC 2016<br>
&gt; &gt; root@barreleye:~#<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
--------------------<br>
&gt; &gt; Thanks and Regards,<br>
&gt; &gt; Vishwanath.<br>
&gt; &gt; Advisory Software Engineer,<br>
&gt; &gt; Power Firmware Development,<br>
&gt; &gt; Systems &amp;Technology Lab,<br>
&gt; &gt; MG2-6F-255 , Manyata Embassy Business Park,<br>
&gt; &gt; Bangalore , KA , 560045<br>
&gt; &gt; Ph: <a href=3D"tel:%2B91-80-46678255" value=3D"+918046678255">+91=
-80-46678255</a><br>
&gt; &gt; E-mail: <a href=3D"mailto:vishwanath@in.ibm.com">vishwanath@in.ib=
m.com</a><br>
&gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
-----------------<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; openbmc mailing list<br>
&gt; &gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.=
org</a><br>
&gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--94eb2c06ccc6eca78e05370fe9a5--
