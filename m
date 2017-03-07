Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcgSY2CpwzDqY0
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 13:23:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnMveX3O"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id h11so209313ywa.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 18:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=TpROzgXczmDrEsPU2RSYqcCCrkUx3IMwF+NFoYpaS6c=;
 b=WnMveX3Og9KhFh+6ibe9RRdqGx3Fr5w+7/qwToJjgDd5GvEY8EtaaLq8KurkJ4VVT0
 MzKvwYzesWwVidZEMV5nuhVoPZ4Qah0k8pxFu8Ar6I147DYoggH6zWL0qPJnVRCaSRg6
 aMJym/W+kVYyQwLNyQvqEclqxp1Vrn3v7x6rUni4+UczF9SXpYzZzmGKhQFFTMF6AvIc
 e5XdPRpf1zI1Aox2VTMB8PUT7e6lO/gf03sJxoISjDtTKRC6FfmAGw3UzF+1DmVmHGUx
 iexuSejmpZuqBD7a+T0maPXSfYe4RQYRFbCWVT97m+J5ajIR3mfteH9PdehyZfXnZYie
 qyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=TpROzgXczmDrEsPU2RSYqcCCrkUx3IMwF+NFoYpaS6c=;
 b=Ti3Qmz/XbjJnZEUt/iFQ8hw7GQpWrIZBXBCIHySYFsALYES8i2m6igdF1I5NKkXtiw
 GP2EvNWHgslcISByiVynCpxQF0dl/ptpIHrdTXa1rDt84+P/zu66U/9ARcVhw+t9Dv5E
 H0MSvYFwXrs1ut7zzyxfT6eRJZK2Gbesj8BQ757HMZPChprZFHbdH3MXub2bdKapzcs+
 C3yffPq1NYq710bFvmHwFatzgov683O/05vrKhAvJNTejH4oYBwcl3SAhnKC5gMUKxob
 +se5EfoM//13bjvs8nPaNrNGpLHsFHEAozaU/jhUv92iSbGIjDJ9x73lxQbSD7OVmH71
 o+xA==
X-Gm-Message-State: AMke39msbkCsHU9L453zl6CMEu7Tz/J2VTosEbMRiF7tHg1p16r0aKKBxJ3sFiiWqNINg3swzINxMd5DPDypdQ==
X-Received: by 10.129.101.195 with SMTP id z186mr13223025ywb.11.1488853418016; 
 Mon, 06 Mar 2017 18:23:38 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 6 Mar 2017 18:23:17 -0800 (PST)
In-Reply-To: <1488787487-12257-1-git-send-email-clg@kaod.org>
References: <1488787487-12257-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Mar 2017 12:53:17 +1030
X-Google-Sender-Auth: Ul6qeCTgwXD26qJi25WGojHl8nI
Message-ID: <CACPK8Xeia=yG3LqkZq_RSS9z=dm+xkmtcCdxQQKL1VE17rpCDA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: remove second
 BMC flash
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 07 Mar 2017 02:23:42 -0000

On Mon, Mar 6, 2017 at 6:34 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Romulus systems have only one MX25L25635 (32768 Kbytes) flash module
> for the BMC firmware and other MT25QL512A (65536 Kbytes) for the host.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts |    5 -----
>  1 file changed, 5 deletions(-)
>
> Index: linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.7.git.orig/arch/arm/boot/dts/aspeed-bmc-opp-romulus.d=
ts
> +++ linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -51,11 +51,6 @@
>                 m25p,fast-read;
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
>         };
> -       flash@1 {
> -               status =3D "okay";
> -               label =3D "alt";
> -               m25p,fast-read;
> -       };

I think this patch was against a different tree; we don't have the
fast-read properties in 4.7.

I fixed it up and committed to dev-4.7.

Cheers,

Joel
