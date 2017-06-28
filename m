Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyLNS0TwFzDr3f
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 21:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NnRqdnXk"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id z21so3199174ywz.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=K8B8ws5XxlypQkxost9kkOtgazeARXTDigzYKquumCs=;
 b=NnRqdnXkYfaEtqEMZDUaeVxMyxhasQMrZXDViPn4AEewItgG+TUSjF2qS1VOGeawMp
 kltzV1t+POt1oP/NZdAaYdM3TVxbCFM0bYiFk7x6N1mxZYvtEUJHLm9IZYx3J5wCUMFL
 8hpqXcB2TbC57UGjiI/+0PQmjLjQVzEHhVdaMeknO6ktbmCUaJLVZMTtdH54PWCb/YOt
 uo6Nbkzep4gunqsLgfczdLX6DiJElbbqUmaO8TnZeqkB/twuwSz3s2wq/y3YAaFXvHW7
 zExrNI43mvFX3UffL17tjst8jNZhMVjn/YVRTOI5PGSo4l9EB99bn4E4A5aLcsHy28g4
 vkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=K8B8ws5XxlypQkxost9kkOtgazeARXTDigzYKquumCs=;
 b=HO6A4Lm6zbyEydVxfkvv0d1wL5S3yRQ90RJAZbJ+NsQ0dFlt6a/ADUAHevyoNB2XyL
 Bi+LyQirjkqh3fPJlibpVskQ5ZqLgXBx7xqEYiluACQIPpP+fkZKnCon3Wc8hmagrapO
 eYmbZT5WATApJRLUhSw9aCcJTmgbm3iRPzOu+I2nyFNUMAUfe6RykoZhfLC9YpNrNiHU
 ts9MVRmbZjA5WRS3cOwnDXO8yGJ9D4ViOWkkQ3uiE5H4zXIPIp5lBlNZ1nhyu6Bd6VAK
 FJO0tD0Bss5FrFMuoTRkK9if+MymPR6Iktd6qZzQfKXc078P8SugVjenw5Qm7RuQP8V9
 8Qnw==
X-Gm-Message-State: AKS2vOxn4e9dpXeSrw0+fhB6/HcTh0OUM6QWPO4mYQYzTNfowdXcqnFl
 NEojKTOWrX546OrG6jDWlyyule97uQ==
X-Received: by 10.13.208.67 with SMTP id s64mr7773185ywd.43.1498649797114;
 Wed, 28 Jun 2017 04:36:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Wed, 28 Jun 2017 04:36:16 -0700 (PDT)
In-Reply-To: <d1910470-c4d0-1620-7932-de3c358881d0@kaod.org>
References: <20170628045655.10965-1-joel@jms.id.au>
 <d1910470-c4d0-1620-7932-de3c358881d0@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Jun 2017 21:06:16 +0930
X-Google-Sender-Auth: W4m8_3S8uYhGUhjCAM5sl84BGzU
Message-ID: <CACPK8Xd9-UQ5vZu754pWZ32h=1Os5tZx1UJ30RcsTx4Vd+AEWg@mail.gmail.com>
Subject: Re: [PATCH qemu v2] aspeed: Register all watchdogs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 28 Jun 2017 11:36:40 -0000

On Wed, Jun 28, 2017 at 5:42 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 06/28/2017 06:56 AM, Joel Stanley wrote:
>> The ast2400 contains two and the ast2500 contains three watchdogs.
>> Add this information to the AspeedSoCInfo and realise the correct number
>> of watchdogs for that each SoC type.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> looks good. one minor problem below, then you can send to mainline
> I think.

Sweet, thanks for the review.

>
> Thanks,
>
> C.
>
>
>> ---
>> v2:
>>  - Add number of watchdogs to AspeedSoCInfo so we can register the
>>  correcet number of devices on each platform
>>  - Drop debugging printf
>>  - Fix long line and remove tabs
>>  - Update commit message
>>
>>  hw/arm/aspeed_soc.c         | 29 +++++++++++++++++++----------
>>  include/hw/arm/aspeed_soc.h |  4 +++-
>>  2 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index 77b95e8e8092..d1c57e1fd6a4 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -65,6 +65,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>>          .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
>>          .fmc_typename =3D "aspeed.smc.fmc",
>>          .spi_typename =3D aspeed_soc_ast2400_typenames,
>> +        .wdts_num     =3D 2,
>>      }, {
>>          .name         =3D "ast2400-a1",
>>          .cpu_model    =3D "arm926",
>> @@ -75,6 +76,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>>          .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
>>          .fmc_typename =3D "aspeed.smc.fmc",
>>          .spi_typename =3D aspeed_soc_ast2400_typenames,
>> +        .wdts_num     =3D 2,
>>      }, {
>>          .name         =3D "ast2400",
>>          .cpu_model    =3D "arm926",
>> @@ -85,6 +87,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>>          .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
>>          .fmc_typename =3D "aspeed.smc.fmc",
>>          .spi_typename =3D aspeed_soc_ast2400_typenames,
>> +        .wdts_num     =3D 2,
>>      }, {
>>          .name         =3D "ast2500-a1",
>>          .cpu_model    =3D "arm1176",
>> @@ -95,6 +98,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>>          .spi_bases    =3D aspeed_soc_ast2500_spi_bases,
>>          .fmc_typename =3D "aspeed.smc.ast2500-fmc",
>>          .spi_typename =3D aspeed_soc_ast2500_typenames,
>> +        .wdts_num     =3D 3,
>>      },
>>  };
>>
>> @@ -178,11 +182,13 @@ static void aspeed_soc_init(Object *obj)
>>      object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
>>                                "ram-size", &error_abort);
>>
>> -    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
>> -    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
>> -    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
>> -    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->s=
cu),
>> -                                   NULL);
>> +    for (i =3D 0; i < sc->info->wdts_num; i++) {
>> +        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WD=
T);
>> +        object_property_add_child(obj, "wdt", OBJECT(&s->wdt[i]), NULL)=
;
>
> may be use "wdt[*]" to have different child names.
>
>> +        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
>> +        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
>> +                                       OBJECT(&s->scu), NULL);
>> +    }
>>
>>      object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC1=
00);
>>      object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), =
NULL);
>> @@ -340,12 +346,15 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
>>
>>      /* Watch dog */
>> -    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> -        return;
>> +    for (i =3D 0; i < ARRAY_SIZE(s->wdt); i++) {
>
> we should be using :
>
>         sc->info->wdts_num
>
> Thanks,
>
> C.
>
>> +        object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", =
&err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
>> +                        ASPEED_SOC_WDT_BASE + i * 0x20);
>>      }
>> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
>>
>>      /* Net */
>>      qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
>> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
>> index d16205c66b5f..fedb7b51a002 100644
>> --- a/include/hw/arm/aspeed_soc.h
>> +++ b/include/hw/arm/aspeed_soc.h
>> @@ -24,6 +24,7 @@
>>  #include "hw/misc/aspeed_ibt.h"
>>
>>  #define ASPEED_SPIS_NUM  2
>> +#define ASPEED_WDTS_NUM  3
>>
>>  typedef struct AspeedSoCState {
>>      /*< private >*/
>> @@ -40,7 +41,7 @@ typedef struct AspeedSoCState {
>>      AspeedSMCState fmc;
>>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>>      AspeedSDMCState sdmc;
>> -    AspeedWDTState wdt;
>> +    AspeedWDTState wdt[ASPEED_WDTS_NUM];
>>      FTGMAC100State ftgmac100;
>>      AspeedIBTState ibt;
>>  } AspeedSoCState;
>> @@ -58,6 +59,7 @@ typedef struct AspeedSoCInfo {
>>      const hwaddr *spi_bases;
>>      const char *fmc_typename;
>>      const char **spi_typename;
>> +    int wdts_num;
>>  } AspeedSoCInfo;
>>
>>  typedef struct AspeedSoCClass {
>>
>
