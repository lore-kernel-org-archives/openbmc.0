Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPz0R1jnHzDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 03:25:42 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HGOSLZ120018
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 11:25:40 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28ngt9n9m1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 11:25:39 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 11:25:39 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 11:25:36 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 0946EC90046;
 Fri, 17 Feb 2017 11:25:17 -0500 (EST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HGPaRj54526072; Fri, 17 Feb 2017 16:25:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 840582803D;
 Fri, 17 Feb 2017 11:25:35 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 2485F28046;
 Fri, 17 Feb 2017 11:25:35 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 5/5] drivers/fsi: Add command line FSI test
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-6-cbostic@linux.vnet.ibm.com>
 <b8aed57b-682e-955d-ca0b-196fa680fcd2@ozlabs.org>
Cc: Edward James <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Fri, 17 Feb 2017 10:25:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <b8aed57b-682e-955d-ca0b-196fa680fcd2@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021716-0044-0000-0000-00000296875C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006633; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823316; UDB=6.00402875; IPR=6.00600763; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014326; XFM=3.00000011;
 UTC=2017-02-17 16:25:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021716-0045-0000-0000-000006C389C2
Message-Id: <44c52718-b5ba-4518-1410-d0bd33d16d83@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170153
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
X-List-Received-Date: Fri, 17 Feb 2017 16:25:43 -0000



On 2/17/17 2:08 AM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Perform FSI reads and writes via the raw sysfs file.  Program
>> reads and writes to various locations on the main link and
>> off of hub link 1.
>>
>> Signed-off-by: Edward James <eajames@us.ibm.com>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsitest.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++++
> Try to avoid putting non-kernel code in the general kernel directories;
> we have tools/testing/selftests/ for this kind of thing.
Hi Jeremy,

Ok will move that to tools

Thanks,
> Cheers,
>
>
> Jeremy
>
