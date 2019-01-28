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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pNc91fP9zDqLL
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 08:51:04 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0SLmdqu110252
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 16:51:02 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qa9gkhdmt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 16:51:01 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 28 Jan 2019 21:51:01 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 28 Jan 2019 21:50:59 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0SLowtl24903844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 21:50:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E29E112063
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 21:50:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0A0C112061
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 21:50:57 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 21:50:57 +0000 (GMT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Aspeed XDMA Engine Driver Interfaces (PCI communications with host)
Date: Mon, 28 Jan 2019 15:50:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19012821-0040-0000-0000-000004B8CFC7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010495; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01153157; UDB=6.00593882; IPR=6.00933520; 
 MB=3.00025329; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-28 21:51:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012821-0041-0000-0000-000008C3E3CD
Message-Id: <c3ab751d-d3a8-8491-3353-92ad91e73966@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-28_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=550 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901280161
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
X-List-Received-Date: Mon, 28 Jan 2019 21:51:05 -0000

Hi,

I'm working on a driver for the XDMA engine to enable DMA operations 
between the host and the BMC. I thought I'd get up a proposal for the 
interfaces to get some feedback.

Driver provides one or two simple read/write file handles under /dev/, 
depending on whether or not we're restricted to using the VGA memory only.

/dev/xdma:

     seek: user sets the host DMA address

     write: user provides the BMC address and specifies the operation 
type ("upstream", meaning from the BMC to the host, or "downstream", 
meaning from the host to the BMC). If we're using only VGA memory, the 
BMC address can be skipped, as it will always be from/to the VGA space.

     read: the syscall blocks or returns EAGAIN until the operation is 
complete

If we only use VGA memory, we need another device to interact with that 
memory space easily, as well as prevent multiple users overwriting each 
others data. VGA memory space is configurable by HW strap on the Aspeed 
between 8 and 64MB, but is 16MB by default.

/dev/xdma-buffer:

     open/close: lock access to the memory

     read/write: read or write the VGA memory

Locking access in this way is quite a limitation, but I'm not sure how 
else to guarantee user's data is OK...

Suggestions are very welcome, on all aspects of the design.

Thanks,

Eddie
