Return-Path: <raltherr@google.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlp0w73kMzDr3T
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 05:42:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dSXPxiCn; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id f30so31079753ioj.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2016 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=o/+qClJMsToRalpJVnmZlHV0dnZWzKegLbhhyCKwPmI=;
 b=dSXPxiCnjQd0WkJZwLFGJlmkIE3tgnkKmYs4Vy6WE/oGwB8teZR345uJYUOAKhgvQx
 aNXb3aOm8T5dt0shXZ2i00rIgprYItnH2L7axfWw/4iotlbz2LB4lTOrpNySk2Lell7M
 bdAXrH6WkUQ7PgajqWDfAuJYWVZZCydiNEf2XMf6RNnKagymyGNDLhsT3zt+A8grFhBK
 wLYYsMYm/d8RtAfe8vWjE51qGb405tYpy9jwS6vBbw7T3GvDpqYwTUz9S3E4qeE5G3xW
 od/CnlmcyUKLyqx2gcxls5u1VhIy24mbq+JZ8CAjTV0a/DjyyyJdDwEJG6AAL5JmGBGq
 39mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=o/+qClJMsToRalpJVnmZlHV0dnZWzKegLbhhyCKwPmI=;
 b=BVidzvgjaLrZh9eomYlmYSoCmPesg9hbdPzM0/GW5ifLifuJkiQutV0/cqS64sNZiQ
 bIAxB6Y4ym89x4KgFj3yTMG+1nPFc7hhSxxPufTTwItzFOlbefV0hVv67IOVrr0mtGzk
 P9csd1bm7AJHBCVEsJwm4tMQrzHJkOgp0ZTWaG0SqbtMFdys3nn4lzEYiGhR4w0C3V/U
 u02Cih1w6XcM9Sb+8XRK0ezDTEjoqf86WFpOlvGpbypG16vH1ayeNLWwtGNo6vCUv8u2
 r6FI4sX2NZ8lZtJ6DwalyV2Fu/+1yc648y0KvG4L6IV9hEWKPlkk+ahU16qCpqB2K1Cp
 XXtA==
X-Gm-Message-State: ALyK8tLQTofEkYm7KPHmL5d0zwxc3tB2imhrjUnsD7i8fWt+ld4eWnC8yLQhYjONd0QlKW6S+zJRSUDK5y8N4Okg
X-Received: by 10.107.58.65 with SMTP id h62mr5226822ioa.172.1467920526266;
 Thu, 07 Jul 2016 12:42:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Thu, 7 Jul 2016 12:42:05 -0700 (PDT)
In-Reply-To: <20160707191336.GF20922@asimov.austin.ibm.com>
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
 <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
 <20160707182339.GE20922@asimov.austin.ibm.com>
 <CAPLgG=kbaOU3YEo44i33GFiOg6ciyxiyNoxe+bc-ckXdfzMTzw@mail.gmail.com>
 <20160707191336.GF20922@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 7 Jul 2016 12:42:05 -0700
Message-ID: <CAPLgG==JmJ8fQJH_S+STjvRQzppSXcf1yhdyZJo7M=+XtJwRPA@mail.gmail.com>
Subject: Re: Issues with setting the timeofday
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Vishwanatha Subbanna <vishwanath@in.ibm.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114ac616872e57053710e19e
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
X-List-Received-Date: Thu, 07 Jul 2016 19:42:09 -0000

--001a114ac616872e57053710e19e
Content-Type: text/plain; charset=UTF-8

In that case, I'd expect this behavior on the BMC assuming some form of NTP
client has been started.  The BMC's RTC (what hwclock is reading and
writing) runs independent of the BMC's kernel clock (what date is
reporting).  The kernel (AFAIK) doesn't poll the RTC normally to keep in
sync.  Once the time is set at boot time, the kernel will just keep
marching along based on the SoC's clock input.  This can eventually lead to
time skew between the kernel and RTC if they are using independent clocks
(very very likely).  Synchronization is left to userspace tools.

root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> Sun Dec 25 12:34:56 UTC 2016


The first command sets the BMC kernel time to a known timestamp.  The
second writes that to the BMC's RTC.


>
> root@barreleye:~# date
> Thu Jul 7 13:07:37 UTC 2016


Now you've read back the BMC kernel's time and it has been rewritten to
current, real-world time.  This only happens if some userspace process set
the kernel's time independently.  The BMC RTC is not involved here.


>
> root@barreleye:~# hwclock -r
> Sun Dec 25 12:35:01 2016 0.000000 seconds


This reads back to the BMC RTC's time.  It has advanced 5 seconds since it
was written which seems plausible.  Note this also strongly implies that
the initial commands that set the kernel time and wrote it to the RTC were
successful.  It's also possible that the RTC just happened to be close to
the desired time already but that seems very unlikely.


>
> root@barreleye:~# hwclock -s


This will read the BMC RTC's time and set the BMC kernel's time to that
same time point.  An immediate 'date' command _should_ return that time.


>
> root@barreleye:~# date
> Thu Jul 7 13:07:52 UTC 2016
>

This is 15s after the last 'date' command.  Given that this is the 3rd
command to run since, there seems to be about 5s between commands on the
CLI.  That's plenty of time for ntpd or timesyncd to overwrite the kernel
time with current NTP time.



> root@barreleye:~#


On Thu, Jul 7, 2016 at 12:13 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Jul 07, 2016 at 11:32:51AM -0700, Rick Altherr wrote:
> > I'm unfamiliar with Barreleye.  Does the host use the BMC as an RTC?  Are
> > the commands in the first post being run on the host or on the BMC?
>
> Rick, good questions.
>
> On all the current Power systems, the Host does not have its own RTC.  The
> skiboot code will create an RTC for the kernel by using IPMI commands down
> to the BMC.  They use the standard get-sel-time / set-sel-time IPMI
> command for this.  Other-BMC systems already operated this way, and since
> the Host firmware support was already there for other-BMC systems, we
> implemented this same behavior on openBMC.  There are also other IPMI
> commands that we implemented to emulate other-BMC behavior so as to not
> require Host firmware changes for openBMC.
>
> The commands Vishwa has below here are ran from the BMC.  The commands
> in the Github issue are also ran from the BMC, but you will see a call
> to '/tmp/ipmitool' there.  That is a development version of the ipmitool
> that will call into the dbus stack as if the Host sent an IPMI message
> through the BT interface.  Thus, 'ipmitool -l dbus sel time set ...' and
> 'ipmitool -l dbus sel time get' are emulating the behavior of the host,
> while 'date' is interacting with the BMC's kernel time subsystem.
>
> > On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> > > On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:
> > > > If ntpd or systemd-timesyncd is running, this makes perfect sense.
> Linux
> > > > maintains current time in the kernel.  The hardware RTC is only used
> to
> > > > load an initial time at boot and is written during shutdown.  When
> an NTP
> > > > daemon is running and an NTP server is reachable, it will adjust the
> > > > kernel's current time to match NTP time.  I believe with timesyncd,
> it
> > > > simply steps time instead of slewing like ntpd does.
> > > >
> > > > What are you trying to accomplish?  There is likely a way to do it
> if you
> > > > can describe what you want to have happen.
> > >
> > > It looks like maybe this is related to Github issue
> openbmc/openbmc#310.
> > >
> > >     https://github.com/openbmc/openbmc/issues/310
> > >
> > > > On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <
> > > vishwanath@in.ibm.com>
> > > > wrote:
> > > >
> > > > > hey Joel,
> > > > >
> > > > > Here is what I am seeing on one the Barreleye box that is running
> > > > > "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets set
> but
> > > > > reverts immediately. Syncing what's in hwclock does not have any
> effect
> > > > > too. Any thoughts ?
> > > > >
> > > > > root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> > > > > Sun Dec 25 12:34:56 UTC 2016
> > > > >
> > > > > root@barreleye:~# date
> > > > > Thu Jul 7 13:07:37 UTC 2016
> > > > >
> > > > > root@barreleye:~# hwclock -r
> > > > > Sun Dec 25 12:35:01 2016 0.000000 seconds
> > > > >
> > > > > root@barreleye:~# hwclock -s
> > > > >
> > > > > root@barreleye:~# date
> > > > > Thu Jul 7 13:07:52 UTC 2016
> > > > > root@barreleye:~#
> > > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > >
> > >
> -------------------------------------------------------------------------------------
> > > > > Thanks and Regards,
> > > > > Vishwanath.
> > > > > Advisory Software Engineer,
> > > > > Power Firmware Development,
> > > > > Systems &Technology Lab,
> > > > > MG2-6F-255 , Manyata Embassy Business Park,
> > > > > Bangalore , KA , 560045
> > > > > Ph: +91-80-46678255
> > > > > E-mail: vishwanath@in.ibm.com
> > > > >
> > > > >
> > >
> ----------------------------------------------------------------------------------
> > > > >
> > > > > _______________________________________________
> > > > > openbmc mailing list
> > > > > openbmc@lists.ozlabs.org
> > > > > https://lists.ozlabs.org/listinfo/openbmc
> > > > >
> > > > >
> > >
> > > > _______________________________________________
> > > > openbmc mailing list
> > > > openbmc@lists.ozlabs.org
> > > > https://lists.ozlabs.org/listinfo/openbmc
> > >
> > >
> > > --
> > > Patrick Williams
> > >
>
> --
> Patrick Williams
>

--001a114ac616872e57053710e19e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In that case, I&#39;d expect this behavior on the BMC assu=
ming some form of NTP client has been started.=C2=A0 The BMC&#39;s RTC (wha=
t hwclock is reading and writing) runs independent of the BMC&#39;s kernel =
clock (what date is reporting).=C2=A0 The kernel (AFAIK) doesn&#39;t poll t=
he RTC normally to keep in sync.=C2=A0 Once the time is set at boot time, t=
he kernel will just keep marching along based on the SoC&#39;s clock input.=
=C2=A0 This can eventually lead to time skew between the kernel and RTC if =
they are using independent clocks (very very likely).=C2=A0 Synchronization=
 is left to userspace tools.<div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span style=3D"=
font-size:12.8px">root@barreleye:~# date -s &#39;</span><span class=3D"gmai=
l-aBn" tabindex=3D"0" style=3D"font-size:12.8px"><span class=3D"gmail-aQJ">=
2016-12-25 12:34:56</span></span><span style=3D"font-size:12.8px">&#39; ; h=
wclock -w<br></span><span style=3D"font-size:12.8px">Sun Dec 25 12:34:56 UT=
C 2016</span></blockquote><div><br></div><div>The first command sets the BM=
C kernel time to a known timestamp.=C2=A0 The second writes that to the BMC=
&#39;s RTC.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><span style=3D"font-si=
ze:12.8px"><br></span><span style=3D"font-size:12.8px">root@barreleye:~# da=
te<br></span><span style=3D"font-size:12.8px">Thu Jul 7 13:07:37 UTC 2016</=
span></blockquote><div><br></div><div>Now you&#39;ve read back the BMC kern=
el&#39;s time and it has been rewritten to current, real-world time.=C2=A0 =
This only happens if some userspace process set the kernel&#39;s time indep=
endently.=C2=A0 The BMC RTC is not involved here.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padd=
ing-left:1ex"><span style=3D"font-size:12.8px"><br></span><span style=3D"fo=
nt-size:12.8px">root@barreleye:~# hwclock -r<br></span><span class=3D"gmail=
-aBn" tabindex=3D"0" style=3D"font-size:12.8px"><span class=3D"gmail-aQJ">S=
un Dec 25 12:35:01 2016</span></span><span style=3D"font-size:12.8px">=C2=
=A00.000000 seconds</span></blockquote><div><br></div><div>This reads back =
to the BMC RTC&#39;s time.=C2=A0 It has advanced 5 seconds since it was wri=
tten which seems plausible.=C2=A0 Note this also strongly implies that the =
initial commands that set the kernel time and wrote it to the RTC were succ=
essful.=C2=A0 It&#39;s also possible that the RTC just happened to be close=
 to the desired time already but that seems very unlikely.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><span style=3D"font-size:12.8px"><br></span><span st=
yle=3D"font-size:12.8px">root@barreleye:~# hwclock -s</span></blockquote><d=
iv><br></div><div>This will read the BMC RTC&#39;s time and set the BMC ker=
nel&#39;s time to that same time point.=C2=A0 An immediate &#39;date&#39; c=
ommand _should_ return that time.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
<span style=3D"font-size:12.8px"><br></span><span style=3D"font-size:12.8px=
">root@barreleye:~# date<br></span><span style=3D"font-size:12.8px">Thu Jul=
 7 13:07:52 UTC 2016<br></span></blockquote><div><br></div><div>This is 15s=
 after the last &#39;date&#39; command.=C2=A0 Given that this is the 3rd co=
mmand to run since, there seems to be about 5s between commands on the CLI.=
=C2=A0 That&#39;s plenty of time for ntpd or timesyncd to overwrite the ker=
nel time with current NTP time.</div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding=
-left:1ex"><span style=3D"font-size:12.8px"></span><span style=3D"font-size=
:12.8px">root@barreleye:~#=C2=A0</span></blockquote></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Jul 7, 2016 at 12:13 PM, P=
atrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" =
target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D"">On Thu, Jul 07, 2016 at 11:32:51AM -0700,=
 Rick Altherr wrote:<br>
&gt; I&#39;m unfamiliar with Barreleye.=C2=A0 Does the host use the BMC as =
an RTC?=C2=A0 Are<br>
&gt; the commands in the first post being run on the host or on the BMC?<br=
>
<br>
</span>Rick, good questions.<br>
<br>
On all the current Power systems, the Host does not have its own RTC.=C2=A0=
 The<br>
skiboot code will create an RTC for the kernel by using IPMI commands down<=
br>
to the BMC.=C2=A0 They use the standard get-sel-time / set-sel-time IPMI<br=
>
command for this.=C2=A0 Other-BMC systems already operated this way, and si=
nce<br>
the Host firmware support was already there for other-BMC systems, we<br>
implemented this same behavior on openBMC.=C2=A0 There are also other IPMI<=
br>
commands that we implemented to emulate other-BMC behavior so as to not<br>
require Host firmware changes for openBMC.<br>
<br>
The commands Vishwa has below here are ran from the BMC.=C2=A0 The commands=
<br>
in the Github issue are also ran from the BMC, but you will see a call<br>
to &#39;/tmp/ipmitool&#39; there.=C2=A0 That is a development version of th=
e ipmitool<br>
that will call into the dbus stack as if the Host sent an IPMI message<br>
through the BT interface.=C2=A0 Thus, &#39;ipmitool -l dbus sel time set ..=
.&#39; and<br>
&#39;ipmitool -l dbus sel time get&#39; are emulating the behavior of the h=
ost,<br>
while &#39;date&#39; is interacting with the BMC&#39;s kernel time subsyste=
m.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:<br>
&gt; &gt; &gt; If ntpd or systemd-timesyncd is running, this makes perfect =
sense.=C2=A0 Linux<br>
&gt; &gt; &gt; maintains current time in the kernel.=C2=A0 The hardware RTC=
 is only used to<br>
&gt; &gt; &gt; load an initial time at boot and is written during shutdown.=
=C2=A0 When an NTP<br>
&gt; &gt; &gt; daemon is running and an NTP server is reachable, it will ad=
just the<br>
&gt; &gt; &gt; kernel&#39;s current time to match NTP time.=C2=A0 I believe=
 with timesyncd, it<br>
&gt; &gt; &gt; simply steps time instead of slewing like ntpd does.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What are you trying to accomplish?=C2=A0 There is likely a w=
ay to do it if you<br>
&gt; &gt; &gt; can describe what you want to have happen.<br>
&gt; &gt;<br>
&gt; &gt; It looks like maybe this is related to Github issue openbmc/openb=
mc#310.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/openbmc/=
issues/310" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc=
/openbmc/issues/310</a><br>
&gt; &gt;<br>
&gt; &gt; &gt; On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna &lt;<br=
>
&gt; &gt; <a href=3D"mailto:vishwanath@in.ibm.com">vishwanath@in.ibm.com</a=
>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; hey Joel,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Here is what I am seeing on one the Barreleye box that =
is running<br>
&gt; &gt; &gt; &gt; &quot;4.4.12-openbmc-20160606-1 : kernel&quot;. I can s=
ee that time gets set but<br>
&gt; &gt; &gt; &gt; reverts immediately. Syncing what&#39;s in hwclock does=
 not have any effect<br>
&gt; &gt; &gt; &gt; too. Any thoughts ?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@barreleye:~# date -s &#39;2016-12-25 12:34:56&#39;=
 ; hwclock -w<br>
&gt; &gt; &gt; &gt; Sun Dec 25 12:34:56 UTC 2016<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@barreleye:~# date<br>
&gt; &gt; &gt; &gt; Thu Jul 7 13:07:37 UTC 2016<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@barreleye:~# hwclock -r<br>
&gt; &gt; &gt; &gt; Sun Dec 25 12:35:01 2016 0.000000 seconds<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@barreleye:~# hwclock -s<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; root@barreleye:~# date<br>
&gt; &gt; &gt; &gt; Thu Jul 7 13:07:52 UTC 2016<br>
&gt; &gt; &gt; &gt; root@barreleye:~#<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
--------------------<br>
&gt; &gt; &gt; &gt; Thanks and Regards,<br>
&gt; &gt; &gt; &gt; Vishwanath.<br>
&gt; &gt; &gt; &gt; Advisory Software Engineer,<br>
&gt; &gt; &gt; &gt; Power Firmware Development,<br>
&gt; &gt; &gt; &gt; Systems &amp;Technology Lab,<br>
&gt; &gt; &gt; &gt; MG2-6F-255 , Manyata Embassy Business Park,<br>
&gt; &gt; &gt; &gt; Bangalore , KA , 560045<br>
&gt; &gt; &gt; &gt; Ph: <a href=3D"tel:%2B91-80-46678255" value=3D"+9180466=
78255">+91-80-46678255</a><br>
&gt; &gt; &gt; &gt; E-mail: <a href=3D"mailto:vishwanath@in.ibm.com">vishwa=
nath@in.ibm.com</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
-----------------<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; openbmc mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lis=
ts.ozlabs.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" r=
el=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/listinfo/openb=
mc</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; openbmc mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.oz=
labs.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D=
"noreferrer" target=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a=
><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Patrick Williams<br>
&gt; &gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--001a114ac616872e57053710e19e--
