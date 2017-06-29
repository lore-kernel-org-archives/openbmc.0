Return-Path: <venture@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz15Q0kqszDrBV
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 23:40:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R84vWc9K"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id u62so48215339pgb.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TL7pCqP8RU5SPHxmv3cpdDVFMJFmZjiRy/O0x1KVfL8=;
 b=R84vWc9Khs0UcWPhJ+OgpSQQUpN2nLwswOYJgQKDCw1Wzx2hE0DnRLaGKbkO5OtVh4
 5FgnehSSy8cHzmmUvnyHFnHgs3Un3NsZrfvH836zkNR3h2nd5KDWcW2juW2BVzR9lXUO
 3ZD8Uv6cMQFequ/WkC8JlKaMQw9gZvNoflp2/jn+wO+nNgQgpCUfc9UZpCeoJcMrNT1r
 dqyzxBBbwzNXlVKxN2YvLNIuSVwfyT6A6y4/sZFEsA0TxNSP0KNhPCwePPpTMVXgvIms
 B+QcO4qieBXfQC2/5uTgeFKPIN8IbEl7BZmRjsXUPBGMldZlFxVZRIT1VW+9zvLsRXS8
 w00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TL7pCqP8RU5SPHxmv3cpdDVFMJFmZjiRy/O0x1KVfL8=;
 b=g4DeUEvc4yKfwFmUXJxHT1v3xMtY/5011q5Lds9FpdWL3rS29Totl9q0yOEqI0Lrji
 /6DS2aGUykNIPoVHgOXnU4xLoJNgaEmXLTXYAasD5u/BfohwuvVOjWvYKUcfAiWrTFyf
 V8Iy3D1QYVqPLv+Jf48dVbQKTyidAiR+xM+kmUPkbVmEwPVxQ3hJ6K5ORWm2KH3sp5nq
 je/rw5MbFbm7JdN3yIjuqVllugn3beZKfgMWnv4fgilPjHW2xPDOZOymkmQaJ1DdwiYV
 hbmRY8kchc+i+dDf58BpnMO7mHeemXvuQjaWJStbvu00092k7PyDx4z6V4Y3MlNx10pk
 EHbQ==
X-Gm-Message-State: AKS2vOyrMQbMuUpEvfltwx0t79yLWnMMHkpY/dyXh04KcWhK9fD2CauN
 tyrhvz2IPnK1gNzdLrneY1YJIvSlvvSW
X-Received: by 10.98.69.76 with SMTP id s73mr16311421pfa.94.1498743656171;
 Thu, 29 Jun 2017 06:40:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Thu, 29 Jun 2017 06:40:35 -0700 (PDT)
In-Reply-To: <DB5PR05MB12247989FD121B27F422DCB4EFD20@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170628142304.34433-1-venture@google.com>
 <DB5PR05MB12247989FD121B27F422DCB4EFD20@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Jun 2017 06:40:35 -0700
Message-ID: <CAO=notw80vkmDPuFdP_sTqHGh0zsWeg_xCQcmxvjDB0HakcS-Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pwm
 fans
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 29 Jun 2017 13:40:58 -0000

On Thu, Jun 29, 2017 at 5:30 AM, Mykola Kostenok <c_mykolak@mellanox.com> w=
rote:
> Hi!
>
>
> We want to add pwm_tacho for msn platform too.
>
> Is there some special reason why you add pwm_tacho:
> pwm-tacho-controller@1e786000  to .dts not .dtsi file?
>
>
> What about add this:
>
>        pwm_tacho: pwm-tacho-controller@1e786000 {
>                #address-cells =3D <1>;
>                #size-cells =3D <1>;
>               reg =3D <0x1e786000 0x1000>;
>                compatible =3D "aspeed,ast2500-pwm-tacho";
>                clocks =3D <&pwm_tacho_fixed_clk>;
>                pinctrl-names =3D "default";
>
>
> to aspeed-g5.dtsi?
>

I believe that's completely do-able.  I submitted patches for the way
we had it configured here.  Defining the fans in a big group with the
pwm specific to the platform.  But you're right, I do believe the
primary details are the same across all aspeed-g4/g5 for the
pwm-tacho-controller.

>
> And specific like pinctrl and fan:
>
>                pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
>                        &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>
>                fan@0 {
>                        reg =3D <0x00>;
>                        aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
>                };
>
>
>  to .dts file.
>
>
> Thanks.
>
> Best regards, Mykola Kostenok.
>
> ________________________________
> =D0=9E=D1=82: openbmc <openbmc-bounces+c_mykolak=3Dmellanox.com@lists.ozl=
abs.org> =D0=BE=D1=82
> =D0=B8=D0=BC=D0=B5=D0=BD=D0=B8 Patrick Venture <venture@google.com>
> =D0=9E=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=BE: 28 =D0=B8=
=D1=8E=D0=BD=D1=8F 2017 =D0=B3. 17:23:04
> =D0=9A=D0=BE=D0=BC=D1=83: venture@google.com; joel@jms.id.au; openbmc@lis=
ts.ozlabs.org
> =D0=A2=D0=B5=D0=BC=D0=B0: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: qua=
nta: Enable pwm fans
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v3: lowercased hex address
> v2: Moved pwm_tacho_fixed_clk to clocks.
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51
> ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g4.dtsi             |  5 +++
>  2 files changed, 56 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index e609c53d58f5..3abc2954d26e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -46,6 +46,57 @@
>                          gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_L=
OW>;
>                  };
>          };
> +
> +       pwm_tacho: pwm-tacho-controller@1e786000 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               reg =3D <0x1e786000 0x1000>;
> +               compatible =3D "aspeed,ast2500-pwm-tacho";
> +               clocks =3D <&pwm_tacho_fixed_clk>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_defaul=
t
> +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> +
> +               fan@0 {
> +                       reg =3D <0x00>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> +               };
> +
> +               fan@1 {
> +                       reg =3D <0x01>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> +               };
> +
> +               fan@2 {
> +                       reg =3D <0x02>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> +               };
> +
> +               fan@3 {
> +                       reg =3D <0x03>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> +               };
> +
> +               fan@4 {
> +                       reg =3D <0x00>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> +               };
> +
> +               fan@5 {
> +                       reg =3D <0x01>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> +               };
> +
> +               fan@6 {
> +                       reg =3D <0x02>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
> +               };
> +
> +               fan@7 {
> +                       reg =3D <0x03>;
> +                       aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
> +               };
> +       };
>  };
>
>  &fmc {
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> b/arch/arm/boot/dts/aspeed-g4.dtsi
> index a998a00a2728..9cc959fccfa0 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -36,6 +36,11 @@
>          };
>
>          clocks {
> +               pwm_tacho_fixed_clk: fixedclk {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <24000000>;
> +               };
>          };
>
>          ahb {
> --
> 2.13.1.611.g7e3b11ae1-goog
>
