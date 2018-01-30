Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVtvq3rmPzF0TZ
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 15:39:51 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0U4clhx114907
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 23:39:48 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ftdj1gcq9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 23:39:48 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 29 Jan 2018 21:39:47 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 29 Jan 2018 21:39:46 -0700
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0U4djxX3670340; Mon, 29 Jan 2018 21:39:45 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE41EBE039;
 Mon, 29 Jan 2018 21:39:45 -0700 (MST)
Received: from birb.localdomain (unknown [9.81.201.128])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id 2DDBCBE038;
 Mon, 29 Jan 2018 21:39:44 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 1E7CA4F0DAB; Tue, 30 Jan 2018 15:39:42 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
Date: Tue, 30 Jan 2018 15:39:42 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18013004-0012-0000-0000-000015ABF606
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008451; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982355; UDB=6.00498112; IPR=6.00761638; 
 BA=6.00005799; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019279; XFM=3.00000015;
 UTC=2018-01-30 04:39:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013004-0013-0000-0000-00005145FF7A
Message-Id: <87vafkyn75.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300059
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
X-List-Received-Date: Tue, 30 Jan 2018 04:39:51 -0000

Alexander Amelkin <a.amelkin@yadro.com> writes:
> 1. BMC usually runs in a secured environment where probability of 
> tampering with flash IC contents by means other than BMC's firmware 
> itself is negligible.

Consider the host to be actively hostile.

In any metal-as-a-service environment, a privilege escalation is to get
code onto the BMC, and thus survive to the next tenant. While the bmc to
host interfaces *should* be nice and secure, they are software, and thus
are *going* to have security issues. A solid secure-boot story on the
BMC would add defense in depth.

-- 
Stewart Smith
OPAL Architect, IBM.
