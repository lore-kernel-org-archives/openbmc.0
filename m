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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZS694vqRzF2Q9
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 00:46:25 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UEifY6072143
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 10:46:19 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hp4sshdsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 10:46:18 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 30 Apr 2018 08:46:18 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 08:46:15 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3UEkF9W15991286
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 07:46:15 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21089C6047
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 08:46:15 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 05DE2C6037
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 08:46:15 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 30 Apr 2018 09:48:56 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Code levels in error log entries
In-Reply-To: <120dd10d-e04a-477e-e84a-5cd536aff663@linux.vnet.ibm.com>
References: <120dd10d-e04a-477e-e84a-5cd536aff663@linux.vnet.ibm.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18043014-0012-0000-0000-00001621B8A5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008951; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025491; UDB=6.00523675; IPR=6.00804722; 
 MB=3.00020861; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-30 14:46:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18043014-0013-0000-0000-00005284CB7F
Message-Id: <98ce31d805dcc9c6d44154ef5825efd3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300142
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
X-List-Received-Date: Mon, 30 Apr 2018 14:46:26 -0000

On 2018-03-21 12:23, Matt Spinler wrote:
> For IBM systems, we need to add the current code level to each error 
> log
> object as it's created to make it easier on the lives of support
> personnel.  It would be a new interface (or maybe use an existing
> code version one) on the /xyz/openbmc_project/logging/entry/X objects.
> 
> Does anyone here that also uses error logs have an opinion on if they
> would also be interested in this or not, so it would go into the common
> logging code?
> 
> Unless others are interested in it, I plan on putting it in an IBM
> specific repository.  (or maybe turn on with a configure option?)


After some additional discussion, we decided this would be useful enough 
to
warrant putting it into the base error logging code.  I plan on adding 
the
xyz.openbmc_project.Software.Version interface to the logging objects 
and
populating it with the VERSION_ID field from /etc/os-release.



> 
> Thanks
