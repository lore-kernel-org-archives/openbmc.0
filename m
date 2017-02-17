Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ0JH3yq8zDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 04:24:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HHNxSB030429
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:24:28 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28p4sksyhf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:24:28 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 10:24:27 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 10:24:24 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id E99D619D803F;
 Fri, 17 Feb 2017 10:23:36 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HHOO9l10813786; Fri, 17 Feb 2017 10:24:24 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FE8F78051;
 Fri, 17 Feb 2017 10:24:24 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id F03117803F;
 Fri, 17 Feb 2017 10:24:23 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7 2/5] drivers/fsi: Initialize hub master
 engine
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-3-cbostic@linux.vnet.ibm.com>
 <f0976d5f-bd57-6ec3-9fec-1235429e9d9b@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 17 Feb 2017 11:24:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <f0976d5f-bd57-6ec3-9fec-1235429e9d9b@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021717-8235-0000-0000-00000AFDDC6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006634; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823336; UDB=6.00402888; IPR=6.00600782; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014326; XFM=3.00000011;
 UTC=2017-02-17 17:24:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021717-8236-0000-0000-000039B00FAD
Message-Id: <51fcb28c-72c9-13d2-92a1-2b007cfe0cf9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170161
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
X-List-Received-Date: Fri, 17 Feb 2017 17:24:32 -0000



On 2/17/17 1:42 AM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Define hub master probe and add definitions for general
>> master registers and bitfields.
> I think some background on what a hub master is (and how it differs from
> a cascaded master) would be useful - either here or in Documentation/.

Hi Jeremy,

Ok will add some details here.
>>   struct fsi_slave {
>>   	struct list_head	list_link;	/* Master's list of slaves */
>>   	struct list_head	my_engines;
>>   	struct device		dev;
>> -	struct fsi_master	*master;
>> +	struct fsi_master	*master;	/* Upstream master */
>> +	struct fsi_master	*next_master;	/* Downstream master */
>>   	int			link;
>>   	uint8_t			id;
>> +	uint32_t		base;		/* Base address */
>>   };
> [...]
>
>> @@ -26,6 +75,10 @@ struct fsi_master {
>>   	int		idx;
>>   	int		n_links;
>>   	uint32_t	ipoll;
>> +	struct fsi_device *engine;
>> +	struct fsi_device *link;
>> +	uint8_t		type;
>> +	uint32_t	link_size;
>>   	int		(*read)(struct fsi_master *, int link,
>>   				uint8_t slave, uint32_t addr,
>>   				void *val, size_t size);
> It seems to me that you've added a lot of hub-specific definitions to
> multiple parts of the generic FSI core code. I would much rather see
> this contained to code that supports just the hub.
>
> However, the hub functionality doesn't seem to fit within the
> slave-engine device model - as a slave-engine driver (binding on the
> 0x1c/0x1d entries in the configuration table), the hub driver violates
> the device model in that it performs accesses to addresses *way* outside
> of the allocations described in the configuration table.
>
> [that's why you've altered fsi_dev->size in the master driver, and can
> potentially lead to conflicts with other drivers in future]
I altered the dev size due to the incorrect size of hMFSI links/ports in 
the config table.  More on that below.

>  From what I can glean from the docs, the hub master has a couple of
> interfaces:
>
>   - the control register set described in the slave configuration table
>     as type 0x1d
>   - a description of the links, as entries in the slave configuration
>     table as type 0x1c

I think 0x1d and 0x1c types are swapped in the overall discussion.
>
>   - the actual FSI master address space, provided underneath a *slave*
>     (and not a *slave engine* - that distinction is important).
>
> To me, it sounds like we should not make this a slave engine driver, but
> a part of the core *slave* code, because the hub masters are attached
> directly to the slaves. This would involve:
>
>    - struct fsi_master_hub {
>          struct fsi_master master;
>          struct fsi_slave *slave;
> 	uint32_t          control_regs;  /* slave-relative addr of regs */
> 	uint32_t          base;          /* slave-relative addr of
> 					    master address space */
>      }
>
>    - in fsi_slave_scan():
>
>       - suppressing the 0x1c and 0x1d devices from creating slave engines
>
>       - if we find an 0x1d type in the configuration table:
>          - struct fsi_master_hub *hub = kzalloc(...);
> 	  hub->base = /* pre-defined */
> 	  hub->control_regs = /* parsed from config table */
> 	  hub->slave = slave;
>
>       - if (hub) {
>            use a count of the 0x1c types to populate n_links
> 	  fsi_master_register(&hub->master);
>         }
>
>    - the read() and write() callbacks of fsi_master_hub just pass through
>      to the slave (at offset ->base), and the enable/break will access the
>      control_regs.
>
> This means that we keep the hub code encapsulated, and the hub
> implementation doesn't leak out to the core fsi_master or fsi_slave
> structs.

Good idea, will implement that.
> For cascaded masters, we can probably keep this model of using a slave
> engine driver, but I just don't think it's suitable for the hubs.

There isn't much difference conceptually between a cMFSI master and hub 
hMFSI master.   Only things that vary between the two are number of 
links/ports that might be supported off of them and what size address 
space their links/ports span.  The cMFSI master on P9 has a 0x8000 byte 
addressable window per link/port  whereas hMFSI accesses 0x80000 per link.

The P9 CFAM configuration space does not list the hMFSI port size 
correctly.  Each link/port is listed as size *0*.
The cMFSI link/port size is correct, 0x20 1k pages.

Given their similarities it would make sense to me to use the refactored 
approach you describe above for both hMFSI and and in the future, cMFSI.

Thanks for your input,

Chris

>
> Regards,
>
>
> Jeremy
>
