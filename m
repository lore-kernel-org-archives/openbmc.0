Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZxfD1bg8zDw19
 for <openbmc@lists.ozlabs.org>; Sat, 10 Dec 2016 02:55:48 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB9Ft7hV128116
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 10:55:43 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 277ymj06am-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Dec 2016 10:55:43 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 9 Dec 2016 10:55:42 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Dec 2016 10:55:39 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 910C3C90041;
 Fri,  9 Dec 2016 10:55:22 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB9Ftdmm39649364; Fri, 9 Dec 2016 15:55:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B2BAE03B;
 Fri,  9 Dec 2016 10:55:39 -0500 (EST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 04782AE03C;
 Fri,  9 Dec 2016 10:55:38 -0500 (EST)
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Joel Stanley <joel@jms.id.au>
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
 <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
 <57E54486.6020304@raptorengineeringinc.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 9 Dec 2016 09:55:55 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <57E54486.6020304@raptorengineeringinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120915-0056-0000-0000-0000022B493F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006221; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000196; SDB=6.00791546; UDB=6.00383457; IPR=6.00569282; 
 BA=6.00004955; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013585; XFM=3.00000011;
 UTC=2016-12-09 15:55:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120915-0057-0000-0000-0000065E6557
Message-Id: <de14e2a8-06f3-19f9-c783-3d05e6856993@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612090223
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
X-List-Received-Date: Fri, 09 Dec 2016 15:55:48 -0000

Hi,

We're getting closer to needing the hwmon driver for this.  Has anyone 
heard an outlook?

On 9/23/2016 10:04 AM, Timothy Pearson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09/23/2016 02:41 AM, Joel Stanley wrote:
>> Hello Timothy,
>>
>> On Tue, Sep 20, 2016 at 11:22 AM, Timothy Pearson
>> <tpearson@raptorengineering.com> wrote:
>>> Add a basic driver for the MAX31785, focusing on the fan control
>>> features but ignoring the temperature and voltage monitoring
>>> features of the device.
>>>
>>> This driver supports all fan control modes and tachometer / PWM
>>> readback where applicable.
>>> This series adds a new hwmon driver for the MAX31875, which is
>>> used for fan control on Firestone.
>>>
>>> This patch is a holdover until a PMBus driver is written at some
>>> point.  Upstream has stated they will not accept unless a PMBus
>>> driver is used for this particular device.
>> I'm happy to carry this in our tree for now.
>>
>> Do you have a timeline for rewriting and submitting upstream?
> At this time upstream needs some significant work; the PMBus core driver
> as it currently exists does not support the required functions.
> However, the hwmon maintainer (Gunter Roeck) has said he will work on
> extending the PMBus driver and might even get something working for this
> chip with that core driver, so there is definitely progress being made.
>   I wouldn't expect anything upstream until at least kernel 4.9 or later
> though.
>
> - -- 
> Timothy Pearson
> Raptor Engineering
> +1 (415) 727-8645 (direct line)
> +1 (512) 690-0200 (switchboard)
> https://www.raptorengineering.com
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iQEcBAEBAgAGBQJX5USGAAoJEK+E3vEXDOFbuZsIALMWMVl0LK/zGDpD3qVL5tib
> M0t9QYXhMfYSX1CbP47lRTTDg779f6YadV4QsVslqVt3pVCVm+cA0q2SuyDGCVJ5
> KCfVlocQ8KYjZXUieY/Ry3YLvU3oraCIAy5VLpeuPAZMU8RwA8gctElcmeWQNneV
> nywY1wJPe1YjBrIZefVvkF5gJQ/Mzoo498Aeyo8Mi98EB+XSStCp5w9XKF7I7Hja
> BL5FZbO13ghvfSoDUPv51uKS4r843Z7SL7yzPH1W4OH+beB8nKXyj5ajo2C21Z2V
> ciyuWQQdQMw/rh5I7ejNvAczEUsYV7h8zXc4dMxoZQYmgcagP1P7uahFL/0skZo=
> =+1Oo
> -----END PGP SIGNATURE-----
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
