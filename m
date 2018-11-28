Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434g7G5vqmzDqv8
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 23:33:46 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wASCJMSO111970
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 07:33:44 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2p1sfqmeha-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 07:33:43 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 28 Nov 2018 12:33:42 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 28 Nov 2018 12:33:41 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wASCXeKp8061356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Nov 2018 12:33:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727724C040;
 Wed, 28 Nov 2018 12:33:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 809654C044;
 Wed, 28 Nov 2018 12:33:39 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Nov 2018 12:33:39 +0000 (GMT)
Subject: Re: Proposal to Sync BMC's MAC Address to U-Boot environment
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Cc: openbmc@lists.ozlabs.org
References: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
 <a31fa95d9b47461a98e5477a94098c5b@yadro.com>
 <efff61d5-645d-7d81-4b75-f26bb465e96a@linux.vnet.ibm.com>
 <20181128091959.GA12725@bbwork.lan>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 28 Nov 2018 18:03:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181128091959.GA12725@bbwork.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18112812-0008-0000-0000-00000299C72C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112812-0009-0000-0000-000022040EAD
Message-Id: <5066d994-22c9-d2a5-3723-b654577f5c75@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=695 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811280111
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
X-List-Received-Date: Wed, 28 Nov 2018 12:33:47 -0000


On 28/11/18 2:50 PM, Alexander A. Filippov wrote:
> On Wed, Nov 28, 2018 at 11:05:32AM +0530, Ratan Gupta wrote:
>> Hi Alexander,
>>
>> We only restart the systemd-networkd during change of macAddress, if the
>> interface is DHCP Enabled.BMC should get new IP from the DHCP server if the
>> mac address has got changed. Do you still see a issue?
> Yes, and because by default is used DHCP and MAC address is randomly generated,
> it happens always at first boot or after resetting to the manufactured settings.
Do you mean to say that we shouldn't restart the systemd-networkd even 
mac address is getting changed? I think we should get the new IP as the 
mac address is changed.
>
>> It would be nice if you can publish your idea also.
>>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/16245
Sure, thx would go through this change.
>> --
>> Regards
>> Ratan Gupta
>>
> --
> Cheers,
> Alexander
>
