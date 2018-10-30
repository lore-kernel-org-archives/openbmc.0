Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kzsd2nnMzF1C6
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 05:05:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9UI5YaW019279
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 14:05:38 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2netg6n789-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 14:05:37 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 30 Oct 2018 12:05:06 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Oct 2018 12:05:04 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9UI533n11206858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Oct 2018 18:05:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CAB578063;
 Tue, 30 Oct 2018 18:05:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 010247805E;
 Tue, 30 Oct 2018 18:05:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Oct 2018 18:05:02 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 30 Oct 2018 13:07:23 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Infrastructure Workgroup?
In-Reply-To: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
References: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18103018-8235-0000-0000-00000E1DFB21
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009955; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01110240; UDB=6.00575260; IPR=6.00890332; 
 MB=3.00023968; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-30 18:05:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18103018-8236-0000-0000-0000432ED662
Message-Id: <d056ba731f3d73d9a21236cf7b782f40@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-30_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810300153
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
X-List-Received-Date: Tue, 30 Oct 2018 18:05:41 -0000

On 2018-10-30 10:49, Andrew Geissler wrote:
> Based on some recent discussion in this area, I'm contemplating
> forming an Infrastructure workgroup. The focus would be on improving
> our CI infrastructure and the scripts and tools around it.
> 
> There's been a lot of great community effort already around our CI
> build scripts.
> 
> Some thoughts on goals:
> - Documenting the existing flow
> - Alternatives to existing flow (ability to use freely provides clouds
> for open source projects, ...)
> - Managing the Jenkins nodes - Bringing new nodes online quickly
> (chef, puppet, ansible?)
> - Managing and optimizing the CI flow (repository CI, meta CI, openbmc 
> CI)
> -- Which systems do we build?
> - Process for adding hardware CI (mechanism for individuals to add HW
> CI to gerrit commits)
> - Optimizations to existing scripts (docker building, CI, QEMU)
> - Gerrit, Jenkins, and build node periodic update process
> - Overall maintenance and responsibilities for infrastructure
> 
> Thoughts or interest?

+1 . This would become important as the org grows. Also setting 
guidelines
on the minimum tests and platforms that need to pass before a change is
accepted.

> 
> Andrew
