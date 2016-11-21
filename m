Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMmv33Kj0zDvhx
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fLg3q7R/"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id m75so2864995oig.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 03:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=js4G7hXgF4lMXgGBEmdWutefX66JmZHHnoq4DCK2hgI=;
 b=fLg3q7R/GXftYNHebzzCqAHcN+1iqs9Jph/ZHQJ/EE05rZi3Swrizx1AbQuTzETfg/
 yPYMLJg5ZTNSvx7v7ViiTn7yWyxPjlW+ioPc58gWEPGQ33qIZ7xkxQcNPv++zXZxSPFt
 uOO68w7vXf0uslt4C7RQZqaIr8v1qbtMjKjJQuAyNqbhbrckvN2O68+sHeRrp9fqeKaH
 RoAIZ6rbUw+fEYQ7+atUaD/TQnIkTiBRsx2ma7LszFyoUOfDhz1v7KckN5JtLoBM2rB8
 FwJqwXGNSdKfHa2IsmoUSKvR8Z8cffp4S487xbPz1XJ3REybOhJQw7DT6x3PK4G8VRG0
 yXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=js4G7hXgF4lMXgGBEmdWutefX66JmZHHnoq4DCK2hgI=;
 b=i/fUfC/1ELGOV94PrZ+l0bnykwdBnINht+X5d8f+KWgvxhZzKPvxQpskPr1Jph5DuB
 zE15sEzCZI1wtbSKI8Vz93PXtfH49a0Cu1qNQtOsEFBjTw2GOcTDCsErVI3BdF0qv/PN
 cZQy1mT2fGzYbdPWP6JEBBYQoMau8QVO8Mhq1qhg9AUxiDw1EShJhnAmZeHbe7bjAVhi
 EuH+RuJqEbUvNOhmqHxp5iy37osxzM2ZTsXqbVDR7LRTkAiGyr1Ky/BbEQn1KrGdaTbD
 780VT45nF8hopXkRfNkJHPRxIepVP7zaEM7D7do8hlPIYaPTUD301L9i1l0AMat7HlYd
 z4Vg==
X-Gm-Message-State: AKaTC018Tgtqse6WteCmFdcsULeBpAohmgUfPC6yBWlYZ8cJi1FiBUDFKZi9MwW3bEBhYbRFX+q0bW0IalDmgw==
X-Received: by 10.202.188.196 with SMTP id m187mr8137209oif.210.1479728589684; 
 Mon, 21 Nov 2016 03:43:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Mon, 21 Nov 2016 03:42:49 -0800 (PST)
In-Reply-To: <1479726239.5215.25.camel@aj.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-4-git-send-email-clg@kaod.org>
 <1479726239.5215.25.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 22:12:49 +1030
X-Google-Sender-Auth: l4Co3F2aKCatpO383trxoKAzAl8
Message-ID: <CACPK8XeHeUW3-8ewULup=19umJLkavos5_VMWqL=VPnKJTNSEw@mail.gmail.com>
Subject: Re: [PATCH qemu 03/38] aspeed: attach the second SPI controller
 object to the SoC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 11:43:12 -0000

On Mon, Nov 21, 2016 at 9:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
>> ---
>>  hw/arm/aspeed_soc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index db145e201451..bbbbfd13862c 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -124,7 +124,7 @@ static void aspeed_soc_init(Object *obj)
>>      for (i =3D 0; i < sc->info->spis_num; i++) {
>>          object_initialize(&s->spi[i], sizeof(s->spi[i]),
>>                            sc->info->spi_typename[i]);
>> -        object_property_add_child(obj, "spi", OBJECT(&s->spi[i]), NULL)=
;
>> +        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NU=
LL);
>
> Such a curious API. I guess it's effective.

I didn't review this one because wtf is with that *?

Cheers,

Joel
