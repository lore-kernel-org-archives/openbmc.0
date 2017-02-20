Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRmxx3f8kzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 01:59:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KEwqRa078787
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 09:59:47 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28qvbygfqd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 09:59:47 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 07:59:46 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 07:59:43 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id CD07C19D8041;
 Mon, 20 Feb 2017 07:58:54 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KExg6313304170; Mon, 20 Feb 2017 07:59:42 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7571C78041;
 Mon, 20 Feb 2017 07:59:42 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 2596078037;
 Mon, 20 Feb 2017 07:59:42 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality
 and sysfs interface
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
References: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
 <4b59fa39-65c2-cb33-07aa-3fe7a1c7fe21@ozlabs.org>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 08:59:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <4b59fa39-65c2-cb33-07aa-3fe7a1c7fe21@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022014-0008-0000-0000-000007473CA1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006651; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824575; UDB=6.00403654; IPR=6.00602031; 
 BA=6.00005157; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014360; XFM=3.00000011;
 UTC=2017-02-20 14:59:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022014-0009-0000-0000-0000400FBEB0
Message-Id: <8f716407-6cdb-7f49-6ba6-39a5224a19ac@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200147
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
X-List-Received-Date: Mon, 20 Feb 2017 14:59:50 -0000



On 02/20/2017 12:54 AM, Jeremy Kerr wrote:
> Hi Eddie,
>
> The changelog doesn't have much context, so a bit of a question:
>
>> +static ssize_t store_reset_register(struct device *dev,
>> +				    struct device_attribute *attr,
>> +				    const char *buf, size_t count)
>> +{
>> +	int rc;
>> +	struct fsi_device *fsi_dev = to_fsi_dev(dev);
>> +
>> +	rc = scom_full_reset(fsi_dev);
>> +
>> +	return rc ? rc : count;
>> +}
>> +DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
>> +
> How does this interact with the scom read/write operations? Having
> different interfaces access methods (file for one, sysfs interface for
> another)for both seems like an invitation for trouble - would this make
> more sense as an ioctl on the existing fd?

It would, but I was under the impression ioctls were frowned upon for 
some reason? Since we only have one option (reset), I felt a sysfs entry 
made more sense for now? It doesn't interact at all with the read/write 
operations, though I suppose if you wrote reset while in the middle of a 
getscom/putscom, you'd probably end up with a bus error. I'd classify 
that as user error. We could add some sort of locking.

>
> Cheers,
>
>
> Jeremy
>
