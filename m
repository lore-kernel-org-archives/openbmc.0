Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQfyd4TvrzDqmt
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 03:27:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9UGQd71143328
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 12:27:19 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dx7be8wy1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 12:27:18 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 30 Oct 2017 12:27:18 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Oct 2017 12:27:15 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9UGRF7D38273184; Mon, 30 Oct 2017 16:27:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 583CEAC03F;
 Mon, 30 Oct 2017 12:28:01 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id EB495AC046;
 Mon, 30 Oct 2017 12:28:00 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508718675.6013.3.camel@aj.id.au>
 <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
 <1508893417.13477.1.camel@aj.id.au>
 <57eb4d71-3db5-d3ec-7a67-db3013c872d8@linux.vnet.ibm.com>
 <1509136907.1496317.1153410920.0302A4F4@webmail.messagingengine.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 30 Oct 2017 11:27:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509136907.1496317.1153410920.0302A4F4@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17103016-0024-0000-0000-000002EA94C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007981; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00938697; UDB=6.00473188; IPR=6.00718958; 
 BA=6.00005663; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017792; XFM=3.00000015;
 UTC=2017-10-30 16:27:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17103016-0025-0000-0000-000045E2C976
Message-Id: <d959f6d2-80ba-d6aa-4a7a-ee35f8cf0c8e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-30_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710300220
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 16:27:22 -0000



On 10/27/2017 03:41 PM, Andrew Jeffery wrote:
>>>>>> +
>>>>>> +	return -ETIME;
>>>>>> +}
>>>>>> +
>>>>>>     static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>>>>>>     				 struct i2c_msg *msg, u32 status)
>>>>>>     {
>>>>>>     	int rc;
>>>>>>     	u8 fifo_count;
>>>>>> -	struct fsi_i2c_master *i2c = port->master;
>>>>>> -	u32 dummy = 0;
>>>>>>     
>>>>>>     	if (status & I2C_STAT_ERR) {
>>>>>> -		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>>>>>> +		rc = fsi_i2c_abort(port, status);
>>>>>>     		if (rc)
>>>>>>     			return rc;
>>>>>>     
>>>>>> +		if (status & I2C_STAT_INV_CMD)
>>>>>> +			return -EINVAL;
>>>>>> +
>>>>>> +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
>>>>>> +		    I2C_STAT_BE_ACCESS))
>>>>>> +			return -EPROTO;
>>>>>> +
>>>>>>     		if (status & I2C_STAT_NACK)
>>>>>>     			return -EFAULT;
>>>>>    
>>>>> EFAULT is "Bad address", but slaves can NACK things that aren't addresses.
>>>>> As an example i2c-aspeed calls a NACK an EIO.
>>>>    
>>>> True, but I dislike returning EIO as it's somewhat of a default option
>>>> and makes it very difficult to determine what actually went wrong. How
>>>> about ENXIO?
>>> What does userspace do with that knowledge? Is it worth differentiating? I
>>> can't immediately see that it is. Maybe it's worth a dev_dbg() or something?
>>> I feel ENXIO doesn't address my point either, as it means "No such device or
>>> address", which is still inappropriate for data NACKs.
>> Well, when someone sees an i2c failure and opens a defect and assigns it
>> to me, I would like to know if it was a NACK or something else :) If I
>> see EIO, it could be either some other I2C error, an FSI bus error, o
>> probably even a GPIO error. And dev_dbg probably won't help in the field
>> since it'll be compiled out.
> That's not true currently as we set CONFIG_DYNAMIC_DEBUG:
>
> https://github.com/openbmc/openbmc/blob/51af974f81c1d8a6df250fb38c27c1a0444b2cf3/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig#L200
>
> unless we plan to change that? You can control it via debugfs. We really
> must return something sensible with respect to the error that occurred,
> and neither EFAULT nor ENXIO fit that bill.

Ah, didn't know that was enabled, thanks! However, that still doesn't 
help the situation where we hit the failure and can't recreate it after 
enabling that level of tracing...

I still argue for ENXIO. The Broadcom iProc I2C driver uses ENXIO for 
both data and addr NACKs: 
http://elixir.free-electrons.com/linux/latest/source/drivers/i2c/busses/i2c-bcm-iproc.c#L231

I forgot to switch ECANCELED to EAGAIN in v3, so I'll send up v4.

Cheers,
Eddie

>>>>    
>>>>>    
>>>>>>     
>>>>>> +		if (status & I2C_STAT_LOST_ARB)
>>>>>> +			return -ECANCELED;
>>>>>    
>>>>> So checking around the tree, all of i2c-aspeed, i2c-designware-core,
>>>>> i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that point) use
>>>>> -EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriate, and
>>>>> certainly think that -EAGAIN is what we want: Nothing went wrong aside from
>>>>> this master lost the arbitration race, so the caller should really just retry.
>>>>    
>>>> Good point, however, for this master, it can often return arbitration
>>>> lost if the clock or data line is stuck, and retries will not work. I'll
>>>> switch it to EAGAIN, callers shouldn't try too many times hopefully...
>>> Can we test status again when a new transfer is starting to see if we need to
>>> recover the bus before proceeding?
>> Well with this change, bus should be recovered after any failure, if
>> recovery is possible. I more meant the case when the clock or data line
>> is really stuck such that the master cannot recover them.
> What do we do in this case then? Power cycle?

Yes... Shouldn't happen except for a hardware fault on the slave side, 
from my experience.

>
> Andrew
>
