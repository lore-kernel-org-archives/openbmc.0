Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1x1vwpzDqGg
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:51:01 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnDPS129650
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:59 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28rt1jsret-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:58 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:36 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:34 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D2D6D1FF0029;
 Tue, 21 Feb 2017 14:50:11 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLoYBp11338170; Tue, 21 Feb 2017 14:50:34 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 570506A03F;
 Tue, 21 Feb 2017 14:50:34 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 1DF206A03C;
 Tue, 21 Feb 2017 14:50:34 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 0/7] drivers/fsi: Add hub master
Date: Tue, 21 Feb 2017 15:50:25 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-8235-0000-0000-00000B056347
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-8236-0000-0000-000039CAD3A1
Message-Id: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210201
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
X-List-Received-Date: Tue, 21 Feb 2017 21:51:01 -0000

Adds the FSI hub master functionality to the OpenFSI device driver.
Hub master is a FSI client device driver that registers with the
core and is notified when devices it wants, hub master engine and
links, are discovered.

v2: Restructured to move hub into the core instead of a separate
    slave device driver.

Christopher Bostic (7):
  drivers/fsi: Add hub master scan detect
  drivers/fsi: Initialize hub master
  drivers/fsi: Define hub master callbacks
  drivers/fsi: Move common read write ops into single function
  drivers/fsi: Add retry on bus error detect
  drivers/fsi: Cleanup bus errors
  tools/testing/selftests: Add fsi command line tool


-- 
1.8.2.2
