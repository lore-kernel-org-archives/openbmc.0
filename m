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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YmNt0V09zDqN7
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 19:57:31 +1100 (AEDT)
X-ASG-Debug-ID: 1546937844-107606139f152750001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda02.hxt-semitech.com with ESMTP id LzL2Zu51YUH14gAn (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Tue, 08 Jan 2019 16:57:24 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 8 Jan 2019 16:57:19 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Tue, 8 Jan 2019 16:57:19 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com"
 <jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong"
 <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Thread-Topic: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
X-ASG-Orig-Subj: Re: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab
 documentation
Thread-Index: AQHUpnWQzQeKH0TYK0OcFgV3qTYMfw==
Date: Tue, 8 Jan 2019 08:57:19 +0000
Message-ID: <6d28f64bd2f441d09819d66b55537e0b@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <568735a3-1de2-3880-5fe1-7be38a55f33f@roeck-us.net>
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
X-Barracuda-Start-Time: 1546937844
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1391
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4824 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65314
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
X-List-Received-Date: Tue, 08 Jan 2019 08:57:34 -0000

On 2019/1/7 21:58, Guenter Roeck wrote:=0A=
> On 1/7/19 3:00 AM, Xiaoting Liu wrote:=0A=
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.=
=0A=
>>=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
>> ---=0A=
>> v2:=0A=
>>    Change the patch subject.=0A=
>> ---=0A=
>>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++=
=0A=
>>   1 file changed, 11 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Docu=
mentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> new file mode 100644=0A=
>> index 000000000000..6bbbff89f6d5=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> @@ -0,0 +1,11 @@=0A=
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering=
=0A=
>> +=0A=
> Assuming this is the Delta Electronics DPS-650-AB power supply, I think=
=0A=
> you should mention that here.=0A=
I will update commit message as mentioned.=0A=
>=0A=
>> +Required properties:=0A=
>> +- compatible : "dps650ab"=0A=
> Again, assuming this is the Delta Electronics power supply, this should=
=0A=
> probably be something like "delta,dps650ab".=0A=
=0A=
OK, I will add delta to compatible property.=0A=
=0A=
Thanks,=0A=
=0A=
Xiaoting=0A=
=0A=
>=0A=
> Thanks,=0A=
> Guenter=0A=
>=0A=
>> +- reg       : I2C address, one of 0x58, 0x59.=0A=
>> +=0A=
>> +Example:=0A=
>> +       dps650ab@58 {=0A=
>> +                   compatible =3D "dps650ab";=0A=
>> +                   reg =3D <0x58>;=0A=
>> +       };=0A=
>> --=0A=
>> 1.8.3.1=0A=
>>=0A=
>>=0A=
>>=0A=
>>=0A=
=0A=
