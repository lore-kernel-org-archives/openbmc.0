Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fcNc2hjtzDqLn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 07:14:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3ALEI8n098960
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 17:14:20 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rsp4tdqjx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 17:14:20 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Wed, 10 Apr 2019 22:14:19 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Apr 2019 22:14:18 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3ALEHjQ28508274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Apr 2019 21:14:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1902878068;
 Wed, 10 Apr 2019 21:14:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05FA7805F;
 Wed, 10 Apr 2019 21:14:16 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Apr 2019 21:14:16 +0000 (GMT)
Subject: Re: Switching to static network address issues
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
 <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
 <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
 <3e535745-9cc8-3289-61a7-8ad7a0bb9f9e@linux.vnet.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Wed, 10 Apr 2019 16:14:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3e535745-9cc8-3289-61a7-8ad7a0bb9f9e@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041021-0020-0000-0000-00000ED6146C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010904; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187227; UDB=6.00621861; IPR=6.00967990; 
 MB=3.00026382; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 21:14:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041021-0021-0000-0000-00006562C4CA
Message-Id: <988b05f0-4d72-cf00-b717-82759a6eb8ac@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100138
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
X-List-Received-Date: Wed, 10 Apr 2019 21:14:25 -0000

On 4/10/2019 7:55 AM, Ratan Gupta wrote:

>
> Can you take a look at what are the rest url which is being executed 
> underneath?
>
When the DHCP setting changes on the GUI (e.g. "OBTAIN AN IP ADDRESS 
AUTOMATICALLY USING DHCP" to "ASSIGN A STATIC IP ADDRESS"), the
/xyz/openbmc_project/network/<interface>/attr/DHCPEnabled interface is 
called on "Save settings".

https://github.com/openbmc/phosphor-webui/blob/2f481e4cb83f0c72a9f3aad11431e4abcf5d632c/app/common/services/api-utils.js#L428

Hope this helps.

>
> On 10/04/19 3:39 PM, Troy Lee wrote:
>> Hi William,
>>
>> This issue could be reproduce with WebUI or REST interface.
>> 1. Starts up romulus-bmc qemu as normal, so the IP address is acquired
>> from DHCP by default, let's say "10.1.1.2".
>> 2. Open the browser and login to https://10.1.1.2/,
>> 3. Switch to [Server Configuration] tab.
>>      Then you will see the current setting is "OBTAIN AN IP ADDRESS
>> AUTOMATICALLY USING DHCP".
>> 4. Click on checkbox "ASSIGN A STATIC IP ADDRESS, and DO NOT CHANGE
>> the IP address, leave it the same as DHCP IP address "10.1.1.2".
>> 5. Click on "Save settings" button.
>>
