Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sWB2873ZJzDrq8
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 07:59:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MyOwRFGK; 
 dkim-atps=neutral
Received: by mail-ua0-x22f.google.com with SMTP id 31so79412499uao.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZowkH9ig0wK4cH3GwHTgKmdiRdfYqhNjzcXZC1mRxA=;
 b=MyOwRFGKumzdn/mKegNu/pYkp67aVH4iN4igNkUuAQPVjJeTMMfKAD7Lamw+f47tCb
 2ZpvvV8QaHO+nfQ7Q+qlmo8cDXqCbHMcd0ZwncSZlhDJburpb84hqagbi/yMm4qj1VRy
 01m1wJOKjT/1cgjhmktlS8svBarSo40ua8vVkGjAN03t04uqADB3QaGQcOqzW4AH2CJ+
 Sjos2bsNUwcxMqROedwgp23fC0yZqku2XI8+ws8ZctRGbBnyJlNlXvuaukvsQfYNljA6
 mY0ZA5Ni+srOF/4PW5mW0oaFQa/c1W26xH/4rPoSQasrR45avnkwUCQq01493heMqTdR
 aXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZowkH9ig0wK4cH3GwHTgKmdiRdfYqhNjzcXZC1mRxA=;
 b=kzfcGD3+d8E/6ZwEKOgCpwWFqVLdR77nv/siDBnKjJ39ZgJQksLHI39SoM+ydTfGaZ
 7Mh0k2JdX6/PUJqnqnpcE1+6AjwIfxGNQQEJi+4ysgFiWol2arHDq9rhl2CXw8gw/k2K
 oDyKT/LBzuVtoRYUHVZAm9QFF0RPatO7gXAcrXn6esjvLwZPxit4qtrgqyU0Pw+WZuhY
 Rtu+egQktf7v1or5BBQpWEMP11GvOTc0KTkzzhL2JDos08x/FJkKoA0uTmS9Gf8mvuVj
 4D8WDSmzVYHWspGOSnEqwXeQaX8e7Nnf/t6P/UY794Ebb2sP+E0tz2azOUBy6kK80kzC
 QUJA==
X-Gm-Message-State: AE9vXwNunKVo959ORVH3+Zv5CKZY5GFhFdu8AyjphTuxQh5t0FhwW7OqrNup3eQTOD8CTbtZKypPEb6oDTL7fXRq
X-Received: by 10.159.36.136 with SMTP id 8mr1019959uar.18.1473458379963; Fri,
 09 Sep 2016 14:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
 <CACPK8XfeS5obZguFmRPhw5OtvaSjmSnYvsxH45N743FZDE+y2w@mail.gmail.com>
 <e45ff4e7-9e3f-f9fc-cc45-bcd12a53172a@kaod.org>
In-Reply-To: <e45ff4e7-9e3f-f9fc-cc45-bcd12a53172a@kaod.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 09 Sep 2016 21:59:29 +0000
Message-ID: <CAFd5g45px_dS7QNwqcs0xz-s=aaDtwWMTpBG3OXSNVy+xZE6dA@mail.gmail.com>
Subject: Re: [RFC 0/2] misc: bt: added Block Transfer over I2C
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113eff2654a814053c1a43cd
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
X-List-Received-Date: Fri, 09 Sep 2016 21:59:45 -0000

--001a113eff2654a814053c1a43cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

@Joel, thanks! I appreciate that :-)

> yes. The main question is about the use of the ioctl to propagate
> the SMS ATN event to the host. I think this is probably the best

You are changing the behavior of the interface in some respect, so I think
ioctl makes sense.

> method but as this is a user API, we should be careful with what we
> merge. I don't know any other implementation of a IPMI BT driver
> for the BMC side.

Fair point, that is something I am not sure about either. I think
upstreaming my patch would be contingent on whether we wanted to upstream
yours. On the other hand, if people want your IPMI BT driver from the BMC
side, it would be worth seeing if upstream wanted mine: bt-i2c addresses an
Aspeed specific issue (cannot NACK arbitrary messages makes SSIF support
possibly impossible), but we will see. I am more interested in seeing how
you guys feel about using Block Transfer for more things in a possibly
somewhat modified manner.

It seems like OpenBMC assumes all IPMI messages are assumed to be framed as
BT messages; maybe we want to consider formalizing around them? Just a
thought.

> Also, the drivers should probably be under char/ipmi. I will change
> that.

Makes sense, I will fix this in my next update.

> Finaly, the device name should contain "ipmi" IMO. Let's find a
> name ! or a pattern at least.

Also makes sense; I definitely want to follow the same pattern as you since
this is intended to provide the same API to the user. To throw my 2 cents
in, I do not like the "host" part of "bt-host", just because it feels
confusing. I get it from the standpoint of the userland (it is a port to
the host), but from a driver standpoint it seems confusing. I like maybe
use the term "bmc" or "slave" instead. Maybe the prefix could be
"ipmi-bt-xxx-cpu" and "ipmi-bt-xxx-bmc"?

Cheers

On Fri, Sep 9, 2016 at 9:30 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 09/09/2016 07:22 AM, Joel Stanley wrote:
> > Hey Brendan,
> >
> > On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins
> > <brendanhiggins@google.com> wrote:
> >> Looking for feedback on my new bt-i2c (Block Transfer over I2C)
> interface.
> >
> > Thanks for sending this out. You're setting a great example for the res=
t
> of us!
> >
> > I don't have an specific feedback for you, other than to say I think
> > what you are doing is reasonable.
> >
> >> I based the slave side (BMC) driver on the bt-host driver; the file
> system
> >> interface is fully compatible and has been tested with btbridged and
> ipmid
> >> running on an ast2500 evb.
> >
> > This is timely. Cedric has recently sent out the bt-host patches[1].
> > One of the questions raised was the suitability of the userspace API
> > for other users. It would be useful for you to put forward your
> > thoughts on that discussion.
> >
> > [1] http://www.spinics.net/lists/arm-kernel/msg527834.html
>
> yes. The main question is about the use of the ioctl to propagate
> the SMS ATN event to the host. I think this is probably the best
> method but as this is a user API, we should be careful with what we
> merge. I don't know any other implementation of a IPMI BT driver
> for the BMC side.
>
> Also, the drivers should probably be under char/ipmi. I will change
> that.
>
> Finaly, the device name should contain "ipmi" IMO. Let's find a
> name ! or a pattern at least.
>
> Thanks,
>
> C.
>
>

--001a113eff2654a814053c1a43cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">@Joel, thanks! I appreciate that :-)<div><br></div><div>&g=
t;=C2=A0<span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue=
&quot;,helvetica,arial,sans-serif;line-height:1.5">yes. The main question i=
s about the use of the ioctl to propagate</span></div><span style=3D"color:=
rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-s=
erif">&gt; the SMS ATN event to the host. I think this is probably the best=
</span><div><br></div><div>You are changing the behavior of the interface i=
n some respect, so I think ioctl makes sense.</div><div><br class=3D"gmail_=
msg" style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif"><span style=3D"color:rgb(33,33,33);font-family:&q=
uot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; method but as thi=
s is a user API, we should be careful with what we</span><br class=3D"gmail=
_msg" style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,h=
elvetica,arial,sans-serif"><span style=3D"color:rgb(33,33,33);font-family:&=
quot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; merge. I don&#39=
;t know any other implementation of a IPMI BT driver</span><br class=3D"gma=
il_msg" style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;=
,helvetica,arial,sans-serif"><span style=3D"color:rgb(33,33,33);font-family=
:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; for the BMC si=
de.</span><div><span style=3D"color:rgb(33,33,33);font-family:&quot;helveti=
ca neue&quot;,helvetica,arial,sans-serif"><br></span></div><div><span style=
=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,ar=
ial,sans-serif">Fair point, that is something I am not sure about either. I=
 think upstreaming my patch would be contingent on whether we wanted to ups=
tream yours. On the other hand, if people want your IPMI BT driver from the=
 BMC side, it would be worth seeing if upstream wanted mine: bt-i2c address=
es an Aspeed specific issue (cannot NACK arbitrary messages makes SSIF supp=
ort possibly impossible), but we will see. I am more interested in seeing h=
ow you guys feel about using Block Transfer for more things in a possibly s=
omewhat modified manner.</span></div><div><span style=3D"color:rgb(33,33,33=
);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><br></=
span></div><div><span style=3D"color:rgb(33,33,33);font-family:&quot;helvet=
ica neue&quot;,helvetica,arial,sans-serif">It seems like OpenBMC assumes al=
l IPMI messages are assumed to be framed as BT messages; maybe we want to c=
onsider formalizing around them? Just a thought.</span></div></div><div><sp=
an style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helv=
etica,arial,sans-serif"><br></span></div><div><span style=3D"color:rgb(33,3=
3,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">&g=
t;=C2=A0</span><span style=3D"color:rgb(33,33,33);font-family:&quot;helveti=
ca neue&quot;,helvetica,arial,sans-serif;line-height:1.5">Also, the drivers=
 should probably be under char/ipmi. I will change</span></div><span style=
=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,ar=
ial,sans-serif">&gt; that.</span><div><br></div><div>Makes sense, I will fi=
x this in my next update.</div><div><br></div><div>&gt;=C2=A0<span style=3D=
"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,arial=
,sans-serif;line-height:1.5">Finaly, the device name should contain &quot;i=
pmi&quot; IMO. Let&#39;s find a</span></div><span style=3D"color:rgb(33,33,=
33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt;=
 name ! or a pattern at least.</span><div><span style=3D"color:rgb(33,33,33=
);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><br></=
span></div><div><span style=3D"color:rgb(33,33,33);font-family:&quot;helvet=
ica neue&quot;,helvetica,arial,sans-serif">Also makes sense; I definitely w=
ant to follow the same pattern as you since this is intended to provide the=
 same API to the user. To throw my 2 cents in, I do not like the &quot;host=
&quot; part of &quot;bt-host&quot;, just because it feels confusing. I get =
it from the standpoint of the userland (it is a port to the host), but from=
 a driver standpoint it seems confusing. I like maybe use the term &quot;bm=
c&quot; or &quot;slave&quot; instead. Maybe the prefix could be &quot;ipmi-=
bt-xxx-cpu&quot; and &quot;ipmi-bt-xxx-bmc&quot;?</span></div><div><span st=
yle=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica=
,arial,sans-serif"><br></span></div><div><span style=3D"color:rgb(33,33,33)=
;font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">Cheers<=
/span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, S=
ep 9, 2016 at 9:30 AM C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.=
org">clg@kaod.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 09/09/2016 07:22 AM, Joel Stanley wrote:<br class=3D"gmail_msg">
&gt; Hey Brendan,<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins<br class=3D"gmail_msg"=
>
&gt; &lt;<a href=3D"mailto:brendanhiggins@google.com" class=3D"gmail_msg" t=
arget=3D"_blank">brendanhiggins@google.com</a>&gt; wrote:<br class=3D"gmail=
_msg">
&gt;&gt; Looking for feedback on my new bt-i2c (Block Transfer over I2C) in=
terface.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Thanks for sending this out. You&#39;re setting a great example for th=
e rest of us!<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; I don&#39;t have an specific feedback for you, other than to say I thi=
nk<br class=3D"gmail_msg">
&gt; what you are doing is reasonable.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt;&gt; I based the slave side (BMC) driver on the bt-host driver; the fil=
e system<br class=3D"gmail_msg">
&gt;&gt; interface is fully compatible and has been tested with btbridged a=
nd ipmid<br class=3D"gmail_msg">
&gt;&gt; running on an ast2500 evb.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; This is timely. Cedric has recently sent out the bt-host patches[1].<b=
r class=3D"gmail_msg">
&gt; One of the questions raised was the suitability of the userspace API<b=
r class=3D"gmail_msg">
&gt; for other users. It would be useful for you to put forward your<br cla=
ss=3D"gmail_msg">
&gt; thoughts on that discussion.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; [1] <a href=3D"http://www.spinics.net/lists/arm-kernel/msg527834.html"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://www.spinic=
s.net/lists/arm-kernel/msg527834.html</a><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
yes. The main question is about the use of the ioctl to propagate<br class=
=3D"gmail_msg">
the SMS ATN event to the host. I think this is probably the best<br class=
=3D"gmail_msg">
method but as this is a user API, we should be careful with what we<br clas=
s=3D"gmail_msg">
merge. I don&#39;t know any other implementation of a IPMI BT driver<br cla=
ss=3D"gmail_msg">
for the BMC side.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Also, the drivers should probably be under char/ipmi. I will change<br clas=
s=3D"gmail_msg">
that.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Finaly, the device name should contain &quot;ipmi&quot; IMO. Let&#39;s find=
 a<br class=3D"gmail_msg">
name ! or a pattern at least.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Thanks,<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
C.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div>

--001a113eff2654a814053c1a43cd--
