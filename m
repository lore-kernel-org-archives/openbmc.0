Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyRYF5ZnvzDrd8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 08:30:09 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBELTSwL070759
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 16:30:06 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2euwvjfng4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 16:30:05 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 16:30:05 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 16:30:03 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBELU23E36831234; Thu, 14 Dec 2017 21:30:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F351AE05C;
 Thu, 14 Dec 2017 16:31:04 -0500 (EST)
Received: from birb.localdomain (unknown [9.102.53.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id 51433AE057;
 Thu, 14 Dec 2017 16:31:03 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 846044EC5DD; Fri, 15 Dec 2017 08:29:57 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Sud\, Shivani A" <shivani.a.sud@intel.com>,
 "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: subscribe
In-Reply-To: <8182A609B58DFF46B0BDFC4B8786AC630A650589@ORSMSX102.amr.corp.intel.com>
References: <8182A609B58DFF46B0BDFC4B8786AC630A650589@ORSMSX102.amr.corp.intel.com>
Date: Fri, 15 Dec 2017 08:29:57 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17121421-0044-0000-0000-000003BE82A5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008205; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00960261; UDB=6.00485717; IPR=6.00740277; 
 BA=6.00005741; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018547; XFM=3.00000015;
 UTC=2017-12-14 21:30:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121421-0045-0000-0000-000007EDC566
Message-Id: <87a7ylvvze.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-14_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712140293
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
X-List-Received-Date: Thu, 14 Dec 2017 21:30:10 -0000

"Sud, Shivani A" <shivani.a.sud@intel.com> writes:
> Shivani Sud | Solution Architect |  Intel Corporation| 6502242279 | shivani.a.sud@intel.com

Hi! Posting a message to the list with a subject of 'subscribe' was
probably not what you meant to do.

To subscribe to the list, head to
https://lists.ozlabs.org/listinfo/openbmc and fill in the web form
(there's probably some fancy mailman way of doing it via email, but the
web form is easy and I know it works).

Welcome to OpenBMC!
-- 
Stewart Smith
OPAL Architect, IBM.
