Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN6V274knzDwqT
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 11:56:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAM0sJvZ058811
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 19:56:08 -0500
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26v5f00htf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 19:56:08 -0500
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 22 Nov 2016 10:56:06 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 22 Nov 2016 10:56:05 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8381A3578052
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 11:56:04 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAM0u4pI6029822
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 11:56:04 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAM0u305002693
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 11:56:04 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAM0u3Vv002669; Tue, 22 Nov 2016 11:56:03 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D9972A004F;
 Tue, 22 Nov 2016 11:56:02 +1100 (AEDT)
Subject: Aspeed VUART implementation for QEMU
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Tue, 22 Nov 2016 11:56:02 +1100
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112200-0040-0000-0000-000002CA0F3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112200-0041-0000-0000-00000BBC3E40
Message-Id: <1479776162.11116.85.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611220013
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
X-List-Received-Date: Tue, 22 Nov 2016 00:56:11 -0000

Hi folks,

I was thinking of getting stuck into the VUART implementation in QEMU
soon.

After reading the docs, I think we should map in a 16550 uart at the
address specified in the design docs, and attach the other end of the
uart to a socket. Does this sound reasonable?

Joel mentioned that Cedric has already given this some thought, so I'd
love to hear it.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819
