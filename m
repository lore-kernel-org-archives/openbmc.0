Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wy9X91WctzDr3R
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 14:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EM5gr7qX"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id z21so2777667ywz.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 21:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X87+x+LQIoQcPX6aTNYUB4n4Hl4Ws8nvSvRaw02Jz+I=;
 b=EM5gr7qXdTnX/O5pYgjMi6ZN+MTq+SBVYU8RAmNUqj8cXU/7MqShNGYgZamSetEwre
 39Pu2QwC5c+MWFqGlizsONkf7OaaQghQzCGc7r7QsnBx6e550TDS75Bk9Lwnvq2+CRYA
 mG46JZK4nanPtq1YiVPS2UC+iPpdi3TLDU9t1ntb1HKLCJKdrNn5/J07b2f7RJrGH7yO
 SRuf70eUYqnywXjtfbYgccod+81kDmXi5JsIt+i+aMOpL//z6O+dVFduuXaIG3acRKoO
 kKLBSgzKWLazftWJc0yQIe+bqWhz/ZXOJC0wS2EH/Rv0l10zvhrjgHJVSNnLzppgh/pU
 oCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X87+x+LQIoQcPX6aTNYUB4n4Hl4Ws8nvSvRaw02Jz+I=;
 b=DVyybnFVOgGTswYUGfaVYGca+JW0IXswBnKXhLA+DQ0t4IEVg+z6pMtlTzy0G/1c1g
 WuroXq2vFBCYKlJtXkWqj16hHhiNxkJOAWlmfI+6TYOnmJnDBUaq2gEAY7E6IGs01hgm
 G2gbNzhPSnlLFO+4CnsZHAueqZJGiJRqkx9TKH9xlIUTNanSH6FHMnuZkS60+h7wpHYz
 OKPQj88pfQEhZPQYc4Ju+NMDGXCLRple4MwpBBF2OJpCMMdo7I3oCY6vCNlr+XE2IY15
 EwnqY1juTJMEtivKlJh/YCuIOPEwKDUtJ58bhA7J+FxIJgP4moUOmql72QU+PecMr+W3
 NDFQ==
X-Gm-Message-State: AKS2vOzjVeyqstyOnqM4Zpj7dLr3ebuIDz/43C09+0AIpc/W2bBcbdgl
 ehfCmm00HmqJCSiMsSkTCywMBGATnw==
X-Received: by 10.13.208.67 with SMTP id s64mr6800793ywd.43.1498625862841;
 Tue, 27 Jun 2017 21:57:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Tue, 27 Jun 2017 21:57:22 -0700 (PDT)
In-Reply-To: <1498505585-1820-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498505585-1820-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Jun 2017 14:27:22 +0930
X-Google-Sender-Auth: -5uj4ZW71HvMmZIPtJ1qR6DGr4w
Message-ID: <CACPK8XeOHwzMjMm7N4GU159QckNV=WvX=5C5RLWOr7DQ5yFF=g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arm/dts: Add I2C master and ports to FSI
 cfam
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 04:57:45 -0000

On Tue, Jun 27, 2017 at 5:03 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> FSI I2C master algorithm probes port devices based on dts.

Do you need all 28 ports enabled?

>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi | 134 +++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> index f29c6e3..a0b5c97 100644
> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -4,6 +4,73 @@
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
> +               i2cm@1800 {
> +                       compatible = "ibm,fsi-i2c-master";
> +                       reg = <0x1800 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               port = <0>;
> +                       };
> +
> +                       port@1 {
> +                               port = <1>;
> +                       };
> +
> +                       port@2 {
> +                               port = <2>;
> +                       };
> +
> +                       port@3 {
> +                               port = <3>;
> +                       };
> +
> +                       port@4 {
> +                               port = <4>;
> +                       };
> +
> +                       port@5 {
> +                               port = <5>;
> +                       };
> +
> +                       port@6 {
> +                               port = <6>;
> +                       };
> +
> +                       port@7 {
> +                               port = <7>;
> +                       };
> +
> +                       port@8 {
> +                               port = <8>;
> +                       };
> +
> +                       port@9 {
> +                               port = <9>;
> +                       };
> +
> +                       port@10 {
> +                               port = <10>;
> +                       };
> +
> +                       port@11 {
> +                               port = <11>;
> +                       };
> +
> +                       port@12 {
> +                               port = <12>;
> +                       };
> +
> +                       port@13 {
> +                               port = <13>;
> +                       };
> +
> +                       port@14 {
> +                               port = <14>;
> +                       };
> +               };
> +
>                 sbefifo@2400 {
>                         compatible = "ibm,p9-sbefifo";
>                         reg = <0x2400 0x400>;
> @@ -31,6 +98,73 @@
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
>
> +                               i2cm@1800 {
> +                                       compatible = "ibm,fsi-i2c-master";
> +                                       reg = <0x1800 0x400>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               port = <0>;
> +                                       };
> +
> +                                       port@1 {
> +                                               port = <1>;
> +                                       };
> +
> +                                       port@2 {
> +                                               port = <2>;
> +                                       };
> +
> +                                       port@3 {
> +                                               port = <3>;
> +                                       };
> +
> +                                       port@4 {
> +                                               port = <4>;
> +                                       };
> +
> +                                       port@5 {
> +                                               port = <5>;
> +                                       };
> +
> +                                       port@6 {
> +                                               port = <6>;
> +                                       };
> +
> +                                       port@7 {
> +                                               port = <7>;
> +                                       };
> +
> +                                       port@8 {
> +                                               port = <8>;
> +                                       };
> +
> +                                       port@9 {
> +                                               port = <9>;
> +                                       };
> +
> +                                       port@10 {
> +                                               port = <10>;
> +                                       };
> +
> +                                       port@11 {
> +                                               port = <11>;
> +                                       };
> +
> +                                       port@12 {
> +                                               port = <12>;
> +                                       };
> +
> +                                       port@13 {
> +                                               port = <13>;
> +                                       };
> +
> +                                       port@14 {
> +                                               port = <14>;
> +                                       };
> +                               };
> +
>                                 sbefifo@2400 {
>                                         compatible = "ibm,p9-sbefifo";
>                                         reg = <0x2400 0x400>;
> --
> 1.8.3.1
>
