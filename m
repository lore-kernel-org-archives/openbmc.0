Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWK3x3bnGzDqp1
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 08:18:21 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0ULHoM5022576
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 16:18:18 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2fu014s648-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 16:18:18 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 30 Jan 2018 14:18:17 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 30 Jan 2018 14:18:14 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0ULIErp13107680; Tue, 30 Jan 2018 14:18:14 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06C7D6E03D;
 Tue, 30 Jan 2018 14:18:14 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.102.43.220])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id A4E176E038;
 Tue, 30 Jan 2018 14:18:11 -0700 (MST)
Subject: Re: Outstanding FSI core patches
To: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 eajames <eajames@linux.vnet.ibm.com>
References: <CACPK8XeH9uS7G6_k1JLxfx3678U=Dkk_2SYyQSQuQk8GSJ9-Sw@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 30 Jan 2018 15:18:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeH9uS7G6_k1JLxfx3678U=Dkk_2SYyQSQuQk8GSJ9-Sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18013021-0004-0000-0000-000013980230
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008454; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982688; UDB=6.00498312; IPR=6.00761970; 
 BA=6.00005802; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019295; XFM=3.00000015;
 UTC=2018-01-30 21:18:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013021-0005-0000-0000-000085E29307
Message-Id: <53d8a2a9-5dbe-6684-044b-8272064a68ae@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300258
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 21:18:22 -0000



On 1/30/18 12:04 AM, Joel Stanley wrote:
> Hello FSI team,
>
> I've got a queue of patches that I've recovered from the openbmc
> mailing list and lkml that we should really have had upstream by now.
>
> You can view the list here:
>
>   https://github.com/shenki/linux/commits/fsi-next
>
> I sent out the no-scan-on-init patch today for review by the device tree people.
>
> The rest have all been reviewed in the past. I intend to send them out
> for Greg KH to pick up on your behalf. If you have any objections, or
> would prefer to send them yourself, please let me know.
No objections from me.  Thanks for taking care of this.

Chris


> Cheers,
>
> Joel
>
> ---
>
> Christopher Bostic (3):
>        fsi: core: Reduce console output during normal scan
>        dt-bindings: fsi: Add optional property no-scan-on-init
>        fsi: core: Add check for master property no-scan-on-init
>
> Eddie James (1):
>        fsi: Fix one and two byte bus reads/writes
>
> Jeremy Kerr (6):
>        fsi: Add fsi_master_rescan()
>        fsi: master-gpio: Add locking during break and link enable
>        fsi: master-gpio: Add external mode
>        dt-bindings: fsi: Add specification for FSI busses
>        fsi: Match fsi slaves and engines to available dt nodes
>        fsi: master: Clarify master lifetimes & fix use-after-free in hub master
>
