Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMJbh1181zDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 09:28:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EzirrqqI"; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id t26so47600278qtg.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1h2PeidC6qJ4421nV6o8XGnl86V7twqz3kqy0Eg6TsE=;
 b=EzirrqqIBn0rWOiBJdTT0R+05OwHg5aAWK3dNIcp91Dr5GBb2mJUS4i+gCUTb+oHFa
 swJ2PS8VttChIZbYFCkHX5bSg4A2WsL4gvuhvduOOIQcuPCYzEhtXcGGFQNybDiav9h5
 BKLZ3aFQof4Jy8cgci57y7Lke4yYR4C1KglMyEI00ksoV0i6TQpORGYecZcKNUrywqY5
 7osQB4Mukr3OYNHGzeapU5meGQX4LD4n1wCiwjTNCUvBHsusKkr6Iz02d0qa3/4+hbRy
 FXufN1Kvv50bwksYkBjS7Bg2wuXXimVwY/fKusLOFUHi7i56z4/gPY1pmrYtMqUDMI18
 oZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1h2PeidC6qJ4421nV6o8XGnl86V7twqz3kqy0Eg6TsE=;
 b=PV/BHkG38LVT8MZMPbezwdbxMhI0C5zMpHHaFC5jVFbLvMrqmbmBACnvLiWmehN2tk
 rG3UmweFxg3XN4j1o3pdTU18dCTXeIktcNViGpT0QQ91qJ0ZUYro86HbU6kzfV+uqGeL
 EAPONVrQN/XYS0ED+3p3Cw+Gj0Cl0Q/dE3TLSeDBQy6pqx+O8KKZHJxEbToS43oBTVm9
 P7WJltMn83y1b5fMn2Q0lIZAiyUW0lfMxvPL+2xJ+nzWrQ0+/wgh7ZGwWIKLyv++NXPb
 o+EiAuuqCUGcadJvLxeOcQzh8UkzUUWAv4M8y+5yRZ6AhK9k6WYjLS4WuZhPGU28R78+
 GQaA==
X-Gm-Message-State: AODbwcC+9D3YeJxyYwCyNlTo/qg3H3Fr7I7+hxPxk1QDDP6RR9j58aOS
 378b7JBdG76eSQm3AEt2jHXb4CNg4D3+
X-Received: by 10.200.50.67 with SMTP id y3mr19201317qta.27.1494286124519;
 Mon, 08 May 2017 16:28:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.229 with HTTP; Mon, 8 May 2017 16:28:44 -0700 (PDT)
In-Reply-To: <20170424181818.2754-5-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 May 2017 16:28:44 -0700
Message-ID: <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: multipart/alternative; boundary=001a1141047aa5568c054f0b9953
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
X-List-Received-Date: Mon, 08 May 2017 23:28:48 -0000

--001a1141047aa5568c054f0b9953
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BI would like to release another version this week or next week, an=
d I
think that we are pretty closed to having something we can apply, but
before I do that, I want to get something resolved:

+static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> +                            struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       /* Disable everything. */
> +       writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       ret =3D __aspeed_i2c_init_clk(bus, pdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable Master Mode */
> +       writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> +              ASPEED_I2CD_MASTER_EN |
> +              /* TODO: provide device tree option for multi-master mode.
> */


I am curious what everyone thinks about this. It seemed that, earlier on,
people did not like me disabling multi-master mode, but I think that it
would make bus recovery not work as well. Given that, I think it makes the
most sense to provide a device tree option either to enable multi-master
support or disable it. Thoughts?


>
> +              ASPEED_I2CD_MULTI_MASTER_DIS,
> +              bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       /* Set interrupt generation of I2C controller */
> +       writel(ASPEED_I2CD_INTR_ALL, bus->base + ASPEED_I2C_INTR_CTRL_REG=
);
> +
> +       return 0;
> +}

--001a1141047aa5568c054f0b9953
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>=E2=80=8BI would like to release another version this =
week or next week, and I think that we are pretty closed to having somethin=
g we can apply, but before I do that, I want to get something resolved:<br>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span styl=
e=3D"font-size:12.8px">+static int __aspeed_i2c_init(struct aspeed_i2c_bus =
*bus,</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"=
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev)</span><br style=3D"f=
ont-size:12.8px"><span style=3D"font-size:12.8px">+{</span><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0int ret;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">+</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8=
px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable everything. */</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0writel(0, bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG);</span><br styl=
e=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D __aspeed_i2c_init_clk(bus, pdev);</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (ret &lt; 0)</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r=
et;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=
</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Enable Master Mode */</span><br style=3D"font-si=
ze:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0wri=
tel(readl(bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG) |</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ASPEED_I2CD_MASTER_EN |</span><br style=3D"font-size:=
12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* TODO: provide device tree option for multi-master mode=
. */</span></blockquote><div><br></div><div>I am curious what everyone thin=
ks about this. It seemed that, earlier on, people did not like me disabling=
 multi-master mode, but I think that it would make bus recovery not work as=
 well. Given that, I think it makes the most sense to provide a device tree=
 option either to enable multi-master support or disable it. Thoughts?</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br sty=
le=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_I2CD_MULTI_MASTER_DIS,</span><br sty=
le=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG);</s=
pan><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+</span=
><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Set interrupt generation of=C2=A0</span><span class=
=3D"gmail-il" style=3D"font-size:12.8px">I2C</span><span style=3D"font-size=
:12.8px">=C2=A0controller */</span><br style=3D"font-size:12.8px"><span sty=
le=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ASPEED_I2CD_INTR=
_ALL, bus-&gt;base + ASPEED_I2C_INTR_CTRL_REG);</span><br style=3D"font-siz=
e:12.8px"><span style=3D"font-size:12.8px">+</span><br style=3D"font-size:1=
2.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0return =
0;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+}=
</span></blockquote></div>

--001a1141047aa5568c054f0b9953--
