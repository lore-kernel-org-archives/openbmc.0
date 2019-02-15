Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="ZNdTPeiK"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 441Jh02tnkzDqSq
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 03:32:13 +1100 (AEDT)
Received: from cpsps-ews30.kpnxchange.com ([10.94.84.196]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Fri, 15 Feb 2019 17:32:10 +0100
X-Brand: 7Ljiz6bi2A==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e2=11;e3=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=UOIM4xXy c=1 sm=1 tr=0
 a=sfk9uMsoq7e5/NfZ3OK45Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=dpRSjrXKAAAA:8
 a=iPe0xSL15bPFmPykl-wA:9 a=CjuIK1q_8ugA:10 a=-FEs8UIgK8oA:10
 a=NWVoK91CQyQA:10 a=IC2XNlieTeVoXbcui8wp:22 a=xkwab4zIHtOjTkBAMNFX:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT108.kpnxchange.com ([195.121.3.24]) by
 cpsps-ews30.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Feb 2019 17:32:10 +0100
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550248330;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=9BkuqnE8PqQgiN6uGEjt1J3IJsbZTcyv4oWp+BOsvCI=;
 b=ZNdTPeiKYpTNZop43BQE7PXziq1Iym0yOs0aQb6ijy6Je5FEk/cpG+wgSY64PuA1NktuCACUio5
 aCsX2bFgQcdbcNUospYz/iIzCPfp/2SkkWk9ZSthrbuTJH7wXhXfVah21DDqwU6b4L8ruwv42u/Jf
 /v5C/pifWHTzUE8F6WE=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT108.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Fri, 15 Feb 2019 17:32:10 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 15 Feb
 2019 17:31:34 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Fri, 15 Feb 2019 17:31:34 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLA==
Date: Fri, 15 Feb 2019 16:31:34 +0000
Message-ID: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Feb 2019 16:32:10.0002 (UTC)
 FILETIME=[FF7A6F20:01D4C54B]
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
X-List-Received-Date: Fri, 15 Feb 2019 16:32:19 -0000

Hello James,

I got the tree building now.

I have been performing some tests as well. One thing that popped up immedia=
tely is that there are no devices created for the kcs interface while the s=
ervice for this is started.

I noticed that the facebook-tiogapass.dts has the items for kcs2 and 3 incl=
uded while the s2600wf.dts doesn't assign addresses for these devices (leav=
ing the kcs_addr at 0 causing the driver not to load).

I this intentional and do start the driver in another way or should I chang=
e the dts?

Best regards,

Wim Vervoorn


Message: 4
Date: Thu, 14 Feb 2019 16:01:57 -0800
From: James Feist <james.feist@linux.intel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Building intel s2600wf image
Message-ID: <0af603f9-33e6-0dcb-7e9c-2cfa13cc2a02@linux.intel.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 2/14/19 3:49 PM, Andrew Jeffery wrote:
> Hi Wim,
>=20
> On Fri, 15 Feb 2019, at 02:51, Wim Vervoorn wrote:
>> Hello,
>>
>> We are trying to build the Intel s2600wf image using the latest=20
>> OpenBMC tree. If we do that we are running into build errors.
>>
>> Before digging into this can you tell me which commit of the tree can=20
>> be used to build an image for  this device without errors. This=20
>> allows us to have a stable version for reference.

I tried to build today with latest trunk and there were some issues, I fixe=
d them all today but all the bumps have to go through first.=20
Specifically this one:=20
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-intel/+/18410/

Then it needs to get synced into openbmc-openbmc, or you can checkout the p=
atch with the above version of meta-phosphor and it should build.

Thanks

-James


End of openbmc Digest, Vol 42, Issue 36
***************************************
