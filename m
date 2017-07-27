Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHt4d67kdzDrD4
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 10:23:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6R0NYRW065743
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 20:23:42 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2by4fxtfqe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 20:23:42 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 20:23:41 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 20:23:38 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6R0Nctj26148868
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 00:23:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF68E124037
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 20:21:03 -0400 (EDT)
Received: from birb.localdomain (unknown [9.83.3.98])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP id 1584C124035
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 20:21:02 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 3E72851BD2E; Thu, 27 Jul 2017 10:23:31 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: FFDC tool?
Date: Thu, 27 Jul 2017 10:23:31 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17072700-0044-0000-0000-00000373C52D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007432; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893385; UDB=6.00446630; IPR=6.00673549; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016397; XFM=3.00000015;
 UTC=2017-07-27 00:23:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072700-0045-0000-0000-000007A1CFFD
Message-Id: <87bmo6sp6k.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707270005
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
X-List-Received-Date: Thu, 27 Jul 2017 00:23:46 -0000

So, I spotted https://gerrit.openbmc-project.xyz/#/c/4881/ (well, an
associated internal bug report), and it appears there is a FFDC tool in
existence?

(FFDC seems like a bit of an IBM specific term, First Failure Data
Capture - i.e. gather all the things when something goes wrong and
attach it to a bug report)

I'm wondering where I missed any announce/info on its availability and
use?

Perhaps an idea would be to put it in the motd and/or /etc/issue(.net)
so that it's prominently documented (we do this for petitboot for
OpenPOWER host firmware, and I think that helps)?

-- 
Stewart Smith
OPAL Architect, IBM.
