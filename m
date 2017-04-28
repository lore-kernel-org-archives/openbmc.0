Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDclg04SfzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 12:12:30 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3S29699091514
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 22:12:25 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a3sh0qgvf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 22:12:25 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 27 Apr 2017 22:12:24 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 27 Apr 2017 22:12:22 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3S2CC9Y46137586; Fri, 28 Apr 2017 02:12:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13B98AC03A;
 Thu, 27 Apr 2017 22:12:02 -0400 (EDT)
Received: from birb.localdomain (unknown [9.185.16.76])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 900C2AC040;
 Thu, 27 Apr 2017 22:12:01 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 09355229DB28; Fri, 28 Apr 2017 12:12:08 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jayanth Othayoth <ojayanth@in.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Debug data collection tool evaluation updates
In-Reply-To: <OF887D4BA6.3DF1614A-ON0025810D.004324D1-0025810D.0043964E@notes.na.collabserv.com>
References: <OF887D4BA6.3DF1614A-ON0025810D.004324D1-0025810D.0043964E@notes.na.collabserv.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 28 Apr 2017 12:12:07 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17042802-0052-0000-0000-000001EA38BB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006986; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00853364; UDB=6.00421979; IPR=6.00632306; 
 BA=6.00005316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015212; XFM=3.00000014;
 UTC=2017-04-28 02:12:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17042802-0053-0000-0000-000050499781
Message-Id: <8737ctcmbs.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-27_20:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704280031
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
X-List-Received-Date: Fri, 28 Apr 2017 02:12:31 -0000

Jayanth Othayoth <ojayanth@in.ibm.com> writes:
> Base SOS Package with minimal plugin size: 360K (based on Fedora distribution)
> Base Package size: 2.65MB (based on Fedora distribution)

I'm not sure these sizes are too valid as to what would show up in
OpenBMC.

Distro packages are not build with -Os, which can halve binary size in
some cases. Additionally, the binaries are likely to be compressed on
flash for OpenBMC, and things like man pages aren't going to be needed.

-- 
Stewart Smith
OPAL Architect, IBM.
