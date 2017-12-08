Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pTZCVdrI"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMZC0G49zF0Dx
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:16:50 +1100 (AEDT)
Received: by mail-lf0-x231.google.com with SMTP id l81so10733397lfl.6
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8eI3SPkqumQ3Wgw3bu6TXw8LqD+9atqv7fHFW57pKuk=;
 b=pTZCVdrIQ9cGSsYqdFIHA4OJsTRfBuVds3uHPra/7s3O70d6NudLUhypnspcLQD9G5
 ZyqwO+wnUhS8pm6kPbstfglb/IRXk5zwQyA+GhRD1XGCecn1arxghXIpVsQY3Q1c74fs
 G+vaxoHjM5tHdjvaleusGn09FSvSow4OkSY7qtj2gZTgzYfzvd4wdSvcWLqYiyg6s/PK
 7IyS74aN5KRDSks9ZaDE5bm9TDdt9TJl4qhEvIMTGazA6Mpthqh+zy65MkD1PN4zzV3y
 VyTgcL/CU6LXK8DXChha0jZwBxatHoPY+4D99BnlTD5LdYu2UXyCWuU7GHfdTmaKlhLM
 5qHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8eI3SPkqumQ3Wgw3bu6TXw8LqD+9atqv7fHFW57pKuk=;
 b=PD/C1pm+mlPnevUMXOe8KYL728sRTWg3xuIFn0NHWlQqdS0KrPMeKku/plnVtRmeVD
 Oe4au+c/JMaYfTNqNvqBm8UhG80XvtQjC/Etji7vn9qCiOXMG2XZSo+pxBZ3TVnXuN5R
 bzWCWiDG8LMj22CMnSTKxkWoAhi8QH7WC38iGayey6zEBBoUuQBK/PC4RruwfPXM3mgb
 nRIe0oe05Zimv+USrTc/DE266PqUfjUYMBWb+777sPGai7m8SwjoBMLmDWGIa572uAs6
 9buzHcUgsfzJMJax0sB481FvaSEZDCXEpM5h24mjHAAgEWco+QhjttFOMxFCbPdwz5ED
 EVjA==
X-Gm-Message-State: AKGB3mK7u0gKwzuAV7XlYfIcO0e2cjWu07s4FH0HpvxVjeiXLnFHidzz
 E0RmwMzbJ8Ls8vNnEI3GalhlbH0l8hKyczrJPJQ=
X-Google-Smtp-Source: AGs4zMZOlcmc+T6jHEbkeLVuKu1a6Fa1djiIa/TVpOLZVlrp32adQraZ1EuF2mpH6rjtjGO/YdcrV27w/2NloJ0Ddew=
X-Received: by 10.25.162.72 with SMTP id l69mr10427096lfe.45.1512713807296;
 Thu, 07 Dec 2017 22:16:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:16:26 -0800 (PST)
In-Reply-To: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 16:46:26 +1030
X-Google-Sender-Auth: dG8GZNLKeTmqumN5qs0h9Rirl90
Message-ID: <CACPK8Xd2Pcb8Z_2PP-B+aALLS9Z1Pc5tvX=2+1qZUbCeVyRUag@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 06:16:52 -0000

On Thu, Dec 7, 2017 at 5:49 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>                                 struct device_attribute *attr, char *buf)
>  {
>         int rc;
> -       u32 val = 0;
> +       u64 val = 0;
>         struct power_sensor_1 *power;
>         struct occ *occ = dev_get_drvdata(dev);
>         struct occ_sensors *sensors = &occ->sensors;
> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>                 val = get_unaligned_be32(&power->accumulator);
>                 break;
>         case 3:
> -               val = get_unaligned_be16(&power->value) * 1000000;
> +               val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;

I don't think these casts are required, are they?
