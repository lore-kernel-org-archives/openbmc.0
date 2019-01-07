Return-Path: <shunyong.yang@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.18; helo=barracuda02.hxt-semitech.com;
 envelope-from=shunyong.yang@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
X-Greylist: delayed 923 seconds by postgrey-1.36 at bilbo;
 Mon, 07 Jan 2019 13:51:14 AEDT
Received: from barracuda02.hxt-semitech.com (unknown [223.203.96.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y0Jf22ywzDqDq
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 13:51:09 +1100 (AEDT)
X-ASG-Debug-ID: 1546828533-107606139f130b30001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda02.hxt-semitech.com with ESMTP id P8ON2kRhmPUePqyK (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 10:35:33 +0800 (CST)
X-Barracuda-Envelope-From: shunyong.yang@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 10:35:28 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 7 Jan 2019 10:35:28 +0800
From: "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>, "Liu, Xiaoting"
 <xiaoting.liu@hxt-semitech.com>, "jdelvare@suse.com" <jdelvare@suse.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
Thread-Topic: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
X-ASG-Orig-Subj: Re: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
Thread-Index: AQHUpAtN0XMGdiJXnEO7wZj7H+98nw==
Date: Mon, 7 Jan 2019 02:35:28 +0000
Message-ID: <0d61e25645bf457ebb55e4c3f64bcb63@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <680b4d5659971cc4f6e1a6878837c2ce49962a7c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <b9548ce0-97d2-a3d4-d578-015fc5419967@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.6.206]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1546828533
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 6971
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4998 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65250
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Approved-At: Tue, 08 Jan 2019 15:50:04 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2019 02:51:15 -0000

Hi, Guenter,=0A=
  Thanks for reply.=0A=
=0A=
On 2019/1/4 22:54, Guenter Roeck wrote:=0A=
> On 1/4/19 12:55 AM, Xiaoting Liu wrote:=0A=
>> Current code compares device name with name in i2c_device_id to decide=
=0A=
>> whether PMBUS_SKIP_STATUS_CHECK should be set in pmbus_platform_data,=0A=
>> which makes adding new devices with PMBUS_SKIP_STATUS_CHECK should also=
=0A=
>> modify code in pmbus_probe().=0A=
>>=0A=
>> This patch adds pmbus_device_info to save pages and flags. Its pointer=
=0A=
>> is put in driver_data of i2c_device_id, which makes adding new device=0A=
>> more straightforward.=0A=
>>=0A=
> =0A=
> Good idea, but I don't see at this time where the patch is needed.=0A=
> Maybe in patch 3/4 which is missing from the series ?=0A=
=0A=
The reason we figure out this patch is that we want to add dps650ab to=0A=
pmbus_id[] in pmbus.c. As dps650ab has flag of PMBUS_SKIP_STATUS_CHECK=0A=
and we don't want to change pmbus_probe(), so make this patch as a=0A=
premise patch.=0A=
As you stated that adding both dps650ab in pmbus.c and adding a separate=0A=
dps650ab driver file is a conceptional mistake, I will work with=0A=
Xiaoting to decide which approach we should use.=0A=
=0A=
> =0A=
>> Signed-off-by: Shunyong Yang <shunyong.yang@hxt-semitech.com>=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
>> ---=0A=
>>   drivers/hwmon/pmbus/pmbus.c | 54 +++++++++++++++++++++++++++----------=
--------=0A=
>>   include/linux/pmbus.h       |  5 +++++=0A=
>>   2 files changed, 37 insertions(+), 22 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c=
=0A=
>> index 7688dab32f6e..aa4cf9636e99 100644=0A=
>> --- a/drivers/hwmon/pmbus/pmbus.c=0A=
>> +++ b/drivers/hwmon/pmbus/pmbus.c=0A=
>> @@ -172,13 +172,15 @@ static int pmbus_probe(struct i2c_client *client,=
=0A=
>>          struct pmbus_driver_info *info;=0A=
>>          struct pmbus_platform_data *pdata =3D NULL;=0A=
>>          struct device *dev =3D &client->dev;=0A=
>> +       struct pmbus_device_info *device_info;=0A=
>>=0A=
>>          info =3D devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GF=
P_KERNEL);=0A=
>>          if (!info)=0A=
>>                  return -ENOMEM;=0A=
>>=0A=
>> -       if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") |=
|=0A=
>> -           !strcmp(id->name, "sgd009")) {=0A=
>> +       device_info =3D (struct pmbus_device_info *)id->driver_data;=0A=
>> +=0A=
>> +       if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {=0A=
>>                  pdata =3D devm_kzalloc(dev, sizeof(struct pmbus_platfor=
m_data),=0A=
>>                                       GFP_KERNEL);=0A=
>>                  if (!pdata)=0A=
>> @@ -187,36 +189,44 @@ static int pmbus_probe(struct i2c_client *client,=
=0A=
>>                  pdata->flags =3D PMBUS_SKIP_STATUS_CHECK;=0A=
>>          }=0A=
>>=0A=
>> -       info->pages =3D id->driver_data;=0A=
>> +       info->pages =3D device_info->pages;=0A=
>>          info->identify =3D pmbus_identify;=0A=
>>          dev->platform_data =3D pdata;=0A=
>>=0A=
>>          return pmbus_do_probe(client, id, info);=0A=
>>   }=0A=
>>=0A=
>> +static const struct pmbus_device_info default_pmbus_info =3D {1, 0};=0A=
>> +static const struct pmbus_device_info dps460_pmbus_info =3D {=0A=
>> +                               1, PMBUS_SKIP_STATUS_CHECK};=0A=
>> +static const struct pmbus_device_info dps800_pmbus_info =3D {=0A=
>> +                               1, PMBUS_SKIP_STATUS_CHECK};=0A=
>> +static const struct pmbus_device_info sgd009_pmbus_info =3D {=0A=
>> +                               1, PMBUS_SKIP_STATUS_CHECK};=0A=
> =0A=
> Three structures with exactly the same content does not add value.=0A=
> Please merge into one with a common name that reflects its use.=0A=
>=0A=
=0A=
Thanks. we will following you suggestion to use common name as=0A=
pmbus_info_one_skip.=0A=
=0A=
>> +static const struct pmbus_device_info pmbus_info =3D {0, 0};=0A=
> =0A=
> default_pmbus_info and pmbus_info are badly named and ordered.=0A=
> The name should reflect that one sets one page and that the other=0A=
> leaves the number of pages unset.=0A=
> =0A=
> I would suggest three structures and names, such as=0A=
> =0A=
> pmbus_info_one=0A=
> pmbus_info_one_skip=0A=
> pmbus_info_zero=0A=
> =0A=
> though I am open to better names.=0A=
=0A=
Thanks. We will change.=0A=
=0A=
> =0A=
>>   /*=0A=
>>    * Use driver_data to set the number of pages supported by the chip.=
=0A=
>>    */=0A=
>>   static const struct i2c_device_id pmbus_id[] =3D {=0A=
>> -       {"adp4000", 1},=0A=
>> -       {"bmr453", 1},=0A=
>> -       {"bmr454", 1},=0A=
>> -       {"dps460", 1},=0A=
>> -       {"dps800", 1},=0A=
>> -       {"mdt040", 1},=0A=
>> -       {"ncp4200", 1},=0A=
>> -       {"ncp4208", 1},=0A=
>> -       {"pdt003", 1},=0A=
>> -       {"pdt006", 1},=0A=
>> -       {"pdt012", 1},=0A=
>> -       {"pmbus", 0},=0A=
>> -       {"sgd009", 1},=0A=
>> -       {"tps40400", 1},=0A=
>> -       {"tps544b20", 1},=0A=
>> -       {"tps544b25", 1},=0A=
>> -       {"tps544c20", 1},=0A=
>> -       {"tps544c25", 1},=0A=
>> -       {"udt020", 1},=0A=
>> +       {"adp4000", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"bmr453", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"bmr454", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"dps460", (kernel_ulong_t)&dps460_pmbus_info},=0A=
>> +       {"dps800", (kernel_ulong_t)&dps800_pmbus_info},=0A=
>> +       {"mdt040", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"ncp4200", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"ncp4208", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"pdt003", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"pdt006", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"pdt012", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"pmbus", (kernel_ulong_t)&pmbus_info},=0A=
>> +       {"sgd009", (kernel_ulong_t)&sgd009_pmbus_info},=0A=
>> +       {"tps40400", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"tps544b20", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"tps544b25", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"tps544c20", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"tps544c25", (kernel_ulong_t)&default_pmbus_info},=0A=
>> +       {"udt020", (kernel_ulong_t)&default_pmbus_info},=0A=
>>          {}=0A=
>>   };=0A=
>>=0A=
>> diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h=0A=
>> index ee3c2aba2a8e..3c05edad7666 100644=0A=
>> --- a/include/linux/pmbus.h=0A=
>> +++ b/include/linux/pmbus.h=0A=
>> @@ -46,4 +46,9 @@ struct pmbus_platform_data {=0A=
>>          struct regulator_init_data *reg_init_data;=0A=
>>   };=0A=
>>=0A=
>> +struct pmbus_device_info {=0A=
>> +       int pages;=0A=
>> +       u32 flags;=0A=
>> +};=0A=
>> +=0A=
> =0A=
> This should not be needed here. The structure can be declared locally=0A=
> in pmbus.c (its use in patch 4/4 is wrong).=0A=
>=0A=
=0A=
OK. We will move the structure back to pmbus.c. And we will decide=0A=
whether we need 4/4.=0A=
=0A=
Thanks.=0A=
Shunyong.=0A=
=0A=
=0A=
>>   #endif /* _PMBUS_H_ */=0A=
>> --=0A=
>> 1.8.3.1=0A=
>>=0A=
>>=0A=
>>=0A=
>>=0A=
>> This email is intended only for the named addressee. It may contain info=
rmation that is confidential/private, legally privileged, or copyright-prot=
ected, and you should handle it accordingly. If you are not the intended re=
cipient, you do not have legal rights to retain, copy, or distribute this e=
mail or its contents, and should promptly delete the email and all electron=
ic copies in your system; do not retain copies in any media. If you have re=
ceived this email in error, please notify the sender promptly. Thank you.=
=0A=
>>=0A=
>>=0A=
>>=0A=
> =0A=
> =0A=
=0A=
