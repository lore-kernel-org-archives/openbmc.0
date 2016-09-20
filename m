Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
 [209.85.213.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdrLZ2jVxzDsgZ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 04:07:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=aGU7D5Py; 
 dkim-atps=neutral
Received: by mail-vk0-f45.google.com with SMTP id u196so38895898vkd.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 11:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fkuuf5KmT5j0fBU+EUTTxVeP4/QL6heJTTDKi09SVCM=;
 b=aGU7D5PyMVRaVfcjn9eYPhMvR36EA3NLqD1z/+CAmzsNZcuA8UsenWkq0aQGSDfBnX
 17IUxy+wYwpY4Wz9GQiTkU/wKb+S93Ii7mOVGZ+zD56HRC+ZMhfW/98syATzQvRRFTnW
 09w+TnUQwLoIhb5Yo5Cyc7y8H1bnLBmhWEYCx8SLaIr4G5m7t6lcVkR0N4k8fETQy7Cz
 W1YwM7aNk36rSUHwP/HmqjFvdWv/dvPZhfaRAELwbiajTirOsiKhKi909LjEEc1sPkmG
 pBOsbe8+Yb9lLnSvMiAa4PW0t86cOYXOnYGMjqyUdCuFshs1llq+gMa+YwEGeCtuAvvX
 wnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fkuuf5KmT5j0fBU+EUTTxVeP4/QL6heJTTDKi09SVCM=;
 b=g74KLwLQ4EotD3AogVAurcl+M0kh6/BpaEwi9wihV/T23YSo6VXuTqfvf4wh+djhDq
 LKP5sDAv9EgMp4QeR9QqXnASkvlfA630fk7uRJcBJHvwnTMGZ2LDe5O/dPw0ewugyBOA
 AbuBXyAyIX8yI4Lavz6eCHQUGVHKIyubDryCpx9HRIj6q46e48FGoUO/I8M5ZiDfV6Nt
 vyQC8chII7PmBTtLfehhgYENdycMvp2bacWUEJYaGdNBw7t3obt5GYqv09OJ0ubQ+oIx
 PBeo3oKbxoyhhvyckhc8NRRJixIwQZTFKwvYY/LYNzg0rXy8solA7kH0Uqx2EEOGH17T
 wt3A==
X-Gm-Message-State: AE9vXwNri3NaXlP0qcFFK+fVnVRvV9PzmZQnajeZH/5CKnPGs27MO+/YYPK/tUDzt9BOGaH8VK3M6mcUH82F5J6d
X-Received: by 10.31.32.6 with SMTP id g6mr4430383vkg.81.1474394756494; Tue,
 20 Sep 2016 11:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
 <20160919213536.GA19274@rob-hp-laptop>
 <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
In-Reply-To: <CAFd5g46WR34A1FLNvuRck84EX1F3gbPDnDuBo2j-SVUEJPvXfg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Sep 2016 18:05:46 +0000
Message-ID: <CAFd5g46j02sb2w_DwaXAgnfcO=ONmJGZwqdRneNd0QHq-t53rA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, mark.rutland@arm.com,
 linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113dacb8b88a89053cf4470a
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
X-List-Received-Date: Tue, 20 Sep 2016 18:07:03 -0000

--001a113dacb8b88a89053cf4470a
Content-Type: text/plain; charset=UTF-8

First off, someone pointed out to me that the mapping that I used between
addresses and bus numbers is not actually valid for busses 8-14.

This could be fixed by checking the offset, but I am wondering if that is
the right way to do it. It seems like this is not completely trivial so
maybe this should be specified in the device tree? If that is the case,
should I do this as another reg entry or go back to the way I was doing it
before?

On Mon, Sep 19, 2016 at 4:26 PM Brendan Higgins <brendanhiggins@google.com>
wrote:

> Addressed in v3.
>
> Thanks!
>
> On Mon, Sep 19, 2016 at 2:35 PM, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:
> >> Added device tree binding documentation for Aspeed I2C controller and
> >> busses.
> >>
> >> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> >> ---
> >> Changes for v2:
> >>   - None
> >> ---
> >>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63
> ++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> new file mode 100644
> >> index 0000000..df68f2a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> @@ -0,0 +1,63 @@
> >> +Device tree configuration for the I2C controller and busses on the
> AST24XX
> >> +and AST25XX SoCs.
> >> +
> >> +Controller:
> >> +
> >> +     Required Properties:
> >> +     - #address-cells        : should be 1
> >> +     - #size-cells           : should be 1
> >> +     - #interrupt-cells      : should be 1
> >> +     - compatible            : should be
> "aspeed,ast2400-i2c-controller"
> >> +                               or "aspeed,ast2500-i2c-controller"
> >> +     - reg                   : address start and range of controller
> >> +     - ranges                : defines address offset and range for
> busses
> >> +     - interrupts            : interrupt number
> >> +     - clocks                : root clock of bus, should reference the
> APB
> >> +                               clock
> >> +     - clock-ranges          : specifies that child busses can inherit
> clocks
> >> +     - interrupt-controller  : denotes that the controller receives
> and fires
> >> +                               new interrupts for child busses
> >> +
> >> +Bus:
> >> +
> >> +     Required Properties:
> >> +     - #address-cells        : should be 1
> >> +     - #size-cells           : should be 0
> >> +     - reg                   : address offset and range of bus
> >> +     - compatible            : should be "aspeed,ast2400-i2c-bus"
> >> +                               or "aspeed,ast2500-i2c-bus"
> >> +     - bus                   : the bus's number
> >
> > Don't use indexes. The reg property is enough to id which bus is which.
>

--001a113dacb8b88a89053cf4470a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">First off, someone pointed out to me that the mapping that=
 I used between addresses and bus numbers is not actually valid for busses =
8-14.<div><br></div><div>This could be fixed by checking the offset, but I =
am wondering if that is the right way to do it. It seems like this is not c=
ompletely trivial so maybe this should be specified in the device tree? If =
that is the case, should I do this as another reg entry or go back to the w=
ay I was doing it before?</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Mon, Sep 19, 2016 at 4:26 PM Brendan Higgins &lt;<a href=3D"ma=
ilto:brendanhiggins@google.com">brendanhiggins@google.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Addressed in v3.<br class=3D"gmail_ms=
g">
<br class=3D"gmail_msg">
Thanks!<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
On Mon, Sep 19, 2016 at 2:35 PM, Rob Herring &lt;<a href=3D"mailto:robh@ker=
nel.org" class=3D"gmail_msg" target=3D"_blank">robh@kernel.org</a>&gt; wrot=
e:<br class=3D"gmail_msg">
&gt; On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:<br cl=
ass=3D"gmail_msg">
&gt;&gt; Added device tree binding documentation for Aspeed I2C controller =
and<br class=3D"gmail_msg">
&gt;&gt; busses.<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; Signed-off-by: Brendan Higgins &lt;<a href=3D"mailto:brendanhiggin=
s@google.com" class=3D"gmail_msg" target=3D"_blank">brendanhiggins@google.c=
om</a>&gt;<br class=3D"gmail_msg">
&gt;&gt; ---<br class=3D"gmail_msg">
&gt;&gt; Changes for v2:<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 =C2=A0- None<br class=3D"gmail_msg">
&gt;&gt; ---<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 .../devicetree/bindings/i2c/i2c-aspeed.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 63 ++++++++++++++++++++++<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 1 file changed, 63 insertions(+)<br class=3D"gmail_msg">
&gt;&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/i2c/i2c=
-aspeed.txt<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt =
b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt<br class=3D"gmail_ms=
g">
&gt;&gt; new file mode 100644<br class=3D"gmail_msg">
&gt;&gt; index 0000000..df68f2a<br class=3D"gmail_msg">
&gt;&gt; --- /dev/null<br class=3D"gmail_msg">
&gt;&gt; +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt<br clas=
s=3D"gmail_msg">
&gt;&gt; @@ -0,0 +1,63 @@<br class=3D"gmail_msg">
&gt;&gt; +Device tree configuration for the I2C controller and busses on th=
e AST24XX<br class=3D"gmail_msg">
&gt;&gt; +and AST25XX SoCs.<br class=3D"gmail_msg">
&gt;&gt; +<br class=3D"gmail_msg">
&gt;&gt; +Controller:<br class=3D"gmail_msg">
&gt;&gt; +<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0Required Properties:<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- #address-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=
 should be 1<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- #size-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: should be 1<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- #interrupt-cells=C2=A0 =C2=A0 =C2=A0 : shou=
ld be 1<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- compatible=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : should be &quot;aspeed,ast2400-i2c-controller&quot;<br class=
=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or &quot;aspeed,ast2500-i2c=
-controller&quot;<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: address start and range of controller<br c=
lass=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- ranges=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : defines address offset and range for busses<br class=
=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- interrupts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : interrupt number<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- clocks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : root clock of bus, should reference the APB<br class=
=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock<br class=3D"gmail_msg=
">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- clock-ranges=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 : specifies that child busses can inherit clocks<br class=3D"gmail_msg"=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- interrupt-controller=C2=A0 : denotes that t=
he controller receives and fires<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new interrupts for child bu=
sses<br class=3D"gmail_msg">
&gt;&gt; +<br class=3D"gmail_msg">
&gt;&gt; +Bus:<br class=3D"gmail_msg">
&gt;&gt; +<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0Required Properties:<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- #address-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=
 should be 1<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- #size-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: should be 0<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: address offset and range of bus<br class=
=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- compatible=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : should be &quot;aspeed,ast2400-i2c-bus&quot;<br class=3D"gmail=
_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or &quot;aspeed,ast2500-i2c=
-bus&quot;<br class=3D"gmail_msg">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0- bus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: the bus&#39;s number<br class=3D"gmail_msg=
">
&gt;<br class=3D"gmail_msg">
&gt; Don&#39;t use indexes. The reg property is enough to id which bus is w=
hich.<br class=3D"gmail_msg">
</blockquote></div>

--001a113dacb8b88a89053cf4470a--
