Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vMxH1FwgzDqP7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 11:38:10 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x160Uerl060709
 for <openbmc@lists.ozlabs.org>; Tue, 5 Feb 2019 19:38:08 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qfju4x8jm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 19:38:08 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Wed, 6 Feb 2019 00:38:07 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Feb 2019 00:38:05 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x160c4Bj14221392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Feb 2019 00:38:04 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80672BE058;
 Wed,  6 Feb 2019 00:38:04 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4960BBE056;
 Wed,  6 Feb 2019 00:38:04 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.92])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Feb 2019 00:38:04 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 76D144EC62C; Wed,  6 Feb 2019 11:38:00 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Romulus to use Virtual PNOR
In-Reply-To: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
Date: Wed, 06 Feb 2019 11:38:00 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19020600-0004-0000-0000-000014DCD48A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010544; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156880; UDB=6.00603506; IPR=6.00937404; 
 MB=3.00025451; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-06 00:38:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020600-0005-0000-0000-00008A7D5E2A
Message-Id: <87r2cliwev.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=471 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902060001
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 00:38:11 -0000

Lei YU <mine260309@gmail.com> writes:
> This email is to notify that Romulus is going to use VirtualPNOR feature, if
> no objections are received.

Why?

It's proved to be massively complex on Witherspoon and a tremendous
source of bugs (both on BMC and host).

-- 
Stewart Smith
OPAL Architect, IBM.
