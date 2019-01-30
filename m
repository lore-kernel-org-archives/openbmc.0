Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43qY0c0mFPzDqRF
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 06:12:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0UJ8rc0035969
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 14:12:45 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qbg1a5mnc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 14:12:44 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Wed, 30 Jan 2019 19:12:44 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 30 Jan 2019 19:12:42 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0UJCf2a9764908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Jan 2019 19:12:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D3E1AC060;
 Wed, 30 Jan 2019 19:12:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AA31AC059;
 Wed, 30 Jan 2019 19:12:41 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jan 2019 19:12:40 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 30 Jan 2019 13:18:52 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: openbmc-security@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: [Security Advisory] CVE 2019-6260: Unsecured ASPEED AHB Bridges
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19013019-0052-0000-0000-00000380A391
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010505; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01154043; UDB=6.00601716; IPR=6.00934418; 
 MB=3.00025357; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-30 19:12:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19013019-0053-0000-0000-00005FA89BAA
Message-Id: <d90a9fc2ed623766a28ae6d1e6773b51@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-30_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=843 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901300144
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
X-List-Received-Date: Wed, 30 Jan 2019 19:12:48 -0000

The OpenBMC Security Response team has released an OpenBMC Security 
Advisory:
https://github.com/openbmc/openbmc/issues/3475

An OpenBMC Security Advisory explains a security vulnerability, its 
severity, and how to protect systems that are built on OpenBMC.
For more information about OpenBMC Security Response, see:
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md

For general information about OpenBMC Security, see the Security Working 
Group wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group
