Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43prXs6BVFzDqQB
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 02:49:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0TFiJKa107234
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 10:49:47 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qaqsyfwya-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 10:49:46 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 29 Jan 2019 15:49:45 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 Jan 2019 15:49:41 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0TFnfN024445032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Jan 2019 15:49:41 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E813F124053;
 Tue, 29 Jan 2019 15:49:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD62B124054;
 Tue, 29 Jan 2019 15:49:38 +0000 (GMT)
Received: from [9.85.142.13] (unknown [9.85.142.13])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jan 2019 15:49:38 +0000 (GMT)
Subject: Re: Aspeed XDMA Engine Driver Interfaces (PCI communications with
 host)
To: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <c3ab751d-d3a8-8491-3353-92ad91e73966@linux.vnet.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org
From: Eddie James <eajames@linux.ibm.com>
Date: Tue, 29 Jan 2019 09:49:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c3ab751d-d3a8-8491-3353-92ad91e73966@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19012915-0060-0000-0000-000003026075
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010499; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01153513; UDB=6.00601394; IPR=6.00933879; 
 MB=3.00025340; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-29 15:49:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012915-0061-0000-0000-0000481A7AF0
Message-Id: <867a30d2-27c2-2c26-be72-959b6c01ebe0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=729 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901290118
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
X-List-Received-Date: Tue, 29 Jan 2019 15:49:50 -0000



On 01/28/2019 03:50 PM, Eddie James wrote:
> Hi,
>
> I'm working on a driver for the XDMA engine to enable DMA operations 
> between the host and the BMC. I thought I'd get up a proposal for the 
> interfaces to get some feedback.
>
> Driver provides one or two simple read/write file handles under /dev/, 
> depending on whether or not we're restricted to using the VGA memory 
> only.
>
> /dev/xdma:
>
>     seek: user sets the host DMA address

Slight revision here; Drop the seek interface and just use the write 
call to specify the host address. Thanks Jeremy for pointing out that 
read/write are expected to increment the seek offset, so this would be 
confusing.

Eddie

>
>     write: user provides the BMC address and specifies the operation 
> type ("upstream", meaning from the BMC to the host, or "downstream", 
> meaning from the host to the BMC). If we're using only VGA memory, the 
> BMC address can be skipped, as it will always be from/to the VGA space.
>
>     read: the syscall blocks or returns EAGAIN until the operation is 
> complete
>
> If we only use VGA memory, we need another device to interact with 
> that memory space easily, as well as prevent multiple users 
> overwriting each others data. VGA memory space is configurable by HW 
> strap on the Aspeed between 8 and 64MB, but is 16MB by default.
>
> /dev/xdma-buffer:
>
>     open/close: lock access to the memory
>
>     read/write: read or write the VGA memory
>
> Locking access in this way is quite a limitation, but I'm not sure how 
> else to guarantee user's data is OK...
>
> Suggestions are very welcome, on all aspects of the design.
>
> Thanks,
>
> Eddie
>
