Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK9ns3rGgzDvht
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:14:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAH6DZ4Z007361
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 01:14:38 -0500
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26s6ydg9hv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 01:14:37 -0500
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 17 Nov 2016 11:44:34 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 17 Nov 2016 11:44:33 +0530
Received: from d28relay10.in.ibm.com (d28relay10.in.ibm.com [9.184.220.161])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 49B1C125804F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 11:45:27 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
 by d28relay10.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAH6E3cJ29163732
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 11:44:03 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAH6ENIg004415
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 11:44:31 +0530
Received: from Deepaks-MacBook-Pro.local ([9.109.127.216])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAH6EKVp004288; Thu, 17 Nov 2016 11:44:20 +0530
Subject: Re: D-Bus interfaces for FRU VPD inventory
To: Yi TZ Li <shliyi@cn.ibm.com>
References: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
 <OFBF350957.8F8AAB7A-ON4825806D.0037DBBB-4825806D.003B431A@notes.na.collabserv.com>
 <8d28c804-fef4-c66a-c472-0c7ddf4c3866@linux.vnet.ibm.com>
 <OF9A69A5FC.380E5832-ON4825806E.0018DDCD-4825806E.0021777D@notes.na.collabserv.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 17 Nov 2016 11:44:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <OF9A69A5FC.380E5832-ON4825806E.0018DDCD-4825806E.0021777D@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111706-0012-0000-0000-0000035F9E42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111706-0013-0000-0000-000019F9E0C6
Message-Id: <f0ba30bb-c0d6-1ec0-9eba-2801e81afe3c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611170116
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
X-List-Received-Date: Thu, 17 Nov 2016 06:14:42 -0000

On 17/11/16 11:35 am, Yi TZ Li wrote:
> Thanks for the response.
> Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> wrote on 11/16/2016
> 08:29:17 PM:
>>
>> > Also there are other FRU items like PCIE card, HDD. How to handle them
>> > in the new inventory framework?
>>
>> Do you mean handle their VPD (if any), or in general creating d-bus
>> objects for them? I'm not sure about the latter.
>
> There are some inventory items without VPD, e.g:
>
> https://github.com/openbmc/skeleton/blob/master/configs/Barreleye.py#L133
>
> "'<inventory_root>/system/chassis/io_board/pcie_slot0_riser' : {
> 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_slot1_riser' : {
> 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_slot2_riser' : {
> 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_slot0' : { 'fru_type' :
> 'PCIE_CARD', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_slot1' : { 'fru_type' :
> 'PCIE_CARD', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_slot2' : { 'fru_type' :
> 'PCIE_CARD', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_mezz0' : { 'fru_type' :
> 'PCIE_CARD', 'is_fru' : True,},
> '<inventory_root>/system/chassis/io_board/pcie_mezz1' : { 'fru_type' :
> 'PCIE_CARD', 'is_fru' : True,},
>
> "
> Will the new inventory manager handle these items too? This looks like
> off the topic.

I have the same question myself. I'm guessing yes, but not sure what 
triggers PIM to create objects for these.

> But I saw your patch is divided into two groups:
> "xyz/openbmc_project/Inventory", and "xyz/openpower/Inventory".
> Where do we put the inventory items above?

The paths you mention above are interface paths, not necessarily object 
paths.

> Thanks,
> -Yi

Regards,
Deepak
