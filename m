Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bbbS0xJVzDqy6
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 19:28:03 +1100 (AEDT)
X-ASG-Debug-ID: 1547195275-093b7e40ef1c620001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda.hxt-semitech.com with ESMTP id cjKeerqtLRgRdn0N (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Fri, 11 Jan 2019 16:27:56 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 11 Jan 2019 16:27:48 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Fri, 11 Jan 2019 16:27:48 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Yang, Shunyong"
 <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v3 4/4] hwmon: (pmbus) add support for DPS-650AB
Thread-Topic: [PATCH v3 4/4] hwmon: (pmbus) add support for DPS-650AB
X-ASG-Orig-Subj: Re: [PATCH v3 4/4] hwmon: (pmbus) add support for DPS-650AB
Thread-Index: AQHUpyi01qEdFN+fSUeA9K9yyOiNHw==
Date: Fri, 11 Jan 2019 08:27:47 +0000
Message-ID: <3cefef03a6c74580b443a278e12f7374@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <625d047f0f42d30bb5ceb75ada529b5fa0c9a21a.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <20190110184227.GB9010@roeck-us.net>
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
X-Barracuda-Start-Time: 1547195276
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65510
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
X-List-Received-Date: Fri, 11 Jan 2019 08:28:05 -0000

On 2019/1/11 2:42, Guenter Roeck wrote:=0A=
> On Thu, Jan 10, 2019 at 10:31:44AM +0800, Xiaoting Liu wrote:=0A=
>> Provide support for PSU DPS-650AB from Delta Electronics, INC.=0A=
>>=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
> Applied to hwmon-next.=0A=
>=0A=
> Thanks,=0A=
> Guenter=0A=
=0A=
Thanks for your reply!=0A=
=0A=
Xiaoting=0A=
=0A=
>> ---=0A=
>> v3:=0A=
>>   No change.=0A=
>> ---=0A=
>> v2:=0A=
>>   Change the patch subject and commit message.=0A=
>>   Drop dps650ab.c file.=0A=
>>   Replace struct name dps650ab_pmbus_info with pmbus_info_one_skip.=0A=
>> ---=0A=
>>  drivers/hwmon/pmbus/pmbus.c | 1 +=0A=
>>  1 file changed, 1 insertion(+)=0A=
>>=0A=
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c=
=0A=
>> index ef845a1310fa..e648ed8d926a 100644=0A=
>> --- a/drivers/hwmon/pmbus/pmbus.c=0A=
>> +++ b/drivers/hwmon/pmbus/pmbus.c=0A=
>> @@ -212,6 +212,7 @@ static int pmbus_probe(struct i2c_client *client,=0A=
>>  	{"bmr453", (kernel_ulong_t)&pmbus_info_one},=0A=
>>  	{"bmr454", (kernel_ulong_t)&pmbus_info_one},=0A=
>>  	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>> +	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>>  	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},=0A=
>>  	{"mdt040", (kernel_ulong_t)&pmbus_info_one},=0A=
>>  	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},=0A=
>> -- =0A=
>> 1.8.3.1=0A=
>>=0A=
=0A=
