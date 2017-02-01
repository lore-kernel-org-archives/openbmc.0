Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDCpT3tsrzDq5W
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 06:28:17 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v11JO1ai023368
 for <openbmc@lists.ozlabs.org>; Wed, 1 Feb 2017 14:28:14 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28bk1t7dgn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 14:28:14 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 1 Feb 2017 12:28:13 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 1 Feb 2017 12:28:11 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 238FB1FF001F
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:27:49 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v11JS9As9306488
 for <openbmc@lists.ozlabs.org>; Wed, 1 Feb 2017 12:28:11 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F14A5C6043
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:28:10 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.201.28])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 33ABEC6042
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:28:09 -0700 (MST)
To: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Users of SBE FIFO kernel driver
Date: Wed, 1 Feb 2017 13:28:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020119-0012-0000-0000-00001385EA1C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006538; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00815819; UDB=6.00398324; IPR=6.00593261; 
 BA=6.00005108; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014141; XFM=3.00000011;
 UTC=2017-02-01 19:28:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020119-0013-0000-0000-00004B09EDF6
Message-Id: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-01_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702010191
X-Mailman-Approved-At: Thu, 02 Feb 2017 10:42:03 +1100
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
X-List-Received-Date: Wed, 01 Feb 2017 19:28:18 -0000

I've not seen this discussed in the group but if this has already been 
determined than any pointers to the latest documentation would be 
appreciated.

Who are all the potential users of the OpenBMC SBE FIFO device driver?   
I understand it will need to export its general submit interface to 
other kernel drivers.  Only one I know of for sure would be the OCC 
driver Eddie James is working on.

Any others?

What about user space access of the SBE FIFO engine?  What apps would 
require it?  Cronus I assume will need some means to directly access it.


Thanks
