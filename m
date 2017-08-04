Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNrsK1sSmzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 12:46:13 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v742hc0O183559
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 22:46:10 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c4bk6jfq2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 22:46:09 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 22:46:09 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 22:46:05 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v742k5r833030314; Fri, 4 Aug 2017 02:46:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03C71AE03C;
 Thu,  3 Aug 2017 22:46:20 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.5.232])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 327CFAE034;
 Thu,  3 Aug 2017 22:46:17 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 1/2] drivers/fsi: Defer hub master scan on
 probe
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
 <20170803185306.85007-2-cbostic@linux.vnet.ibm.com>
 <2c647116-8b52-f234-4b99-1a52d2b27ea9@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 3 Aug 2017 21:46:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <2c647116-8b52-f234-4b99-1a52d2b27ea9@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17080402-0040-0000-0000-0000038A8548
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007480; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897239; UDB=6.00448925; IPR=6.00677422; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016524; XFM=3.00000015;
 UTC=2017-08-04 02:46:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080402-0041-0000-0000-0000077EB0D7
Message-Id: <607ed6ed-df73-b63d-86bc-f9ca74ec66a3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708040040
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
X-List-Received-Date: Fri, 04 Aug 2017 02:46:13 -0000



On 8/3/17 8:43 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Prevent hub master from scanning its connected links/slaves
>> at probe time.  Needed to keep from creating arbitration
>> conflicts on the hub connected links during host boot
>> FSI bus accesses.
> This change doesn't need to be specific to the hub code - this just
> makes it more complex.
>
> As I mentioned yesterday, this can be done entirely in the fsi core.
> When a master is registered, it has a reference to the of_node; just
> check that. This way, we don't need to a) assume behaviour of different
> master types, or 2) implement this logic in every master.
>
> So, the basis of the change will just be something like:
>
>      diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>      --- a/drivers/fsi/fsi-core.c
>      +++ b/drivers/fsi/fsi-core.c
>      @@ -927,7 +927,9 @@ int fsi_master_register(struct fsi_master *master)
>       		return rc;
>       	}
>
>      -	fsi_master_scan(master);
>      +	np = dev_of_node(&master->dev);
>      +	if (!np || !of_property_read_bool(np, "no-scan-on-init"))
>      +		fsi_master_scan(master);
>
>       	return 0;
>       }
>
> This way, the no-scan-on-init (or whatever would be a better name)
> node applies to the core, rather than every master implementation.
> Consequently, this property is related to compatible = fsi-master and
> not fsi-master-gpio or fsi-master-whatever-else.
>
> [Also, don't forget to add this to the binding doc; it'd go in fsi.txt,
> under the "FSI Masters" section].
>
> Regarding names, I wouldn't use "probe" in the property name, as it's a
> linux implementation detail. Some ideas:
>
>   - no-scan-on-init
>   - explicit-scan
>   - arbitration-required
>   - multiple-access
>
>   : the latter two indicating that other entities can access the device, so
>   we need to be careful when scanning, and scan explicitly. Or, anything
>   else that you think is appropriate (but doesn't imply any specific OS
>   implementation.
Hi Jeremy,

Ok thanks for the detailed description.  Will get version 2 out shortly.

Thanks,
Chris


> Cheers,
>
>
> Jeremy
>
