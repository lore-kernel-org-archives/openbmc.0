Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qwwm2CLnzF3LG
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 06:10:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA7J9Q8K094484
 for <openbmc@lists.ozlabs.org>; Wed, 7 Nov 2018 14:10:29 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2nm5dksdpr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 14:10:28 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 7 Nov 2018 19:10:28 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 7 Nov 2018 19:10:27 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wA7JAQYu38142102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 7 Nov 2018 19:10:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91929124053
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 19:10:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45FBE124052
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 19:10:26 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 19:10:26 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Nov 2018 13:13:05 -0600
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: button handler w/o python
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18110719-0064-0000-0000-0000037036CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010003; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01114092; UDB=6.00577118; IPR=6.00894192; 
 MB=3.00024063; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-07 19:10:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110719-0065-0000-0000-00003B427371
Message-Id: <6ae8410c8a7db06ee19ff421ee3412b2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-07_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=389 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811070170
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
X-List-Received-Date: Wed, 07 Nov 2018 19:10:32 -0000

Hi,

In our quest to be able to remove python, I put up a review for a button
handler in C++ in phosphor-state-manager called phosphor-button-handler:
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-state-manager/+/15437/

It uses the signals sent by the phosphor-button code to support the 
power, ID,
and reset buttons, though it doesn't require them all to be present.

I realize systems may want to do their own unique things on button 
presses, but
I think this gives a good reference implementation.

Matt
