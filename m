Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTCKB1PKzzDqD0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 09:51:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MMir4M057832
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 17:51:24 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ruy1aeec-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 17:51:23 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 15:51:22 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 15:51:20 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 2BF2F3E4003E;
 Wed, 22 Feb 2017 15:51:20 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MMpK7a11338232; Wed, 22 Feb 2017 15:51:20 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A8BE78047;
 Wed, 22 Feb 2017 15:51:20 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id C915078037;
 Wed, 22 Feb 2017 15:51:19 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 v2 6/7] drivers/fsi: Cleanup bus errors
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-7-cbostic@linux.vnet.ibm.com>
 <d4241d99-a5ca-0bad-da73-ae1b1328393f@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 16:51:18 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <d4241d99-a5ca-0bad-da73-ae1b1328393f@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022222-0004-0000-0000-000011A9CC3F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006665; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825691; UDB=6.00404316; IPR=6.00603146; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014399; XFM=3.00000011;
 UTC=2017-02-22 22:51:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022222-0005-0000-0000-00007D4C4ED0
Message-Id: <d1457bad-7d49-b5fd-e00f-efc71c4c669b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220202
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
X-List-Received-Date: Wed, 22 Feb 2017 22:51:26 -0000



On 2/22/17 3:55 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> @@ -255,6 +263,10 @@ int hub_master_break(struct fsi_master *master, int linkno)
>>   	uint32_t break_offset = 0x4; /* hw workaround */
>>   	uint32_t addr;
>>   
>> +	/* config table lists 2 entries per hub link */
>> +	if (linkno >= (master->n_links / 2))
>> +		return -ENODEV;
>> +
> master->n_links should represent the actual number of links, rather than
> reflect what's in the config table.
>
> [besides, don't we do the / 2 during the config table parse anyway?]

Hi Jeremy,

Yes that's true, its set in scan so no need for the /2 here - will fix.


>>   	command = FSI_BREAK;
>>   	addr = (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
>>   	return fsi_slave_write(hub->slave, addr + break_offset, &command,
>> @@ -641,6 +653,28 @@ static int fsi_master_break(struct fsi_master *master, int link)
>>   
>>   void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
>>   {
>> +	uint32_t smode = FSI_SLAVE_SMODE_DFLT;
>> +
>> +	/* Avoid nested error handling */
>> +	if (test_and_set_bit(FSI_IN_ERR_CLEANUP, &fsi_state))
>> +		return;
> Do we have any other bits of state to represent? If not, just use a
> plain atomic_t rather than a set of flags.
No others at this point,  will change to an atomic_t

Thanks,
Chris

> Cheers,
>
>
> Jeremy
>
