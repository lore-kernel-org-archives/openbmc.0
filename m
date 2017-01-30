Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC5lg1HVjzDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 10:51:57 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0UNmwdl004777
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 18:51:55 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28a6qp6fvn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 18:51:55 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 30 Jan 2017 16:51:54 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Jan 2017 16:51:53 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id D45D23E40030
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:51:52 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0UNpqma9896294; Mon, 30 Jan 2017 16:51:52 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B20FA78037;
 Mon, 30 Jan 2017 16:51:52 -0700 (MST)
Received: from birb.localdomain (unknown [9.185.16.210])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 442D87803F;
 Mon, 30 Jan 2017 16:51:52 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B2442229DB26; Tue, 31 Jan 2017 10:51:47 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Callout definitions in phosphor-logging : RFC
In-Reply-To: <82ebc370-99c2-a44e-bf89-68d90acff3ae@linux.vnet.ibm.com>
References: <82ebc370-99c2-a44e-bf89-68d90acff3ae@linux.vnet.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 31 Jan 2017 10:51:47 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17013023-0008-0000-0000-00000713098E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006527; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00814949; UDB=6.00397802; IPR=6.00592390; 
 BA=6.00005100; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014112; XFM=3.00000011;
 UTC=2017-01-30 23:51:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17013023-0009-0000-0000-00003F7765D2
Message-Id: <87o9youmwc.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-30_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701300220
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
X-List-Received-Date: Mon, 30 Jan 2017 23:51:59 -0000

Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> writes:
> 4) The error log server, upon identifying a callout, will with the help 
> of the callout metadata, the system's MRW and various system policies, 
> identify one or more FRUs that need to be called out. It will fetch 
> appropriate FRU inventory objects from the phosphor-inventory-manager, 
> and create associations between the error object and these inventory 
> objects, in order to represent the callouts.

Would this be a hard mapping?

What about calling out a bit of hardware that the BMC does not
necessarily know about? e.g. disks or DIMMS on a PCIe card? Is that
something that should be supported?

-- 
Stewart Smith
OPAL Architect, IBM.
