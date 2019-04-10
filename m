Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fPKG6mmpzDqCt
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 22:55:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3ACscdC124847
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 08:55:41 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rsey0dwmk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 08:55:41 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 10 Apr 2019 13:55:39 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 13:55:38 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3ACtbVL57933852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 12:55:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4DE85205F;
 Wed, 10 Apr 2019 12:55:36 +0000 (GMT)
Received: from [9.85.139.199] (unknown [9.85.139.199])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 61E2552050;
 Wed, 10 Apr 2019 12:55:35 +0000 (GMT)
Subject: Re: Switching to static network address issues
To: gmills@us.ibm.com, openbmc@lists.ozlabs.org
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
 <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
 <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 10 Apr 2019 18:25:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041012-0020-0000-0000-0000032E512D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041012-0021-0000-0000-000021807C24
Message-Id: <3e535745-9cc8-3289-61a7-8ad7a0bb9f9e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100092
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
X-List-Received-Date: Wed, 10 Apr 2019 12:55:47 -0000

Hi Gunnar,

Can you take a look at what are the rest url which is being executed 
underneath?

Ratan


On 10/04/19 3:39 PM, Troy Lee wrote:
> Hi William,
>
> This issue could be reproduce with WebUI or REST interface.
> 1. Starts up romulus-bmc qemu as normal, so the IP address is acquired
> from DHCP by default, let's say "10.1.1.2".
> 2. Open the browser and login to https://10.1.1.2/,
> 3. Switch to [Server Configuration] tab.
>      Then you will see the current setting is "OBTAIN AN IP ADDRESS
> AUTOMATICALLY USING DHCP".
> 4. Click on checkbox "ASSIGN A STATIC IP ADDRESS, and DO NOT CHANGE
> the IP address, leave it the same as DHCP IP address "10.1.1.2".
> 5. Click on "Save settings" button.
>
> Thanks,
> Vertiv Avocent
> Troy Lee
>
> William Kennington <wak@google.com> 於 2019年4月10日 週三 下午5:45寫道：
>> What are the configuration steps you are using to achieve this?
>>
>> On Wed, Apr 10, 2019 at 2:36 AM Troy Lee <leetroy@gmail.com> wrote:
>>> Hi there,
>>>
>>> We met an issue about switching network address from DHCP to static issue.
>>> If we manually set the new static IP address which is the same as
>>> DHCP, the network setting will be dropped.
>>> This issue could be reproduced on qemu with romulus-bmc daily build image.
>>>
>>> root@romulus:~# cat /etc/systemd/network/00-bmc-eth0.network
>>> [Match]
>>> Name=eth0
>>> [Network]
>>> LinkLocalAddressing=yes
>>> IPv6AcceptRA=false
>>> DHCP=false
>>> Gateway=10.1.1.1
>>> [DHCP]
>>> ClientIdentifier=mac
>>> UseDNS=true
>>> UseNTP=true
>>> UseHostname=true
>>> SendHostname=true
>>>
>>> Thanks,
>>> Vertiv Avocent
>>> Troy Lee
>>> --
>>> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
