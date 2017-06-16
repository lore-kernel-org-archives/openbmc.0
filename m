Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq2Hf6wgWzDq88
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 00:07:10 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5GE6Di1092823
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 10:07:08 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b4g5vhtu5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 10:07:07 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 16 Jun 2017 08:07:06 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 16 Jun 2017 08:07:02 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5GE72tp8257870; Fri, 16 Jun 2017 07:07:02 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55433136055;
 Fri, 16 Jun 2017 08:07:02 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.216.198])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id C6208136046;
 Fri, 16 Jun 2017 08:07:01 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] hwmon: occ: Fix uninitialised variable
 warning
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170616075917.12356-1-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 16 Jun 2017 09:07:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170616075917.12356-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17061614-0008-0000-0000-00000808B865
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007243; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00875634; UDB=6.00435989; IPR=6.00655723; 
 BA=6.00005425; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015852; XFM=3.00000015;
 UTC=2017-06-16 14:07:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061614-0009-0000-0000-000042A601E1
Message-Id: <a359a4c2-31e1-c1b9-1f70-28749a4ea0ed@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706160234
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
X-List-Received-Date: Fri, 16 Jun 2017 14:07:11 -0000



On 06/16/2017 02:59 AM, Andrew Jeffery wrote:
> Observed the following:
>
>        CC      drivers/hwmon/occ/common.o
>      drivers/hwmon/occ/common.c: In function ‘occ_show_status’:
>      drivers/hwmon/occ/common.c:262:9: warning: ‘val’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>        return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Andrew!

Eddie
> ---
>   drivers/hwmon/occ/common.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index f34b40062479..d3eb6f83a42c 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -257,6 +257,8 @@ static ssize_t occ_show_status(struct device *dev,
>   	case 6:
>   		val = header->occ_state;
>   		break;
> +	default:
> +		return -EINVAL;
>   	}
>
>   	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
