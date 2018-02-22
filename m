Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cTThgrGb"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn4WK1K5QzF17n
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 17:41:17 +1100 (AEDT)
Received: by mail-qk0-x231.google.com with SMTP id s198so5222781qke.5
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 22:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lN6Pw/xkbuleBNE/WbtRRQ/IVivFyLLsowXQuW7g2jA=;
 b=cTThgrGbBPJuCM3DlNL8M+z305BtDQo5M6DCVNsWoRBNSiB9KsSD/Qj+b1AMdGXMZH
 E5j5nBHrRJMwpPK13H5y9LKQ0SSFSNYjK6wOT65heR7vNDvfNNcrA6HjjmsOl2g6vuK0
 dZBVqUrtEuqRqvODAVuFIfUYrDAfJEO02MAUONEGm19f7QqSio+/7di5wfqwQ8AxSAZH
 miLzCgY649bhWyCrQbQKrqaukeJPpBbREMetb4Rl1ZDJqDmY2NUUDY3Qsxfy112nd1dH
 pD7hkchAsaSlhlApPDYl4RHSTbpizaiuLbYjsmFqr8JWlC34p7C5zIPHIgsKDtIdB99E
 bqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lN6Pw/xkbuleBNE/WbtRRQ/IVivFyLLsowXQuW7g2jA=;
 b=WLX+9M1XXNIAc1KpnfCTLLTZDtaK6cbJbhuklQ1TPikM4N6+jEOx5AHd7pRMD0TnWz
 MolVPJlKvghKoF197bKkNBXUYpY2WE7k00w8id9DOfz/YvtM9p4WyYgK8N/RSon1HVGu
 CimdLr59c16znzTc2ywScnQjw78ag9MZjVWC+jIep6mFXmNAbIzwhZolshrPkwYVzVHG
 fjuvWk4ZYQp4axAT2nQTy+owID+85DeRaXMFHxXdbid01XOtlVu7b0JDcMQi24RPYRvh
 /rFSki8geQnqoXqrke4Y3/Ve0yoNeb1snmhDc7xSpLKoyy0zujbiWyxmu8we5E7KIBKP
 ExTw==
X-Gm-Message-State: APf1xPCg7jDHk+l+aKnPxAJM+oJA0KM4Aps2KzVAoxfrNKEvNxQvN77u
 VSDVcrnqrXZkEFrlzw4d4zfE7LLbrybZZRoQxpI=
X-Google-Smtp-Source: AG47ELv86R7bnl7bJ64JVd1dieAbMn1p5dsBcVZo7aDL4myvhmjDAdFgeuU0w57KOjDTNchb52MSwnCEgFDXOr2raxU=
X-Received: by 10.55.44.65 with SMTP id s62mr9076319qkh.203.1519281674464;
 Wed, 21 Feb 2018 22:41:14 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 21 Feb 2018 22:40:54 -0800 (PST)
In-Reply-To: <20180221071726.43440-1-chen.kenyy@inventec.com>
References: <20180221071726.43440-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2018 17:10:54 +1030
X-Google-Sender-Auth: y_SCrHmNek61siOCnw6vJqvtRmU
Message-ID: <CACPK8XdL9AbAWd9CuMW8OrEJ4_LbwSj4xA4peh9sUd7b_FmEEw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v6] Add ARM system BMC device tree
To: Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 06:41:17 -0000

Hi Ken,

On Wed, Feb 21, 2018 at 5:47 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> +&i2c8 {
> +       status = "okay";
> +
> +       pca9641@70 {
> +               compatible = "nxp,pca9641";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;

In order to build cleanly, I had to move the above two lines into the
i2c-arb node.

It is important that you compile your patches before submitting them,
and that they do not introduce any new warnings to the build.

I have fixed this for you in this case.

> +               i2c-arb {
> +                       tmp421@1d {
> +                               compatible = "tmp421";
> +                               reg = <0x1d>;
> +                       };
> +                       adm1278@12 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x12>;
> +                               Rsense = <500>;
> +                       };
> +                       eeprom@50 {
> +                               compatible = "atmel,24c02";
> +                               reg = <0x50>;
> +                       };
> +                       ds1100@58 {
> +                               compatible = "ds1100";
> +                               reg = <0x58>;
> +                       };
> +               };
> +       };
> +};
> +

> +&wdt2 {
> +       status = "okay";
> +};

This is redundant in dev-4.13.

I've fixed up these minor errors and applied it to dev-4.13.
Congratulations for your persistence :)

Cheers,

Joel
