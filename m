Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yDBJ2049gzDqlv
 for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2017 02:21:05 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9DFJr5Q038341
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 11:21:03 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2djx99nes5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 11:21:02 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 13 Oct 2017 09:21:02 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 13 Oct 2017 09:21:00 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9DFKxWS58196048; Fri, 13 Oct 2017 08:20:59 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6774BE03E;
 Fri, 13 Oct 2017 09:20:59 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.218.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 38BFCBE03B;
 Fri, 13 Oct 2017 09:20:59 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort method
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507875532.5452.205.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 13 Oct 2017 10:20:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507875532.5452.205.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17101315-8235-0000-0000-00000C686B5D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007891; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00930596; UDB=6.00468473; IPR=6.00710863; 
 BA=6.00005636; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017527; XFM=3.00000015;
 UTC=2017-10-13 15:21:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101315-8236-0000-0000-00003E0653DF
Message-Id: <9932860b-efad-c836-a46e-ba8a1c258bbc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710130212
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 15:21:06 -0000



On 10/13/2017 01:18 AM, Andrew Jeffery wrote:
> On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Driver wasn't cleaning up on timeout or in an error situation properly.
>> Need to do a full reset if we fail in order to re-stablish a good state
>> of the engine.
> Was there a particular use-case that triggered this behaviour or was this just
> found in general use? I feel a bit more context would be helpful here. It's a
> fairly sizeable patch and I'm surprised recovery was overlooked initially.

You'd have to hit either a timeout or some non-NACK error condition in 
order to trigger the problem. Somehow NACK doesn't cause the I2C engine 
to get into a bad state. And timeouts it seems to be somewhat 
intermittent. Probably depends what state the bus is in when the driver 
actually bails out.

Thanks,
Eddie

>
> Cheers,
>
> Andrew
