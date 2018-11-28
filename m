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
 by lists.ozlabs.org (Postfix) with ESMTPS id 434Ts12SRxzDqjJ
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 16:35:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAS5YHvU027695
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 00:35:42 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p1g5b1e13-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 00:35:42 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 28 Nov 2018 05:35:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 28 Nov 2018 05:35:37 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAS5Za0c6750576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Nov 2018 05:35:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA703A405C;
 Wed, 28 Nov 2018 05:35:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94026A4060;
 Wed, 28 Nov 2018 05:35:35 +0000 (GMT)
Received: from [9.85.156.74] (unknown [9.85.156.74])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Nov 2018 05:35:35 +0000 (GMT)
Subject: Re: Proposal to Sync BMC's MAC Address to U-Boot environment
To: openbmc@lists.ozlabs.org, a.filippov@yadro.com
References: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
 <a31fa95d9b47461a98e5477a94098c5b@yadro.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 28 Nov 2018 11:05:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a31fa95d9b47461a98e5477a94098c5b@yadro.com>
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18112805-0028-0000-0000-000003228FF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112805-0029-0000-0000-000023DE9AC6
Message-Id: <efff61d5-645d-7d81-4b75-f26bb465e96a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811280051
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
X-List-Received-Date: Wed, 28 Nov 2018 05:35:49 -0000

Hi Alexander,

We only restart the systemd-networkd during change of macAddress, if the 
interface is DHCP Enabled.BMC should get new IP from the DHCP server if 
the mac address has got changed. Do you still see a issue?

It would be nice if you can publish your idea also.

--
Regards
Ratan Gupta


On 27/11/18 6:34 PM, Alexander A. Filippov wrote:
> Hi there,
>
> On our VESNIN servers it work by the same scenario.
> This way gives an excess restart of the systemd-network.service and it looks uncomfortable.
>
> For this reason, I wrote an implementation of the aspeed-i2c and VPD-parser for the u-boot-aspeed.
> It has one bug - i2c does not work at the cold start (after the power cord plugged). I will fix it later.
>
> The general idea, why it is not sent to the community yet - the mainline of the u-boot already has the implementation of the aspeed-i2c but has no support (or maybe not full) of ast-2400 (which we are using). It also in our plans but with lower priority.
>
> If you interested in any of these solutions, I can publish them.
>
> --
> Regards,
> Alexander Filippov
> Software Engineer, YADRO.
>
> ________________________________________
> От: openbmc <openbmc-bounces+a.filippov=yadro.com@lists.ozlabs.org> от имени Nagaraju Goruganti <ngorugan@in.ibm.com>
> Отправлено: 27 ноября 2018 г. 13:58:01
> Кому: openbmc@lists.ozlabs.org
> Тема: Proposal to Sync BMC's MAC Address to U-Boot environment
>
> HI All,
>
> As we want to get rid of python, making this proposal to sync BMC's MAC Address to U-Boot environment(assuming this is a common requirement across OpenBMC based systems).
>
> Proposal:
>
> Platform specific code :
>
> a) Get MAC Address from platform specific NV storage (BMC VPD on OpenPOWER systems) into an inventory object. It is being done by openpower-vpd-parser on the openpower systems .
>
> Common code:
>
> b) A script (invoked by systemd on the way to BMC ready state) fetches BMC MAC Address from (platform specific) inventory object. If this MAC Address and the one in u-boot environment are different (or if the u-boot one is empty), then the script writes the inventory MAC Address to u-boot using fw_setenv.
>
> c) The script can reside in a phosphor layer.
>
> Existing Python script:
>
> The existing python script(openbmc/skeleton/pyinventorymgr/sync_inventory_items.py) does the same thing.
>
>
> We need a opinion from the community members on this proposal.
>
> Best Regards,
>
> Nagaraju G
>
