Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VMWx6SZczF3Hk
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 00:06:21 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6HE5C4G038083
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 10:06:18 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2k9fjhe45g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 10:06:18 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 17 Jul 2018 08:06:17 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Jul 2018 08:06:13 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6HE6CJE13107594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Jul 2018 07:06:12 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BD68BE058;
 Tue, 17 Jul 2018 08:06:12 -0600 (MDT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C064EBE051;
 Tue, 17 Jul 2018 08:06:10 -0600 (MDT)
Received: from [9.85.150.94] (unknown [9.85.150.94])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jul 2018 08:06:10 -0600 (MDT)
Subject: Re: KVM Support?
To: Avi.Fishman@nuvoton.com, avifishman70@gmail.com
Cc: akashgj91@gmail.com, openbmc@lists.ozlabs.org, Uri.Trichter@nuvoton.com,
 Eyal.Cohen@nuvoton.com, LCCHEN@nuvoton.com, KWLIU@nuvoton.com
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
 <8df2b64e-b903-caa8-f439-96128f3c9b19@linux.vnet.ibm.com>
 <CAKKbWA7i884rXOd2nKnMKRoOB-sbzwK7YQENGYWiGze-qbN9WA@mail.gmail.com>
 <0b9a54bd-8a52-b24f-fc21-e38940c01e31@linux.vnet.ibm.com>
 <161fc7e4e5e84892ae34d5e3979bc775@NTILML02.nuvoton.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 17 Jul 2018 09:06:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <161fc7e4e5e84892ae34d5e3979bc775@NTILML02.nuvoton.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18071714-0020-0000-0000-00000E3F2715
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009380; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01062116; UDB=6.00545300; IPR=6.00839974; 
 MB=3.00022171; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-17 14:06:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071714-0021-0000-0000-000062504D6A
Message-Id: <c322703c-518f-c93a-12c1-7221019c2132@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-17_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=583 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807170148
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 14:06:22 -0000



On 07/17/2018 03:56 AM, Avi.Fishman@nuvoton.com wrote:
> Hi Eddie,
>
> 1. Where is the JPEG HW compression is done?

It is done in the AST2500 hardware, there is a video engine that 
captures and compresses the video data from the host. The V4L2 
application reads /dev/video0 (which is created by the driver for that 
video engine) to grab the JPEG, and sends it after that.

> a. Is it in the V4L driver; the V4L reads the frame buffer compress it and send it via read()?
> b. Or the V4L reads the frame buffer send it via read() and another driver compress it for the VNC server?
> 2. Since VNC RFB supports also other compression protocols, can we use other protocol than JPEG? Hextile for example.

Yes, although I had to submit a patch to libvncserver project to be able 
to send JPEGs directly (normally libvncserver can only take RGB 
framebuffer, then compress, then send). It may require similar changes 
to send already-compressed Hextile data.

> 3. Can we see this driver and application code so we can adopt to our HW?

Sure. Everything necessary is here: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11500/ The 
linux-aspeed and obmc-ikvm recipes point to the kernel driver additions 
and application, respectively.

I will be sending the driver for RFC to the list soon.

Thanks,
Eddie

>
> Regards,
> Avi
>
>
> -----Original Message-----
> From: Eddie James [mailto:eajames@linux.vnet.ibm.com]
> Sent: Monday, July 16, 2018 6:39 PM
> To: Avi Fishman
> Cc: akashgj91@gmail.com; OpenBMC Maillist; IV00 Uri Trichter; IS20 Eyal Cohen
> Subject: Re: KVM Support?
>
>
>
> On 07/16/2018 10:01 AM, Avi Fishman wrote:
>> Hi Eddie,
>>
>> Is it based on V4L or also VNC?
>> Does it have HW compression or SW only?
> Hi,
>
> The driver interface is V4L2, though I am just using read() calls rather
> than the streaming interface.
> The network interface is VNC, directly sending JPEGs to the clients
> rather than using the normal VNC framebuffer update methods.
>
> Compression is done in HW, and then decompression at the client. So CPU
> usage on the BMC is kept low, though bandwidth usage is pretty high
> because it sends the whole frame every time. Seems to work with any VNC
> client that supports JPEG compression.
>
> I'm currently working through some input latency problems; seems the
> bandwidth usage for the frames causes huge delays for sending the input
> events from the client to the server. Other than that it's working well.
>
> Thanks,
> Eddie
>
>> Thanks,
>> Avi
>> On Mon, Jul 16, 2018 at 5:03 PM Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>>
>>> On 07/16/2018 01:34 AM, AKASH G J wrote:
>>>> Hi Team,
>>>>
>>>> Please someone share whether Keyboard Video Mouse (KVM) over IP
>>>> implementation available in OpenBMC ?
>>> Hi Akash,
>>>
>>> It's in development... If you want to help, let me know! I'll be
>>> updating the mailing list with drivers, etc, when it's more functional.
>>>
>>> Thanks,
>>> Eddie
>>>
>>>>
>>>> Thanks and Regards,
>>>>
>>>> Akash
>
>
> ===========================================================================================
> The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
