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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bbXl2lQKzDqxq
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 19:25:40 +1100 (AEDT)
X-ASG-Debug-ID: 1547195131-107606139f17e390001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda02.hxt-semitech.com with ESMTP id uJI7HTgM7NmpVMjI (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Fri, 11 Jan 2019 16:25:32 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 11 Jan 2019 16:25:24 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Fri, 11 Jan 2019 16:25:24 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yang,
 Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Thread-Topic: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
X-ASG-Orig-Subj: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab
 documentation
Thread-Index: AQHUpyB956RJj2bOg0KNjbfbMBgDFA==
Date: Fri, 11 Jan 2019 08:25:23 +0000
Message-ID: <878e5a2d4495479688ff6df866b092e5@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <20190110184624.GC9010@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1547195132
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1579
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4995 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65511
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
X-List-Received-Date: Fri, 11 Jan 2019 08:25:44 -0000

On 2019/1/11 2:46, Guenter Roeck wrote:=0A=
> On Thu, Jan 10, 2019 at 10:24:33AM +0800, Xiaoting Liu wrote:=0A=
>> Bindings for Delta Electronics DPS-650-AB power supply.=0A=
>>=0A=
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>=0A=
> Waiting for DT maintainer Ack to apply. Note that you did not copy=0A=
> linux-hwmon@vger.kernel.org. As a result, it _may_ get lost since=0A=
> https://patchwork.kernel.org/project/linux-hwmon/list/ is my primary=0A=
> means to track hwmon patches, and it isn't there.=0A=
> If I don't the patch after the Ack, please resend and remember=0A=
> to include the hwmon mailing list.=0A=
>=0A=
> Thanks,=0A=
> Guenter=0A=
=0A=
Thanks for your kindly reminder! I will loop linux-hwmon@vger.kernel.org=0A=
=0A=
when I resend the patch.=0A=
=0A=
Xiaoting=0A=
=0A=
>> ---=0A=
>> v3:=0A=
>>   Change patch commit message.=0A=
>>   Add vendor delta to the compatible property.=0A=
>> ---=0A=
>> v2:=0A=
>>   Change the patch subject.=0A=
>> ---=0A=
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++=
=0A=
>>  1 file changed, 11 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Docu=
mentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> new file mode 100644=0A=
>> index 000000000000..32d89e4f4956=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt=0A=
>> @@ -0,0 +1,11 @@=0A=
>> +Bindings for Delta Electronics DPS-650-AB power supply=0A=
>> +=0A=
>> +Required properties:=0A=
>> +- compatible : "delta,dps650ab"=0A=
>> +- reg        : I2C address, one of 0x58, 0x59.=0A=
>> +=0A=
>> +Example:=0A=
>> +	dps650ab@58 {=0A=
>> +		    compatible =3D "delta,dps650ab";=0A=
>> +		    reg =3D <0x58>;=0A=
>> +	};=0A=
>> -- =0A=
>> 1.8.3.1=0A=
>>=0A=
=0A=
