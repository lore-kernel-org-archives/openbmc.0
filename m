Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxFSp63n5zDr26
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 02:51:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qgjchoSk"; 
 dkim-atps=neutral
Received: by mail-qt0-x242.google.com with SMTP id w6so863993qtg.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eL8rxSkVWsZV4tSTEIUmmEgXvQPpWXkSQ//im+4C/10=;
 b=qgjchoSkRSU2duRMxkiCZ7hODEGquVPATOAh/pBFpInh80/z/l5eZG+h/T/3FL1+15
 iFJOBic6pHznR2VtujOLt77Lk9LQVClrtqZbu0AXSL5ERQgC4u1C0ilrivp+SsNilpS3
 3Y/ir5W72Ov1gNCFl1Fyk2VfruJbnhXqIxe+jRTN96YpQ0QV397EzWtKRuuYbEjQzOTX
 aSO0e64b3n4qw9auuNJ1FOnrSOl+m3AdekDuJymOoGRnSUattQSPx2rHOOXeTCbspRSw
 1x1lGgqKgJ/72lainwSzWO+oQUS82K8DTJB7sG/ekIQ5EJl4DYsbESSDUG37HS+7oXnE
 1UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eL8rxSkVWsZV4tSTEIUmmEgXvQPpWXkSQ//im+4C/10=;
 b=MpeeS4so0r/hyL6fp2iULpETx4nVL+8NcLPUBkNQa0pn0uqevPzSUepoCf7WPAMWee
 fHb9SRTAv/sfw758LEX6kNq46v6N3+i3JkKD8EExIFdppZfly4/hvidD8o6+/8ugglR+
 pxgs04XnPaNgdWDNy9aHsJk24E0TmE//pZcwHvK9Ddn99+nflc30T58NOwO2Kf75N5/2
 SAallTkgeMRPoZlV/MWU/4zi0RFWNDg0EFVdkf65t9RrX9WywmiIw2oshDLPpK4wZw4o
 NhJPozio+WJg5pJ4VIhgHvdtNQI749HZCRqkBLpyC9qLUNdKnsBMQi2qqUIvuvJD482B
 +JgQ==
X-Gm-Message-State: AKS2vOysz8kgh5OjSADDLd2lkvjw7S0m1ZMuJ5Hul5lSNWZ7VVI5rW1D
 t2N8WXDzJWDqQg5IbOzfe0pZidmtRQ==
X-Received: by 10.200.38.70 with SMTP id v6mr1542682qtv.157.1498495894645;
 Mon, 26 Jun 2017 09:51:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.4 with HTTP; Mon, 26 Jun 2017 09:51:34 -0700 (PDT)
In-Reply-To: <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
 <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 26 Jun 2017 11:51:34 -0500
Message-ID: <CAK_vbW1+j_eg5GpxfeLkWcmEcipCHyV1D8gW8J=MNTmJzoh1dg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 26 Jun 2017 16:51:39 -0000

On Mon, Jun 26, 2017 at 1:16 AM, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Brandon,
>
> On Sat, Jun 24, 2017 at 9:26 AM, Brandon Wyman <bjwyman@gmail.com> wrote:
> > The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
> > is used for fan fault and identify LED control. Adding this chip and the
> > LED lines to the device tree.
>
> Great first submission. One issue I found, please see below.
>
> >
> > Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 47 ++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index 31315d0..e5e3b37 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -203,6 +203,53 @@
> >                 compatible = "infineon,dps310";
> >                 reg = <0x76>;
> >         };
> > +
> > +       pca0: pca9552@60 {
> > +               compatible = "nxp,pca9552";
> > +               reg = <0x60>;
>
> You've missed out the #address-cells and #size-cells properties here.
> Without these you would have seen this when you compiled the patch:
>
>   DTC     arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dtb
> Warning (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@0 has invalid length
> (4 bytes) (#address-cells == 2, #size-cells == 1)
> Warning (reg_format): "reg" property in
> /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@1 has invalid length
> (4 bytes) (#address-cells == 2, #size-cells == 1)
> Warning (avoid_default_addr_size): Relying on default #address-cells
> value for /ahb/apb/i2c@1e78a000/i2c-bus@100/pca9552@60/led@0
>
> If you go back and check the bindings document, you will notice that
> it specifies these properties as required:
>
> - #address-cells: must be 1
> - #size-cells: must be 0
>
> https://github.com/openbmc/linux/blob/95dffc96f1f1271c60f180bf736e18278f905a88/Documentation/devicetree/bindings/leds/leds-pca955x.txt#L13
>
> Please send a v2 with this fixed.
Okay, I missed that. Will do.
>
> Cheers,
>
> Joel
>
>
> > +               fan0: led@0 {
> > +                       label = "fan0:yellow";
> > +                       default-state = "keep";
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               fan1: led@1 {
> > +                       label = "fan1:yellow";
> > +                       default-state = "keep";
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               fan2: led@2 {
> > +                       label = "fan2:yellow";
> > +                       default-state = "keep";
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               fan3: led@3 {
> > +                       label = "fan3:yellow";
> > +                       default-state = "keep";
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               led@13 {
> > +                       label = "yellow";
> > +                       default-state = "keep";
> > +                       reg = <13>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               led@14 {
> > +                       label = "green";
> > +                       default-state = "keep";
> > +                       reg = <14>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +               led@15 {
> > +                       label = "blue";
> > +                       default-state = "keep";
> > +                       reg = <15>;
> > +                       type = <PCA955X_TYPE_LED>;
> > +               };
> > +       };
> >  };
> >
> >  &i2c4 {
> > --
> > 1.8.2.2
> >
