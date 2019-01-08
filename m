Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.18; helo=barracuda02.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda02.hxt-semitech.com (unknown [223.203.96.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Yml45zJpzDqFF
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 20:13:17 +1100 (AEDT)
X-ASG-Debug-ID: 1546938791-107606139f152b80001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda02.hxt-semitech.com with ESMTP id mdPmz4DGalF0DetK (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Tue, 08 Jan 2019 17:13:11 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 8 Jan 2019 17:13:05 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Tue, 8 Jan 2019 17:13:05 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yang,
 Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
Thread-Topic: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
X-ASG-Orig-Subj: Re: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
Thread-Index: AQHUpnWQvB84NJ6vhUqklmqeqreTrQ==
Date: Tue, 8 Jan 2019 09:13:04 +0000
Message-ID: <a05be53a7110480990bc3b2cf1d31dae@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <2e94eb44c0acf6b90c1d9bbffd1c5c5cc2af59be.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <af54e702-d384-4af8-0cbc-008a1e927b67@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1546938791
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1392
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4928 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65315
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-List-Received-Date: Tue, 08 Jan 2019 09:13:21 -0000

Hi Guenter Roeck,=0A=
=0A=
Thanks for your reply.=0A=
=0A=
On 2019/1/7 22:04, Guenter Roeck wrote:=0A=
> On 1/7/19 3:06 AM, Xiaoting Liu wrote:=0A=
>> Provide support for PSU DPS-650AB from Delta Electronics, INC.=0A=
>>=0A=
> Where is patch 3/4 ?=0A=
=0A=
Sorry for forgetting to send patch 3/4 to you, please refer to the=0A=
following link,=0A=
=0A=
https://lore.kernel.org/patchwork/patch/1029475/=0A=
=0A=
Thanks,=0A=
=0A=
Xiaoting=0A=
=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
>> ---=0A=
>> v2:=0A=
>>    Change the patch subject and commit message.=0A=
>>    Drop dps650ab.c file.=0A=
>>    Replace struct name dps650ab_pmbus_info with pmbus_info_one_skip.=0A=
>> ---=0A=
>>   drivers/hwmon/pmbus/pmbus.c | 1 +=0A=
>>   1 file changed, 1 insertion(+)=0A=
>>=0A=
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c=
=0A=
>> index e38dd97cc49a..f6b35f858db8 100644=0A=
>> --- a/drivers/hwmon/pmbus/pmbus.c=0A=
>> +++ b/drivers/hwmon/pmbus/pmbus.c=0A=
>> @@ -213,6 +213,7 @@ static int pmbus_probe(struct i2c_client *client,=0A=
>>          {"bmr453", (kernel_ulong_t)&pmbus_info_one},=0A=
>>          {"bmr454", (kernel_ulong_t)&pmbus_info_one},=0A=
>>          {"dps460", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>> +       {"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>>          {"dps800", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>>          {"mdt040", (kernel_ulong_t)&pmbus_info_one},=0A=
>>          {"ncp4200", (kernel_ulong_t)&pmbus_info_one},=0A=
>> --=0A=
>> 1.8.3.1=0A=
>>=0A=
>>=0A=
>>=0A=
>=0A=
=0A=
