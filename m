Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZYQF1GFdzF2Q5
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 04:45:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UIfpNA073612
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 14:45:35 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hp7adu8w5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 14:45:35 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 30 Apr 2018 12:45:34 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 12:45:32 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3UIiH377012684; Mon, 30 Apr 2018 11:44:17 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52CBABE042;
 Mon, 30 Apr 2018 12:44:17 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 3BC2CBE03A;
 Mon, 30 Apr 2018 12:44:17 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 30 Apr 2018 13:46:58 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Code levels in error log entries
In-Reply-To: <6eff09e8-6e8e-db50-2207-94549d24e8ba@linux.vnet.ibm.com>
References: <120dd10d-e04a-477e-e84a-5cd536aff663@linux.vnet.ibm.com>
 <98ce31d805dcc9c6d44154ef5825efd3@linux.vnet.ibm.com>
 <6eff09e8-6e8e-db50-2207-94549d24e8ba@linux.vnet.ibm.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18043018-0016-0000-0000-000008A0FF0A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008952; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025571; UDB=6.00523721; IPR=6.00804802; 
 MB=3.00020867; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-30 18:45:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18043018-0017-0000-0000-00003E7C7B59
Message-Id: <a41f90537695e0195c744f2d99aa59e5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300179
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
X-List-Received-Date: Mon, 30 Apr 2018 18:45:41 -0000

On 2018-04-30 12:31, Deepak Kodihalli wrote:
> On 30/04/18 8:18 pm, Matt Spinler wrote:
>> On 2018-03-21 12:23, Matt Spinler wrote:
>>> For IBM systems, we need to add the current code level to each error 
>>> log
>>> object as it's created to make it easier on the lives of support
>>> personnel.  It would be a new interface (or maybe use an existing
>>> code version one) on the /xyz/openbmc_project/logging/entry/X 
>>> objects.
>>> 
>>> Does anyone here that also uses error logs have an opinion on if they
>>> would also be interested in this or not, so it would go into the 
>>> common
>>> logging code?
>>> 
>>> Unless others are interested in it, I plan on putting it in an IBM
>>> specific repository.  (or maybe turn on with a configure option?)
>> 
>> 
>> After some additional discussion, we decided this would be useful 
>> enough to
>> warrant putting it into the base error logging code.  I plan on 
>> adding the
>> xyz.openbmc_project.Software.Version interface to the logging objects 
>> and
>> populating it with the VERSION_ID field from /etc/os-release.
> 
> I see the Version interface also has a 'VersionPurpose' enum property.
> What would you populate that with? VersionPurpose.BMC? What if the
> error was from host and the version required was that of the host
> firmware?

I was always planning on putting the BMC code version into this.  In the 
case of
OpenPower, the host already includes their code version in their 
embedded PEL error
I believe.

> 
> Also, the value that gets into the /etc/os-release is known to the
> os-release recipe, so you could provide that to the logging recipe at
> build time (ipmi does something similar).


Thanks.  Will look into that.


> 
>> 
>> 
>> 
>>> 
>>> Thanks
> 
> Thanks,
> Deepak
