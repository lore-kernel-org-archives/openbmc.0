Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3SZr51pmzDt4D
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 09:32:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Tuo29Y8W; 
 dkim-atps=neutral
Received: by mail-ua0-x233.google.com with SMTP id i31so4984220uai.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 15:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=jHUbp3zKjJFy+Q5rCpmosfrV8TT4tzr3wLEH1eh2twc=;
 b=Tuo29Y8W2srARamUQppN7CBORQcXd7odiAbJytKE1aiWmER/QAmtU/mY9vMECXEFP5
 U5sBU2eo/g3lRIqhda/+4Ru0S50dmmhqpMcjm6Kv9EqYxngmiA9TbTo2k38h6FPFHpmO
 FYN+bLgJFqiH4eOzJsmBCZUSRYPQcYYrb7gIdpJ8wIOot7rODHu7mf2C78mKVlIBjbUq
 t/d1rVrQQ+jBuE24+ktkR7Prey+/lP/3/t2Y3xy89WQhLe+CYhKe/kST2Wg6qnraMYQZ
 HcSVYu5ZOneF73I1U9jW9faCMYBZrVof4IbOnMK9DGpl4PBpdusaCgY8ARtvTUAgGOPn
 4Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jHUbp3zKjJFy+Q5rCpmosfrV8TT4tzr3wLEH1eh2twc=;
 b=REOCG08gjiieGv7ouwMqKivmJaenqzUZz+TtuE1/sA1b5UMUYzQBMdHw9lMiv+As3j
 La9YYPce0bohimFTZhRyfBTrOnS8tIXAM+HoZ6hv6eeHkYPZQSAk+MGV3CyEblNjM2BX
 1kCvjpMwGNG0tqaN8erNi67OAu0FUX80TpQV6QuGsC6vHDL4y9EGB62nTfEClM/MBw1T
 n3FGPcPmoPBuC8IXnde3YR9GBZoDyQ0DZoC26V3wk7sVi51gnhcgAs6kiw7JIdyM7j82
 mC+lQqLr8XGpF2JFk3q30Z0JqzH3TZEYJ89wKUdJEZaCO8hhjSzikb4ltlffoyXNfk2g
 sOuQ==
X-Gm-Message-State: ABUngveARWmlYp1RN4r5ElOXKTnpIbHERFRpSz+CgoOBLvDc+rrDTAzzzz9MwRolDsUUoRC1p92eNZGr+omOxFDP
X-Received: by 10.176.83.92 with SMTP id y28mr9200978uay.128.1477434753047;
 Tue, 25 Oct 2016 15:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <1476173448.2654.7.camel@kernel.crashing.org>
 <1476910490-21190-1-git-send-email-brendanhiggins@google.com>
 <1476922514.2654.182.camel@kernel.crashing.org>
 <CAFd5g47a99CP9750y4PLs3WsURRrBLHwfOCVKU_iM3yBomCk=Q@mail.gmail.com>
 <1476997560.2654.208.camel@kernel.crashing.org>
In-Reply-To: <1476997560.2654.208.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Oct 2016 22:32:22 +0000
Message-ID: <CAFd5g46D9BK6G0jgL_S6hgs4hBH6-v7qqrpKUYKrLJpg86y9UA@mail.gmail.com>
Subject: Fwd: libflash questions mostly relating to P9 bringup
To: Nancy Yuen <yuenn@google.com>, Abhishek Pandit <abhishekpandit@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1929fea2d2cf053fb8158b
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
X-List-Received-Date: Tue, 25 Oct 2016 22:32:37 -0000

--94eb2c1929fea2d2cf053fb8158b
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ---------
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, Oct 20, 2016 at 2:06 PM
Subject: Re: libflash questions mostly relating to P9 bringup
To: Brendan Higgins <brendanhiggins@google.com>, Cyril Bur <
cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>,
Abhishek Pandit <abhishekpandit@google.com>


On Thu, 2016-10-20 at 11:41 -0700, Brendan Higgins wrote:
> > The main one is probably speed. IPMI is fairly slow and we don't
> > really want
> >  to transport the actual flash data over it.
>
> I do not dispute that; I think we accept that as a consequence,
> again, as LPC does not exist on many platforms.

Ok.

> I only mentioned the most simple method that we wanted to
> implement, RawFlashRequest, which would provide direct flash access,
> but we were interested in supporting other methods as well, so if you
> would be willing to support other access methods, I see this as being
> totally compatible with what we want to do.

Yes, it would work fine to support multiple methods.

> That sounds reasonable to me. As long as we have a common way to do
> flash access on all systems we are happy; if we happen to support
> some other faster access methods (as long as they share a common
> API), I think that would be even better :-)

So the API ... The plan for us is to plumb this behind the existing
OPAL flash APIs which are themselves plumbed into Linux MTD layer.

It's fairly easy inside OPAL to implement different backends for a
given API.

> Yep, that is what we are trying to address with our OEM/Group
> extension; it provides an interface that sends arbitrary data over
> IPMI. Admittedly, it will make all other IPMI traffic slower;
> however, this is unavoidable on platforms that only have one hardware
> interface between the BMC and the host CPU.

Right.

> Also true, but still unavoidable if we only have a single hardware
> interface.
>
> Sounds to me like we do not have any incompatible goals; although it
> is true that on our side we are more concerned about a common
> implementation that will work on any platform and you guys seem to be
> more concerned about performance, I think that just means that we
> should provide both transport layers: IPMI and LPC mailbox. I imagine
> that a good deal of the actual flash access logic will be the same
> for the both of us.

Yup, I think both work. At some point we might want to look at the
implementation details a bit more closely, it would be good to merge
the Zaius support into the main OPAL repo sooner rather than later.

We are still working on the implementation of our mbox based flash
protocol, but once we are done it should be easy for you guys to pick
it up as well if you wish to for your Aspeed based machine(s).

Cheers,
Ben.

--94eb2c1929fea2d2cf053fb8158b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">------=
---- Forwarded message ---------<br>From: Benjamin Herrenschmidt &lt;<a hre=
f=3D"mailto:benh@kernel.crashing.org">benh@kernel.crashing.org</a>&gt;<br>D=
ate: Thu, Oct 20, 2016 at 2:06 PM<br>Subject: Re: libflash questions mostly=
 relating to P9 bringup<br>To: Brendan Higgins &lt;<a href=3D"mailto:brenda=
nhiggins@google.com">brendanhiggins@google.com</a>&gt;, Cyril Bur &lt;<a hr=
ef=3D"mailto:cyrilbur@gmail.com">cyrilbur@gmail.com</a>&gt;, Joel Stanley &=
lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt;, Xo Wang &lt;<a=
 href=3D"mailto:xow@google.com">xow@google.com</a>&gt;, Abhishek Pandit &lt=
;<a href=3D"mailto:abhishekpandit@google.com">abhishekpandit@google.com</a>=
&gt;<br></div><br><br>On Thu, 2016-10-20 at 11:41 -0700, Brendan Higgins wr=
ote:<br class=3D"gmail_msg">
&gt; &gt; The main one is probably speed. IPMI is fairly slow and we don&#3=
9;t<br class=3D"gmail_msg">
&gt; &gt; really want=C2=A0<br class=3D"gmail_msg">
&gt; &gt; =C2=A0to transport the actual flash data over it.<br class=3D"gma=
il_msg">
&gt;<br class=3D"gmail_msg">
&gt; I do not dispute that; I think we accept that as a consequence,<br cla=
ss=3D"gmail_msg">
&gt; again, as LPC does not exist on many platforms.<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
Ok.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; I only mentioned the most simple method that we wanted to<br class=3D"=
gmail_msg">
&gt; implement,=C2=A0RawFlashRequest, which would provide direct flash acce=
ss,<br class=3D"gmail_msg">
&gt; but we were interested in supporting other methods as well, so if you<=
br class=3D"gmail_msg">
&gt; would be willing to support other access methods, I see this as being<=
br class=3D"gmail_msg">
&gt; totally compatible with what we want to do.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Yes, it would work fine to support multiple methods.<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
&gt; That sounds reasonable to me. As long as we have a common way to do<br=
 class=3D"gmail_msg">
&gt; flash access on all systems we are happy; if we happen to support<br c=
lass=3D"gmail_msg">
&gt; some other faster access methods (as long as they share a common<br cl=
ass=3D"gmail_msg">
&gt; API), I think that would be even better :-)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
So the API ... The plan for us is to plumb this behind the existing<br clas=
s=3D"gmail_msg">
OPAL flash APIs which are themselves plumbed into Linux MTD layer.<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
It&#39;s fairly easy inside OPAL to implement different backends for a<br c=
lass=3D"gmail_msg">
given API.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; Yep, that is what we are trying to address with our OEM/Group<br class=
=3D"gmail_msg">
&gt; extension; it provides an interface that sends arbitrary data over<br =
class=3D"gmail_msg">
&gt; IPMI. Admittedly, it will make all other IPMI traffic slower;<br class=
=3D"gmail_msg">
&gt; however, this is unavoidable on platforms that only have one hardware<=
br class=3D"gmail_msg">
&gt; interface between the BMC and the host CPU.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Right.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; Also true, but still unavoidable if we only have a single hardware<br =
class=3D"gmail_msg">
&gt; interface.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Sounds to me like we do not have any incompatible goals; although it<b=
r class=3D"gmail_msg">
&gt; is true that on our side we are more concerned about a common<br class=
=3D"gmail_msg">
&gt; implementation that will work on any platform and you guys seem to be<=
br class=3D"gmail_msg">
&gt; more concerned about performance, I think that just means that we<br c=
lass=3D"gmail_msg">
&gt; should provide both transport layers: IPMI and LPC mailbox. I imagine<=
br class=3D"gmail_msg">
&gt; that a good deal of the actual flash access logic will be the same<br =
class=3D"gmail_msg">
&gt; for the both of us.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Yup, I think both work. At some point we might want to look at the<br class=
=3D"gmail_msg">
implementation details a bit more closely, it would be good to merge<br cla=
ss=3D"gmail_msg">
the Zaius support into the main OPAL repo sooner rather than later.<br clas=
s=3D"gmail_msg">
<br class=3D"gmail_msg">
We are still working on the implementation of our mbox based flash<br class=
=3D"gmail_msg">
protocol, but once we are done it should be easy for you guys to pick<br cl=
ass=3D"gmail_msg">
it up as well if you wish to for your Aspeed based machine(s).<br class=3D"=
gmail_msg">
<br class=3D"gmail_msg">
Cheers,<br class=3D"gmail_msg">
Ben.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</div></div>

--94eb2c1929fea2d2cf053fb8158b--
