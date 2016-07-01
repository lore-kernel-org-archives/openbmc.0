Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgwRF1NKRzDql5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 22:18:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NSEl8JmM; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id j2so23043036qkf.1
 for <openbmc@lists.ozlabs.org>; Fri, 01 Jul 2016 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:date:message-id:subject
 :from:to:cc; bh=G2lACGzMV6vCFdY3VFAVq1CF+wuBVNDqsGI5z1Ze4oI=;
 b=NSEl8JmMD0vuzMrkHCth2FxnTfasq+0E2oURQicDvE9V3tJvyhrvdaVy0jQi6NYwmh
 z0U2j1EZ0b3dayKYBNrvWnKzsjKbPN5rrXPEML5jdMHBhTePKYWetxkGP73WfgFBL6SD
 QJ4AMwJF34qgjynZTLb9whP4ARrMmPWgYC5m24ydI6oaUzVsgWIUb+mBRv4Lc7YbVWoB
 zvdoJBJxcc1+fsQ61BM8Y/6hdJ4hj0RO7iDX6IzpEkicuSYF0hBLb60fm3rsP4L0u+6X
 BjbwnbCXThz4pxQ17PyXlkZGoaoLtrczOlWPyyuHWwQeh4V6TEnOhcOJ09nMRztVVQ/p
 WQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
 :message-id:subject:from:to:cc;
 bh=G2lACGzMV6vCFdY3VFAVq1CF+wuBVNDqsGI5z1Ze4oI=;
 b=iy9w+i5ZJR6KmqCi5x0KjPshz3tuEzZPn3w+s7E/ws/G82BTKTrSMgLxsuj4XScat5
 FLCtrSqz5tmgcGFnaoXc9xhho+ZomT41bwFXEmQQ64LvBisWUGNRHAVrqPEQSmhuJB/W
 mLj8t10m/2nJPJ4QOvD8QvxsdqAkBHNGqsMxvxL8pSU3fH2GzAd3OLdB7oSxbapZi/ir
 vSgFSH2HE33eWiZl+kVDljKw4vv+8097vFj0Mrkg6v9egOev2N5q5UTFmoQq3tOCJyA2
 L4ZlxRr/yzofzE+8XI4p0f3clT13xLzq2zONgUqeghQloTXRLRPzw0P0whDPCtL3MdX3
 jDGA==
X-Gm-Message-State: ALyK8tK1TaGVxfTgVnSW1n808Zpd9WdFQgb+9Y34XXbp91GUeQVJAguHhyRpftox5T2OpMR3Q/FUjrEHeYS/MQ==
MIME-Version: 1.0
X-Received: by 10.55.15.27 with SMTP id z27mr25537539qkg.58.1467375478891;
 Fri, 01 Jul 2016 05:17:58 -0700 (PDT)
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 1 Jul 2016 05:17:58 -0700 (PDT)
Received: by 10.237.37.148 with HTTP; Fri, 1 Jul 2016 05:17:58 -0700 (PDT)
In-Reply-To: <CACPK8XdAiDW=PADte4ZWNumKYXCkK-8kcw0atOUQATORsRQEGA@mail.gmail.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
 <1467372307.7422.40.camel@kernel.crashing.org>
 <CACPK8XdAiDW=PADte4ZWNumKYXCkK-8kcw0atOUQATORsRQEGA@mail.gmail.com>
Date: Fri, 1 Jul 2016 21:47:58 +0930
X-Google-Sender-Auth: jo1k5wlHgTicNfoxvPo30I-Jzwc
Message-ID: <CACPK8Xc1adhXOtmtNHYzbivqzxVABxfG2L6CPsNEMWkbV0KCwA@mail.gmail.com>
Subject: Re: [PATCH 07/10] net/farady: Read MAC address from chip
From: Joel Stanley <joel@jms.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11475b5c2beb36053691fa82
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
X-List-Received-Date: Fri, 01 Jul 2016 12:18:02 -0000

--001a11475b5c2beb36053691fa82
Content-Type: text/plain; charset=UTF-8

On 1 Jul 2016 20:55, "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
wrote:
>
> On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:
> > On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan  wrote:
> > > The device is assigned with random MAC address. It isn't reasonable.
> > > An valid MAC address might have been in the chip. It's reasonable
> > > to use it to maintain consistency.
> > >
> > > This uses the MAC address in the chip if it's valid. Otherwise, a
> > > random MAC address is given as before.
>
> If that is a worry we could use a device-tree property. Does our
> uboot update the DT ? If yes it can set the local-mac-address prop.

It doesn't currently, but we will be adding that soon we need to update the
memory node for systems where board revisions change the DRAM size.

Cheers,

Joel

>
> > > Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > > ---
> > >  drivers/net/ethernet/faraday/ftgmac100.c | 60
++++++++++++++++++++++++++++----
> > >  1 file changed, 53 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
b/drivers/net/ethernet/faraday/ftgmac100.c
> > > index 2c22f74..120993e 100644
> > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > @@ -141,6 +141,55 @@ static void ftgmac100_set_mac(struct ftgmac100
*priv, const unsigned char *mac)
> > >         iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
> > >  }
> > >
> > > +static void ftgmac100_setup_mac(struct ftgmac100 *priv)
> > > +{
> > > +       unsigned char mac[6];
> > > +       unsigned int m;
> > > +       unsigned int l;
> > > +
> > > +       m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
> > > +       l = ioread32(priv->base + FTGMAC100_OFFSET_MAC_LADR);
> > > +
> > > +       mac[0] = (m >> 8) & 0xff;
> > > +       mac[1] = m & 0xff;
> > > +       mac[2] = (l >> 24) & 0xff;
> > > +       mac[3] = (l >> 16) & 0xff;
> > > +       mac[4] = (l >> 8) & 0xff;
> > > +       mac[5] = l & 0xff;
> > > +
> > > +       if (!is_valid_ether_addr(mac)) {
> > > +               mac[5] = (m >> 8) & 0xff;
> > > +               mac[4] = m & 0xff;
> > > +               mac[3] = (l >> 24) & 0xff;
> > > +               mac[2] = (l >> 16) & 0xff;
> > > +               mac[1] = (l >>  8) & 0xff;
> > > +               mac[0] = l & 0xff;
> > > +       }
> > > +
> > > +       if (!is_valid_ether_addr(mac)) {
> > > +               eth_hw_addr_random(priv->netdev);
> > > +               dev_info(priv->dev, "Generated random MAC address
%pM\n",
> > > +                        priv->netdev->dev_addr);
> > > +       } else {
> > > +               memcpy(priv->netdev->dev_addr, mac, 6);
> > > +               dev_info(priv->dev, "Read MAC address from chip
%pM\n", mac);
> > > +       }
> > > +}
> > > +
> > > +static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
> > > +{
> > > +       int ret;
> > > +
> > > +       ret = eth_prepare_mac_addr_change(dev, p);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       eth_commit_mac_addr_change(dev, p);
> > > +       ftgmac100_set_mac(netdev_priv(dev), dev->dev_addr);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static void ftgmac100_init_hw(struct ftgmac100 *priv)
> > >  {
> > >         /* setup ring buffer base registers */
> > > @@ -1141,7 +1190,7 @@ static const struct net_device_ops
ftgmac100_netdev_ops = {
> > >         .ndo_open               = ftgmac100_open,
> > >         .ndo_stop               = ftgmac100_stop,
> > >         .ndo_start_xmit         = ftgmac100_hard_start_xmit,
> > > -       .ndo_set_mac_address    = eth_mac_addr,
> > > +       .ndo_set_mac_address    = ftgmac100_set_mac_addr,
> > >         .ndo_validate_addr      = eth_validate_addr,
> > >         .ndo_do_ioctl           = ftgmac100_do_ioctl,
> > >  };
> > > @@ -1263,6 +1312,9 @@ static int ftgmac100_probe(struct
platform_device *pdev)
> > >
> > >         priv->irq = irq;
> > >
> > > +       /* MAC address from chip or random one */
> > > +       ftgmac100_setup_mac(priv);
> > > +
> > >         err = ftgmac100_setup_mdio(netdev);
> > >         if (err)
> > >                 goto err_setup_mdio;
> > > @@ -1276,12 +1328,6 @@ static int ftgmac100_probe(struct
platform_device *pdev)
> > >
> > >         netdev_info(netdev, "irq %d, mapped at %p\n", priv->irq,
priv->base);
> > >
> > > -       if (!is_valid_ether_addr(netdev->dev_addr)) {
> > > -               eth_hw_addr_random(netdev);
> > > -               netdev_info(netdev, "generated random MAC address
%pM\n",
> > > -                           netdev->dev_addr);
> > > -       }
> > > -
> > >         return 0;
> > >
> > >  err_register_netdev:
> > > --
> > > 2.1.0
> > >

--001a11475b5c2beb36053691fa82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 1 Jul 2016 20:55, &quot;Benjamin Herrenschmidt&quot; &lt;<a href=3D"mail=
to:benh@kernel.crashing.org">benh@kernel.crashing.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:<br>
&gt; &gt; On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan=C2=A0 wrote:<br>
&gt; &gt; &gt; The device is assigned with random MAC address. It isn&#39;t=
 reasonable.<br>
&gt; &gt; &gt; An valid MAC address might have been in the chip. It&#39;s r=
easonable<br>
&gt; &gt; &gt; to use it to maintain consistency.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This uses the MAC address in the chip if it&#39;s valid. Oth=
erwise, a<br>
&gt; &gt; &gt; random MAC address is given as before.<br>
&gt;<br>
&gt; If that is a worry we could use a device-tree property. Does our<br>
&gt; uboot update the DT ? If yes it can set the local-mac-address prop.</p=
>
<p dir=3D"ltr">It doesn&#39;t currently, but we will be adding that soon we=
 need to update the memory node for systems where board revisions change th=
e DRAM size.</p>
<p dir=3D"ltr">Cheers,</p>
<p dir=3D"ltr">Joel<br></p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt; &gt; Signed-off-by: Gavin Shan &lt;<a href=3D"mailto:gwshan@linux=
.vnet.ibm.com">gwshan@linux.vnet.ibm.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0drivers/net/ethernet/faraday/ftgmac100.c | 60 ++++++++=
++++++++++++++++++++----<br>
&gt; &gt; &gt; =C2=A01 file changed, 53 insertions(+), 7 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/driv=
ers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; index 2c22f74..120993e 100644<br>
&gt; &gt; &gt; --- a/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; +++ b/drivers/net/ethernet/faraday/ftgmac100.c<br>
&gt; &gt; &gt; @@ -141,6 +141,55 @@ static void ftgmac100_set_mac(struct ft=
gmac100 *priv, const unsigned char *mac)<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(la=
ddr, priv-&gt;base + FTGMAC100_OFFSET_MAC_LADR);<br>
&gt; &gt; &gt; =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +static void ftgmac100_setup_mac(struct ftgmac100 *priv)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned char mac=
[6];<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int m;<b=
r>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int l;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m =3D ioread32(pr=
iv-&gt;base + FTGMAC100_OFFSET_MAC_MADR);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l =3D ioread32(pr=
iv-&gt;base + FTGMAC100_OFFSET_MAC_LADR);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[0] =3D (m &gt=
;&gt; 8) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[1] =3D m &amp=
; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[2] =3D (l &gt=
;&gt; 24) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[3] =3D (l &gt=
;&gt; 16) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[4] =3D (l &gt=
;&gt; 8) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[5] =3D l &amp=
; 0xff;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!is_valid_eth=
er_addr(mac)) {<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[5] =3D (m &gt;&gt; 8) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[4] =3D m &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[3] =3D (l &gt;&gt; 24) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[2] =3D (l &gt;&gt; 16) &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[1] =3D (l &gt;&gt;=C2=A0=C2=A08) &amp;=
 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mac[0] =3D l &amp; 0xff;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!is_valid_eth=
er_addr(mac)) {<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eth_hw_addr_random(priv-&gt;netdev);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_info(priv-&gt;dev, &quot;Generated ran=
dom MAC address %pM\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0priv-&gt;netdev-&gt;dev_addr);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(priv-&gt;netdev-&gt;dev_addr, mac, =
6);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_info(priv-&gt;dev, &quot;Read MAC addr=
ess from chip %pM\n&quot;, mac);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int ftgmac100_set_mac_addr(struct net_device *dev, v=
oid *p)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D eth_prepa=
re_mac_addr_change(dev, p);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret &lt; 0)<b=
r>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eth_commit_mac_ad=
dr_change(dev, p);<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ftgmac100_set_mac=
(netdev_priv(dev), dev-&gt;dev_addr);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; =C2=A0static void ftgmac100_init_hw(struct ftgmac100 *priv)<=
br>
&gt; &gt; &gt; =C2=A0{<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* setup rin=
g buffer base registers */<br>
&gt; &gt; &gt; @@ -1141,7 +1190,7 @@ static const struct net_device_ops ftg=
mac100_netdev_ops =3D {<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_open=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D ftgmac100_open,<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_stop=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D ftgmac100_stop,<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_start_x=
mit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D ftgmac100_hard=
_start_xmit,<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_set_mac_addr=
ess=C2=A0=C2=A0=C2=A0=C2=A0=3D eth_mac_addr,<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_set_mac_addr=
ess=C2=A0=C2=A0=C2=A0=C2=A0=3D ftgmac100_set_mac_addr,<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_validat=
e_addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D eth_validate_addr,<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ndo_do_ioct=
l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D ftgm=
ac100_do_ioctl,<br>
&gt; &gt; &gt; =C2=A0};<br>
&gt; &gt; &gt; @@ -1263,6 +1312,9 @@ static int ftgmac100_probe(struct plat=
form_device *pdev)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv-&gt;irq=
 =3D irq;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* MAC address fr=
om chip or random one */<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ftgmac100_setup_m=
ac(priv);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D ftgm=
ac100_setup_mdio(netdev);<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_setup_mdio;<br>
&gt; &gt; &gt; @@ -1276,12 +1328,6 @@ static int ftgmac100_probe(struct pla=
tform_device *pdev)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0netdev_info(=
netdev, &quot;irq %d, mapped at %p\n&quot;, priv-&gt;irq, priv-&gt;base);<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!is_valid_eth=
er_addr(netdev-&gt;dev_addr)) {<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eth_hw_addr_random(netdev);<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0netdev_info(netdev, &quot;generated random=
 MAC address %pM\n&quot;,<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0netdev-&gt;dev_addr);<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0err_register_netdev:<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.1.0<br>
&gt; &gt; &gt;<br>
</p>

--001a11475b5c2beb36053691fa82--
