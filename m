Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1Z0C6SdszF07P
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 10:30:51 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBJNT4Pq117365
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 18:30:49 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eybcdtjcv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 18:30:49 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 19 Dec 2017 18:30:47 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Dec 2017 18:30:45 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBJNUjFi46530804; Tue, 19 Dec 2017 23:30:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8140AC03A;
 Tue, 19 Dec 2017 18:31:49 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.209.119])
 by b01ledav006.gho.pok.ibm.com (Postfix) with SMTP id 7E449AC040;
 Tue, 19 Dec 2017 18:31:48 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 381354EC6A2; Wed, 20 Dec 2017 10:30:40 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: "Tanous\, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Request for comments: C++ embedded webserver
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
Date: Wed, 20 Dec 2017 10:30:40 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17121923-0008-0000-0000-000002B26E2A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008229; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00962694; UDB=6.00486964; IPR=6.00742689; 
 BA=6.00005752; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018633; XFM=3.00000015;
 UTC=2017-12-19 23:30:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121923-0009-0000-0000-000037A4695F
Message-Id: <87zi6ewb1b.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-19_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712190330
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
X-List-Received-Date: Tue, 19 Dec 2017 23:30:52 -0000

"Tanous, Ed" <ed.tanous@intel.com> writes:
> I'm looking for comments on a code review that's been outstanding.
> One of the large pushes we've made is to attempt to make the web
> server more efficient, and add capabilities that comprehend long term
> needs of OpenBmc.  One key that wasn't made clear in the commit
> message is that it includes the basic redfish implementation that (we
> hope) should be extensible to the full redfish specification in the
> short term future.
>
> https://gerrit.openbmc-project.xyz/#/c/7786/
>
> We would very much appreciate comments to see if we can move this
> forward.

One question, it seems like you rolled your own http server, any reason
to do that rather than re-use what's in libevent or similar such
library?

-- 
Stewart Smith
OPAL Architect, IBM.
