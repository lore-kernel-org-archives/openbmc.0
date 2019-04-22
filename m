Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nbkk1DpGzDqQc
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 16:09:16 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3M5xi2W130664
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 02:09:12 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s12gggq8f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 02:09:12 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 22 Apr 2019 07:09:10 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 22 Apr 2019 07:09:08 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3M697S532833574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Apr 2019 06:09:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EB4B4C05A;
 Mon, 22 Apr 2019 06:09:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D6594C046;
 Mon, 22 Apr 2019 06:09:06 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.20])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Apr 2019 06:09:06 +0000 (GMT)
Subject: Re: DBus interface for Hypervisor State
To: openbmc@lists.ozlabs.org, "geissonator@gmail.com" <geissonator@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CAODBi=oD62gRZwMbvFfa-Mx38G4NuGZBAxPqLd=dX+OGNbwHPQ@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 22 Apr 2019 11:39:05 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAODBi=oD62gRZwMbvFfa-Mx38G4NuGZBAxPqLd=dX+OGNbwHPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042206-4275-0000-0000-0000032A4312
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042206-4276-0000-0000-000038398428
Message-Id: <f1927257-7d62-d810-bc77-a92c0a236032@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=916 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904220045
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
X-List-Received-Date: Mon, 22 Apr 2019 06:09:18 -0000

On 19/04/19 11:23 AM, Sampa Misra wrote:
> Hi,
> 
> We (IBM) have a requirement to maintain the state of hypervisor/virtual 
> machine monitor in the bmc for several reasons like
> 1. Representing the state at bmc for logging purpose
> 2. To be aware that communication to hypervisor from bmc is possible
> 
> The states are usually kind of standard states like hypervisor booting, 
> boot completed, partitions running etc. We are planning to write a dbus 
> interface for this one and wondering whether it can fit in the phosphor 
> layer or open power layer or be just an IBM interface. The decision 
> would be taken based on the interest of the community to use the interface.
> 
> Thanks
> Sampa
> 

We spoke about this a bit on IRC. Based on that discussion and some more 
thinking, I believe this is what we can do :

- We already have a couple of interfaces to indicate the firmware boot 
progress (State.Boot.Progress) and the operating system/hypervisor's 
boot progress (State.OperatingSystem.Status). These are implemented by 
the host state manager application.

- What you need now are a couple of new states to indicate the 
os/hypervisor ready to boot and boot completed. These can just be 
additions to the State.OperatingSystem.Status interface.

Thanks,
Deepak
