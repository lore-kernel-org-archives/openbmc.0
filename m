Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nXVP3dqqzF2Cg
 for <openbmc@lists.ozlabs.org>; Sat, 19 May 2018 01:42:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4IFU1fI085195
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:42:18 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j1xcf238q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:42:17 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 18 May 2018 11:42:16 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 18 May 2018 11:42:14 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4IFgDTD58064902
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 15:42:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD3B124058
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 12:44:04 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B13FC124055
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 12:44:04 -0400 (EDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 12:44:04 -0400 (EDT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [RFC] AST2500 video engine driver design
Date: Fri, 18 May 2018 10:42:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18051815-0048-0000-0000-0000026F278A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009047; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01034146; UDB=6.00528840; IPR=6.00813275; 
 MB=3.00021186; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-18 15:42:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051815-0049-0000-0000-0000452ABF22
Message-Id: <ff0a9c9c-2b09-00e5-3f04-4406b16309e3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805180170
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 15:42:22 -0000

Hi,

I'm working on a driver for the AST2500 video engine; just wanted to 
post up the plan in case anyone has any ideas. The purpose behind this 
development is to be able to use IKVM with video from the host and i/o 
from a remote user.

The video engine is a piece of hardware in the AST24/2500 that captures 
and/or compresses video data. Typically the input is the host graphics, 
writing it's RGB output to the VGA memory on the BMC. The video engine 
will capture and compress the data and store it in memory. The driver 
should provide an interface for an application to read that compressed 
video in order to get it on the network.

The driver interface will use the Video4Linux2 API. This involves 
standard file operations like open, read, and close, as well as a video 
ioctl interface for configuring the device. Configuration options will 
probably be limited, as I think there will only be one mode that will 
provide enough performance for IKVM. I do want to be able to configure 
the video source; either direct from host at the BMC VGA memory or from 
the BMC DRM driver.

The most substantial part of the driver will just be the hardware setup 
and manipulation. Intel has done some work here already (thanks Ed) 
which has been useful for configuring the hardware and doing the 
capture/compress loop. I'll be following what I think is fairly common 
for video drivers and only initializing the engine once a file 
descriptor is opened, and then allow more file descriptors to be opened 
as necessary without further touching the engine, though changing 
configs will obviously do the necessary engine operations. Once the last 
file descriptor is released, the engine and clocks will be shut down. 
The read operation will trigger a single frame capture/compress for now.

I still have details to hash out regarding streaming, user-space 
buffers, etc, which will probably be necessary to get the performance we 
need.

Any comments/questions/concerns?

Thanks,

Eddie
