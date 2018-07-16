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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Tndm2gqGzDr55
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 01:39:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6GFdFuj044402
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 11:39:21 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2k8uvxeu3j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 11:39:21 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 16 Jul 2018 11:39:20 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Jul 2018 11:39:18 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6GFdHXE1245448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Jul 2018 15:39:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 180F42805C;
 Mon, 16 Jul 2018 11:38:34 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5837D28059;
 Mon, 16 Jul 2018 11:38:31 -0400 (EDT)
Received: from oc6728276242.ibm.com (unknown [9.85.164.128])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Jul 2018 11:38:31 -0400 (EDT)
Subject: Re: KVM Support?
To: Avi Fishman <avifishman70@gmail.com>
Cc: akashgj91@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 uri.trichter@nuvoton.com, eyal.cohen@nuvoton.com
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>
 <8df2b64e-b903-caa8-f439-96128f3c9b19@linux.vnet.ibm.com>
 <CAKKbWA7i884rXOd2nKnMKRoOB-sbzwK7YQENGYWiGze-qbN9WA@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 16 Jul 2018 10:39:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKKbWA7i884rXOd2nKnMKRoOB-sbzwK7YQENGYWiGze-qbN9WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18071615-0064-0000-0000-0000032B1D49
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009375; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01061681; UDB=6.00545067; IPR=6.00839586; 
 MB=3.00022159; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-16 15:39:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071615-0065-0000-0000-000039F5DFA5
Message-Id: <0b9a54bd-8a52-b24f-fc21-e38940c01e31@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=719 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807160182
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
X-List-Received-Date: Mon, 16 Jul 2018 15:39:24 -0000



On 07/16/2018 10:01 AM, Avi Fishman wrote:
> Hi Eddie,
>
> Is it based on V4L or also VNC?
> Does it have HW compression or SW only?

Hi,

The driver interface is V4L2, though I am just using read() calls rather 
than the streaming interface.
The network interface is VNC, directly sending JPEGs to the clients 
rather than using the normal VNC framebuffer update methods.

Compression is done in HW, and then decompression at the client. So CPU 
usage on the BMC is kept low, though bandwidth usage is pretty high 
because it sends the whole frame every time. Seems to work with any VNC 
client that supports JPEG compression.

I'm currently working through some input latency problems; seems the 
bandwidth usage for the frames causes huge delays for sending the input 
events from the client to the server. Other than that it's working well.

Thanks,
Eddie

>
> Thanks,
> Avi
> On Mon, Jul 16, 2018 at 5:03 PM Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>
>>
>> On 07/16/2018 01:34 AM, AKASH G J wrote:
>>> Hi Team,
>>>
>>> Please someone share whether Keyboard Video Mouse (KVM) over IP
>>> implementation available in OpenBMC ?
>> Hi Akash,
>>
>> It's in development... If you want to help, let me know! I'll be
>> updating the mailing list with drivers, etc, when it's more functional.
>>
>> Thanks,
>> Eddie
>>
>>>
>>>
>>> Thanks and Regards,
>>>
>>> Akash
