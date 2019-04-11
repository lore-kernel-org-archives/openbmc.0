Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="fsZ/vyTZ"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 44fyRf4nwszDqPC
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 20:48:11 +1000 (AEST)
Received: from cpsps-ews09.kpnxchange.com ([10.94.84.176]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 11 Apr 2019 12:48:05 +0200
X-Brand: 7Ljiz6bi2A==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=CfzZG4jl c=1 sm=1 tr=0 cx=a_idp_e
 a=/dHbpd/3q0lrH6oA/zwSgQ==:117 a=/dHbpd/3q0lrH6oA/zwSgQ==:17
 a=eIHzyqS2sMcA:10 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10
 a=oexKYjalfGEA:10 a=VnNF1IyMAAAA:8 a=X5F7dNyOAAAA:8 a=pGLkceISAAAA:8
 a=voM4FWlXAAAA:8 a=peDeANYtAAAA:20 a=cJK8_A0x6vM5VSn16oIA:9
 a=CjuIK1q_8ugA:10 a=pS7LufLo7ZPxIL5li5Lt:22 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.45]) by cpsps-ews09.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 11 Apr 2019 12:48:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=Wd0l73q2jDEy1kdELmvB4tEbFwPZ/H41OtBpUJepfLU=;
 b=fsZ/vyTZjAiZWOnrOEbuEXyzNLW6YAD3/JUVzLa09slyDugVL/6emISRctzVCZ5dYknc95cMpE5P3
 voaq04ukr71Ii6JrBZvYMh9xPwRtI0w0F4FwY2LYq0kfhJ8TOrixONjXUqrKaYpA47w5URaAF/sPw4
 WD8AfeqJec8IxhFE=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 48db4e14-5c47-11e9-8eb5-005056ab7447;
 Thu, 11 Apr 2019 12:48:04 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 11 Apr
 2019 12:47:10 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 11 Apr 2019 12:46:58 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Matthew Barth
 <msbarth@linux.ibm.com>, Matt Spinler <mspinler@linux.ibm.com>
Subject: Subject: RE: using phosphor-dbus-monitor
Thread-Topic: Subject: RE: using phosphor-dbus-monitor
Thread-Index: AdTwUwl25SBFFPV9RSmn8I3aFheCbg==
Date: Thu, 11 Apr 2019 10:46:58 +0000
Message-ID: <093a51cc056240c1ac677531f578e105@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Apr 2019 10:48:05.0117 (UTC)
 FILETIME=[0AE33AD0:01D4F054]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Thu, 11 Apr 2019 10:48:17 -0000

Hello,

I ran into another issue with the phosphor-dbus-monitor. The mechanism is w=
orking fine for me as long as I am using Boolean items like CriticalAlarmHi=
gh etc.

For some reason it doesn't work if I try to use a real Value like the Value=
 in the xyz.openbmc_project.Sensor.Value interface or  the CriticalHigh in =
the xyz.openbmc_project.Sensor.Threshold.Critical interface.

If I do this the "get value" always returns 0 (while in the case of the Boo=
lean it correctly returns either 0 or 1.

One thing to mention is that I am using dbus-sensors. As far as I can see t=
his always deals with "double" Values and I can't specify this in the yaml =
so I used a uint64 instead.

Any suggestions?

Best regards,

Wim Vervoorn

-----Original Message-----
Subject: RE: using phosphor-dbus-monitor
Message-ID: <eb2c8def113944bfacad1d5aeafb94af@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=3D"utf-8"

Hello Matt,

I just found the reason why this wasn?t working. I overlooked a typo in the=
 interface : Sensors instead of Sensor.

Best ergards,

Wim Vervoorn

-----Original Message-----
From: Matthew Barth [mailto:msbarth@linux.ibm.com]
Sent: Tuesday, April 9, 2019 4:12 PM
To: Matt Spinler <mspinler@linux.ibm.com>; Wim Vervoorn <wvervoorn@eltan.co=
m>; Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: using phosphor-dbus-monitor



On 4/9/19 8:50 AM, Matt Spinler wrote:
> Hi Wim,
>=20
> If you could post your YAML somewhere, I could take a look for any=20
> obvious problems.
If you could also provide a little more details on the error your attemptin=
g to log would be helpful (i.e. is there a dbus interface?).
>=20
> On 4/9/2019 2:23 AM, Wim Vervoorn wrote:
>> Hello Lei,
>>
>> Thanks for your response. I know this example too and it helps a bit=20
>> but it doesn?t really clarify all issues.
>>
>> As you've worked with this as well. Do you understand the meta item?=20
>> The example indicates it has different meaning but doesn't provide=20
>> any pointers to what those meanings are. Have you been able to find out?
What meta item are you referring to?
>>
>> Best Regards,
>> Wim Vervoorn
>>
>> -----Original Message-----
>> From: Lei YU [mailto:mine260309@gmail.com]
>> Sent: Tuesday, April 9, 2019 5:44 AM
>> To: Wim Vervoorn <wvervoorn@eltan.com>; Matthew Barth=20
>> <msbarth@linux.ibm.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: using phosphor-dbus-monitor
>>
>>> I am trying to use phosphor-dbus-monitor to create logging of sensor=20
>>> exceptions like a Critical state on a specific sensor.
>>> I am able to create a solution with a building yaml but at the end=20
>>> it doesn?t deliver me the desired result.
>>> As there are very limited examples (on a few in the witherspoon) it=20
>>> is very hard to figure out where the mistake is.
>> There is an example yaml config in the repo:
>> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/exam
>> ple/example.yaml
>>
>>
>> And I have the same feeling that it's hard to know what's wrong if=20
>> something is wrong.ei
>>
>>> Are there any tools that can be used to make this easier?
>> @Matthew Barth Could you kindly help to add some doc/tool to make it=20
>> easier to use?
Originally, the example yaml was meant to be the document which I understan=
d is probably not the greatest form when it comes to this.=20
Unfortunately enhancing the documentation would be a low priority at this t=
ime but feel free to create/update the documentation from your findings and=
 push them up for review if you'd like.
>>
>>> Additionally is this the correct method to achieve this goal or=20
>>> should I use something else to define conditions for logging?
>> I think so. This repo is intended to watch the dbus and do stuff as=20
>> yaml config.
Correct. This repo was intended to perform error logging and/or system leve=
l actions, such as a shutdown, based on object properties on dbus.
>>
>>
