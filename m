Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NJQD1WZGzDqH6
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 01:26:11 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2IEPqOl140997
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 10:26:09 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2racem9wh9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 10:26:09 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 18 Mar 2019 14:26:08 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Mar 2019 14:26:06 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2IEQ5dW8912916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Mar 2019 14:26:05 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0103B206A;
 Mon, 18 Mar 2019 14:26:05 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AED6B206B;
 Mon, 18 Mar 2019 14:26:05 +0000 (GMT)
Received: from [9.85.233.34] (unknown [9.85.233.34])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Mar 2019 14:26:05 +0000 (GMT)
Subject: Re: Legacy OCC numbering
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8Xcb0XUt7aJU0vHrvKUv5HtjLSEnHcfqggtDJzMFxfXMmQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 18 Mar 2019 09:26:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcb0XUt7aJU0vHrvKUv5HtjLSEnHcfqggtDJzMFxfXMmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19031814-0040-0000-0000-000004D3C2D5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010780; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01176157; UDB=6.00606765; IPR=6.00956841; 
 MB=3.00026032; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-18 14:26:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031814-0041-0000-0000-000008DEDC80
Message-Id: <d5936748-a188-1bd3-f193-ed1cb77c6396@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903180107
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
X-List-Received-Date: Mon, 18 Mar 2019 14:26:12 -0000


On 3/18/19 12:12 AM, Joel Stanley wrote:
> Hi Eddie,
>
> I'm cleaning up the FSI device tree snippets that Ben wrote. There's a comment:
>
>    /* Legacy OCC numbering (to get rid of when userspace is fixed) */
>    &fsi_occ0 {
>            reg = <1>;
>    };
>
> Do you know if these changes have been made to userspace?

I don't think this needs any userspace changes. The "reg" value is coded 
into the dts to make sure that the 2nd processor OCC is always occc2 and 
the 1st processor OCC is always occ1. I don't think that can be removed 
because otherwise there's no way to determine which is which (since the 
probe ordering is not certain). Reading that reg value is in the 
upstream driver, so I think it should be left in the dts.

Thanks,

Eddie

>
> Cheers,
>
> Joel
>
