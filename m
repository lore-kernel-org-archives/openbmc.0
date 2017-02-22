Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT31b4Q47zDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 03:37:23 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MGSnFT065469
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 11:37:20 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28sau3bcqy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 11:37:20 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 11:37:20 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 11:37:17 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id E844A6E805C;
 Wed, 22 Feb 2017 11:36:47 -0500 (EST)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MGb3wq21364800; Wed, 22 Feb 2017 16:37:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88B4C124037;
 Wed, 22 Feb 2017 11:37:15 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 39845124044;
 Wed, 22 Feb 2017 11:37:15 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 v2 5/7] drivers/fsi: Add retry on bus error
 detect
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
 <a16b4705-f6d8-67cc-9bd1-a3d10df050bd@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 10:37:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <a16b4705-f6d8-67cc-9bd1-a3d10df050bd@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022216-0044-0000-0000-0000029FDEB6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006663; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825566; UDB=6.00404241; IPR=6.00603022; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014395; XFM=3.00000011;
 UTC=2017-02-22 16:37:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022216-0045-0000-0000-000006CCE37F
Message-Id: <5d65c925-9f84-e75a-2457-a514a3f16614@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220154
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
X-List-Received-Date: Wed, 22 Feb 2017 16:37:25 -0000



On 2/21/17 7:13 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -381,7 +381,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>>   		return -ENODEV;
>>   
>>   	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
>> -	return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +	if (rc) {
>> +		fsi_master_handle_error(&master->master, addr);
>> +
>> +		/* Try again */
>> +		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>> +		if (rc)
>> +			fsi_master_handle_error(&master->master, addr);
>> +	}
>> +
>> +	return rc;
> Lets avoid the repeated code:
>
> 	const static int master_retries = 2;
>
> 	[...]
>
> 	for (retries = 0; retries < master_retries; retries++) {
> 		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> 		if (!rc)
> 			break;
> 		fsi_master_handle_error(&master->master, addr);
> 	}
>
> 	return rc;
>
> [or even better, we may want to put this in a helper, for use by both
> call sites]
Hi Jeremy,

Will change to a loop.


> Also, is there any condition where fsi_master_handle_error() knows that
> the FSI bus is totally hosed, and there's no point retrying?

There's not anything defined to flag a bad bus -will look into it.

Thanks,
Chris

> Cheers,
>
>
> Jeremy
>
