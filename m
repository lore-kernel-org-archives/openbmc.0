Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT1W92dsRzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 02:29:25 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MFTJ02120977
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 10:29:22 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28s9r430ub-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 10:29:22 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 08:29:10 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 08:29:08 -0700
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8723419D801C;
 Wed, 22 Feb 2017 08:28:19 -0700 (MST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MFT7l260227606; Wed, 22 Feb 2017 15:29:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86BEFAC040;
 Wed, 22 Feb 2017 10:29:04 -0500 (EST)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.4.51])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id A7D9AAC041;
 Wed, 22 Feb 2017 10:29:02 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 v2 1/7] drivers/fsi: Add hub master scan
 detect
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-2-cbostic@linux.vnet.ibm.com>
 <cfc0ea35-fe2f-b733-ecfc-4a1d405e2a84@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 09:29:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <cfc0ea35-fe2f-b733-ecfc-4a1d405e2a84@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022215-0020-0000-0000-00000B71F30C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006663; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825544; UDB=6.00404228; IPR=6.00602999; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014394; XFM=3.00000011;
 UTC=2017-02-22 15:29:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022215-0021-0000-0000-00005A53D1F4
Message-Id: <e881c9b5-0e3c-409b-1790-cd6df225c2b0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220145
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
X-List-Received-Date: Wed, 22 Feb 2017 15:29:25 -0000



On 2/21/17 7:02 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> @@ -252,7 +271,31 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>>   		 * Unused address areas are marked by a zero type value; this
>>   		 * skips the defined address areas
>>   		 */
>> -		if (type != 0 && slots != 0) {
>> +		if (type != 0) {
>> +
>> +			if (type == FSI_ENGID_HUB_MASTER) {
> I'd split this into a separate part of the above 'if' statement. Or,
> convert it to a switch.

Hi Jeremy,

Will change.

>> +				hub = kzalloc(sizeof(*hub), GFP_KERNEL);
>> +				if (!hub)
>> +					return -ENOMEM;
>> +
>> +				hub->base = FSI_HUB_LINK_OFFSET;
>> +				hub->control_regs = engine_addr;
>> +				hub->slave = slave;
>> +				rc = hub_master_init(hub);
>> +
>> +				continue;
>> +			}
>> +			if (type == FSI_ENGID_HUB_LINK) {
>> +				if (!hub)
>> +					continue;
>> +
>> +				hub->master.n_links++;
>> +				if (hub->master.n_links ==
>> +						(FSI_HUB_MASTER_MAX_LINKS * 2))
>> +					rc = fsi_master_register(&hub->master);
>> +
>> +				continue;
>> +			}
> This logic doesn't make a lot of sense. You're counting the number of
> link slots, but then registering the master when that count hits a
> predefined number. I'd suggest either:
>
>   - just setting n_links to the predefined number; or
>
>   - keeping a separate variable for n_links, and then once we've finished
>     scanning the configuration table (after the for loop)
>
>      if (hub) {
> 	    hub->n_links = conf_link_count / 2;
> 	    fsi_master_register(&hub->master);
>      }
>
> I'd much prefer the second option, as that actually uses the link count
> from the config table.

Will implement the second option

>>   int fsi_master_register(struct fsi_master *master)
>>   {
>> -	if (!master || !master->dev)
>> +	if (!master)
>>   		return -EINVAL;
> I'm worried if this is needed - we should be creating a device for all
> masters.

Will add a dev for struct fsi_master.

Thanks

> Cheers,
>
>
> Jeremy
>
