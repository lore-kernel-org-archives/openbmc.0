Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygmdF2NmszDrFt
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 11:27:44 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAL0O9Wi061307
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 19:27:42 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ec7bw59et-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 19:27:41 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 20 Nov 2017 17:27:40 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Nov 2017 17:27:38 -0700
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAL0Rbjn6029702; Mon, 20 Nov 2017 17:27:37 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B4ED136044;
 Mon, 20 Nov 2017 17:27:37 -0700 (MST)
Received: from birb.localdomain (unknown [9.102.46.226])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP id BBE78136043;
 Mon, 20 Nov 2017 17:27:36 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0E6574F0CAA; Tue, 21 Nov 2017 11:27:33 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Tanous\, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC community telecon - 11/20 Agenda
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4A58B2@ORSMSX114.amr.corp.intel.com>
References: <785099C4-5D19-4341-9F40-3B6A3404EEC8@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F4A58B2@ORSMSX114.amr.corp.intel.com>
Date: Tue, 21 Nov 2017 11:27:33 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17112100-0012-0000-0000-000015553232
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008101; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00948838; UDB=6.00479146; IPR=6.00729118; 
 BA=6.00005702; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018113; XFM=3.00000015;
 UTC=2017-11-21 00:27:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17112100-0013-0000-0000-0000505A5A9E
Message-Id: <873758zdai.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711210004
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2017 00:27:45 -0000

"Tanous, Ed" <ed.tanous@intel.com> writes:
> Secure coding guidelines:
> What secure coding guidelines are other groups/individuals using?    I'd like to have an open discussion about how to move toward more secure coding guidelines with the minimum possible interruption while alienating the minimum number of people.  Some subtopics:
> 1. Can anything be enforced at the master branch?  
> 2. Can anything be enforced by policy?  (example: reference components must be secure)
> 3. Does anyone have experience with automating secure coding
> guidelines?

A minimal starting point would be to run every code repository through
Coverity Scan. Setting this up with travs-ci isn't too hard (we do it
for parts of host firmware today).

Efforts to limit the damage could also be good, like strict SELinux
policy. After all, much of the current design would work quite well for
that.

-- 
Stewart Smith
OPAL Architect, IBM.
