Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZhRs0lTJzF2QN
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 10:02:32 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UNx7gc138671
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 20:02:30 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hpa5nx8xq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 20:02:29 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Mon, 30 Apr 2018 18:02:28 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 18:02:27 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4102RCe12321186; Mon, 30 Apr 2018 17:02:27 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 047F86E041;
 Mon, 30 Apr 2018 18:02:27 -0600 (MDT)
Received: from birb.localdomain (unknown [9.102.38.196])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with SMTP id 596B36E044;
 Mon, 30 Apr 2018 18:02:26 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 93C5C4EC649; Tue,  1 May 2018 10:02:24 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13] fsi: occ: Add check for OCC response
 checksum
In-Reply-To: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Tue, 01 May 2018 10:02:24 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18050100-0008-0000-0000-000009B05BD6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008953; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025676; UDB=6.00523785; IPR=6.00804908; 
 MB=3.00020872; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-01 00:02:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050100-0009-0000-0000-0000470ACE85
Message-Id: <87po2g6y5r.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300232
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 00:02:33 -0000

Eddie James <eajames@linux.vnet.ibm.com> writes:
> The OCC specification indicates that it is an error scenario if the
> response checksum doesn't match the sum of the bytes of the response.
> The driver needs to perform this calculation and check, and return an
> error if it's a mismatch.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-occ.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 45ae13c..16f18df 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -427,6 +427,27 @@ static int occ_release(struct inode *inode, struct file *file)
>  	.release = occ_release,
>  };
>  
> +static int occ_check_sum(struct occ_response *resp, u16 data_length)

Minor nitpick: It looks like 'checksum' is the standard rather than 'check_sum':

[stewart@birb linux]$ ack check_sum|wc -l
133
[stewart@birb linux]$ ack checksum|wc -l
7284

Would a more accurate name be occ_resp_verify_checksum() ? By the name
'occ_check_sum' alone, I'd assume that it was returning the calculated
checksum rather than verifying it.

-- 
Stewart Smith
OPAL Architect, IBM.
